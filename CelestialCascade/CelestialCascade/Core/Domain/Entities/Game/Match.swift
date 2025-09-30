//
//  Match.swift
//  Celestial Cascade
//
//  Represents a match of 3+ elements on the board
//

import Foundation

/// Type of match pattern detected
enum MatchType: String, Codable, Equatable, Sendable {
    case three      // 3 in a row
    case four       // 4 in a row
    case five       // 5 in a row
    case tShape     // T-shaped pattern (4 elements)
    case lShape     // L-shaped pattern (4 elements)
    case square     // 2×2 square (4 elements)

    /// Base bonus points for this match type
    var bonusPoints: Int {
        switch self {
        case .three: return 0
        case .four: return 50
        case .five: return 150
        case .tShape: return 100
        case .lShape: return 100
        case .square: return 200
        }
    }

    /// Whether this match type triggers a power-up
    var createsPowerUp: Bool {
        switch self {
        case .three: return false
        case .four, .five, .tShape, .lShape, .square: return true
        }
    }

    /// Power-up type created by this match
    var powerUpType: PowerUpType? {
        switch self {
        case .three: return nil
        case .four: return .rowClear
        case .five: return .colorBomb
        case .tShape, .lShape: return .columnClear
        case .square: return .bombBlast
        }
    }
}

/// Represents a detected match on the board
struct Match: Equatable, Identifiable, Codable, Sendable {
    let id: UUID
    let elements: [Element]
    let type: MatchType
    let centerPosition: Position

    init(id: UUID = UUID(), elements: [Element], type: MatchType) {
        self.id = id
        self.elements = elements
        self.type = type

        // Calculate center position (average of all positions)
        let avgX = elements.map { $0.position.x }.reduce(0, +) / elements.count
        let avgY = elements.map { $0.position.y }.reduce(0, +) / elements.count
        self.centerPosition = Position(x: avgX, y: avgY)
    }

    /// Total base points for this match (before multipliers)
    var basePoints: Int {
        guard let firstElement = elements.first else { return 0 }
        let elementPoints = firstElement.type.basePoints * elements.count
        return elementPoints + type.bonusPoints
    }

    /// All positions involved in this match
    var positions: [Position] {
        return elements.map { $0.position }
    }

    /// Element type of this match
    var elementType: ElementType? {
        return elements.first?.type
    }
}

// TODO: Implement match detection algorithm in DetectMatchesUseCase
// - Scan board horizontally for consecutive elements
// - Scan board vertically for consecutive elements
// - Detect special patterns (T, L, square)
// - Return sorted by points (highest first)
// - Avoid duplicate detection of same elements