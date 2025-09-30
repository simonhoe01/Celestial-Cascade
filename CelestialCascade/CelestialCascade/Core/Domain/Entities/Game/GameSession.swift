//
//  GameSession.swift
//  Celestial Cascade
//
//  Represents an active game session
//

import Foundation

/// Represents an active gameplay session
struct GameSession: Equatable, Identifiable, Codable, Sendable {
    let id: UUID
    let level: Level
    var board: Board
    var score: Int
    var moves: Int
    var timeRemaining: TimeInterval
    var combo: Combo
    var activePowerUps: [PowerUp]
    var isGameOver: Bool
    var isPaused: Bool
    var startedAt: Date
    var lastMoveAt: Date

    init(
        id: UUID = UUID(),
        level: Level,
        board: Board? = nil,
        score: Int = 0,
        moves: Int = 0,
        timeRemaining: TimeInterval? = nil,
        combo: Combo = Combo(),
        activePowerUps: [PowerUp] = [],
        isGameOver: Bool = false,
        isPaused: Bool = false,
        startedAt: Date = Date(),
        lastMoveAt: Date = Date()
    ) {
        self.id = id
        self.level = level
        self.board = board ?? Board(layout: level.layout)
        self.score = score
        self.moves = moves
        self.timeRemaining = timeRemaining ?? level.parTime
        self.combo = combo
        self.activePowerUps = activePowerUps
        self.isGameOver = isGameOver
        self.isPaused = isPaused
        self.startedAt = startedAt
        self.lastMoveAt = lastMoveAt
    }

    /// Whether player has won the level
    var hasWon: Bool {
        return score >= level.targetScore
    }

    /// Whether player has lost (time ran out)
    var hasLost: Bool {
        return timeRemaining <= 0 && !hasWon
    }

    /// Current star rating
    var stars: Int {
        return level.starThresholds.stars(for: score)
    }

    /// Whether achieved perfect score
    var isPerfect: Bool {
        return level.starThresholds.isPerfect(score)
    }

    /// Session duration
    var duration: TimeInterval {
        return Date().timeIntervalSince(startedAt)
    }

    /// Progress toward target score (0.0 to 1.0)
    var progressToTarget: Double {
        return min(1.0, Double(score) / Double(level.targetScore))
    }

    /// Add score with multiplier
    mutating func addScore(_ points: Int, withMultiplier: Bool = true) {
        let finalPoints = withMultiplier ? points * combo.multiplier : points
        score += finalPoints

        if withMultiplier {
            combo.addMatch(score: points)
        }
    }

    /// Update time remaining
    mutating func updateTime(delta: TimeInterval) {
        guard !isPaused else { return }
        timeRemaining = max(0, timeRemaining - delta)

        if timeRemaining <= 0 {
            isGameOver = true
        }
    }

    /// Add bonus time
    mutating func addBonusTime(_ seconds: TimeInterval) {
        timeRemaining += seconds
    }

    /// Record a move
    mutating func recordMove() {
        moves += 1
        lastMoveAt = Date()
    }

    /// Activate power-up
    mutating func activatePowerUp(_ powerUp: PowerUp) {
        var activatedPowerUp = powerUp
        activatedPowerUp.activate()
        activePowerUps.append(activatedPowerUp)
    }

    /// Update active power-ups (check for expiration)
    mutating func updatePowerUps(at currentTime: Date = Date()) {
        activePowerUps = activePowerUps.filter { !$0.hasExpired(at: currentTime) }
    }

    /// Check if specific power-up type is active
    func hasPowerUpActive(_ type: PowerUpType) -> Bool {
        return activePowerUps.contains { $0.type == type && $0.isActive }
    }

    /// Reset combo if expired
    mutating func checkComboExpiration(at currentTime: Date = Date()) {
        if !combo.isActive(at: currentTime) {
            combo.reset()
        }
    }

    /// Complete the session
    mutating func complete(won: Bool) {
        isGameOver = true
        isPaused = true
    }
}

// TODO: Implement GameSession management
// - Create session when level starts (StartLevelUseCase)
// - Update session state on each move
// - Persist session to SwiftData for resume
// - Track session analytics (moves, time, score)
// - Handle pause/resume
// - Calculate rewards on completion
// - Award XP and coins
// - Update statistics