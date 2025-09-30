# 🚀 Celestial Cascade - Setup Guide

Complete step-by-step guide to set up and run Celestial Cascade on macOS with Xcode.

---

## ⚠️ Important Note

This project was initially created on Windows for planning and code generation. To run on macOS/iOS, follow these setup steps carefully.

---

## 📋 Prerequisites

### Required

- **macOS**: 14.0 (Sonoma) or later
- **Xcode**: 15.0 or later
- **iOS Device/Simulator**: iOS 16.0 or later
- **Apple Developer Account**: For signing and capabilities
- **Git**: For version control

### Recommended

- **16GB+ RAM**: For smooth Xcode performance
- **SSD**: For fast builds
- **iPhone 12 or later**: For 120fps testing
- **AirPods Pro**: For spatial audio testing

---

## 🛠️ Setup Steps

### Step 1: Transfer to macOS

If you're moving from Windows development machine:

```bash
# On macOS, navigate to your development folder
cd ~/Developer

# Copy the CelestialCascade folder from Windows
# (Use AirDrop, USB drive, or cloud sync)

# Or clone if using Git
git clone <repository-url>
cd testxCode
```

### Step 2: Create Xcode Project

Since we generated Swift files on Windows, we need to create the Xcode project wrapper on macOS:

1. **Open Xcode**
2. **File → New → Project**
3. Select **iOS → App**
4. Configure:
   - **Product Name**: `CelestialCascade`
   - **Organization**: `Your Name`
   - **Bundle ID**: `com.yourname.celestialcascade`
   - **Interface**: `SwiftUI`
   - **Language**: `Swift`
   - **Include Tests**: ✅
5. **Save** to: `testxCode/CelestialCascade/`

### Step 3: Configure Project Settings

1. **Open Project Settings** (click project name in navigator)

2. **General Tab**:
   - **Display Name**: `Celestial Cascade`
   - **Bundle Identifier**: `com.yourname.celestialcascade`
   - **Version**: `1.0.0`
   - **Build**: `1`
   - **Minimum Deployments**: `iOS 16.0`

3. **Build Settings Tab**:
   - **Swift Language Version**: `Swift 6`
   - **Optimization Level (Debug)**: `-Onone`
   - **Optimization Level (Release)**: `-O`
   - **Enable Strict Concurrency Checking**: `Complete`

4. **Signing & Capabilities**:
   - Select your **Team**
   - **Signing Certificate**: Automatic
   - Add capabilities:
     - ☑️ **iCloud** → CloudKit
     - ☑️ **Game Center**
     - ☑️ **In-App Purchase**
     - ☑️ **Push Notifications**

### Step 4: Add Swift Package Dependencies

1. **File → Add Packages...**

2. Add **Composable Architecture**:
   - URL: `https://github.com/pointfreeco/swift-composable-architecture`
   - Dependency Rule: `Up to Next Major Version` → `1.0.0`
   - Add to Target: `CelestialCascade`

3. Add **Swift Collections**:
   - URL: `https://github.com/apple/swift-collections`
   - Dependency Rule: `Up to Next Major Version` → `1.0.0`
   - Add to Target: `CelestialCascade`

4. Wait for packages to resolve

### Step 5: Organize Files in Xcode

Now we need to add all our Swift files to the Xcode project:

1. **Delete** the auto-generated files:
   - Delete `ContentView.swift` (we have our own)
   - Keep `CelestialCascadeApp.swift` but replace with our version

2. **Add Existing Files**:
   - Right-click project in navigator
   - **Add Files to "CelestialCascade"...**
   - Navigate to `CelestialCascade/CelestialCascade/` folder
   - Select **all folders**: `App`, `Core`, `Features`, `Common`, `Resources`
   - **Options**:
     - ☑️ Copy items if needed
     - ☑️ Create groups (not folder references)
     - ☑️ Add to targets: `CelestialCascade`

3. **Verify Structure** in Xcode navigator:
```
CelestialCascade/
├── App/
├── Core/
│   ├── Domain/
│   ├── Data/
│   └── Presentation/
├── Features/
├── Common/
└── Resources/
```

### Step 6: Configure Info.plist

1. **Open Info.plist**

2. **Add Required Keys**:

```xml
<key>UILaunchStoryboardName</key>
<string>LaunchScreen</string>

<key>UIRequiresFullScreen</key>
<true/>

<key>UISupportedInterfaceOrientations</key>
<array>
    <string>UIInterfaceOrientationPortrait</string>
</array>

<key>UIStatusBarStyle</key>
<string>UIStatusBarStyleLightContent</string>

<key>NSUserTrackingUsageDescription</key>
<string>We use this to provide personalized game experiences.</string>

<key>NSLocalNetworkUsageDescription</key>
<string>Connect to Game Center for multiplayer features.</string>

<key>ITSAppUsesNonExemptEncryption</key>
<false/>

<key>UIBackgroundModes</key>
<array>
    <string>audio</string>
    <string>remote-notification</string>
</array>
```

