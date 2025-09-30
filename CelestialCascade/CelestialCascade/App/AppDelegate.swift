//
//  AppDelegate.swift
//  Celestial Cascade
//
//  Created by Expert iOS Developer
//  Copyright © 2025 Celestial Cascade. All rights reserved.
//

import UIKit
import UserNotifications

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        // Initialize core managers
        setupCoreManagers()

        // Configure notifications
        configureNotifications()

        // Setup analytics (privacy-first)
        setupAnalytics()

        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(
        _ application: UIApplication,
        configurationForConnecting connectingSceneSession: UISceneSession,
        options: UIScene.ConnectionOptions
    ) -> UISceneConfiguration {
        return UISceneConfiguration(
            name: "Default Configuration",
            sessionRole: connectingSceneSession.role
        )
    }

    func application(
        _ application: UIApplication,
        didDiscardSceneSessions sceneSessions: Set<UISceneSession>
    ) {
        // Called when the user discards a scene session.
    }

    // MARK: - Push Notifications

    func application(
        _ application: UIApplication,
        didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data
    ) {
        let token = deviceToken.map { String(format: "%02.2hhx", $0) }.joined()
        print("Device Token: \(token)")
        // Send token to server if needed (currently none for privacy)
    }

    func application(
        _ application: UIApplication,
        didFailToRegisterForRemoteNotificationsWithError error: Error
    ) {
        print("Failed to register for notifications: \(error.localizedDescription)")
    }

    // MARK: - Private Setup Methods

    private func setupCoreManagers() {
        // Initialize SwiftData
        do {
            try SwiftDataManager.shared.setup()
        } catch {
            fatalError("Failed to initialize SwiftData: \(error)")
        }

        // Initialize texture cache
        TextureCache.shared.preloadAtlas(named: "Elements")
        TextureCache.shared.preloadAtlas(named: "UI")

        // Initialize audio manager
        AudioManager.shared.setup()

        // Initialize haptic engine
        HapticEngine.shared.setup()
    }

    private func configureNotifications() {
        UNUserNotificationCenter.current().delegate = self

        // Request notification permission
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { granted, error in
            if granted {
                DispatchQueue.main.async {
                    UIApplication.shared.registerForRemoteNotifications()
                }
            }
        }
    }

    private func setupAnalytics() {
        // Privacy-first analytics - no third-party SDKs
        AnalyticsManager.shared.initialize()
        AnalyticsManager.shared.trackEvent(.appLaunched)
    }
}

// MARK: - UNUserNotificationCenterDelegate

extension AppDelegate: UNUserNotificationCenterDelegate {
    func userNotificationCenter(
        _ center: UNUserNotificationCenter,
        willPresent notification: UNNotification,
        withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void
    ) {
        // Show notification even when app is in foreground
        completionHandler([.banner, .sound, .badge])
    }

    func userNotificationCenter(
        _ center: UNUserNotificationCenter,
        didReceive response: UNNotificationResponse,
        withCompletionHandler completionHandler: @escaping () -> Void
    ) {
        // Handle notification tap
        let userInfo = response.notification.request.content.userInfo
        handleNotificationTap(userInfo: userInfo)
        completionHandler()
    }

    private func handleNotificationTap(userInfo: [AnyHashable: Any]) {
        // Parse notification and navigate to appropriate screen
        if let type = userInfo["type"] as? String {
            switch type {
            case "daily_challenge":
                // Navigate to daily challenge
                break
            case "battle_pass":
                // Navigate to battle pass
                break
            case "friend_challenge":
                // Navigate to friend challenge
                break
            default:
                break
            }
        }
    }
}