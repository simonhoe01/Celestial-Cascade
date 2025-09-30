//
//  Position.swift
//  Celestial Cascade
//
//  2D grid position for board elements
//

import Foundation

/// Represents a position on the 8×8 game board
struct Position: Equatable, Hashable, Codable, Sendable {
    let x: Int
    let y: Int

    init(x: Int, y: Int) {
        self.x = x
        self.y = y
    }

    /// Check if position is valid on an 8×8 board
    var isValid: Bool {
        return x >= 0 && x < 8 && y >= 0 && y < 8
    }

    /// Adjacent positions (up, right, down, left)
    var adjacentPositions: [Position] {
        return [
            Position(x: x, y: y - 1), // Up
            Position(x: x + 1, y: y), // Right
            Position(x: x, y: y + 1), // Down
            Position(x: x - 1, y: y)  // Left
        ].filter { $0.isValid }
    }

    /// All 8 surrounding positions (including diagonals)
    var surroundingPositions: [Position] {
        return [
            Position(x: x - 1, y: y - 1), // Top-left
            Position(x: x, y: y - 1),     // Top
            Position(x: x + 1, y: y - 1), // Top-right
            Position(x: x + 1, y: y),     // Right
            Position(x: x + 1, y: y + 1), // Bottom-right
            Position(x: x, y: y + 1),     // Bottom
            Position(x: x - 1, y: y + 1), // Bottom-left
            Position(x: x - 1, y: y)      // Left
        ].filter { $0.isValid }
    }

    /// Manhattan distance to another position
    func distance(to other: Position) -> Int {
        return abs(x - other.x) + abs(y - other.y)
    }

    /// Check if this position is adjacent to another
    func isAdjacent(to other: Position) -> Bool {
        return distance(to: other) == 1
    }

    /// Direction to move from this position to another
    func direction(to other: Position) -> Direction? {
        let dx = other.x - x
        let dy = other.y - y

        if dx == 1 && dy == 0 { return .right }
        if dx == -1 && dy == 0 { return .left }
        if dx == 0 && dy == 1 { return .down }
        if dx == 0 && dy == -1 { return .up }

        return nil
    }
}

/// Direction of movement
enum Direction: String, Codable, Sendable {
    case up
    case down
    case left
    case right

    var opposite: Direction {
        switch self {
        case .up: return .down
        case .down: return .up
        case .left: return .right
        case .right: return .left
        }
    }

    var vector: (x: Int, y: Int) {
        switch self {
        case .up: return (0, -1)
        case .down: return (0, 1)
        case .left: return (-1, 0)
        case .right: return (1, 0)
        }
    }
}