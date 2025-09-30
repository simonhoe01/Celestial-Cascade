//
//  GameStats.swift
//  Celestial Cascade
//
//  Player statistics and records
//

import Foundation

/// Player game statistics
struct GameStats: Equatable, Codable, Sendable {
    var totalGamesPlayed: Int
    var totalGamesWon: Int
    var totalGamesLost: Int
    var highScore: Int
    var longestCombo: Int
    var totalPlaytime: TimeInterval
    var totalMatches: Int
    var favoriteElementType: ElementType?
    var perfectLevels: Int
    var totalCoinsEarned: Int
    var totalCoinsSpent: Int
    var powerUpsUsed: Int
    var achievementsUnlocked: Int

    init(
        totalGamesPlayed: Int = 0,
        totalGamesWon: Int = 0,
        totalGamesLost: Int = 0,
        highScore: Int = 0,
        longestCombo: Int = 0,
        totalPlaytime: TimeInterval = 0,
        totalMatches: Int = 0,
        favoriteElementType: ElementType? = nil,
        perfectLevels: Int = 0,
        totalCoinsEarned: Int = 0,
        totalCoinsSpent: Int = 0,
        powerUpsUsed: Int = 0,
        achievementsUnlocked: Int = 0
    ) {
        self.totalGamesPlayed = totalGamesPlayed
        self.totalGamesWon = totalGamesWon
        self.totalGamesLost = totalGamesLost
        self.highScore = highScore
        self.longestCombo = longestCombo
        self.totalPlaytime = totalPlaytime
        self.totalMatches = totalMatches
        self.favoriteElementType = favoriteElementType
        self.perfectLevels = perfectLevels
        self.totalCoinsEarned = totalCoinsEarned
        self.totalCoinsSpent = totalCoinsSpent
        self.powerUpsUsed = powerUpsUsed
        self.achievementsUnlocked = achievementsUnlocked
    }

    /// Win rate percentage
    var winRate: Double {
        guard totalGamesPlayed > 0 else { return 0 }
        return Double(totalGamesWon) / Double(totalGamesPlayed)
    }

    /// Average score per game
    var averageScore: Double {
        guard totalGamesWon > 0 else { return 0 }
        return Double(highScore) / Double(totalGamesWon)
    }

    /// Formatted playtime string
    var formattedPlaytime: String {
        let hours = Int(totalPlaytime) / 3600
        let minutes = (Int(totalPlaytime) % 3600) / 60
        return "\(hours)h \(minutes)m"
    }

    /// Update stats after game completion
    mutating func recordGame(session: GameSession) {
        totalGamesPlayed += 1

        if session.hasWon {
            totalGamesWon += 1
        } else {
            totalGamesLost += 1
        }

        if session.score > highScore {
            highScore = session.score
        }

        if session.combo.matchCount > longestCombo {
            longestCombo = session.combo.matchCount
        }

        totalPlaytime += session.duration
        totalMatches += session.moves

        if session.isPerfect {
            perfectLevels += 1
        }
    }

    /// Record element usage for favorite tracking
    mutating func recordElementMatch(_ type: ElementType) {
        // TODO: Implement proper tracking with counts per type
        favoriteElementType = type
    }

    /// Record coins earned
    mutating func earnCoins(_ amount: Int) {
        totalCoinsEarned += amount
    }

    /// Record coins spent
    mutating func spendCoins(_ amount: Int) {
        totalCoinsSpent += amount
    }

    /// Record power-up usage
    mutating func recordPowerUpUsed() {
        powerUpsUsed += 1
    }

    /// Record achievement unlocked
    mutating func recordAchievementUnlocked() {
        achievementsUnlocked += 1
    }
}

// TODO: Implement stats tracking
// - Update stats after each game
// - Display stats in profile screen
// - Use stats for achievement progress
// - Track element-specific stats
// - Export stats for analytics
// - Display leaderboard comparisons