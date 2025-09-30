//
//  Element.swift
//  Celestial Cascade
//
//  Individual cosmic element on the game board
//

import Foundation

/// Represents a single element on the game board
struct Element: Equatable, Identifiable, Codable, Sendable {
    let id: UUID
    let type: ElementType
    var position: Position
    var state: ElementState
    var animationProgress: Double

    init(
        id: UUID = UUID(),
        type: ElementType,
        position: Position,
        state: ElementState = .idle,
        animationProgress: Double = 0.0
    ) {
        self.id = id
        self.type = type
        self.position = position
        self.state = state
        self.animationProgress = animationProgress
    }

    /// Create a random element for a given position
    static func random(at position: Position, availableTypes: [ElementType]) -> Element {
        let type = availableTypes.randomElement() ?? .star
        return Element(type: type, position: position)
    }

    /// Check if this element can match with another
    func canMatch(with other: Element) -> Bool {
        return self.type == other.type && self.state == .idle && other.state == .idle
    }
}

/// Current state of an element
enum ElementState: String, Codable, Equatable, Sendable {
    case idle       // Normal state, can be matched
    case falling    // Currently falling due to gravity
    case matched    // Part of a match, about to be removed
    case exploding  // Playing explosion animation
    case spawning   // Just spawned, fading in
    case swapping   // Being swapped with another element
    case frozen     // Frozen by power-up or special effect
    case special    // Has special ability active
}

extension Element {
    /// Priority for sorting elements (for gravity calculations)
    var fallPriority: Int {
        switch state {
        case .idle, .spawning:
            return 0
        case .falling:
            return 1
        case .swapping:
            return 2
        case .matched, .exploding:
            return 3
        case .frozen, .special:
            return 4
        }
    }

    /// Whether this element should be affected by gravity
    var isAffectedByGravity: Bool {
        return state == .idle || state == .falling
    }

    /// Whether this element can be selected by the player
    var isSelectable: Bool {
        return state == .idle
    }

    /// Whether this element can be part of a match
    var isMatchable: Bool {
        return state == .idle || state == .special
    }
}