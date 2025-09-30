//
//  DailyChallenge.swift
//  Celestial Cascade
//
//  Daily challenge system with streak rewards
//

import Foundation

/// Difficulty of daily challenge
enum ChallengeDifficulty: String, Codable, Equatable, Sendable {
    case easy
    case medium
    case hard

    var displayName: String {
        return rawValue.capitalized
    }

    var coinReward: Int {
        switch self {
        case .easy: return 50
        case .medium: return 100
        case .hard: return 200
        }
    }

    var xpReward: Int {
        switch self {
        case .easy: return 100
        case .medium: return 200
        case .hard: return 400
        }
    }
}

/// Type of challenge requirement
enum ChallengeRequirement: Codable, Equatable, Sendable {
    case scoreTarget(Int)           // Reach target score
    case comboStreak(Int)           // Achieve combo of X
    case timeUnder(TimeInterval)    // Complete under time
    case moveLimit(Int)             // Complete in X moves
    case noSpecialElements          // No black holes or wormholes
    case perfectScore               // Get perfect score

    var description: String {
        switch self {
        case .scoreTarget(let score):
            return "Score \(score) points"
        case .comboStreak(let combo):
            return "Achieve \(combo)x combo"
        case .timeUnder(let time):
            return "Complete in under \(Int(time))s"
        case .moveLimit(let moves):
            return "Complete in \(moves) moves or less"
        case .noSpecialElements:
            return "No Black Holes or Wormholes"
        case .perfectScore:
            return "Achieve perfect score"
        }
    }
}

/// Challenge reward
struct ChallengeReward: Codable, Equatable, Sendable {
    let coins: Int
    let xp: Int
    let item: String?  // Optional cosmetic item ID

    var description: String {
        var parts: [String] = []
        if coins > 0 { parts.append("\(coins) coins") }
        if xp > 0 { parts.append("\(xp) XP") }
        if let item = item { parts.append("Exclusive item") }
        return parts.joined(separator: ", ")
    }
}

/// Daily challenge instance
struct DailyChallenge: Equatable, Identifiable, Codable, Sendable {
    let id: UUID
    let date: Date
    let difficulty: ChallengeDifficulty
    let level: Level
    let requirement: ChallengeRequirement
    let reward: ChallengeReward
    var isCompleted: Bool
    var completedAt: Date?
    var progress: Double  // 0.0 to 1.0

    init(
        id: UUID = UUID(),
        date: Date,
        difficulty: ChallengeDifficulty,
        level: Level,
        requirement: ChallengeRequirement,
        reward: ChallengeReward,
        isCompleted: Bool = false,
        completedAt: Date? = nil,
        progress: Double = 0.0
    ) {
        self.id = id
        self.date = date
        self.difficulty = difficulty
        self.level = level
        self.requirement = requirement
        self.reward = reward
        self.isCompleted = isCompleted
        self.completedAt = completedAt
        self.progress = progress
    }

    /// Whether challenge is active today
    var isActive: Bool {
        return Calendar.current.isDateInToday(date)
    }

    /// Check if requirement is met by game session
    func checkRequirement(session: GameSession) -> Bool {
        switch requirement {
        case .scoreTarget(let target):
            return session.score >= target
        case .comboStreak(let combo):
            return session.combo.matchCount >= combo
        case .timeUnder(let time):
            return session.duration <= time
        case .moveLimit(let moves):
            return session.moves <= moves && session.hasWon
        case .noSpecialElements:
            // Check if level used special elements
            return !level.elementTypes.contains { $0 == .blackHole || $0 == .wormhole }
        case .perfectScore:
            return session.isPerfect
        }
    }

    /// Update progress based on session
    mutating func updateProgress(session: GameSession) {
        switch requirement {
        case .scoreTarget(let target):
            progress = min(1.0, Double(session.score) / Double(target))
        case .comboStreak(let combo):
            progress = min(1.0, Double(session.combo.matchCount) / Double(combo))
        case .timeUnder(let time):
            progress = min(1.0, 1.0 - (session.duration / time))
        case .moveLimit(let moves):
            progress = min(1.0, 1.0 - (Double(session.moves) / Double(moves)))
        case .noSpecialElements, .perfectScore:
            progress = checkRequirement(session: session) ? 1.0 : 0.0
        }
    }

    /// Complete the challenge
    mutating func complete() {
        isCompleted = true
        completedAt = Date()
        progress = 1.0
    }
}

/// Daily streak tracking
struct DailyStreak: Codable, Equatable, Sendable {
    var currentStreak: Int
    var longestStreak: Int
    var lastCompletedDate: Date?

    init(currentStreak: Int = 0, longestStreak: Int = 0, lastCompletedDate: Date? = nil) {
        self.currentStreak = currentStreak
        self.longestStreak = longestStreak
        self.lastCompletedDate = lastCompletedDate
    }

    /// Update streak after completing a challenge
    mutating func recordCompletion(on date: Date = Date()) {
        let calendar = Calendar.current

        if let lastDate = lastCompletedDate {
            let daysDiff = calendar.dateComponents([.day], from: lastDate, to: date).day ?? 0

            if daysDiff == 1 {
                // Continue streak
                currentStreak += 1
            } else if daysDiff > 1 {
                // Streak broken
                currentStreak = 1
            }
            // daysDiff == 0 means already completed today
        } else {
            // First completion
            currentStreak = 1
        }

        if currentStreak > longestStreak {
            longestStreak = currentStreak
        }

        lastCompletedDate = date
    }

    /// Get bonus multiplier based on streak
    var bonusMultiplier: Double {
        switch currentStreak {
        case 0...2: return 1.0
        case 3...6: return 1.5   // 3-day streak: +50%
        case 7...29: return 2.0  // 7-day streak: +100%
        default: return 3.0      // 30-day streak: +200%
        }
    }

    /// Reward for maintaining streak
    var streakReward: ChallengeReward? {
        switch currentStreak {
        case 3:
            return ChallengeReward(coins: 500, xp: 500, item: nil)
        case 7:
            return ChallengeReward(coins: 1000, xp: 1000, item: "streak_7_badge")
        case 30:
            return ChallengeReward(coins: 5000, xp: 5000, item: "streak_30_exclusive")
        default:
            return nil
        }
    }
}

// TODO: Implement daily challenge system
// - Generate 3 challenges daily (easy, medium, hard)
// - Use date-based seed for consistent challenges
// - Track progress during gameplay
// - Award rewards on completion
// - Track streak system
// - Send push notification for daily challenges
// - Display challenge UI with progress bars
// - Award bonus items for long streaks