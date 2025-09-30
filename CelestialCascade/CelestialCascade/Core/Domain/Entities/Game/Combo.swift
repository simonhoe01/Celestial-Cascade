//
//  Combo.swift
//  Celestial Cascade
//
//  Tracks combo chains and multipliers
//

import Foundation

/// Represents a combo chain of matches
struct Combo: Equatable, Codable, Sendable {
    let id: UUID
    var matchCount: Int
    var totalScore: Int
    var startTime: Date
    var lastMatchTime: Date
    let timeWindow: TimeInterval = 3.0 // 3 seconds to continue combo

    init(id: UUID = UUID(), matchCount: Int = 0, totalScore: Int = 0, startTime: Date = Date()) {
        self.id = id
        self.matchCount = matchCount
        self.totalScore = totalScore
        self.startTime = startTime
        self.lastMatchTime = startTime
    }

    /// Current multiplier based on match count
    var multiplier: Int {
        switch matchCount {
        case 0...1: return 1
        case 2: return 2
        case 3: return 3
        case 4...5: return 5
        case 6...9: return 10
        default: return 25 // 10+ matches
        }
    }

    /// Display text for multiplier (e.g., "2x", "10x")
    var multiplierText: String {
        return "\(multiplier)x"
    }

    /// Time remaining before combo expires
    func timeRemaining(at currentTime: Date = Date()) -> TimeInterval {
        let elapsed = currentTime.timeIntervalSince(lastMatchTime)
        return max(0, timeWindow - elapsed)
    }

    /// Whether combo is still active
    func isActive(at currentTime: Date = Date()) -> Bool {
        return timeRemaining(at: currentTime) > 0
    }

    /// Add a match to the combo chain
    mutating func addMatch(score: Int, at time: Date = Date()) {
        guard isActive(at: time) else { return }
        matchCount += 1
        totalScore += score * multiplier
        lastMatchTime = time
    }

    /// Reset combo
    mutating func reset() {
        matchCount = 0
        totalScore = 0
        startTime = Date()
        lastMatchTime = Date()
    }
}

// TODO: Implement combo tracking in GameSession
// - Start combo on first match
// - Extend combo when matches occur within time window
// - Apply multiplier to score calculations
// - Display combo UI with countdown timer
// - Play escalating audio feedback
// - Trigger celebration particles at high multipliers