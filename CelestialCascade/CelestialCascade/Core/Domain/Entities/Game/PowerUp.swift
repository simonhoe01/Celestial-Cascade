//
//  PowerUp.swift
//  Celestial Cascade
//
//  Power-ups that can be activated during gameplay
//

import Foundation

/// Types of power-ups available
enum PowerUpType: String, CaseIterable, Codable, Equatable, Sendable {
    case timeFreeze     // Freeze timer for 5 seconds
    case elementSwap    // Swap any two elements
    case colorBomb      // Remove all elements of one color
    case rowClear       // Clear entire row
    case columnClear    // Clear entire column
    case shuffle        // Shuffle board elements
    case multiplierBoost // Double multiplier for 10 seconds
    case ghostMode      // Matches don't remove elements (3 matches)
    case magnet         // Auto-attract similar elements
    case undo           // Undo last move

    var displayName: String {
        switch self {
        case .timeFreeze: return "Time Freeze"
        case .elementSwap: return "Element Swap"
        case .colorBomb: return "Color Bomb"
        case .rowClear: return "Row Clear"
        case .columnClear: return "Column Clear"
        case .shuffle: return "Shuffle"
        case .multiplierBoost: return "Multiplier Boost"
        case .ghostMode: return "Ghost Mode"
        case .magnet: return "Magnet"
        case .undo: return "Undo"
        }
    }

    var description: String {
        switch self {
        case .timeFreeze: return "Freezes the timer for 5 seconds"
        case .elementSwap: return "Swap any two elements on the board"
        case .colorBomb: return "Removes all elements of one color"
        case .rowClear: return "Clears an entire row"
        case .columnClear: return "Clears an entire column"
        case .shuffle: return "Shuffles all board elements"
        case .multiplierBoost: return "Doubles your multiplier for 10 seconds"
        case .ghostMode: return "Next 3 matches don't remove elements"
        case .magnet: return "Auto-attracts similar elements for 10 seconds"
        case .undo: return "Undo your last move"
        }
    }

    var iconName: String {
        return "powerup_\(rawValue)"
    }

    var duration: TimeInterval? {
        switch self {
        case .timeFreeze: return 5.0
        case .multiplierBoost: return 10.0
        case .ghostMode: return nil // 3 matches
        case .magnet: return 10.0
        default: return nil // Instant effect
        }
    }

    var coinCost: Int {
        switch self {
        case .undo: return 50
        case .timeFreeze: return 100
        case .elementSwap: return 150
        case .shuffle: return 200
        case .rowClear, .columnClear: return 250
        case .multiplierBoost: return 300
        case .ghostMode: return 350
        case .magnet: return 400
        case .colorBomb: return 500
        }
    }
}

/// Power-up instance with state
struct PowerUp: Equatable, Identifiable, Codable, Sendable {
    let id: UUID
    let type: PowerUpType
    var isActive: Bool
    var activatedAt: Date?
    var usesRemaining: Int? // For ghost mode

    init(
        id: UUID = UUID(),
        type: PowerUpType,
        isActive: Bool = false,
        activatedAt: Date? = nil,
        usesRemaining: Int? = nil
    ) {
        self.id = id
        self.type = type
        self.isActive = isActive
        self.activatedAt = activatedAt
        self.usesRemaining = usesRemaining
    }

    /// Check if power-up has expired
    func hasExpired(at currentTime: Date = Date()) -> Bool {
        guard isActive, let activatedAt = activatedAt else { return false }

        if let duration = type.duration {
            return currentTime.timeIntervalSince(activatedAt) >= duration
        }

        if let uses = usesRemaining {
            return uses <= 0
        }

        return false
    }

    /// Time remaining for timed power-ups
    func timeRemaining(at currentTime: Date = Date()) -> TimeInterval {
        guard isActive, let activatedAt = activatedAt, let duration = type.duration else {
            return 0
        }
        let elapsed = currentTime.timeIntervalSince(activatedAt)
        return max(0, duration - elapsed)
    }

    /// Activate power-up
    mutating func activate() {
        isActive = true
        activatedAt = Date()

        // Set uses for ghost mode
        if type == .ghostMode {
            usesRemaining = 3
        }
    }

    /// Deactivate power-up
    mutating func deactivate() {
        isActive = false
        activatedAt = nil
        usesRemaining = nil
    }

    /// Consume one use (for ghost mode)
    mutating func consumeUse() {
        if let uses = usesRemaining {
            usesRemaining = uses - 1
        }
    }
}

// TODO: Implement power-up system
// - Purchase power-ups with coins from shop
// - Store power-up inventory in UserProfile
// - Activate power-ups during gameplay
// - Apply effects to game state
// - Handle power-up UI and feedback
// - Create particle effects for each power-up
// - Play unique sound effects
// - Track power-up usage in analytics