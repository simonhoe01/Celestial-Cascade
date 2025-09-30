//
//  UserProfile.swift
//  Celestial Cascade
//
//  User profile with progression and stats
//

import Foundation

/// User profile containing all player data
struct UserProfile: Equatable, Identifiable, Codable, Sendable {
    let id: UUID
    var username: String
    var avatarURL: URL?
    var level: Int
    var currentXP: Int
    var totalXP: Int
    var prestigeLevel: Int
    var coins: Int
    var createdAt: Date
    var lastPlayedAt: Date

    init(
        id: UUID = UUID(),
        username: String,
        avatarURL: URL? = nil,
        level: Int = 1,
        currentXP: Int = 0,
        totalXP: Int = 0,
        prestigeLevel: Int = 0,
        coins: Int = 0,
        createdAt: Date = Date(),
        lastPlayedAt: Date = Date()
    ) {
        self.id = id
        self.username = username
        self.avatarURL = avatarURL
        self.level = level
        self.currentXP = currentXP
        self.totalXP = totalXP
        self.prestigeLevel = prestigeLevel
        self.coins = coins
        self.createdAt = createdAt
        self.lastPlayedAt = Date()
    }

    /// XP required for next level (non-linear curve: level² × 100)
    var xpRequiredForNextLevel: Int {
        return (level + 1) * (level + 1) * 100
    }

    /// Progress to next level (0.0 to 1.0)
    var progressToNextLevel: Double {
        return Double(currentXP) / Double(xpRequiredForNextLevel)
    }

    /// Display level (includes prestige)
    var displayLevel: String {
        if prestigeLevel > 0 {
            return "\(level) ★\(prestigeLevel)"
        }
        return "\(level)"
    }

    /// Whether player can prestige (level 100+)
    var canPrestige: Bool {
        return level >= 100
    }

    /// Skill level estimation (for difficulty scaling)
    func calculateSkillLevel() -> Double {
        // Based on total XP, prestige, and level
        let baseSkill = Double(level) / 100.0
        let prestigeBonus = Double(prestigeLevel) * 0.5
        let xpFactor = Double(totalXP) / 1_000_000.0
        return min(10.0, baseSkill + prestigeBonus + xpFactor)
    }

    /// Add XP and level up if threshold reached
    mutating func addXP(_ amount: Int) -> Bool {
        currentXP += amount
        totalXP += amount

        if currentXP >= xpRequiredForNextLevel {
            return levelUp()
        }
        return false
    }

    /// Level up and return excess XP
    private mutating func levelUp() -> Bool {
        let excess = currentXP - xpRequiredForNextLevel
        level += 1
        currentXP = excess
        return true
    }

    /// Prestige: reset level to 1 with bonuses
    mutating func prestige() {
        guard canPrestige else { return }
        prestigeLevel += 1
        level = 1
        currentXP = 0
        // Keep coins and total XP
    }

    /// Add coins
    mutating func addCoins(_ amount: Int) {
        coins += amount
    }

    /// Spend coins
    mutating func spendCoins(_ amount: Int) -> Bool {
        guard coins >= amount else { return false }
        coins -= amount
        return true
    }

    /// Update last played date
    mutating func updateLastPlayed() {
        lastPlayedAt = Date()
    }
}

// TODO: Implement user profile management
// - Create profile on first launch
// - Persist to SwiftData
// - Sync to CloudKit
// - Handle conflict resolution (use server for progress, client for settings)
// - Display profile in UI
// - Allow username editing
// - Game Center integration for avatar