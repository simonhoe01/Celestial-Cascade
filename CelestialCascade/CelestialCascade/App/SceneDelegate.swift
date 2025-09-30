//
//  SceneDelegate.swift
//  Celestial Cascade
//
//  Created by Expert iOS Developer
//  Copyright © 2025 Celestial Cascade. All rights reserved.
//

import UIKit
import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var appCoordinator: AppCoordinator?

    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        guard let windowScene = (scene as? UIWindowScene) else { return }

        // Create window
        let window = UIWindow(windowScene: windowScene)
        self.window = window

        // Setup root coordinator
        let coordinator = AppCoordinator(window: window)
        self.appCoordinator = coordinator

        // Start app flow
        coordinator.start()

        window.makeKeyAndVisible()
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called when the scene is being released by the system
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state

        // Resume game if it was paused
        NotificationCenter.default.post(name: .sceneDidBecomeActive, object: nil)

        // Refresh data
        Task {
            await refreshUserData()
        }
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state

        // Pause game
        NotificationCenter.default.post(name: .sceneWillResignActive, object: nil)

        // Save game state
        Task {
            await saveGameState()
        }
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground

        // Check for daily rewards
        Task {
            await checkDailyRewards()
        }

        // Sync with CloudKit
        Task {
            await syncWithCloud()
        }
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background

        // Save changes
        Task {
            await saveGameState()
        }

        // Schedule local notifications
        scheduleLocalNotifications()
    }

    // MARK: - Private Methods

    private func refreshUserData() async {
        do {
            let repository = UserRepository(
                swiftDataManager: SwiftDataManager.shared,
                cloudKitManager: CloudKitManager(),
                conflictResolver: ConflictResolver()
            )
            _ = try await repository.fetchProfile()
        } catch {
            print("Failed to refresh user data: \(error)")
        }
    }

    private func saveGameState() async {
        // Save current game state if playing
        do {
            try SwiftDataManager.shared.modelContext.save()
        } catch {
            print("Failed to save game state: \(error)")
        }
    }

    private func checkDailyRewards() async {
        let defaults = UserDefaultsManager()
        guard let lastRewardDate: Date = defaults.get(.lastDailyRewardDate) else {
            // First time - award day 1 reward
            return
        }

        let calendar = Calendar.current
        if !calendar.isDateInToday(lastRewardDate) {
            // Award daily reward
            // Increment streak or reset if more than 1 day passed
            let daysDiff = calendar.dateComponents([.day], from: lastRewardDate, to: Date()).day ?? 0

            if daysDiff == 1 {
                // Increment streak
                let currentStreak: Int = defaults.get(.currentStreak) ?? 0
                defaults.set(currentStreak + 1, for: .currentStreak)
            } else if daysDiff > 1 {
                // Reset streak
                defaults.set(1, for: .currentStreak)
            }

            defaults.set(Date(), for: .lastDailyRewardDate)

            // Show daily reward UI
            NotificationCenter.default.post(name: .showDailyReward, object: nil)
        }
    }

    private func syncWithCloud() async {
        // Sync user data with CloudKit
        do {
            let repository = UserRepository(
                swiftDataManager: SwiftDataManager.shared,
                cloudKitManager: CloudKitManager(),
                conflictResolver: ConflictResolver()
            )
            let profile = try await repository.fetchProfile()
            try await repository.update(profile) // Triggers CloudKit sync
        } catch {
            print("CloudKit sync failed: \(error)")
        }
    }

    private func scheduleLocalNotifications() {
        let notificationManager = NotificationManager()

        // Schedule daily reminder (if enabled)
        let defaults = UserDefaultsManager()
        if defaults.bool(for: .notificationsEnabled) {
            notificationManager.scheduleDailyReminder()
        }
    }
}

// MARK: - Notification Names

extension Notification.Name {
    static let sceneDidBecomeActive = Notification.Name("sceneDidBecomeActive")
    static let sceneWillResignActive = Notification.Name("sceneWillResignActive")
    static let showDailyReward = Notification.Name("showDailyReward")
}