//
//  Inventory.swift
//  Celestial Cascade
//
//  Player inventory for owned items and cosmetics
//

import Foundation

/// Player inventory
struct Inventory: Equatable, Codable, Sendable {
    var ownedSkins: Set<String>           // Skin IDs
    var ownedEffects: Set<String>         // Effect IDs
    var ownedBackgrounds: Set<String>     // Background IDs
    var activeSkinID: String?
    var activeEffectID: String?
    var activeBackgroundID: String?
    var powerUpCounts: [PowerUpType: Int] // Available power-ups

    init(
        ownedSkins: Set<String> = ["default"],
        ownedEffects: Set<String> = ["default"],
        ownedBackgrounds: Set<String> = ["default"],
        activeSkinID: String? = "default",
        activeEffectID: String? = "default",
        activeBackgroundID: String? = "default",
        powerUpCounts: [PowerUpType: Int] = [:]
    ) {
        self.ownedSkins = ownedSkins
        self.ownedEffects = ownedEffects
        self.ownedBackgrounds = ownedBackgrounds
        self.activeSkinID = activeSkinID
        self.activeEffectID = activeEffectID
        self.activeBackgroundID = activeBackgroundID
        self.powerUpCounts = powerUpCounts
    }

    /// Total number of owned cosmetic items
    var totalOwnedCosmetics: Int {
        return ownedSkins.count + ownedEffects.count + ownedBackgrounds.count
    }

    /// Check if player owns a skin
    func ownsSkin(_ id: String) -> Bool {
        return ownedSkins.contains(id)
    }

    /// Check if player owns an effect
    func ownsEffect(_ id: String) -> Bool {
        return ownedEffects.contains(id)
    }

    /// Check if player owns a background
    func ownsBackground(_ id: String) -> Bool {
        return ownedBackgrounds.contains(id)
    }

    /// Unlock a skin
    mutating func unlockSkin(_ id: String) {
        ownedSkins.insert(id)
    }

    /// Unlock an effect
    mutating func unlockEffect(_ id: String) {
        ownedEffects.insert(id)
    }

    /// Unlock a background
    mutating func unlockBackground(_ id: String) {
        ownedBackgrounds.insert(id)
    }

    /// Equip a skin
    mutating func equipSkin(_ id: String) -> Bool {
        guard ownsSkin(id) else { return false }
        activeSkinID = id
        return true
    }

    /// Equip an effect
    mutating func equipEffect(_ id: String) -> Bool {
        guard ownsEffect(id) else { return false }
        activeEffectID = id
        return true
    }

    /// Equip a background
    mutating func equipBackground(_ id: String) -> Bool {
        guard ownsBackground(id) else { return false }
        activeBackgroundID = id
        return true
    }

    /// Get power-up count
    func powerUpCount(_ type: PowerUpType) -> Int {
        return powerUpCounts[type] ?? 0
    }

    /// Add power-up
    mutating func addPowerUp(_ type: PowerUpType, count: Int = 1) {
        let currentCount = powerUpCounts[type] ?? 0
        powerUpCounts[type] = currentCount + count
    }

    /// Use power-up
    mutating func usePowerUp(_ type: PowerUpType) -> Bool {
        guard let count = powerUpCounts[type], count > 0 else { return false }
        powerUpCounts[type] = count - 1
        return true
    }

    /// Check if player has power-up available
    func hasPowerUp(_ type: PowerUpType) -> Bool {
        return powerUpCount(type) > 0
    }
}

// TODO: Implement inventory system
// - Unlock items through battle pass, achievements, purchases
// - Persist to SwiftData
// - Sync to CloudKit
// - Display in customization screen
// - Preview cosmetics before equipping
// - Apply active cosmetics to game rendering
// - Track power-up purchases and usage