### Step 7: Create Assets Catalog

1. **Navigate to Resources/Assets.xcassets**

2. **Create App Icon**:
   - Right-click Assets → **App Icons & Launch Images** → **New iOS App Icon**
   - Name: `AppIcon`
   - Add your icon images (1024×1024 required)

3. **Create Color Sets**:
   - **Primary**: #0A0E27
   - **Secondary**: #1A1F4D
   - **Accent**: #A855F7

4. **Add Image Assets**:
   - Logo
   - UI elements
   - Element sprites (can add placeholders for now)

### Step 8: Configure CloudKit

1. **Open CloudKit Dashboard**:
   - https://icloud.developer.apple.com/

2. **Select Container**:
   - `iCloud.com.yourname.celestialcascade`

3. **Create Record Types**:
   - `UserProfile` (fields: username, level, totalXP, coins, lastPlayedAt)
   - `GameState` (fields: levelNumber, score, boardState, lastSaved)

4. **Set Permissions**:
   - Default: Read/Write for owner

### Step 9: Configure Game Center

1. **Open App Store Connect**:
   - https://appstoreconnect.apple.com/

2. **Create App** (if needed):
   - Platform: iOS
   - Bundle ID: `com.yourname.celestialcascade`

3. **Configure Game Center**:
   - **Features** → **Game Center**
   - Enable Game Center

4. **Create Leaderboards**:
   - High Score (All Time)
   - Weekly High Score
   - Monthly High Score
   - Best Combo
   - Fastest Time

5. **Create Achievements** (40 total):
   - First Match
   - 100 Matches
   - Level 10 Reached
   - Perfect Score
   - ... (34 more)

### Step 10: Build and Run

1. **Select Target Device**:
   - iOS Simulator: **iPhone 15 Pro**
   - Or: **Your iOS Device**

2. **Build** (⌘ + B):
   - Fix any build errors (should be minimal)

3. **Run** (⌘ + R):
   - App should launch
   - You'll see errors for missing dependencies initially

4. **Common Issues**:

   **Missing Files**: Add placeholder files for:
   - `SwiftDataManager.swift`
   - `AudioManager.swift`
   - `HapticEngine.swift`
   - `AnalyticsManager.swift`
   - Other referenced managers

   **Import Errors**: Verify package dependencies are resolved

   **Signing Errors**: Check Team selection in Signing & Capabilities

---

## 🧪 Testing

### Run Unit Tests

```bash
⌘ + U
```

Or in Terminal:
```bash
xcodebuild test \
  -scheme CelestialCascade \
  -destination 'platform=iOS Simulator,name=iPhone 15 Pro'
```

### Run on Device

1. Connect iPhone via USB
2. Select device in Xcode
3. Trust computer on iPhone
4. ⌘ + R

---

## 🎮 First Run Checklist

After successful build:

- [ ] App launches without crashes
- [ ] Main menu displays
- [ ] Can start a game
- [ ] Elements appear on board
- [ ] Swipe gestures work
- [ ] Matches are detected
- [ ] Particles appear
- [ ] Sound plays
- [ ] Haptics trigger
- [ ] Score updates
- [ ] Level completes

---

## 🐛 Troubleshooting

### Build Errors

**"Cannot find type 'Store' in scope"**
- TCA not imported
- Solution: Add ComposableArchitecture package

**"Module 'SwiftData' not found"**
- Wrong deployment target
- Solution: Set minimum iOS to 16.0

**"No such module 'SpriteKit'"**
- Framework not linked
- Solution: Add SpriteKit in Build Phases → Link Binary

### Runtime Errors

**"Failed to initialize SwiftData"**
- Container not configured
- Solution: Implement SwiftDataManager.swift

**"CloudKit container not found"**
- Capability not enabled
- Solution: Enable iCloud in Signing & Capabilities

**"Game Center not available"**
- Not signed in
- Solution: Sign in to Game Center on device

---

## 📚 Next Steps

Once basic setup is complete:

1. **Implement Core Managers**:
   - SwiftDataManager
   - AudioManager
   - HapticEngine
   - AnalyticsManager

2. **Create Placeholder Assets**:
   - Element sprites
   - UI graphics
   - Sound effects

3. **Test Core Game Loop**:
   - Level generation
   - Match detection
   - Gravity/physics
   - Score calculation

4. **Iterate and Polish**:
   - Add remaining features
   - Optimize performance
   - Test on devices

---

## 🚀 Ready to Code!

You should now have a fully configured Xcode project ready for development. Open `CelestialCascade.xcodeproj` and start coding!

```bash
cd testxCode/CelestialCascade
open CelestialCascade.xcodeproj
```

Happy coding! 🎉

---

## 📞 Support

For issues during setup:
1. Check Xcode console for detailed errors
2. Verify all dependencies are resolved
3. Ensure code signing is configured
4. Check device/simulator OS version

---

**Setup complete! Time to build the best iOS game ever! 🌟**