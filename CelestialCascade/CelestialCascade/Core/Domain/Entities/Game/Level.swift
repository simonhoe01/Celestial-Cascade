//
//  Level.swift
//  Celestial Cascade
//
//  Represents a game level with difficulty and layout
//

import Foundation

/// Represents a single game level
struct Level: Equatable, Identifiable, Codable, Sendable {
    let id: UUID
    let number: Int
    let difficulty: Double
    let seed: UInt64
    let layout: [[ElementType?]]
    let targetScore: Int
    let parTime: TimeInterval
    let powerUpSpawnRate: Double
    let elementTypes: [ElementType]

    init(
        id: UUID = UUID(),
        number: Int,
        difficulty: Double,
        seed: UInt64,
        layout: [[ElementType?]],
        targetScore: Int,
        parTime: TimeInterval,
        powerUpSpawnRate: Double,
        elementTypes: [ElementType]
    ) {
        self.id = id
        self.number = number
        self.difficulty = difficulty
        self.seed = seed
        self.layout = layout
        self.targetScore = targetScore
        self.parTime = parTime
        self.powerUpSpawnRate = powerUpSpawnRate
        self.elementTypes = elementTypes
    }

    /// Number of element types in this level (3-7)
    var elementComplexity: Int {
        return elementTypes.count
    }

    /// Display name for UI
    var displayName: String {
        return "Level \(number)"
    }

    /// Difficulty tier (Easy, Medium, Hard, Expert, Master)
    var difficultyTier: DifficultyTier {
        switch difficulty {
        case 0..<20: return .easy
        case 20..<40: return .medium
        case 40..<60: return .hard
        case 60..<80: return .expert
        default: return .master
        }
    }

    /// Star rating thresholds
    var starThresholds: StarThresholds {
        return StarThresholds(
            oneStarScore: Int(Double(targetScore) * 0.6),
            twoStarScore: Int(Double(targetScore) * 0.8),
            threeStarScore: targetScore,
            perfectScore: Int(Double(targetScore) * 1.2)
        )
    }
}

/// Difficulty tiers
enum DifficultyTier: String, Codable, Equatable, Sendable {
    case easy
    case medium
    case hard
    case expert
    case master

    var displayName: String {
        return rawValue.capitalized
    }

    var color: String {
        switch self {
        case .easy: return "#10B981"      // Green
        case .medium: return "#FBBF24"    // Yellow
        case .hard: return "#F97316"      // Orange
        case .expert: return "#EF4444"    // Red
        case .master: return "#A855F7"    // Purple
        }
    }
}

/// Star rating thresholds for a level
struct StarThresholds: Equatable, Codable, Sendable {
    let oneStarScore: Int
    let twoStarScore: Int
    let threeStarScore: Int
    let perfectScore: Int

    func stars(for score: Int) -> Int {
        if score >= threeStarScore { return 3 }
        if score >= twoStarScore { return 2 }
        if score >= oneStarScore { return 1 }
        return 0
    }

    func isPerfect(_ score: Int) -> Bool {
        return score >= perfectScore
    }
}

// TODO: Implement in LevelGenerator
// - Generate levels using Perlin Noise + WFC
// - Scale difficulty based on player level
// - Ensure levels are solvable (LevelValidator)
// - Cache generated levels (LevelCache)
// - Use deterministic seeds for consistency
// - Pre-generate next 10 levels in background