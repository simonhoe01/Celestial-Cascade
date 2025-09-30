//
//  ElementType.swift
//  Celestial Cascade
//
//  Core cosmic element types for the game
//

import Foundation

/// The seven cosmic element types in Celestial Cascade
enum ElementType: String, CaseIterable, Codable, Hashable, Sendable {
    case star
    case nebula
    case comet
    case galaxy
    case blackHole
    case supernova
    case wormhole

    /// Display name for UI
    var displayName: String {
        switch self {
        case .star: return "Star"
        case .nebula: return "Nebula"
        case .comet: return "Comet"
        case .galaxy: return "Galaxy"
        case .blackHole: return "Black Hole"
        case .supernova: return "Supernova"
        case .wormhole: return "Wormhole"
        }
    }

    /// Base points for matching this element type
    var basePoints: Int {
        switch self {
        case .star: return 10
        case .nebula: return 15
        case .comet: return 20
        case .galaxy: return 25
        case .blackHole: return 30
        case .supernova: return 35
        case .wormhole: return 40
        }
    }

    /// Primary color for this element (hex)
    var primaryColor: String {
        switch self {
        case .star: return "#FBBF24" // Gold
        case .nebula: return "#A855F7" // Purple
        case .comet: return "#22D3EE" // Cyan
        case .galaxy: return "#EC4899" // Pink
        case .blackHole: return "#1E1B4B" // Deep Blue
        case .supernova: return "#EF4444" // Red
        case .wormhole: return "#10B981" // Green
        }
    }

    /// Texture atlas name for this element
    var atlasName: String {
        return "Elements"
    }

    /// Base texture name (animation frames will be name_01 through name_10)
    var textureName: String {
        return rawValue
    }

    /// Number of animation frames
    var animationFrames: Int {
        return 10
    }

    /// Special ability when matched (for advanced gameplay)
    var specialAbility: SpecialAbility? {
        switch self {
        case .blackHole: return .absorb // Absorbs adjacent elements
        case .supernova: return .explode // Clears row and column
        case .wormhole: return .teleport // Connects distant elements
        default: return nil
        }
    }
}

/// Special abilities for certain element types
enum SpecialAbility: Codable, Hashable, Sendable {
    case absorb // Black Hole: absorbs adjacent elements
    case explode // Supernova: clears row and column
    case teleport // Wormhole: connects two distant elements
}

/// Musical note associated with each element (for audio design)
extension ElementType {
    var musicalNote: String {
        switch self {
        case .star: return "C"
        case .nebula: return "D"
        case .comet: return "E"
        case .galaxy: return "G"
        case .blackHole: return "A"
        case .supernova: return "B"
        case .wormhole: return "C2" // Octave up
        }
    }
}