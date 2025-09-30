//
//  Board.swift
//  Celestial Cascade
//
//  The 8×8 game board that holds all elements
//

import Foundation

/// Represents the 8×8 game board
struct Board: Equatable, Codable, Sendable {
    private(set) var elements: [[Element?]]
    let size: Int = 8

    init(elements: [[Element?]] = []) {
        if elements.isEmpty {
            // Create empty 8×8 grid
            self.elements = Array(
                repeating: Array(repeating: nil, count: 8),
                count: 8
            )
        } else {
            self.elements = elements
        }
    }

    /// Initialize with a layout of element types
    init(layout: [[ElementType?]]) {
        var elements: [[Element?]] = []

        for (y, row) in layout.enumerated() {
            var elementRow: [Element?] = []
            for (x, type) in row.enumerated() {
                if let type = type {
                    let element = Element(
                        type: type,
                        position: Position(x: x, y: y)
                    )
                    elementRow.append(element)
                } else {
                    elementRow.append(nil)
                }
            }
            elements.append(elementRow)
        }

        self.elements = elements
    }

    /// Get element at position
    subscript(position: Position) -> Element? {
        get {
            guard position.isValid else { return nil }
            return elements[position.y][position.x]
        }
        set {
            guard position.isValid else { return }
            elements[position.y][position.x] = newValue
        }
    }

    /// Get element at x, y coordinates
    subscript(x: Int, y: Int) -> Element? {
        get {
            return self[Position(x: x, y: y)]
        }
        set {
            self[Position(x: x, y: y)] = newValue
        }
    }

    /// All non-nil elements on the board
    var allElements: [Element] {
        return elements.flatMap { $0.compactMap { $0 } }
    }

    /// Count of non-nil elements
    var elementCount: Int {
        return allElements.count
    }

    /// Check if board is completely filled
    var isFull: Bool {
        return elementCount == size * size
    }

    /// Get all elements in a row
    func row(_ y: Int) -> [Element?] {
        guard y >= 0 && y < size else { return [] }
        return elements[y]
    }

    /// Get all elements in a column
    func column(_ x: Int) -> [Element?] {
        guard x >= 0 && x < size else { return [] }
        return (0..<size).map { y in elements[y][x] }
    }

    // MARK: - Mutations

    /// Swap two elements
    mutating func swap(_ pos1: Position, _ pos2: Position) {
        guard pos1.isValid, pos2.isValid else { return }

        let temp = self[pos1]
        self[pos1] = self[pos2]
        self[pos2] = temp

        // Update positions
        if var element1 = self[pos1] {
            element1.position = pos1
            self[pos1] = element1
        }
        if var element2 = self[pos2] {
            element2.position = pos2
            self[pos2] = element2
        }
    }

    /// Remove element at position
    mutating func remove(at position: Position) {
        self[position] = nil
    }

    /// Set element at position
    mutating func set(_ element: Element, at position: Position) {
        var updatedElement = element
        updatedElement.position = position
        self[position] = updatedElement
    }

    /// Apply gravity: move elements down into empty spaces
    mutating func applyGravity() -> [Element] {
        var movedElements: [Element] = []

        // Process columns from bottom to top
        for x in 0..<size {
            var column = self.column(x)
            var newColumn: [Element?] = []
            var writeIndex = size - 1

            // Collect non-nil elements from bottom to top
            for y in stride(from: size - 1, through: 0, by: -1) {
                if let element = column[y] {
                    newColumn.insert(element, at: 0)
                }
            }

            // Pad with nils at the top
            while newColumn.count < size {
                newColumn.insert(nil, at: 0)
            }

            // Write back to board
            for y in 0..<size {
                let oldElement = elements[y][x]
                let newElement = newColumn[y]

                if oldElement?.id != newElement?.id {
                    if let element = newElement {
                        movedElements.append(element)
                    }
                }

                if var element = newColumn[y] {
                    element.position = Position(x: x, y: y)
                    element.state = .falling
                    elements[y][x] = element
                } else {
                    elements[y][x] = nil
                }
            }
        }

        return movedElements
    }

    /// Fill empty spaces with new random elements
    mutating func fillEmpty(with availableTypes: [ElementType]) -> [Element] {
        var newElements: [Element] = []

        for x in 0..<size {
            for y in 0..<size {
                if self[x, y] == nil {
                    let position = Position(x: x, y: y)
                    let element = Element.random(at: position, availableTypes: availableTypes)
                    self[position] = element
                    newElements.append(element)
                }
            }
        }

        return newElements
    }

    /// Check if a move is valid (elements are adjacent)
    func isValidMove(from: Position, to: Position) -> Bool {
        guard from.isValid, to.isValid else { return false }
        guard from.isAdjacent(to: to) else { return false }
        guard self[from] != nil, self[to] != nil else { return false }

        return true
    }

    /// Find all possible moves that would create matches
    func findPossibleMoves() -> [(from: Position, to: Position)] {
        var moves: [(Position, Position)] = []

        for y in 0..<size {
            for x in 0..<size {
                let pos = Position(x: x, y: y)
                guard self[pos] != nil else { continue }

                // Try swapping with adjacent positions
                for adjacent in pos.adjacentPositions {
                    guard self[adjacent] != nil else { continue }

                    // Simulate swap
                    var testBoard = self
                    testBoard.swap(pos, adjacent)

                    // Check if this creates matches
                    if testBoard.hasMatch(around: pos) || testBoard.hasMatch(around: adjacent) {
                        moves.append((pos, adjacent))
                    }
                }
            }
        }

        return moves
    }

    /// Check if there's a match around a position
    private func hasMatch(around position: Position) -> Bool {
        guard let element = self[position] else { return false }

        // Check horizontal
        let horizontalCount = countConsecutive(from: position, direction: .left) +
                            countConsecutive(from: position, direction: .right) + 1
        if horizontalCount >= 3 { return true }

        // Check vertical
        let verticalCount = countConsecutive(from: position, direction: .up) +
                          countConsecutive(from: position, direction: .down) + 1
        if verticalCount >= 3 { return true }

        return false
    }

    /// Count consecutive elements of same type in a direction
    private func countConsecutive(from position: Position, direction: Direction) -> Int {
        guard let element = self[position] else { return 0 }

        var count = 0
        var currentPos = position
        let vector = direction.vector

        while true {
            let nextPos = Position(x: currentPos.x + vector.x, y: currentPos.y + vector.y)
            guard nextPos.isValid else { break }
            guard let nextElement = self[nextPos] else { break }
            guard nextElement.type == element.type else { break }

            count += 1
            currentPos = nextPos
        }

        return count
    }
}