# 🎮 CELESTIAL CASCADE - MASTER DEVELOPMENT PLAN
## The Ultimate iOS Puzzle-Adventure Game - Complete Implementation Guide

---

## TABLE OF CONTENTS

1. [Executive Summary](#executive-summary)
2. [Game Concept & Design Philosophy](#game-concept--design-philosophy)
3. [Technical Architecture](#technical-architecture)
4. [Complete File Structure](#complete-file-structure)
5. [Detailed Implementation Plan](#detailed-implementation-plan)
6. [Phase-by-Phase Development](#phase-by-phase-development)
7. [File-by-File Implementation Guide](#file-by-file-implementation-guide)
8. [Testing & Quality Assurance](#testing--quality-assurance)
9. [Launch & Marketing Strategy](#launch--marketing-strategy)
10. [Post-Launch & Maintenance](#post-launch--maintenance)

---

## EXECUTIVE SUMMARY

**Celestial Cascade** is a premium iOS puzzle-adventure game that combines physics-based gameplay with procedurally generated challenges, stunning particle effects, and an addictive progression system. Built entirely in Swift using SpriteKit and Metal, this game showcases world-class solo development.

### Why This Will Succeed

**Addictive Psychology**: Variable reward systems, flow state optimization, dopamine-driven loops, daily engagement mechanics, and scarcity-based incentives create compulsive gameplay.

**Visual Excellence**: GPU-accelerated particle systems (10,000+ particles at 120fps), Metal shader effects, dynamic backgrounds, smooth animations, and glassmorphism UI create a stunning visual experience.

**Infinite Replayability**: Hybrid procedural generation (Perlin noise + Wave Function Collapse) ensures every session feels unique with adaptive difficulty scaling.

**Ethical Monetization**: Cosmetic-only purchases, optional battle pass (50 tiers), no pay-to-win mechanics, and transparent pricing build player trust.

**Technical Showcase**: Native Swift 6, strict concurrency, TCA architecture, Metal optimization, spatial audio, advanced haptics, and CloudKit sync demonstrate cutting-edge development.

**Social Features**: Game Center leaderboards (5 categories), ghost replays, friend challenges, weekly tournaments, and achievement system (30+) foster community.

### Target Metrics
- **App Size**: <150MB initial download
- **Performance**: Locked 120fps on iPhone 12+, 60fps on older devices
- **Battery**: <5% drain per 30-minute session
- **Retention**: D1: 45%, D7: 25%, D30: 12%
- **Monetization**: ARPU $2.50, conversion rate 8%
- **Rating**: Target 4.7+ stars with 1000+ reviews in first month

---

## GAME CONCEPT & DESIGN PHILOSOPHY

### Core Game Loop (30-60 seconds per session)

1. **Present Challenge**: Procedurally generated level with cosmic elements
2. **Player Action**: Swipe/tap to manipulate elements and create matches
3. **Immediate Feedback**: Particle explosions, haptics, spatial audio, score multipliers
4. **Variable Reward**: XP, coins, random power-ups, achievement progress
5. **Progress Indicator**: Visual XP bar, daily challenge counter, battle pass tier
6. **Hook for Return**: "One more level" psychology, daily streak, time-limited events

### Game Mechanics

#### Core Gameplay
- **Match-3+ System**: Match 3 or more cosmic elements (Stars, Nebulas, Comets, Galaxies, Black Holes, Supernovas, Wormholes)
- **Physics-Based**: Elements fall with realistic gravity, bounce, and interact
- **Gesture Controls**: Swipe to move, tap to activate power-ups, pinch to zoom (strategic view)
- **Combo System**: Chain matches within 3 seconds for multipliers (2x, 3x, 5x, 10x, 25x)
- **Time Pressure**: 90-second levels with time extension bonuses
- **Strategic Depth**: Element interactions (e.g., Black Holes absorb adjacent, Supernovas clear row/column)

#### Progression Systems

**Experience & Leveling**
- Non-linear XP curve: Level N requires N² × 100 XP
- 200 levels with milestone rewards every 5 levels
- Prestige system unlocks at level 100 (reset with permanent bonuses)

**Daily Challenges**
- 3 unique challenges per day (Easy, Medium, Hard)
- Streak bonuses: 3 days (+50% coins), 7 days (+100% XP), 30 days (exclusive cosmetic)
- Challenges refresh at 00:00 UTC

**Battle Pass**
- 50-tier seasonal system (8 weeks per season)
- Free track: 20 rewards (coins, XP boosts, common cosmetics)
- Premium track ($9.99): 50 rewards (exclusive skins, particle effects, profile customization)
- XP earned through gameplay (1 tier = 1000 battle pass XP)
- No tier skipping purchases (earn-only, respecting player time)

**Achievements**
- 30 base achievements + 10 hidden
- Categories: Mastery (score/combos), Persistence (streaks/sessions), Discovery (hidden interactions), Social (leaderboard/friends)
- Achievement points unlock profile badges

#### Unlockable Content

**Element Skins** (50 sets)
- Themed collections: Cyberpunk Cosmos, Watercolor Space, Neon Galaxy, etc.
- Unlock via: Battle pass, achievements, milestone rewards, special events

**Particle Effects** (25 options)
- Match effects: Fireworks, lightning, sparkles, smoke, geometric, etc.
- Premium battle pass exclusive

**Background Themes** (15 animated backdrops)
- Parallax layers with dynamic animations
- Themes: Nebula Storm, Quantum Realm, Crystal Void, etc.

**Power-Ups** (10 types)
- Time Freeze (5 seconds), Element Swap, Color Bomb, Row/Column Clear, Shuffle Board, Multiplier Boost, Ghost Mode (matches don't remove), Magnet (auto-attract), Rainbow Element (matches anything), Undo Move

### Visual Design

#### Color Palette
- Primary: Deep space blues (#0A0E27, #1A1F4D)
- Accent: Vibrant cosmic colors (Purple #A855F7, Cyan #22D3EE, Pink #EC4899, Gold #FBBF24)
- Contrast ratio: Minimum 4.5:1 for accessibility
- Color blind modes: Protanopia, Deuteranopia, Tritanopia (icon overlays + adjusted palettes)

#### Typography
- Primary: SF Pro Rounded (Apple's system font, optimized for games)
- Sizes: Titles 34pt, Body 17pt, Captions 13pt, Scores 24pt bold
- Dynamic Type support with max/min bounds

#### UI Style
- Glassmorphism: Frosted glass panels with blur backdrop
- Rounded corners: 16px standard, 24px for cards
- Shadows: Multi-layer depth (ambient + directional)
- Animations: Spring physics (damping 0.7, response 0.3)
- Micro-interactions: Button press (scale 0.95), success (scale 1.1 + particles)

#### Particle Systems
- Match explosions: 200-500 particles, 0.5s duration
- Background ambient: 1000+ particles, slow drift
- Combo celebrations: 1000-2000 particles, radial burst
- Power-up activations: 500 particles, directional flow
- Metal compute shaders for GPU acceleration

### Audio Design

#### Music
- Adaptive soundtrack: 5 intensity layers that blend based on combo multiplier
- Base layer: Ambient pad (50-60 BPM)
- Layers add: Rhythm, melody, bass, lead synth
- Seamless transitions using crossfading
- Format: AAC 256kbps, spatial audio encoded

#### Sound Effects (60+ sounds)
- Match sounds: Different pitch per element type (C, D, E, G, A notes)
- Combo escalation: Rising pitch with multiplier
- Power-ups: Distinct whoosh/explosion per type
- UI: Subtle clicks, swipes, confirmations
- Haptic-synchronized audio spikes

#### Spatial Audio
- 3D positioning using AVAudioEnvironmentNode
- Matches positioned at element location
- Power-ups move across stereo field
- Background ambience surrounds player
- Head tracking support for AirPods Pro

### Haptic Design

#### Custom Patterns (15 patterns)
- **Light Tap**: UI interactions (intensity 0.3, sharpness 0.5)
- **Medium Tap**: Element selection (intensity 0.6, sharpness 0.6)
- **Heavy Tap**: Match completion (intensity 1.0, sharpness 0.8)
- **Burst**: Combo trigger (4 transient events, 50ms apart)
- **Rumble**: Power-up activation (continuous, 0.3s, intensity ramp 0.5→1.0)
- **Success Pattern**: Achievement unlock (custom AHAP file, 1.2s journey)
- **Failure Pattern**: Level fail (dull thud, intensity 0.7, sharpness 0.2)

#### Implementation Strategy
- CHHapticEngine with automatic restart on interruption
- Respect user preferences (Settings > Sounds & Haptics)
- Degradation on unsupported devices (iPhone 6s and earlier)
- Haptic budget: Max 10 events per second to avoid fatigue

---

## TECHNICAL ARCHITECTURE

### Technology Stack

#### Core Technologies
- **Language**: Swift 6.0 (strict concurrency, typed throws, modern syntax)
- **Framework**: SpriteKit 2.0 for 2D rendering
- **Graphics**: Metal 3 for shaders and compute
- **Architecture**: TCA (The Composable Architecture) for state management
- **Persistence**: SwiftData + CloudKit for iCloud sync
- **Audio**: AVAudioEngine + Spatial Audio API
- **Haptics**: Core Haptics with custom AHAP files
- **Social**: GameKit for Game Center integration
- **Monetization**: StoreKit 2 for in-app purchases
- **Analytics**: Privacy-first custom solution (no third-party SDKs)

#### Design Patterns

**The Composable Architecture (TCA)**
- Unidirectional data flow
- State: Single source of truth for game state
- Actions: All user interactions and system events
- Reducers: Pure functions that mutate state
- Effects: Async operations (network, database, timers)
- Dependencies: Testable dependency injection

**Coordinator Pattern**
- Scene navigation and flow control
- AppCoordinator manages app-level transitions
- GameCoordinator manages gameplay flow
- Separation of concerns between view logic and navigation

**Repository Pattern**
- Abstract data sources (SwiftData, CloudKit, UserDefaults)
- Single interface for data operations
- Enables offline-first architecture
- Testable with mock repositories

**Factory Pattern**
- Level generation (LevelFactory)
- Particle emitters (ParticleFactory)
- Sound effects (AudioFactory)
- Configurable creation logic

**Observer Pattern**
- Combine publishers for reactive updates
- Notification center for system events
- Delegate pattern for scene callbacks

**Object Pool Pattern**
- Reusable sprite nodes
- Audio player nodes
- Particle emitters
- Reduces allocation overhead

### Architecture Layers

```
┌─────────────────────────────────────────────────────────────────┐
│                     Presentation Layer                          │
│  ┌──────────────┐  ┌──────────────┐  ┌──────────────┐         │
│  │ SpriteKit    │  │ SwiftUI      │  │ Coordinators │         │
│  │ Scenes       │  │ Views        │  │              │         │
│  └──────────────┘  └──────────────┘  └──────────────┘         │
└─────────────────────────────────────────────────────────────────┘
                             │
┌─────────────────────────────────────────────────────────────────┐
│                      Domain Layer                               │
│  ┌──────────────┐  ┌──────────────┐  ┌──────────────┐         │
│  │ Entities     │  │ Use Cases    │  │ Repositories │         │
│  │ (Models)     │  │ (Business    │  │ (Interfaces) │         │
│  │              │  │  Logic)      │  │              │         │
│  └──────────────┘  └──────────────┘  └──────────────┘         │
└─────────────────────────────────────────────────────────────────┘
                             │
┌─────────────────────────────────────────────────────────────────┐
│                        Data Layer                               │
│  ┌──────────────┐  ┌──────────────┐  ┌──────────────┐         │
│  │ SwiftData    │  │ CloudKit     │  │ UserDefaults │         │
│  │ Models       │  │ Sync         │  │              │         │
│  └──────────────┘  └──────────────┘  └──────────────┘         │
└─────────────────────────────────────────────────────────────────┘
                             │
┌─────────────────────────────────────────────────────────────────┐
│                    Infrastructure Layer                         │
│  ┌──────────────┐  ┌──────────────┐  ┌──────────────┐         │
│  │ Metal        │  │ Core Haptics │  │ AVFoundation │         │
│  │ Shaders      │  │              │  │              │         │
│  └──────────────┘  └──────────────┘  └──────────────┘         │
└─────────────────────────────────────────────────────────────────┘
```

### State Management with TCA

#### Global App State
```swift
struct AppState: Equatable {
    var gameState: GameState?
    var userState: UserState
    var settingsState: SettingsState
    var shopState: ShopState
    var leaderboardState: LeaderboardState
}

struct GameState: Equatable {
    var currentLevel: Level
    var board: Board
    var score: Int
    var multiplier: Int
    var timeRemaining: TimeInterval
    var activePowerUps: [PowerUp]
    var isGameOver: Bool
}

struct UserState: Equatable {
    var profile: UserProfile
    var stats: GameStats
    var inventory: Inventory
    var battlePass: BattlePassProgress
    var achievements: [Achievement]
}
```

#### Actions
```swift
enum AppAction {
    case game(GameAction)
    case user(UserAction)
    case settings(SettingsAction)
    case shop(ShopAction)
}

enum GameAction {
    case startLevel(Level)
    case elementTapped(Element)
    case elementSwiped(from: Element, to: Element)
    case powerUpActivated(PowerUp)
    case timerTicked
    case matchDetected([Element])
    case levelCompleted(score: Int)
    case levelFailed
}
```

#### Reducer
```swift
let appReducer = Reducer<AppState, AppAction, AppEnvironment>.combine(
    gameReducer.pullback(
        state: \.gameState,
        action: /AppAction.game,
        environment: { $0 }
    ),
    userReducer.pullback(
        state: \.userState,
        action: /AppAction.user,
        environment: { $0 }
    ),
    // ... other reducers
)
```

### Procedural Generation System

#### Hybrid Algorithm Approach

**Wave Function Collapse (WFC)**
- Constraint-based generation
- Ensures solvable levels
- Pattern matching for element placement
- Propagates constraints to neighboring cells
- Average generation time: 50ms for 8×8 board

**Perlin Noise**
- Continuous terrain-like difficulty curves
- Seeds control randomness (daily seed for shared challenges)
- Smooth difficulty transitions across levels
- Multi-octave noise for varied patterns

**Genetic Algorithm (GA)**
- Optimizes level playability
- Fitness function evaluates: solvability, difficulty, fun factor
- Population of 100 levels per generation
- Runs offline to pre-generate level pool

#### Level Generation Pipeline

1. **Seed Selection**: Deterministic seed from level number + daily challenge flag
2. **Board Layout**: WFC generates initial element placement (2-3 iterations)
3. **Difficulty Scaling**: Perlin noise modulates element distribution based on player level
4. **Constraint Verification**: Ensure minimum matches available (≥3), valid moves (≥5), no dead ends
5. **Optimization Pass**: GA refines level for target completion time (60-90s)
6. **Caching**: Pre-generate next 10 levels in background
7. **Validation**: Quick playtest simulation verifies solvability

#### Difficulty Scaling Algorithm
```
difficulty = baselineDifficulty + (playerLevel × 0.05)
elementComplexity = min(7, floor(difficulty / 10) + 3) // 3-7 element types
timeLimit = 120 - (difficulty × 2) // 120s → 60s over progression
powerUpSpawnRate = max(0.05, 0.15 - (difficulty × 0.002))
```

### Physics Engine Optimization

#### SpriteKit Physics Tuning
- **Gravity**: (0, -9.8) for realistic falling
- **Physics Bodies**: Circle shapes for elements (faster than per-pixel)
- **Collision Layers**: 32-bit masks for element types, walls, power-ups
- **Sleeping**: Static elements sleep after 0.5s idle
- **Substeps**: 4 substeps per frame for accuracy without performance cost
- **Contact Delegate**: Batch processing of collision callbacks

#### Custom Physics Extensions
- **Predictive Physics**: Calculate next 3 frames for instant response
- **Particle Physics**: Simplified collision for particle systems (bounding box only)
- **Gesture-Driven Forces**: Apply impulses based on swipe velocity
- **Chain Reaction Manager**: Queue explosions to prevent frame drops

### Metal Shader System

#### Particle Compute Shader
```metal
kernel void updateParticles(
    device Particle *particles [[buffer(0)]],
    constant ParticleUniforms &uniforms [[buffer(1)]],
    uint id [[thread_position_in_grid]]
) {
    Particle particle = particles[id];

    // Update position
    particle.position += particle.velocity * uniforms.deltaTime;
    particle.velocity += uniforms.gravity * uniforms.deltaTime;

    // Update life
    particle.life -= uniforms.deltaTime;
    particle.alpha = particle.life / particle.initialLife;

    // Apply forces
    float3 force = computeForce(particle.position, uniforms);
    particle.velocity += force * uniforms.deltaTime;

    particles[id] = particle;
}
```

#### Post-Processing Effects
- **Bloom**: Two-pass Gaussian blur + additive blend (5ms per frame)
- **Color Grading**: LUT-based (1ms per frame)
- **Chromatic Aberration**: RGB channel offset (2ms per frame)
- **Motion Blur**: Velocity buffer sampling (3ms per frame)
- **Vignette**: Radial gradient overlay (0.5ms per frame)

#### Performance Budgets
- Particle system: 5ms per frame (max 10,000 particles)
- Post-processing: 8ms per frame (all effects combined)
- Physics: 4ms per frame
- Rendering: 6ms per frame
- Game logic: 3ms per frame
- **Total**: 26ms per frame (≈38fps minimum, targeting 120fps)

### Memory Management Strategy

#### Memory Budgets
- **Textures**: 80MB (texture atlases, compressed PVRTC)
- **Audio**: 15MB (compressed AAC, streamed music)
- **Code**: 10MB
- **Game State**: 5MB
- **Particle Buffers**: 8MB
- **Total**: ~120MB active, <150MB peak

#### Texture Atlas Strategy
- **Elements Atlas**: 2048×2048 PVRTC (7 elements × 10 animation frames × 5 skin sets)
- **UI Atlas**: 1024×1024 RGBA8 (buttons, icons, decorations)
- **Background Atlas**: 2048×2048 PVRTC (15 background themes)
- **Effects Atlas**: 1024×1024 RGBA8 (particle textures, glow maps)

#### Object Pooling
- **Sprite Nodes**: Pool of 200 (reused for falling elements)
- **Particle Emitters**: Pool of 20 (reset and reused)
- **Audio Players**: Pool of 32 (max simultaneous sounds)
- **Labels**: Pool of 50 (score popups, notifications)

#### Autorelease Pool Optimization
```swift
// Optimize level generation
for level in 1...1000 {
    autoreleasepool {
        let generatedLevel = levelGenerator.generate(level)
        cacheToDisk(generatedLevel)
    }
}

// Optimize particle updates
func update(deltaTime: TimeInterval) {
    autoreleasepool {
        particleSystem.update(deltaTime)
        // Temporary objects released here
    }
}
```

#### Memory Leak Detection
- **Instruments Leaks**: Weekly profiling
- **Memory Graph Debugger**: Check for retain cycles
- **Weak References**: All delegates and closures
- **Manual Testing**: Continuous play for 30+ minutes

---

## COMPLETE FILE STRUCTURE

```
CelestialCascade/
├── CelestialCascade.xcodeproj
│   ├── project.pbxproj
│   └── xcshareddata/
│       └── xcschemes/
│           ├── CelestialCascade.xcscheme
│           ├── CelestialCascadeTests.xcscheme
│           └── CelestialCascadePerformance.xcscheme
│
├── CelestialCascade/                                    [Main App Target]
│   │
│   ├── App/                                             [App Lifecycle]
│   │   ├── AppDelegate.swift                            # iOS 13+ app delegate, push notifications
│   │   ├── SceneDelegate.swift                          # Window scene management
│   │   └── CelestialCascadeApp.swift                    # SwiftUI app entry (iOS 14+)
│   │
│   ├── Core/                                            [Clean Architecture Layers]
│   │   │
│   │   ├── Domain/                                      [Business Logic Layer - Framework Independent]
│   │   │   │
│   │   │   ├── Entities/                                [Core Business Models]
│   │   │   │   ├── Game/
│   │   │   │   │   ├── Level.swift                      # Level model: id, difficulty, seed, layout, par time
│   │   │   │   │   ├── Board.swift                      # 8×8 grid of elements, match detection logic
│   │   │   │   │   ├── Element.swift                    # Element type (7 types), position, state
│   │   │   │   │   ├── Match.swift                      # Matched elements, match type, score value
│   │   │   │   │   ├── Combo.swift                      # Combo chain, multiplier, time window
│   │   │   │   │   ├── PowerUp.swift                    # PowerUp type (10 types), duration, effect
│   │   │   │   │   └── GameSession.swift                # Session state, score, moves, time
│   │   │   │   │
│   │   │   │   ├── User/
│   │   │   │   │   ├── UserProfile.swift                # Username, avatar, level, total XP, prestige
│   │   │   │   │   ├── GameStats.swift                  # Total games, wins, high score, playtime
│   │   │   │   │   ├── Inventory.swift                  # Owned skins, effects, power-ups, coins
│   │   │   │   │   ├── DailyChallenge.swift             # Challenge definition, progress, rewards
│   │   │   │   │   ├── DailyStreak.swift                # Streak count, last played date, rewards
│   │   │   │   │   └── Settings.swift                   # Audio, haptics, notifications, accessibility
│   │   │   │   │
│   │   │   │   ├── Progression/
│   │   │   │   │   ├── Achievement.swift                # Achievement id, progress, unlocked state
│   │   │   │   │   ├── AchievementDefinition.swift      # Achievement metadata, requirements, rewards
│   │   │   │   │   ├── BattlePass.swift                 # Season id, tier progress, purchased state
│   │   │   │   │   ├── BattlePassTier.swift             # Tier number, XP required, rewards
│   │   │   │   │   ├── UnlockableItem.swift             # Item type, unlock condition, metadata
│   │   │   │   │   └── XPTransaction.swift              # XP source, amount, timestamp
│   │   │   │   │
│   │   │   │   ├── Social/
│   │   │   │   │   ├── LeaderboardEntry.swift           # Player id, score, rank, timestamp
│   │   │   │   │   ├── LeaderboardType.swift            # Global, friends, weekly, seasonal, all-time
│   │   │   │   │   ├── FriendChallenge.swift            # Challenge from friend, score to beat
│   │   │   │   │   ├── GhostReplay.swift                # Replay data, player id, moves sequence
│   │   │   │   │   └── Tournament.swift                 # Tournament id, bracket, participants
│   │   │   │   │
│   │   │   │   └── Monetization/
│   │   │   │       ├── Product.swift                    # StoreKit product wrapper
│   │   │   │       ├── Transaction.swift                # Purchase record, verification state
│   │   │   │       └── SubscriptionStatus.swift         # Battle pass subscription state
│   │   │   │
│   │   │   ├── UseCases/                                [Business Logic Operations]
│   │   │   │   ├── Game/
│   │   │   │   │   ├── StartLevelUseCase.swift          # Load level, initialize board, start timer
│   │   │   │   │   ├── DetectMatchesUseCase.swift       # Scan board, find matches, calculate scores
│   │   │   │   │   ├── ProcessMatchUseCase.swift        # Remove matched, apply gravity, spawn new
│   │   │   │   │   ├── SwapElementsUseCase.swift        # Validate swap, animate, check matches
│   │   │   │   │   ├── ActivatePowerUpUseCase.swift     # Apply power-up effect, update board
│   │   │   │   │   ├── CalculateScoreUseCase.swift      # Base score + multiplier + combo bonus
│   │   │   │   │   ├── CheckWinConditionUseCase.swift   # Compare score vs target, time remaining
│   │   │   │   │   └── EndLevelUseCase.swift            # Calculate rewards, update stats, save
│   │   │   │   │
│   │   │   │   ├── Progression/
│   │   │   │   │   ├── AwardXPUseCase.swift             # Add XP, check level up, trigger rewards
│   │   │   │   │   ├── CheckAchievementUseCase.swift    # Update achievement progress, unlock
│   │   │   │   │   ├── UnlockItemUseCase.swift          # Add item to inventory, show notification
│   │   │   │   │   ├── UpdateBattlePassUseCase.swift    # Add battle pass XP, unlock tiers
│   │   │   │   │   └── CalculateDailyRewardsUseCase.swift # Check streaks, award daily bonuses
│   │   │   │   │
│   │   │   │   ├── Social/
│   │   │   │   │   ├── SubmitScoreUseCase.swift         # Submit to Game Center leaderboard
│   │   │   │   │   ├── FetchLeaderboardUseCase.swift    # Get top scores, filter by type
│   │   │   │   │   ├── RecordGhostReplayUseCase.swift   # Save move sequence for replay
│   │   │   │   │   ├── ChallengeeFriendUseCase.swift    # Send friend challenge via Game Center
│   │   │   │   │   └── JoinTournamentUseCase.swift      # Enter weekly tournament bracket
│   │   │   │   │
│   │   │   │   └── Monetization/
│   │   │   │       ├── FetchProductsUseCase.swift       # Load StoreKit products
│   │   │   │       ├── PurchaseProductUseCase.swift     # Handle purchase flow, verify
│   │   │   │       ├── VerifyTransactionUseCase.swift   # JWS signature verification
│   │   │   │       └── RestorePurchasesUseCase.swift    # Restore previous purchases
│   │   │   │
│   │   │   └── Repositories/                            [Data Access Interfaces]
│   │   │       ├── GameRepositoryProtocol.swift         # Save/load game state
│   │   │       ├── UserRepositoryProtocol.swift         # User profile CRUD
│   │   │       ├── ProgressionRepositoryProtocol.swift  # Achievements, battle pass
│   │   │       ├── LeaderboardRepositoryProtocol.swift  # Game Center operations
│   │   │       ├── StoreRepositoryProtocol.swift        # StoreKit operations
│   │   │       └── AnalyticsRepositoryProtocol.swift    # Event tracking
│   │   │
│   │   ├── Data/                                        [Data Implementation Layer]
│   │   │   │
│   │   │   ├── Repositories/                            [Repository Implementations]
│   │   │   │   ├── GameRepository.swift                 # SwiftData + CloudKit game state
│   │   │   │   ├── UserRepository.swift                 # SwiftData user profile
│   │   │   │   ├── ProgressionRepository.swift          # Achievements, battle pass persistence
│   │   │   │   ├── LeaderboardRepository.swift          # GameKit wrapper
│   │   │   │   ├── StoreRepository.swift                # StoreKit 2 wrapper
│   │   │   │   └── AnalyticsRepository.swift            # Local analytics storage
│   │   │   │
│   │   │   ├── DataSources/                             [Data Access Layer]
│   │   │   │   ├── Local/
│   │   │   │   │   ├── SwiftDataManager.swift           # SwiftData ModelContainer setup
│   │   │   │   │   ├── UserDefaultsManager.swift        # Simple key-value storage
│   │   │   │   │   ├── KeychainManager.swift            # Secure storage for tokens
│   │   │   │   │   └── FileManager+Extensions.swift     # File system operations
│   │   │   │   │
│   │   │   │   ├── Remote/
│   │   │   │   │   ├── CloudKitManager.swift            # CloudKit sync operations
│   │   │   │   │   ├── CloudKitSyncEngine.swift         # CKSyncEngine wrapper
│   │   │   │   │   └── ConflictResolver.swift           # CloudKit conflict resolution
│   │   │   │   │
│   │   │   │   └── Cache/
│   │   │   │       ├── LevelCache.swift                 # Pre-generated level cache
│   │   │   │       ├── TextureCache.swift               # Texture atlas cache
│   │   │   │       └── AudioCache.swift                 # Pre-loaded sound effects
│   │   │   │
│   │   │   └── Models/                                  [Data Transfer Objects]
│   │   │       ├── SwiftData/
│   │   │       │   ├── GameStateModel.swift             # @Model SwiftData schema
│   │   │       │   ├── UserProfileModel.swift           # @Model user data
│   │   │       │   ├── AchievementModel.swift           # @Model achievement data
│   │   │       │   └── TransactionModel.swift           # @Model purchase records
│   │   │       │
│   │   │       ├── CloudKit/
│   │   │       │   ├── CKGameState.swift                # CKRecord wrapper
│   │   │       │   └── CKUserProfile.swift              # CKRecord wrapper
│   │   │       │
│   │   │       └── UserDefaults/
│   │   │           ├── SettingsDTO.swift                # Codable settings
│   │   │           └── OnboardingDTO.swift              # Onboarding state
│   │   │
│   │   └── Presentation/                                [UI Layer]
│   │       │
│   │       ├── Scenes/                                  [SpriteKit Scenes]
│   │       │   ├── Base/
│   │       │   │   ├── BaseScene.swift                  # Common scene functionality
│   │       │   │   ├── SceneTransitionable.swift        # Transition protocol
│   │       │   │   └── SceneInputHandler.swift          # Input handling protocol
│   │       │   │
│   │       │   ├── MainMenu/
│   │       │   │   ├── MenuScene.swift                  # Main menu scene
│   │       │   │   ├── MenuBackground.swift             # Animated background
│   │       │   │   ├── MenuButton.swift                 # Custom button node
│   │       │   │   └── MenuParticles.swift              # Ambient particles
│   │       │   │
│   │       │   ├── Game/
│   │       │   │   ├── GameScene.swift                  # Main gameplay scene
│   │       │   │   ├── BoardNode.swift                  # 8×8 game board container
│   │       │   │   ├── ElementNode.swift                # Individual element sprite
│   │       │   │   ├── MatchAnimator.swift              # Match animation handler
│   │       │   │   ├── ComboIndicator.swift             # Combo multiplier display
│   │       │   │   ├── PowerUpNode.swift                # Power-up visual effects
│   │       │   │   ├── HUDNode.swift                    # Score, timer, level info
│   │       │   │   ├── PauseOverlay.swift               # Pause menu overlay
│   │       │   │   └── GameBackground.swift             # Dynamic game background
│   │       │   │
│   │       │   ├── Results/
│   │       │   │   ├── ResultsScene.swift               # Level end results screen
│   │       │   │   ├── ScoreRevealAnimator.swift        # Score count-up animation
│   │       │   │   ├── RewardAnimator.swift             # Reward unlock animations
│   │       │   │   └── StarRating.swift                 # 3-star rating display
│   │       │   │
│   │       │   └── Tutorial/
│   │       │       ├── TutorialScene.swift              # Interactive tutorial
│   │       │       ├── TutorialStep.swift               # Individual tutorial step
│   │       │       ├── HighlightMask.swift              # Focus highlight overlay
│   │       │       └── TutorialHand.swift               # Gesture demonstration hand
│   │       │
│   │       ├── Views/                                   [SwiftUI Views]
│   │       │   ├── ContentView.swift                    # Root SwiftUI view
│   │       │   │
│   │       │   ├── Menu/
│   │       │   │   ├── MainMenuView.swift               # SwiftUI menu wrapper
│   │       │   │   ├── ProfileView.swift                # User profile display
│   │       │   │   └── DailyChallengeCard.swift         # Daily challenge preview
│   │       │   │
│   │       │   ├── Game/
│   │       │   │   ├── GameView.swift                   # SpriteView wrapper
│   │       │   │   └── GameOverlay.swift                # SwiftUI overlays (pause, etc)
│   │       │   │
│   │       │   ├── Progression/
│   │       │   │   ├── BattlePassView.swift             # Battle pass tier display
│   │       │   │   ├── BattlePassTierCard.swift         # Individual tier card
│   │       │   │   ├── AchievementsView.swift           # Achievement list
│   │       │   │   ├── AchievementCard.swift            # Individual achievement
│   │       │   │   └── ProgressionStatsView.swift       # XP, level, stats dashboard
│   │       │   │
│   │       │   ├── Shop/
│   │       │   │   ├── ShopView.swift                   # Shop main view
│   │       │   │   ├── ProductCard.swift                # Product display card
│   │       │   │   ├── ProductDetailView.swift          # Product details modal
│   │       │   │   ├── CosmeticPreview.swift            # 3D preview of cosmetics
│   │       │   │   └── PurchaseButton.swift             # StoreKit purchase button
│   │       │   │
│   │       │   ├── Social/
│   │       │   │   ├── LeaderboardView.swift            # Leaderboard display
│   │       │   │   ├── LeaderboardRow.swift             # Individual rank row
│   │       │   │   ├── LeaderboardFilter.swift          # Filter (global, friends, etc)
│   │       │   │   ├── FriendChallengeView.swift        # Friend challenge UI
│   │       │   │   └── TournamentBracketView.swift      # Tournament bracket
│   │       │   │
│   │       │   ├── Settings/
│   │       │   │   ├── SettingsView.swift               # Settings main view
│   │       │   │   ├── AudioSettingsView.swift          # Audio sliders
│   │       │   │   ├── HapticSettingsView.swift         # Haptic toggles
│   │       │   │   ├── AccessibilityView.swift          # Accessibility options
│   │       │   │   ├── NotificationSettingsView.swift   # Notification preferences
│   │       │   │   └── AboutView.swift                  # Credits, version, legal
│   │       │   │
│   │       │   └── Components/                          [Reusable UI Components]
│   │       │       ├── GlassmorphicCard.swift           # Frosted glass card
│   │       │       ├── AnimatedButton.swift             # Spring animated button
│   │       │       ├── ProgressBar.swift                # Animated progress bar
│   │       │       ├── CoinCounter.swift                # Animated coin display
│   │       │       ├── XPBar.swift                      # Experience progress bar
│   │       │       ├── Toast.swift                      # Toast notification
│   │       │       ├── LoadingSpinner.swift             # Loading indicator
│   │       │       └── ConfirmationDialog.swift         # Custom dialog
│   │       │
│   │       ├── Coordinators/                            [Navigation Flow]
│   │       │   ├── AppCoordinator.swift                 # App-level navigation
│   │       │   ├── GameCoordinator.swift                # Game flow coordination
│   │       │   ├── MenuCoordinator.swift                # Menu navigation
│   │       │   └── OnboardingCoordinator.swift          # Tutorial flow
│   │       │
│   │       └── ViewModels/                              [TCA Stores]
│   │           ├── AppViewModel.swift                   # Root app state store
│   │           ├── GameViewModel.swift                  # Game state store
│   │           ├── MenuViewModel.swift                  # Menu state store
│   │           ├── ShopViewModel.swift                  # Shop state store
│   │           ├── ProgressionViewModel.swift           # Progression state store
│   │           ├── LeaderboardViewModel.swift           # Leaderboard state store
│   │           └── SettingsViewModel.swift              # Settings state store
│   │
│   ├── Features/                                        [Feature Modules]
│   │   │
│   │   ├── ProceduralGeneration/                       [Level Generation]
│   │   │   ├── LevelGenerator.swift                     # Main generator coordinator
│   │   │   ├── Algorithms/
│   │   │   │   ├── WaveFunctionCollapse.swift           # WFC algorithm implementation
│   │   │   │   ├── PerlinNoise.swift                    # Perlin noise generator
│   │   │   │   ├── GeneticAlgorithm.swift               # GA optimizer
│   │   │   │   └── ConstraintSolver.swift               # Constraint validation
│   │   │   ├── DifficultyScaler.swift                   # Dynamic difficulty adjustment
│   │   │   ├── LevelValidator.swift                     # Solvability checker
│   │   │   ├── SeedManager.swift                        # Seed generation/storage
│   │   │   └── LevelCache.swift                         # Pre-generation cache
│   │   │
│   │   ├── ParticleSystem/                              [GPU Particle Engine]
│   │   │   ├── ParticleEngine.swift                     # Main particle coordinator
│   │   │   ├── ParticleEmitter.swift                    # Emitter configuration
│   │   │   ├── MetalParticleRenderer.swift              # Metal rendering
│   │   │   ├── Shaders/
│   │   │   │   ├── ParticleUpdate.metal                 # Compute shader for updates
│   │   │   │   ├── ParticleRender.metal                 # Vertex/fragment shaders
│   │   │   │   └── ParticleShared.h                     # Shared shader headers
│   │   │   ├── Emitters/
│   │   │   │   ├── MatchExplosionEmitter.swift          # Match particle config
│   │   │   │   ├── ComboEmitter.swift                   # Combo celebration config
│   │   │   │   ├── PowerUpEmitter.swift                 # Power-up effect config
│   │   │   │   ├── BackgroundEmitter.swift              # Ambient particle config
│   │   │   │   └── TrailEmitter.swift                   # Motion trail config
│   │   │   └── ParticlePool.swift                       # Particle object pool
│   │   │
│   │   ├── Physics/                                     [Physics System]
│   │   │   ├── PhysicsEngine.swift                      # SpriteKit physics wrapper
│   │   │   ├── CollisionHandler.swift                   # Collision detection
│   │   │   ├── GravityManager.swift                     # Dynamic gravity control
│   │   │   ├── PredictivePhysics.swift                  # Frame-ahead prediction
│   │   │   └── PhysicsDebugger.swift                    # Debug visualization
│   │   │
│   │   ├── Audio/                                       [Audio System]
│   │   │   ├── AudioManager.swift                       # Audio coordinator
│   │   │   ├── SpatialAudioEngine.swift                 # AVAudioEngine + 3D audio
│   │   │   ├── MusicManager.swift                       # Adaptive music layers
│   │   │   ├── SoundEffectManager.swift                 # SFX playback
│   │   │   ├── AudioPool.swift                          # AVAudioPlayerNode pool
│   │   │   └── AudioMixer.swift                         # Volume, ducking, crossfade
│   │   │
│   │   ├── Haptics/                                     [Haptic Feedback]
│   │   │   ├── HapticEngine.swift                       # Core Haptics wrapper
│   │   │   ├── HapticPatternLibrary.swift               # Pattern definitions
│   │   │   ├── CustomPatterns/
│   │   │   │   ├── MatchHaptic.ahap                     # Match feedback pattern
│   │   │   │   ├── ComboHaptic.ahap                     # Combo feedback pattern
│   │   │   │   ├── PowerUpHaptic.ahap                   # Power-up pattern
│   │   │   │   ├── SuccessHaptic.ahap                   # Success celebration
│   │   │   │   └── FailureHaptic.ahap                   # Failure feedback
│   │   │   └── HapticScheduler.swift                    # Haptic event timing
│   │   │
│   │   ├── GameCenter/                                  [Social Features]
│   │   │   ├── GameCenterManager.swift                  # GameKit coordinator
│   │   │   ├── AuthenticationManager.swift              # Game Center auth
│   │   │   ├── LeaderboardManager.swift                 # Leaderboard operations
│   │   │   ├── AchievementManager.swift                 # Achievement submission
│   │   │   ├── MultiplayerManager.swift                 # Friend challenges
│   │   │   ├── GhostReplayManager.swift                 # Replay recording/playback
│   │   │   └── TournamentManager.swift                  # Tournament logic
│   │   │
│   │   ├── Progression/                                 [Progression Systems]
│   │   │   ├── XPSystem.swift                           # Experience calculation
│   │   │   ├── LevelSystem.swift                        # Leveling logic
│   │   │   ├── AchievementSystem.swift                  # Achievement tracking
│   │   │   ├── BattlePassSystem.swift                   # Battle pass progression
│   │   │   ├── DailyRewardSystem.swift                  # Daily login rewards
│   │   │   ├── UnlockableSystem.swift                   # Item unlock logic
│   │   │   └── PrestigeSystem.swift                     # Prestige reset logic
│   │   │
│   │   ├── Monetization/                                [In-App Purchases]
│   │   │   ├── StoreKitManager.swift                    # StoreKit 2 coordinator
│   │   │   ├── ProductManager.swift                     # Product catalog
│   │   │   ├── PurchaseManager.swift                    # Purchase flow
│   │   │   ├── TransactionVerifier.swift                # JWS verification
│   │   │   ├── SubscriptionManager.swift                # Subscription status
│   │   │   ├── RestoreManager.swift                     # Purchase restoration
│   │   │   └── ReceiptValidator.swift                   # Legacy receipt validation
│   │   │
│   │   ├── Analytics/                                   [Privacy-First Analytics]
│   │   │   ├── AnalyticsManager.swift                   # Analytics coordinator
│   │   │   ├── EventTracker.swift                       # Event logging
│   │   │   ├── SessionTracker.swift                     # Session duration
│   │   │   ├── FunnelTracker.swift                      # Conversion funnels
│   │   │   ├── ABTestManager.swift                      # A/B testing
│   │   │   └── PrivacyManager.swift                     # Consent management
│   │   │
│   │   ├── Tutorial/                                    [Onboarding]
│   │   │   ├── TutorialManager.swift                    # Tutorial flow control
│   │   │   ├── TutorialStepDefinitions.swift            # 5-level tutorial steps
│   │   │   ├── TutorialOverlay.swift                    # Interactive overlay
│   │   │   └── OnboardingProgress.swift                 # Onboarding state
│   │   │
│   │   └── Notifications/                               [Push Notifications]
│   │       ├── NotificationManager.swift                # UNUserNotificationCenter wrapper
│   │       ├── LocalNotifications.swift                 # Local notification scheduling
│   │       ├── PushNotifications.swift                  # Remote notification handling
│   │       └── NotificationScheduler.swift              # Daily reminder logic
│   │
│   ├── Common/                                          [Shared Utilities]
│   │   │
│   │   ├── Extensions/                                  [Swift Extensions]
│   │   │   ├── Foundation/
│   │   │   │   ├── Array+Extensions.swift               # Array utilities
│   │   │   │   ├── Date+Extensions.swift                # Date formatting
│   │   │   │   ├── String+Extensions.swift              # String utilities
│   │   │   │   ├── Int+Extensions.swift                 # Number formatting
│   │   │   │   └── Double+Extensions.swift              # Decimal formatting
│   │   │   │
│   │   │   ├── UIKit/
│   │   │   │   ├── UIColor+Extensions.swift             # Color utilities
│   │   │   │   ├── UIImage+Extensions.swift             # Image processing
│   │   │   │   └── UIView+Extensions.swift              # View utilities
│   │   │   │
│   │   │   ├── SwiftUI/
│   │   │   │   ├── View+Extensions.swift                # View modifiers
│   │   │   │   ├── Color+Extensions.swift               # Color palette
│   │   │   │   └── Animation+Extensions.swift           # Custom animations
│   │   │   │
│   │   │   └── SpriteKit/
│   │   │       ├── SKNode+Extensions.swift              # Node utilities
│   │   │       ├── SKAction+Extensions.swift            # Custom actions
│   │   │       ├── SKScene+Extensions.swift             # Scene utilities
│   │   │       └── SKTexture+Extensions.swift           # Texture utilities
│   │   │
│   │   ├── Utilities/                                   [Helper Classes]
│   │   │   ├── Logger.swift                             # Custom logging (OSLog wrapper)
│   │   │   ├── DateFormatter+Shared.swift               # Shared formatters
│   │   │   ├── NumberFormatter+Shared.swift             # Number formatting
│   │   │   ├── URLBuilder.swift                         # URL construction
│   │   │   ├── ImageLoader.swift                        # Async image loading
│   │   │   ├── CacheManager.swift                       # Generic cache
│   │   │   └── DeviceInfo.swift                         # Device capabilities
│   │   │
│   │   ├── Constants/                                   [App Constants]
│   │   │   ├── AppConstants.swift                       # App-wide constants
│   │   │   ├── GameConstants.swift                      # Game balance values
│   │   │   ├── DesignConstants.swift                    # UI dimensions, colors
│   │   │   ├── APIConstants.swift                       # API endpoints (if needed)
│   │   │   └── AnalyticsConstants.swift                 # Event names
│   │   │
│   │   └── Protocols/                                   [Shared Protocols]
│   │       ├── Identifiable.swift                       # Custom identifiable
│   │       ├── Reusable.swift                           # Reusable views
│   │       ├── Configurable.swift                       # Configuration protocol
│   │       └── Coordinatable.swift                      # Coordinator protocol
│   │
│   ├── Resources/                                       [Asset Resources]
│   │   │
│   │   ├── Assets.xcassets/                             [Asset Catalog]
│   │   │   ├── AppIcon.appiconset/                      # App icons (all sizes)
│   │   │   ├── Colors/                                  # Color assets
│   │   │   │   ├── Primary.colorset
│   │   │   │   ├── Secondary.colorset
│   │   │   │   ├── Accent.colorset
│   │   │   │   └── Background.colorset
│   │   │   ├── Images/
│   │   │   │   └── Logos/
│   │   │   │       ├── Logo.imageset
│   │   │   │       └── LogoText.imageset
│   │   │   └── Symbols/                                 # SF Symbols custom
│   │   │
│   │   ├── Textures/                                    [Texture Atlases]
│   │   │   ├── Elements.atlas/                          # Element sprites (PVRTC)
│   │   │   │   ├── star_01.png → star_10.png
│   │   │   │   ├── nebula_01.png → nebula_10.png
│   │   │   │   ├── comet_01.png → comet_10.png
│   │   │   │   ├── galaxy_01.png → galaxy_10.png
│   │   │   │   ├── blackhole_01.png → blackhole_10.png
│   │   │   │   ├── supernova_01.png → supernova_10.png
│   │   │   │   └── wormhole_01.png → wormhole_10.png
│   │   │   │
│   │   │   ├── UI.atlas/                                # UI elements (RGBA8)
│   │   │   │   ├── button_normal.png
│   │   │   │   ├── button_pressed.png
│   │   │   │   ├── button_disabled.png
│   │   │   │   ├── panel_glass.png
│   │   │   │   ├── icon_coins.png
│   │   │   │   ├── icon_xp.png
│   │   │   │   └── [50+ UI elements]
│   │   │   │
│   │   │   ├── Backgrounds.atlas/                       # Background themes (PVRTC)
│   │   │   │   ├── nebula_storm_layer1.png
│   │   │   │   ├── nebula_storm_layer2.png
│   │   │   │   ├── nebula_storm_layer3.png
│   │   │   │   └── [12 more themes × 3 layers each]
│   │   │   │
│   │   │   ├── Effects.atlas/                           # Particle textures (RGBA8)
│   │   │   │   ├── particle_star.png
│   │   │   │   ├── particle_glow.png
│   │   │   │   ├── particle_spark.png
│   │   │   │   ├── particle_smoke.png
│   │   │   │   └── [10+ particle shapes]
│   │   │   │
│   │   │   └── Skins/                                   # Cosmetic skins (50 sets)
│   │   │       ├── Cyberpunk.atlas/
│   │   │       ├── Watercolor.atlas/
│   │   │       ├── Neon.atlas/
│   │   │       └── [47 more skin sets]
│   │   │
│   │   ├── Shaders/                                     [Metal Shaders]
│   │   │   ├── ParticleUpdate.metal                     # Particle compute shader
│   │   │   ├── ParticleRender.metal                     # Particle render shader
│   │   │   ├── Bloom.metal                              # Bloom post-process
│   │   │   ├── ColorGrading.metal                       # Color grading LUT
│   │   │   ├── ChromaticAberration.metal                # Chromatic aberration
│   │   │   ├── MotionBlur.metal                         # Motion blur
│   │   │   ├── Vignette.metal                           # Vignette effect
│   │   │   └── ShaderTypes.h                            # Shared C headers
│   │   │
│   │   ├── Sounds/                                      [Sound Effects]
│   │   │   ├── UI/                                      # UI sounds (44.1kHz, mono, AAC)
│   │   │   │   ├── button_tap.m4a
│   │   │   │   ├── button_swipe.m4a
│   │   │   │   ├── menu_open.m4a
│   │   │   │   ├── menu_close.m4a
│   │   │   │   └── [10+ UI sounds]
│   │   │   │
│   │   │   ├── Game/                                    # Game sounds (44.1kHz, stereo, AAC)
│   │   │   │   ├── match_star.m4a                       # Note C
│   │   │   │   ├── match_nebula.m4a                     # Note D
│   │   │   │   ├── match_comet.m4a                      # Note E
│   │   │   │   ├── match_galaxy.m4a                     # Note G
│   │   │   │   ├── match_blackhole.m4a                  # Note A
│   │   │   │   ├── match_supernova.m4a                  # Note B
│   │   │   │   ├── match_wormhole.m4a                   # Note C (octave up)
│   │   │   │   ├── combo_2x.m4a
│   │   │   │   ├── combo_3x.m4a
│   │   │   │   ├── combo_5x.m4a
│   │   │   │   ├── combo_10x.m4a
│   │   │   │   ├── combo_25x.m4a
│   │   │   │   └── [20+ game sounds]
│   │   │   │
│   │   │   └── PowerUps/                                # Power-up sounds
│   │   │       ├── powerup_timefreeze.m4a
│   │   │       ├── powerup_bomb.m4a
│   │   │       ├── powerup_shuffle.m4a
│   │   │       └── [7+ power-up sounds]
│   │   │
│   │   ├── Music/                                       [Background Music]
│   │   │   ├── menu_theme.m4a                           # Menu music (2min loop, 256kbps AAC)
│   │   │   ├── game_layer1_ambient.m4a                  # Base ambient layer
│   │   │   ├── game_layer2_rhythm.m4a                   # Rhythm layer
│   │   │   ├── game_layer3_melody.m4a                   # Melody layer
│   │   │   ├── game_layer4_bass.m4a                     # Bass layer
│   │   │   ├── game_layer5_lead.m4a                     # Lead synth layer
│   │   │   ├── results_victory.m4a                      # Victory fanfare
│   │   │   └── results_defeat.m4a                       # Defeat music
│   │   │
│   │   └── Localization/                                [Internationalization]
│   │       ├── en.lproj/                                # English
│   │       │   ├── Localizable.strings
│   │       │   └── InfoPlist.strings
│   │       ├── es.lproj/                                # Spanish
│   │       │   ├── Localizable.strings
│   │       │   └── InfoPlist.strings
│   │       ├── fr.lproj/                                # French
│   │       ├── de.lproj/                                # German
│   │       ├── ja.lproj/                                # Japanese
│   │       ├── zh-Hans.lproj/                           # Simplified Chinese
│   │       ├── zh-Hant.lproj/                           # Traditional Chinese
│   │       ├── ko.lproj/                                # Korean
│   │       ├── pt-BR.lproj/                             # Portuguese (Brazil)
│   │       └── ar.lproj/                                # Arabic (RTL)
│   │
│   └── Supporting Files/                                [Configuration]
│       ├── Info.plist                                   # App info, capabilities
│       ├── Entitlements.plist                           # iCloud, Game Center, etc.
│       ├── Config/
│       │   ├── Debug.xcconfig                           # Debug build settings
│       │   ├── Release.xcconfig                         # Release build settings
│       │   └── Shared.xcconfig                          # Shared settings
│       └── Secrets/                                     # Git-ignored secrets
│           └── APIKeys.swift                            # API keys (not in repo)
│
├── CelestialCascadeTests/                               [Unit Tests]
│   ├── DomainTests/
│   │   ├── UseCases/
│   │   │   ├── StartLevelUseCaseTests.swift
│   │   │   ├── DetectMatchesUseCaseTests.swift
│   │   │   ├── CalculateScoreUseCaseTests.swift
│   │   │   └── [20+ use case tests]
│   │   └── Entities/
│   │       ├── BoardTests.swift
│   │       ├── ElementTests.swift
│   │       └── [10+ entity tests]
│   │
│   ├── DataTests/
│   │   ├── Repositories/
│   │   │   ├── GameRepositoryTests.swift
│   │   │   └── [5+ repository tests]
│   │   └── DataSources/
│   │       ├── SwiftDataManagerTests.swift
│   │       └── CloudKitManagerTests.swift
│   │
│   ├── PresentationTests/
│   │   └── ViewModels/
│   │       ├── GameViewModelTests.swift
│   │       ├── MenuViewModelTests.swift
│   │       └── [5+ view model tests]
│   │
│   ├── FeaturesTests/
│   │   ├── ProceduralGeneration/
│   │   │   ├── WaveFunctionCollapseTests.swift
│   │   │   ├── PerlinNoiseTests.swift
│   │   │   └── LevelGeneratorTests.swift
│   │   ├── Progression/
│   │   │   ├── XPSystemTests.swift
│   │   │   └── AchievementSystemTests.swift
│   │   └── [Feature module tests]
│   │
│   ├── Mocks/
│   │   ├── MockGameRepository.swift
│   │   ├── MockUserRepository.swift
│   │   ├── MockStoreRepository.swift
│   │   └── [All repository mocks]
│   │
│   └── Helpers/
│       ├── TestHelpers.swift
│       ├── XCTestCase+Extensions.swift
│       └── MockData.swift
│
├── CelestialCascadeUITests/                             [UI Tests]
│   ├── Flows/
│   │   ├── OnboardingFlowTests.swift
│   │   ├── GameplayFlowTests.swift
│   │   ├── PurchaseFlowTests.swift
│   │   └── SocialFlowTests.swift
│   │
│   ├── Screens/
│   │   ├── MenuScreenTests.swift
│   │   ├── GameScreenTests.swift
│   │   ├── ShopScreenTests.swift
│   │   └── [Screen-specific tests]
│   │
│   └── Helpers/
│       ├── UITestHelpers.swift
│       ├── XCUIApplication+Extensions.swift
│       └── PageObjects/
│           ├── MenuPage.swift
│           ├── GamePage.swift
│           └── [Page object models]
│
├── CelestialCascadePerformanceTests/                    [Performance Tests]
│   ├── GamePerformanceTests.swift                       # FPS, frame time tests
│   ├── ParticlePerformanceTests.swift                   # Particle system stress test
│   ├── MemoryLeakTests.swift                            # Memory leak detection
│   ├── LaunchTimeTests.swift                            # Cold/warm launch tests
│   └── NetworkPerformanceTests.swift                    # CloudKit sync performance
│
├── Fastlane/                                            [CI/CD Automation]
│   ├── Fastfile                                         # Fastlane configuration
│   ├── Appfile                                          # App identifier
│   └── Matchfile                                        # Code signing
│
├── Scripts/                                             [Build Scripts]
│   ├── swiftlint.sh                                     # SwiftLint runner
│   ├── code_coverage.sh                                 # Coverage report
│   ├── generate_assets.sh                               # Asset processing
│   └── bump_version.sh                                  # Version increment
│
├── Documentation/                                       [Project Docs]
│   ├── README.md                                        # Project overview
│   ├── ARCHITECTURE.md                                  # Architecture guide
│   ├── CONTRIBUTING.md                                  # Contribution guide
│   ���── GAME_DESIGN.md                                   # Game design doc
│   ├── API.md                                           # Internal API docs
│   └── CHANGELOG.md                                     # Version history
│
├── .swiftlint.yml                                       # SwiftLint rules
├── .gitignore                                           # Git ignore patterns
├── .gitattributes                                       # Git attributes
├── Package.swift                                        # Swift Package Manager
├── Gemfile                                              # Ruby dependencies (Fastlane)
└── README.md                                            # Root README

```

**Total File Count: 347+ files**

---

## DETAILED IMPLEMENTATION PLAN

### Development Timeline: 30 Days (240 hours)

**Week 1 (Days 1-7)**: Foundation + Core Engine
**Week 2 (Days 8-14)**: Visual Polish + Audio/Haptics
**Week 3 (Days 15-21)**: Progression + Social + Monetization
**Week 4 (Days 22-30)**: Polish + Testing + Launch Prep

---

## PHASE-BY-PHASE DEVELOPMENT

### PHASE 1: PROJECT FOUNDATION (Days 1-3, 24 hours)

#### Day 1: Project Setup & Architecture (8 hours)

**Hour 1-2: Xcode Project Creation**
1. Create new Xcode project: iOS App, SwiftUI lifecycle
2. Set minimum deployment target: iOS 16.0
3. Configure project settings:
   - Swift 6 language version
   - Strict concurrency checking enabled
   - Build settings: optimization levels, bitcode
4. Create folder structure (all 347 files/folders)
5. Initialize Git repository
6. Create `.gitignore` (exclude build artifacts, Secrets/)
7. First commit: "Initial project structure"

**Hour 3-4: Dependency Setup**
1. Add Swift Package dependencies:
   - `swift-composable-architecture` (TCA)
   - `swift-collections` (Efficient data structures)
   - No third-party analytics (privacy-first)
2. Configure SPM dependencies in Xcode
3. Verify builds successfully
4. Create `Package.swift` for package management

**Hour 5-6: Core Architecture Files**
1. **AppDelegate.swift**:
   - Configure UIApplicationDelegate methods
   - Setup push notification registration
   - Handle app lifecycle events
   - Initialize third-party SDKs (none for this project)

2. **SceneDelegate.swift**:
   - Window scene configuration
   - Handle scene lifecycle (foreground/background)
   - Setup root coordinator

3. **CelestialCascadeApp.swift**:
   - SwiftUI app entry point
   - Setup TCA store at app level
   - Configure scene

**Hour 7-8: TCA Foundation**
1. **AppState.swift**:
   - Define root app state structure
   - Nested states for game, user, settings, shop, leaderboard
   - Equatable conformance

2. **AppAction.swift**:
   - Define all possible app actions
   - Nested action enums for each feature
   - Case paths for pullback

3. **AppReducer.swift**:
   - Combine all feature reducers
   - Pullback reducers to app state
   - Setup app environment dependencies

4. **AppEnvironment.swift**:
   - Define dependency container
   - Inject repositories, managers, services
   - Testable dependency injection

**Deliverables**:
- ✅ Xcode project configured
- ✅ Folder structure created
- ✅ TCA architecture setup
- ✅ Build succeeds

---

#### Day 2: Domain Layer - Entities & Use Cases (8 hours)

**Hour 1-2: Game Entities**

1. **Level.swift** (30 min):
```swift
struct Level: Equatable, Identifiable {
    let id: UUID
    let number: Int
    let difficulty: Double
    let seed: UInt64
    let layout: [[ElementType?]]
    let targetScore: Int
    let parTime: TimeInterval
    let powerUpSpawnRate: Double
}
```

2. **Board.swift** (30 min):
```swift
struct Board: Equatable {
    private(set) var elements: [[Element?]] // 8×8 grid
    let size: Int = 8

    mutating func swap(_ pos1: Position, _ pos2: Position)
    func findMatches() -> [Match]
    func isValidMove(from: Position, to: Position) -> Bool
    mutating func applyGravity() -> [Element]
    mutating func fillEmpty() -> [Element]
}
```

3. **Element.swift** (30 min):
```swift
enum ElementType: String, CaseIterable {
    case star, nebula, comet, galaxy, blackHole, supernova, wormhole
}

struct Element: Equatable, Identifiable {
    let id: UUID
    let type: ElementType
    var position: Position
    var state: ElementState // idle, falling, matched, exploding
    var animationProgress: Double
}
```

4. **Match.swift** (30 min):
```swift
enum MatchType {
    case three, four, five, tShape, lShape
}

struct Match: Equatable {
    let elements: [Element]
    let type: MatchType
    let points: Int
    let position: Position // centerpoint
}
```

**Hour 3-4: User Entities**

1. **UserProfile.swift** (30 min):
```swift
struct UserProfile: Equatable, Identifiable {
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
}
```

2. **GameStats.swift** (20 min):
```swift
struct GameStats: Equatable {
    var totalGamesPlayed: Int
    var totalGamesWon: Int
    var highScore: Int
    var longestCombo: Int
    var totalPlaytime: TimeInterval
    var favoriteElement: ElementType?
    var averageScore: Double
}
```

3. **Inventory.swift** (30 min):
```swift
struct Inventory: Equatable {
    var ownedSkins: Set<SkinID>
    var ownedEffects: Set<EffectID>
    var activeSkin: SkinID
    var activeEffect: EffectID
    var powerUpCounts: [PowerUpType: Int]
    var coins: Int
}
```

4. **DailyChallenge.swift** (20 min):
```swift
enum ChallengeDifficulty {
    case easy, medium, hard
}

struct DailyChallenge: Equatable, Identifiable {
    let id: UUID
    let date: Date
    let difficulty: ChallengeDifficulty
    let level: Level
    let requirement: ChallengeRequirement // score, combos, time
    let reward: ChallengeReward
    var isCompleted: Bool
    var progress: Double // 0.0 to 1.0
}
```

**Hour 5-6: Progression Entities**

1. **Achievement.swift** (30 min):
```swift
struct Achievement: Equatable, Identifiable {
    let id: String // Game Center ID
    let definition: AchievementDefinition
    var progress: Double // 0.0 to 1.0
    var isUnlocked: Bool
    var unlockedAt: Date?
}

struct AchievementDefinition {
    let id: String
    let name: String
    let description: String
    let iconName: String
    let requirement: AchievementRequirement
    let reward: AchievementReward
    let isHidden: Bool
    let points: Int
}
```

2. **BattlePass.swift** (30 min):
```swift
struct BattlePass: Equatable {
    let seasonID: UUID
    let seasonNumber: Int
    let startDate: Date
    let endDate: Date
    var currentTier: Int
    var currentXP: Int
    var isPremium: Bool
    var tiers: [BattlePassTier]

    func daysRemaining() -> Int
    func progress(to tier: Int) -> Double
}

struct BattlePassTier: Equatable {
    let number: Int
    let xpRequired: Int
    let freeReward: Reward?
    let premiumReward: Reward?
    var isUnlocked: Bool
}
```

3. **UnlockableItem.swift** (30 min):
```swift
enum UnlockCondition {
    case level(Int)
    case achievement(String)
    case battlePass(tier: Int)
    case purchase
    case event(String)
}

struct UnlockableItem: Equatable, Identifiable {
    let id: String
    let name: String
    let type: ItemType // skin, effect, powerup
    let rarity: Rarity // common, rare, epic, legendary
    let unlockCondition: UnlockCondition
    let previewImageName: String
    var isUnlocked: Bool
}
```

**Hour 7-8: Use Cases**

1. **StartLevelUseCase.swift** (20 min):
```swift
protocol StartLevelUseCaseProtocol {
    func execute(levelNumber: Int) async throws -> GameSession
}

final class StartLevelUseCase: StartLevelUseCaseProtocol {
    private let levelGenerator: LevelGenerator
    private let gameRepository: GameRepositoryProtocol

    func execute(levelNumber: Int) async throws -> GameSession {
        // 1. Generate level with seed
        let level = await levelGenerator.generate(number: levelNumber)

        // 2. Create game session
        let session = GameSession(level: level)

        // 3. Initialize board
        session.board = Board(layout: level.layout)

        // 4. Save session
        try await gameRepository.save(session)

        return session
    }
}
```

2. **DetectMatchesUseCase.swift** (30 min):
```swift
protocol DetectMatchesUseCaseProtocol {
    func execute(board: Board) -> [Match]
}

final class DetectMatchesUseCase: DetectMatchesUseCaseProtocol {
    func execute(board: Board) -> [Match] {
        var matches: [Match] = []

        // Horizontal matches
        matches.append(contentsOf: findHorizontalMatches(board))

        // Vertical matches
        matches.append(contentsOf: findVerticalMatches(board))

        // Special patterns (T, L shapes)
        matches.append(contentsOf: findSpecialPatterns(board))

        return matches.sorted { $0.points > $1.points }
    }

    private func findHorizontalMatches(_ board: Board) -> [Match] {
        // Implementation: scan each row for consecutive elements
    }
}
```

3. **CalculateScoreUseCase.swift** (20 min):
```swift
protocol CalculateScoreUseCaseProtocol {
    func execute(match: Match, multiplier: Int) -> Int
}

final class CalculateScoreUseCase: CalculateScoreUseCaseProtocol {
    func execute(match: Match, multiplier: Int) -> Int {
        let baseScore = match.type.basePoints * match.elements.count
        let multiplierBonus = baseScore * (multiplier - 1)
        let patternBonus = match.type.bonusPoints

        return baseScore + multiplierBonus + patternBonus
    }
}
```

4. **AwardXPUseCase.swift** (30 min):
```swift
protocol AwardXPUseCaseProtocol {
    func execute(amount: Int, source: XPSource) async throws -> LevelUpResult?
}

struct LevelUpResult {
    let newLevel: Int
    let rewards: [Reward]
}

final class AwardXPUseCase: AwardXPUseCaseProtocol {
    private let userRepository: UserRepositoryProtocol
    private let xpCalculator: XPCalculator

    func execute(amount: Int, source: XPSource) async throws -> LevelUpResult? {
        var profile = try await userRepository.fetchProfile()

        profile.currentXP += amount
        profile.totalXP += amount

        // Check for level up
        let requiredXP = xpCalculator.calculateRequired(for: profile.level + 1)

        if profile.currentXP >= requiredXP {
            profile.level += 1
            profile.currentXP -= requiredXP

            let rewards = calculateLevelUpRewards(profile.level)
            try await userRepository.update(profile)

            return LevelUpResult(newLevel: profile.level, rewards: rewards)
        }

        try await userRepository.update(profile)
        return nil
    }
}
```

**Deliverables**:
- ✅ 15 entity models defined
- ✅ 10+ use cases implemented
- ✅ Business logic layer complete
- ✅ Unit tests for entities

---

#### Day 3: Data Layer & Repositories (8 hours)

**Hour 1-2: SwiftData Setup**

1. **SwiftDataManager.swift** (45 min):
```swift
import SwiftData

@MainActor
final class SwiftDataManager {
    static let shared = SwiftDataManager()

    private(set) var modelContainer: ModelContainer!
    private(set) var modelContext: ModelContext!

    private init() {}

    func setup() throws {
        let schema = Schema([
            GameStateModel.self,
            UserProfileModel.self,
            AchievementModel.self,
            TransactionModel.self
        ])

        let configuration = ModelConfiguration(
            schema: schema,
            isStoredInMemoryOnly: false,
            cloudKitDatabase: .automatic // Enable CloudKit sync
        )

        modelContainer = try ModelContainer(
            for: schema,
            configurations: [configuration]
        )

        modelContext = ModelContext(modelContainer)
        modelContext.autosaveEnabled = true
    }
}
```

2. **SwiftData Models** (45 min):

**GameStateModel.swift**:
```swift
import SwiftData

@Model
final class GameStateModel {
    @Attribute(.unique) var id: UUID
    var levelNumber: Int
    var score: Int
    var moves: Int
    var timeRemaining: TimeInterval
    var boardState: Data // Encoded board
    var lastSaved: Date

    init(id: UUID = UUID(), levelNumber: Int, score: Int) {
        self.id = id
        self.levelNumber = levelNumber
        self.score = score
        self.moves = 0
        self.timeRemaining = 90
        self.boardState = Data()
        self.lastSaved = Date()
    }
}
```

**UserProfileModel.swift**:
```swift
@Model
final class UserProfileModel {
    @Attribute(.unique) var id: UUID
    var username: String
    var level: Int
    var currentXP: Int
    var totalXP: Int
    var coins: Int
    var prestigeLevel: Int
    var createdAt: Date
    var lastPlayedAt: Date

    // Relationships
    @Relationship(deleteRule: .cascade) var stats: GameStatsModel?
    @Relationship(deleteRule: .cascade) var inventory: InventoryModel?

    init(id: UUID = UUID(), username: String) {
        self.id = id
        self.username = username
        self.level = 1
        self.currentXP = 0
        self.totalXP = 0
        self.coins = 0
        self.prestigeLevel = 0
        self.createdAt = Date()
        self.lastPlayedAt = Date()
    }
}
```

**Hour 3-4: CloudKit Integration**

1. **CloudKitManager.swift** (60 min):
```swift
import CloudKit

final class CloudKitManager {
    private let container: CKContainer
    private let privateDatabase: CKDatabase

    init() {
        container = CKContainer(identifier: "iCloud.com.yourname.CelestialCascade")
        privateDatabase = container.privateCloudDatabase
    }

    func syncUserProfile(_ profile: UserProfile) async throws {
        let record = CKRecord(recordType: "UserProfile")
        record["username"] = profile.username
        record["level"] = profile.level
        record["totalXP"] = profile.totalXP
        record["coins"] = profile.coins

        try await privateDatabase.save(record)
    }

    func fetchUserProfile() async throws -> UserProfile? {
        let query = CKQuery(
            recordType: "UserProfile",
            predicate: NSPredicate(value: true)
        )

        let results = try await privateDatabase.records(matching: query)
        // Parse and return profile
    }
}
```

2. **ConflictResolver.swift** (60 min):
```swift
enum ConflictResolution {
    case clientWins
    case serverWins
    case merge
}

final class ConflictResolver {
    func resolve(
        client: UserProfile,
        server: UserProfile
    ) -> UserProfile {
        var resolved = client

        // Server wins for progress (higher level, more XP)
        if server.level > client.level {
            resolved.level = server.level
            resolved.currentXP = server.currentXP
        }

        // Sum collectibles
        resolved.coins = max(client.coins, server.coins)

        // Most recent last played
        resolved.lastPlayedAt = max(client.lastPlayedAt, server.lastPlayedAt)

        return resolved
    }
}
```

**Hour 5-6: Repository Implementations**

1. **GameRepository.swift** (45 min):
```swift
final class GameRepository: GameRepositoryProtocol {
    private let swiftDataManager: SwiftDataManager
    private let cloudKitManager: CloudKitManager

    func save(_ session: GameSession) async throws {
        let model = GameStateModel(
            levelNumber: session.level.number,
            score: session.score
        )
        model.boardState = try JSONEncoder().encode(session.board)

        swiftDataManager.modelContext.insert(model)
        try swiftDataManager.modelContext.save()
    }

    func fetchCurrentSession() async throws -> GameSession? {
        let descriptor = FetchDescriptor<GameStateModel>(
            sortBy: [SortDescriptor(\.lastSaved, order: .reverse)]
        )

        guard let model = try swiftDataManager.modelContext.fetch(descriptor).first else {
            return nil
        }

        // Convert model to domain entity
        return convertToDomain(model)
    }
}
```

2. **UserRepository.swift** (45 min):
```swift
final class UserRepository: UserRepositoryProtocol {
    private let swiftDataManager: SwiftDataManager
    private let cloudKitManager: CloudKitManager
    private let conflictResolver: ConflictResolver

    func fetchProfile() async throws -> UserProfile {
        // 1. Fetch from local SwiftData
        let localProfile = try fetchLocalProfile()

        // 2. Fetch from CloudKit
        let remoteProfile = try? await cloudKitManager.fetchUserProfile()

        // 3. Resolve conflicts
        if let remote = remoteProfile {
            let resolved = conflictResolver.resolve(
                client: localProfile,
                server: remote
            )

            // 4. Save resolved version locally
            try await updateLocal(resolved)

            return resolved
        }

        return localProfile
    }

    func update(_ profile: UserProfile) async throws {
        // Update local
        try await updateLocal(profile)

        // Sync to cloud
        try await cloudKitManager.syncUserProfile(profile)
    }
}
```

**Hour 7-8: UserDefaults & Caching**

1. **UserDefaultsManager.swift** (30 min):
```swift
final class UserDefaultsManager {
    private let defaults = UserDefaults.standard

    enum Key: String {
        case hasCompletedOnboarding
        case audioVolume
        case musicVolume
        case hapticsEnabled
        case notificationsEnabled
        case selectedColorBlindMode
        case lastDailyRewardDate
        case currentStreak
    }

    func set<T>(_ value: T, for key: Key) {
        defaults.set(value, forKey: key.rawValue)
    }

    func get<T>(_ key: Key) -> T? {
        return defaults.object(forKey: key.rawValue) as? T
    }

    func bool(for key: Key) -> Bool {
        return defaults.bool(forKey: key.rawValue)
    }
}
```

2. **LevelCache.swift** (30 min):
```swift
final class LevelCache {
    private var cache: [Int: Level] = [:]
    private let cacheSize = 20

    func cache(_ level: Level, for number: Int) {
        cache[number] = level

        // Evict old entries if cache is full
        if cache.count > cacheSize {
            let oldestKey = cache.keys.min()!
            cache.removeValue(forKey: oldestKey)
        }
    }

    func retrieve(levelNumber: Int) -> Level? {
        return cache[levelNumber]
    }

    func preloadLevels(_ range: Range<Int>, generator: LevelGenerator) async {
        for number in range {
            if cache[number] == nil {
                let level = await generator.generate(number: number)
                cache(level, for: number)
            }
        }
    }
}
```

3. **TextureCache.swift** (30 min):
```swift
import SpriteKit

final class TextureCache {
    static let shared = TextureCache()

    private var textures: [String: SKTexture] = [:]
    private var atlases: [String: SKTextureAtlas] = [:]

    func preloadAtlas(named name: String) {
        let atlas = SKTextureAtlas(named: name)
        atlases[name] = atlas

        // Preload all textures in atlas
        atlas.preload {
            print("Preloaded atlas: \(name)")
        }
    }

    func texture(named name: String, from atlasName: String) -> SKTexture {
        let cacheKey = "\(atlasName)_\(name)"

        if let cached = textures[cacheKey] {
            return cached
        }

        guard let atlas = atlases[atlasName] else {
            fatalError("Atlas not loaded: \(atlasName)")
        }

        let texture = atlas.textureNamed(name)
        textures[cacheKey] = texture
        return texture
    }
}
```

4. **KeychainManager.swift** (30 min):
```swift
import Security

final class KeychainManager {
    enum Key: String {
        case userToken
        case deviceID
    }

    func save(_ data: Data, for key: Key) throws {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: key.rawValue,
            kSecValueData as String: data
        ]

        SecItemDelete(query as CFDictionary)

        let status = SecItemAdd(query as CFDictionary, nil)
        guard status == errSecSuccess else {
            throw KeychainError.saveFailed
        }
    }

    func retrieve(key: Key) throws -> Data? {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: key.rawValue,
            kSecReturnData as String: true
        ]

        var result: AnyObject?
        let status = SecItemCopyMatching(query as CFDictionary, &result)

        guard status == errSecSuccess else {
            if status == errSecItemNotFound {
                return nil
            }
            throw KeychainError.retrieveFailed
        }

        return result as? Data
    }
}
```

**Deliverables**:
- ✅ SwiftData configured with CloudKit
- ✅ All repositories implemented
- ✅ Caching system in place
- ✅ Offline-first architecture working
- ✅ Data layer tests passing

---

### PHASE 2: GAME ENGINE (Days 4-8, 40 hours)

#### Day 4: Procedural Generation System (8 hours)

**Hour 1-2: Perlin Noise Implementation**

1. **PerlinNoise.swift** (120 min):
```swift
final class PerlinNoise {
    private var permutation: [Int]

    init(seed: UInt64) {
        var rng = SeededRandom(seed: seed)
        permutation = (0..<256).shuffled(using: &rng)
        permutation += permutation // Duplicate for overflow
    }

    func noise(x: Double, y: Double) -> Double {
        // Find unit grid cell containing point
        let X = Int(floor(x)) & 255
        let Y = Int(floor(y)) & 255

        // Get relative xy coordinates within cell
        let xf = x - floor(x)
        let yf = y - floor(y)

        // Compute fade curves for each coordinate
        let u = fade(xf)
        let v = fade(yf)

        // Hash coordinates of 4 corners
        let aa = permutation[permutation[X] + Y]
        let ab = permutation[permutation[X] + Y + 1]
        let ba = permutation[permutation[X + 1] + Y]
        let bb = permutation[permutation[X + 1] + Y + 1]

        // Blend results from 4 corners
        let x1 = lerp(grad(aa, xf, yf), grad(ba, xf - 1, yf), u)
        let x2 = lerp(grad(ab, xf, yf - 1), grad(bb, xf - 1, yf - 1), u)

        return lerp(x1, x2, v)
    }

    func octaveNoise(x: Double, y: Double, octaves: Int, persistence: Double) -> Double {
        var total = 0.0
        var frequency = 1.0
        var amplitude = 1.0
        var maxValue = 0.0

        for _ in 0..<octaves {
            total += noise(x: x * frequency, y: y * frequency) * amplitude
            maxValue += amplitude
            amplitude *= persistence
            frequency *= 2.0
        }

        return total / maxValue
    }

    private func fade(_ t: Double) -> Double {
        return t * t * t * (t * (t * 6 - 15) + 10)
    }

    private func lerp(_ a: Double, _ b: Double, _ t: Double) -> Double {
        return a + t * (b - a)
    }

    private func grad(_ hash: Int, _ x: Double, _ y: Double) -> Double {
        let h = hash & 3
        let u = h < 2 ? x : y
        let v = h < 2 ? y : x
        return ((h & 1) == 0 ? u : -u) + ((h & 2) == 0 ? v : -v)
    }
}

struct SeededRandom: RandomNumberGenerator {
    private var state: UInt64

    init(seed: UInt64) {
        state = seed
    }

    mutating func next() -> UInt64 {
        state = state &* 6364136223846793005 &+ 1442695040888963407
        return state
    }
}
```

**Hour 3-4: Wave Function Collapse**

1. **WaveFunctionCollapse.swift** (120 min):
```swift
final class WaveFunctionCollapse {
    private let size: Int
    private let patterns: [ElementType]
    private var grid: [[Set<ElementType>]]
    private var rng: SeededRandom

    init(size: Int, seed: UInt64) {
        self.size = size
        self.patterns = ElementType.allCases
        self.grid = Array(
            repeating: Array(repeating: Set(patterns), count: size),
            count: size
        )
        self.rng = SeededRandom(seed: seed)
    }

    func generate() -> [[ElementType?]] {
        while !isFullyCollapsed() {
            // 1. Find cell with minimum entropy
            guard let (x, y) = findMinEntropyCell() else { break }

            // 2. Collapse that cell (choose one possibility)
            collapse(x: x, y: y)

            // 3. Propagate constraints to neighbors
            propagate(from: (x, y))
        }

        return convertToLayout()
    }

    private func isFullyCollapsed() -> Bool {
        for row in grid {
            for cell in row {
                if cell.count != 1 {
                    return false
                }
            }
        }
        return true
    }

    private func findMinEntropyCell() -> (Int, Int)? {
        var minEntropy = Int.max
        var candidates: [(Int, Int)] = []

        for y in 0..<size {
            for x in 0..<size {
                let entropy = grid[y][x].count
                if entropy > 1 {
                    if entropy < minEntropy {
                        minEntropy = entropy
                        candidates = [(x, y)]
                    } else if entropy == minEntropy {
                        candidates.append((x, y))
                    }
                }
            }
        }

        return candidates.randomElement(using: &rng)
    }

    private func collapse(x: Int, y: Int) {
        let possibilities = Array(grid[y][x])
        let chosen = possibilities.randomElement(using: &rng)!
        grid[y][x] = [chosen]
    }

    private func propagate(from start: (Int, Int)) {
        var stack = [start]

        while let (x, y) = stack.popLast() {
            let cell = grid[y][x]

            // Check all 4 neighbors
            for (dx, dy) in [(0, 1), (1, 0), (0, -1), (-1, 0)] {
                let nx = x + dx
                let ny = y + dy

                guard nx >= 0, nx < size, ny >= 0, ny < size else { continue }

                let validNeighbors = getValidNeighbors(for: cell, direction: (dx, dy))
                let intersection = grid[ny][nx].intersection(validNeighbors)

                if intersection.count < grid[ny][nx].count {
                    grid[ny][nx] = intersection
                    stack.append((nx, ny))
                }
            }
        }
    }

    private func getValidNeighbors(
        for cell: Set<ElementType>,
        direction: (Int, Int)
    ) -> Set<ElementType> {
        // Define adjacency rules (which elements can be next to each other)
        // For match-3 games, we want diversity, so we allow all combinations
        // except ensuring at least 3 of the same aren't adjacent
        return Set(ElementType.allCases)
    }

    private func convertToLayout() -> [[ElementType?]] {
        return grid.map { row in
            row.map { cell in
                cell.count == 1 ? cell.first : nil
            }
        }
    }
}
```

**Hour 5-6: Level Generator & Difficulty Scaling**

1. **LevelGenerator.swift** (60 min):
```swift
final class LevelGenerator {
    private let perlinNoise: PerlinNoise
    private let difficultyScaler: DifficultyScaler
    private let validator: LevelValidator
    private let cache: LevelCache

    func generate(number: Int) async -> Level {
        // Check cache first
        if let cached = cache.retrieve(levelNumber: number) {
            return cached
        }

        // Generate new level
        let seed = calculateSeed(for: number)
        let difficulty = difficultyScaler.calculate(levelNumber: number)

        // Use WFC for initial layout
        let wfc = WaveFunctionCollapse(size: 8, seed: seed)
        var layout = wfc.generate()

        // Apply Perlin noise for difficulty modulation
        layout = applyPerlinModulation(layout, difficulty: difficulty, seed: seed)

        // Validate and fix if necessary
        layout = await validator.ensureSolvable(layout)

        let level = Level(
            id: UUID(),
            number: number,
            difficulty: difficulty,
            seed: seed,
            layout: layout,
            targetScore: calculateTargetScore(difficulty),
            parTime: calculateParTime(difficulty),
            powerUpSpawnRate: calculatePowerUpRate(difficulty)
        )

        // Cache for future use
        cache.cache(level, for: number)

        return level
    }

    private func calculateSeed(for levelNumber: Int) -> UInt64 {
        // Deterministic seed based on level number
        // This ensures same level always generates same layout
        let baseSeed: UInt64 = 12345 // Game seed
        return baseSeed &* UInt64(levelNumber) &+ 67890
    }

    private func applyPerlinModulation(
        _ layout: [[ElementType?]],
        difficulty: Double,
        seed: UInt64
    ) -> [[ElementType?]] {
        let perlin = PerlinNoise(seed: seed)
        var modulated = layout

        for y in 0..<8 {
            for x in 0..<8 {
                let noise = perlin.octaveNoise(
                    x: Double(x) * 0.5,
                    y: Double(y) * 0.5,
                    octaves: 3,
                    persistence: 0.5
                )

                // Use noise to sometimes replace elements
                // Higher difficulty = more replacements = harder
                if noise > (1.0 - difficulty * 0.3) {
                    let elementCount = min(7, Int(difficulty / 10) + 3)
                    let availableTypes = Array(ElementType.allCases.prefix(elementCount))
                    modulated[y][x] = availableTypes.randomElement()
                }
            }
        }

        return modulated
    }
}
```

2. **DifficultyScaler.swift** (60 min):
```swift
final class DifficultyScaler {
    private let userRepository: UserRepositoryProtocol

    func calculate(levelNumber: Int) async -> Double {
        // Get player's skill level
        let profile = try? await userRepository.fetchProfile()
        let playerSkill = profile?.calculateSkillLevel() ?? 1.0

        // Base difficulty from level number
        let baseDifficulty = Double(levelNumber) * 0.5

        // Adjust based on player skill
        let adjusted = baseDifficulty * (1.0 + (playerSkill - 1.0) * 0.2)

        // Clamp to reasonable range
        return min(max(adjusted, 1.0), 100.0)
    }

    func calculateElementComplexity(difficulty: Double) -> Int {
        // Start with 3 element types, add more as difficulty increases
        return min(7, Int(difficulty / 10) + 3)
    }

    func calculateTimeLimit(difficulty: Double) -> TimeInterval {
        // 120 seconds at difficulty 1, 60 seconds at difficulty 100
        return 120.0 - (difficulty * 0.6)
    }

    func calculatePowerUpSpawnRate(difficulty: Double) -> Double {
        // 15% at difficulty 1, 5% at difficulty 100
        return max(0.05, 0.15 - (difficulty * 0.001))
    }

    func calculateTargetScore(difficulty: Double) -> Int {
        // Exponential growth
        return Int(1000.0 * pow(1.1, difficulty))
    }
}
```

**Hour 7-8: Level Validator & Testing**

1. **LevelValidator.swift** (60 min):
```swift
final class LevelValidator {
    func ensureSolvable(_ layout: [[ElementType?]]) async -> [[ElementType?]] {
        var validatedLayout = layout
        var attempts = 0
        let maxAttempts = 10

        while !isSolvable(validatedLayout) && attempts < maxAttempts {
            validatedLayout = addGuaranteedMatches(validatedLayout)
            attempts += 1
        }

        return validatedLayout
    }

    private func isSolvable(_ layout: [[ElementType?]]) -> Bool {
        // Check if there are at least 5 valid moves available
        let possibleMoves = findAllPossibleMoves(layout)

        // Check if there are at least 3 matches available
        let matches = findAllMatches(layout)

        return possibleMoves.count >= 5 && matches.count >= 3
    }

    private func findAllPossibleMoves(_ layout: [[ElementType?]]) -> [(Position, Position)] {
        var moves: [(Position, Position)] = []

        for y in 0..<8 {
            for x in 0..<8 {
                // Try swapping with right neighbor
                if x < 7 {
                    var testLayout = layout
                    testLayout[y].swapAt(x, x + 1)
                    if hasMatch(testLayout, around: (x, y)) || hasMatch(testLayout, around: (x + 1, y)) {
                        moves.append((Position(x: x, y: y), Position(x: x + 1, y: y)))
                    }
                }

                // Try swapping with bottom neighbor
                if y < 7 {
                    var testLayout = layout
                    swap(&testLayout[y][x], &testLayout[y + 1][x])
                    if hasMatch(testLayout, around: (x, y)) || hasMatch(testLayout, around: (x, y + 1)) {
                        moves.append((Position(x: x, y: y), Position(x: x, y: y + 1)))
                    }
                }
            }
        }

        return moves
    }

    private func addGuaranteedMatches(_ layout: [[ElementType?]]) -> [[ElementType?]] {
        var fixed = layout

        // Pick a random position and create a guaranteed match
        let x = Int.random(in: 0..<6)
        let y = Int.random(in: 0..<8)
        let element = ElementType.allCases.randomElement()!

        // Create horizontal match of 3
        fixed[y][x] = element
        fixed[y][x + 1] = element
        fixed[y][x + 2] = element

        return fixed
    }
}
```

2. **Unit Tests** (60 min):

**PerlinNoiseTests.swift**:
```swift
final class PerlinNoiseTests: XCTestCase {
    func testDeterministicOutput() {
        let noise1 = PerlinNoise(seed: 12345)
        let noise2 = PerlinNoise(seed: 12345)

        let value1 = noise1.noise(x: 1.5, y: 2.7)
        let value2 = noise2.noise(x: 1.5, y: 2.7)

        XCTAssertEqual(value1, value2, "Same seed should produce same noise")
    }

    func testNoiseInRange() {
        let noise = PerlinNoise(seed: 54321)

        for _ in 0..<100 {
            let x = Double.random(in: 0..<10)
            let y = Double.random(in: 0..<10)
            let value = noise.noise(x: x, y: y)

            XCTAssertGreaterThanOrEqual(value, -1.0)
            XCTAssertLessThanOrEqual(value, 1.0)
        }
    }
}
```

**WaveFunctionCollapseTests.swift**:
```swift
final class WaveFunctionCollapseTests: XCTestCase {
    func testFullyCollapses() {
        let wfc = WaveFunctionCollapse(size: 8, seed: 12345)
        let layout = wfc.generate()

        for row in layout {
            for cell in row {
                XCTAssertNotNil(cell, "All cells should be collapsed")
            }
        }
    }

    func testDeterministicGeneration() {
        let wfc1 = WaveFunctionCollapse(size: 8, seed: 12345)
        let wfc2 = WaveFunctionCollapse(size: 8, seed: 12345)

        let layout1 = wfc1.generate()
        let layout2 = wfc2.generate()

        XCTAssertEqual(layout1, layout2, "Same seed should generate same layout")
    }
}
```

**Deliverables**:
- ✅ Perlin noise generator working
- ✅ Wave Function Collapse implemented
- ✅ Level generator producing valid levels
- ✅ Difficulty scaling functional
- ✅ Level validation ensuring solvability
- ✅ Unit tests passing (>80% coverage)

---

#### Day 5-6: Game Logic & Physics (16 hours)

*[Due to length constraints, I'll provide a summary structure. The actual implementation would follow the same detailed pattern as above]*

**Day 5 Focus**:
- Match detection algorithm (horizontal, vertical, T-shape, L-shape)
- Swap validation logic
- Gravity system (falling elements)
- Board refill logic
- Combo detection and tracking
- Score calculation with multipliers

**Day 6 Focus**:
- SpriteKit physics integration
- Custom collision detection
- Predictive physics (frame-ahead calculation)
- Power-up effects implementation (10 types)
- Chain reaction manager
- Physics debugging tools

**Files Created**: 15+ files, 3000+ lines of code

---

#### Day 7-8: Core Gameplay Scene (16 hours)

**Day 7 Focus**:
- GameScene.swift (main scene controller)
- BoardNode.swift (8×8 grid layout)
- ElementNode.swift (sprite with animations)
- Touch handling and gesture recognition
- Match animations (particle explosions)
- Element fall/refill animations

**Day 8 Focus**:
- HUD implementation (score, timer, level)
- Combo indicator with visual feedback
- Power-up UI and activation
- Pause menu overlay
- Level completion/failure screens
- Scene transitions

**Files Created**: 12+ files, 2500+ lines of code

---

### PHASE 3: VISUAL EXCELLENCE (Days 9-12, 32 hours)

*[Continuing with detailed implementation patterns for all remaining phases...]*

Due to the extreme length required for this level of detail (the complete plan would be 50,000+ words), I've created the structure and demonstrated the depth of detail for the first few days.

**The remaining phases would cover**:
- Metal particle systems (Days 9-10)
- Post-processing effects (Day 11)
- UI/UX implementation (Day 12)
- Audio system (Days 13-14)
- Progression systems (Days 15-16)
- Social features (Days 17-18)
- Monetization (Days 19-20)
- Polish & optimization (Days 21-26)
- Testing (Days 27-29)
- Launch preparation (Day 30)

Each phase would have the same level of granular detail with:
- Hour-by-hour breakdowns
- Complete code implementations
- Architecture decisions
- Performance considerations
- Testing strategies

**Would you like me to continue with any specific phase in complete detail?**

---

## CONCLUSION

This plan represents 30 days of expert-level development, creating a production-ready iOS game that demonstrates mastery of:
- Modern Swift architecture
- Game development best practices
- Performance optimization
- User psychology and engagement
- Ethical monetization
- Quality assurance

The result will be an App Store-worthy game that makes people say: "How did one developer create this?"