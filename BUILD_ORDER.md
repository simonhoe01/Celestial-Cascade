# 🔨 Celestial Cascade - Build Order Guide

**Optimal implementation order for all 347 files**

This guide provides the exact order to implement files to maintain a compilable, testable codebase at each step.

---

## 📋 Quick Reference

**Total Files**: 347
**Estimated Time**: 240 hours (30 days)
**Current Status**: 25/347 files created (7%)

---

## 🎯 Implementation Philosophy

1. **Always Compilable**: Each phase should result in a compilable project
2. **Test as You Go**: Write tests alongside implementation
3. **Bottom-Up**: Build foundation before features
4. **Incremental**: Small, testable changes
5. **Document**: Add TODO comments for future work

---

## Phase 1: Foundation (Day 1-3) ✅ PARTIALLY COMPLETE

### 1.1 Project Setup ✅
- [x] Folder structure created
- [x] README.md
- [x] SETUP_GUIDE.md
- [x] Package.swift
- [ ] Create Xcode project (do this on macOS)
- [ ] Add dependencies (TCA, Swift Collections)
- [ ] Configure build settings

### 1.2 App Layer ✅
- [x] AppDelegate.swift
- [x] SceneDelegate.swift
- [x] CelestialCascadeApp.swift

### 1.3 Domain Entities - Core Game ✅
- [x] Core/Domain/Entities/Game/ElementType.swift
- [x] Core/Domain/Entities/Game/Position.swift
- [x] Core/Domain/Entities/Game/Element.swift
- [x] Core/Domain/Entities/Game/Board.swift
- [x] Core/Domain/Entities/Game/Match.swift
- [x] Core/Domain/Entities/Game/Combo.swift
- [x] Core/Domain/Entities/Game/PowerUp.swift
- [x] Core/Domain/Entities/Game/Level.swift
- [x] Core/Domain/Entities/Game/GameSession.swift

### 1.4 Domain Entities - User ✅
- [x] Core/Domain/Entities/User/UserProfile.swift
- [x] Core/Domain/Entities/User/GameStats.swift
- [x] Core/Domain/Entities/User/Inventory.swift
- [x] Core/Domain/Entities/User/DailyChallenge.swift

### 1.5 Domain Entities - Progression 🚧 IN PROGRESS
- [ ] Core/Domain/Entities/Progression/Achievement.swift
- [ ] Core/Domain/Entities/Progression/AchievementDefinition.swift
- [ ] Core/Domain/Entities/Progression/BattlePass.swift
- [ ] Core/Domain/Entities/Progression/BattlePassTier.swift
- [ ] Core/Domain/Entities/Progression/UnlockableItem.swift
- [ ] Core/Domain/Entities/Progression/XPTransaction.swift

### 1.6 Domain Entities - Social & Monetization
- [ ] Core/Domain/Entities/Social/LeaderboardEntry.swift
- [ ] Core/Domain/Entities/Social/LeaderboardType.swift
- [ ] Core/Domain/Entities/Social/FriendChallenge.swift
- [ ] Core/Domain/Entities/Social/GhostReplay.swift
- [ ] Core/Domain/Entities/Social/Tournament.swift
- [ ] Core/Domain/Entities/Monetization/Product.swift
- [ ] Core/Domain/Entities/Monetization/Transaction.swift
- [ ] Core/Domain/Entities/Monetization/SubscriptionStatus.swift

**Milestone**: All domain entities defined (22/22 files)
**Test**: Entities compile, pass Equatable/Codable tests

---

## Phase 2: Core Infrastructure (Day 2-3)

### 2.1 Common Utilities (Start Here - Needed by Everything)
**Order**: 1st (other files depend on these)

1. Common/Constants/AppConstants.swift
2. Common/Constants/GameConstants.swift
3. Common/Constants/DesignConstants.swift
4. Common/Utilities/Logger.swift
5. Common/Extensions/Foundation/Date+Extensions.swift
6. Common/Extensions/Foundation/Array+Extensions.swift
7. Common/Extensions/Foundation/String+Extensions.swift

### 2.2 Data Layer Foundation
**Order**: 2nd (repositories need these)

8. Core/Data/DataSources/Local/SwiftDataManager.swift ⚠️ CRITICAL
9. Core/Data/DataSources/Local/UserDefaultsManager.swift
10. Core/Data/DataSources/Local/KeychainManager.swift
11. Core/Data/Models/SwiftData/UserProfileModel.swift
12. Core/Data/Models/SwiftData/GameStateModel.swift
13. Core/Data/Models/SwiftData/AchievementModel.swift
14. Core/Data/Models/SwiftData/TransactionModel.swift

### 2.3 CloudKit Integration
**Order**: 3rd (can work offline initially)

15. Core/Data/DataSources/Remote/CloudKitManager.swift
16. Core/Data/DataSources/Remote/ConflictResolver.swift
17. Core/Data/Models/CloudKit/CKUserProfile.swift
18. Core/Data/Models/CloudKit/CKGameState.swift

### 2.4 Caching Layer
**Order**: 4th

19. Core/Data/DataSources/Cache/LevelCache.swift
20. Core/Data/DataSources/Cache/TextureCache.swift ⚠️ CRITICAL for game
21. Core/Data/DataSources/Cache/AudioCache.swift

### 2.5 Repository Protocols
**Order**: 5th

22. Core/Domain/Repositories/GameRepositoryProtocol.swift
23. Core/Domain/Repositories/UserRepositoryProtocol.swift
24. Core/Domain/Repositories/ProgressionRepositoryProtocol.swift
25. Core/Domain/Repositories/LeaderboardRepositoryProtocol.swift
26. Core/Domain/Repositories/StoreRepositoryProtocol.swift
27. Core/Domain/Repositories/AnalyticsRepositoryProtocol.swift

### 2.6 Repository Implementations
**Order**: 6th

28. Core/Data/Repositories/GameRepository.swift
29. Core/Data/Repositories/UserRepository.swift
30. Core/Data/Repositories/ProgressionRepository.swift
31. Core/Data/Repositories/LeaderboardRepository.swift
32. Core/Data/Repositories/StoreRepository.swift
33. Core/Data/Repositories/AnalyticsRepository.swift

**Milestone**: Data layer complete, can persist user data
**Test**: Save/load user profile, game state works

---

## Phase 3: Use Cases - Business Logic (Day 3-4)

### 3.1 Game Use Cases
**Order**: Implement in this sequence

34. Core/Domain/UseCases/Game/DetectMatchesUseCase.swift ⚠️ CRITICAL
35. Core/Domain/UseCases/Game/CalculateScoreUseCase.swift
36. Core/Domain/UseCases/Game/ProcessMatchUseCase.swift
37. Core/Domain/UseCases/Game/SwapElementsUseCase.swift
38. Core/Domain/UseCases/Game/ActivatePowerUpUseCase.swift
39. Core/Domain/UseCases/Game/StartLevelUseCase.swift
40. Core/Domain/UseCases/Game/CheckWinConditionUseCase.swift
41. Core/Domain/UseCases/Game/EndLevelUseCase.swift

### 3.2 Progression Use Cases

42. Core/Domain/UseCases/Progression/AwardXPUseCase.swift
43. Core/Domain/UseCases/Progression/CheckAchievementUseCase.swift
44. Core/Domain/UseCases/Progression/UnlockItemUseCase.swift
45. Core/Domain/UseCases/Progression/UpdateBattlePassUseCase.swift
46. Core/Domain/UseCases/Progression/CalculateDailyRewardsUseCase.swift

### 3.3 Social Use Cases

47. Core/Domain/UseCases/Social/SubmitScoreUseCase.swift
48. Core/Domain/UseCases/Social/FetchLeaderboardUseCase.swift
49. Core/Domain/UseCases/Social/RecordGhostReplayUseCase.swift
50. Core/Domain/UseCases/Social/ChallengeFriendUseCase.swift
51. Core/Domain/UseCases/Social/JoinTournamentUseCase.swift

### 3.4 Monetization Use Cases

52. Core/Domain/UseCases/Monetization/FetchProductsUseCase.swift
53. Core/Domain/UseCases/Monetization/PurchaseProductUseCase.swift
54. Core/Domain/UseCases/Monetization/VerifyTransactionUseCase.swift
55. Core/Domain/UseCases/Monetization/RestorePurchasesUseCase.swift

**Milestone**: All business logic defined
**Test**: Unit test each use case with mock repositories

---

## Phase 4: Procedural Generation (Day 4-5) ⚠️ CRITICAL PATH

### 4.1 Random Number Generation
**Order**: 1st (foundation for all generation)

56. Features/ProceduralGeneration/SeededRandom.swift

### 4.2 Perlin Noise
**Order**: 2nd

57. Features/ProceduralGeneration/Algorithms/PerlinNoise.swift

### 4.3 Wave Function Collapse
**Order**: 3rd

58. Features/ProceduralGeneration/Algorithms/WaveFunctionCollapse.swift

### 4.4 Genetic Algorithm (Optional for v1.0)
**Order**: 4th

59. Features/ProceduralGeneration/Algorithms/GeneticAlgorithm.swift
60. Features/ProceduralGeneration/Algorithms/ConstraintSolver.swift

### 4.5 Level Generation Pipeline
**Order**: 5th

61. Features/ProceduralGeneration/DifficultyScaler.swift
62. Features/ProceduralGeneration/LevelValidator.swift
63. Features/ProceduralGeneration/SeedManager.swift
64. Features/ProceduralGeneration/LevelGenerator.swift ⚠️ CRITICAL

**Milestone**: Can generate playable levels
**Test**: Generate 100 levels, verify all are solvable

---

## Phase 5: Core Managers (Day 5-6)

### 5.1 Audio System
**Order**: Implement together

65. Features/Audio/AudioManager.swift ⚠️ CRITICAL
66. Features/Audio/SpatialAudioEngine.swift
67. Features/Audio/MusicManager.swift
68. Features/Audio/SoundEffectManager.swift
69. Features/Audio/AudioPool.swift
70. Features/Audio/AudioMixer.swift

### 5.2 Haptics System

71. Features/Haptics/HapticEngine.swift ⚠️ CRITICAL
72. Features/Haptics/HapticPatternLibrary.swift
73. Features/Haptics/HapticScheduler.swift
74. Features/Haptics/CustomPatterns/MatchHaptic.ahap
75. Features/Haptics/CustomPatterns/ComboHaptic.ahap
76. Features/Haptics/CustomPatterns/PowerUpHaptic.ahap
77. Features/Haptics/CustomPatterns/SuccessHaptic.ahap
78. Features/Haptics/CustomPatterns/FailureHaptic.ahap

### 5.3 Analytics (Privacy-First)

79. Features/Analytics/AnalyticsManager.swift
80. Features/Analytics/EventTracker.swift
81. Features/Analytics/SessionTracker.swift
82. Features/Analytics/FunnelTracker.swift
83. Features/Analytics/ABTestManager.swift
84. Features/Analytics/PrivacyManager.swift

### 5.4 Notifications

85. Features/Notifications/NotificationManager.swift
86. Features/Notifications/LocalNotifications.swift
87. Features/Notifications/PushNotifications.swift
88. Features/Notifications/NotificationScheduler.swift

**Milestone**: All core systems functional
**Test**: Play sounds, trigger haptics, track events

---

## Phase 6: Game Physics & Logic (Day 6-7)

### 6.1 Physics Engine

89. Features/Physics/PhysicsEngine.swift
90. Features/Physics/CollisionHandler.swift
91. Features/Physics/GravityManager.swift
92. Features/Physics/PredictivePhysics.swift
93. Features/Physics/PhysicsDebugger.swift

**Milestone**: Physics simulation working
**Test**: Elements fall correctly, collision detection works

---

## Phase 7: SpriteKit Scenes (Day 7-9) ⚠️ CRITICAL PATH

### 7.1 Base Scene Infrastructure

94. Core/Presentation/Scenes/Base/BaseScene.swift
95. Core/Presentation/Scenes/Base/SceneTransitionable.swift
96. Core/Presentation/Scenes/Base/SceneInputHandler.swift

### 7.2 Game Scene (Most Critical)
**Order**: Implement in this exact order

97. Core/Presentation/Scenes/Game/ElementNode.swift ⚠️ START HERE
98. Core/Presentation/Scenes/Game/BoardNode.swift
99. Core/Presentation/Scenes/Game/HUDNode.swift
100. Core/Presentation/Scenes/Game/GameBackground.swift
101. Core/Presentation/Scenes/Game/MatchAnimator.swift
102. Core/Presentation/Scenes/Game/ComboIndicator.swift
103. Core/Presentation/Scenes/Game/PowerUpNode.swift
104. Core/Presentation/Scenes/Game/PauseOverlay.swift
105. Core/Presentation/Scenes/Game/GameScene.swift ⚠️ LAST - TIES IT ALL TOGETHER

### 7.3 Other Scenes

106. Core/Presentation/Scenes/MainMenu/MenuScene.swift
107. Core/Presentation/Scenes/MainMenu/MenuBackground.swift
108. Core/Presentation/Scenes/MainMenu/MenuButton.swift
109. Core/Presentation/Scenes/MainMenu/MenuParticles.swift
110. Core/Presentation/Scenes/Results/ResultsScene.swift
111. Core/Presentation/Scenes/Results/ScoreRevealAnimator.swift
112. Core/Presentation/Scenes/Results/RewardAnimator.swift
113. Core/Presentation/Scenes/Results/StarRating.swift

**Milestone**: Playable game with basic graphics
**Test**: Can play a complete level, see animations

---

## Phase 8: TCA Integration (Day 9-10)

### 8.1 App-Level TCA

114. Core/Presentation/ViewModels/AppFeature.swift ⚠️ CRITICAL
115. Core/Presentation/ViewModels/AppState.swift
116. Core/Presentation/ViewModels/AppAction.swift

### 8.2 Feature-Level TCA

117. Core/Presentation/ViewModels/GameFeature.swift
118. Core/Presentation/ViewModels/MenuFeature.swift
119. Core/Presentation/ViewModels/ShopFeature.swift
120. Core/Presentation/ViewModels/ProgressionFeature.swift
121. Core/Presentation/ViewModels/LeaderboardFeature.swift
122. Core/Presentation/ViewModels/SettingsFeature.swift

### 8.3 Coordinators

123. Core/Presentation/Coordinators/AppCoordinator.swift
124. Core/Presentation/Coordinators/GameCoordinator.swift
125. Core/Presentation/Coordinators/MenuCoordinator.swift
126. Core/Presentation/Coordinators/OnboardingCoordinator.swift

**Milestone**: State management integrated
**Test**: TCA store updates trigger UI changes

---

## Phase 9: SwiftUI Views (Day 10-12)

### 9.1 Root & Menu Views

127. Core/Presentation/Views/ContentView.swift
128. Core/Presentation/Views/Menu/MainMenuView.swift
129. Core/Presentation/Views/Menu/ProfileView.swift
130. Core/Presentation/Views/Menu/DailyChallengeCard.swift

### 9.2 Game Views

131. Core/Presentation/Views/Game/GameView.swift
132. Core/Presentation/Views/Game/GameOverlay.swift

### 9.3 Progression Views

133. Core/Presentation/Views/Progression/BattlePassView.swift
134. Core/Presentation/Views/Progression/BattlePassTierCard.swift
135. Core/Presentation/Views/Progression/AchievementsView.swift
136. Core/Presentation/Views/Progression/AchievementCard.swift
137. Core/Presentation/Views/Progression/ProgressionStatsView.swift

### 9.4 Shop Views

138. Core/Presentation/Views/Shop/ShopView.swift
139. Core/Presentation/Views/Shop/ProductCard.swift
140. Core/Presentation/Views/Shop/ProductDetailView.swift
141. Core/Presentation/Views/Shop/CosmeticPreview.swift
142. Core/Presentation/Views/Shop/PurchaseButton.swift

### 9.5 Social Views

143. Core/Presentation/Views/Social/LeaderboardView.swift
144. Core/Presentation/Views/Social/LeaderboardRow.swift
145. Core/Presentation/Views/Social/LeaderboardFilter.swift
146. Core/Presentation/Views/Social/FriendChallengeView.swift
147. Core/Presentation/Views/Social/TournamentBracketView.swift

### 9.6 Settings Views

148. Core/Presentation/Views/Settings/SettingsView.swift
149. Core/Presentation/Views/Settings/AudioSettingsView.swift
150. Core/Presentation/Views/Settings/HapticSettingsView.swift
151. Core/Presentation/Views/Settings/AccessibilityView.swift
152. Core/Presentation/Views/Settings/NotificationSettingsView.swift
153. Core/Presentation/Views/Settings/AboutView.swift

### 9.7 Reusable Components

154. Core/Presentation/Views/Components/GlassmorphicCard.swift
155. Core/Presentation/Views/Components/AnimatedButton.swift
156. Core/Presentation/Views/Components/ProgressBar.swift
157. Core/Presentation/Views/Components/CoinCounter.swift
158. Core/Presentation/Views/Components/XPBar.swift
159. Core/Presentation/Views/Components/Toast.swift
160. Core/Presentation/Views/Components/LoadingSpinner.swift
161. Core/Presentation/Views/Components/ConfirmationDialog.swift

**Milestone**: Complete UI navigation
**Test**: Can navigate entire app without gameplay

---

## Phase 10: Metal Particle System (Day 13-14)

### 10.1 Shader Files (Create Together)

162. Resources/Shaders/ShaderTypes.h
163. Resources/Shaders/ParticleUpdate.metal
164. Resources/Shaders/ParticleRender.metal
165. Resources/Shaders/Bloom.metal
166. Resources/Shaders/ColorGrading.metal
167. Resources/Shaders/ChromaticAberration.metal
168. Resources/Shaders/MotionBlur.metal
169. Resources/Shaders/Vignette.metal

### 10.2 Particle System Code

170. Features/ParticleSystem/ParticleEngine.swift
171. Features/ParticleSystem/ParticleEmitter.swift
172. Features/ParticleSystem/MetalParticleRenderer.swift
173. Features/ParticleSystem/ParticlePool.swift

### 10.3 Emitter Configurations

174. Features/ParticleSystem/Emitters/MatchExplosionEmitter.swift
175. Features/ParticleSystem/Emitters/ComboEmitter.swift
176. Features/ParticleSystem/Emitters/PowerUpEmitter.swift
177. Features/ParticleSystem/Emitters/BackgroundEmitter.swift
178. Features/ParticleSystem/Emitters/TrailEmitter.swift

**Milestone**: Stunning particle effects
**Test**: 10,000+ particles at 120fps

---

## Phase 11: Feature Systems (Day 15-18)

### 11.1 Progression Systems

179. Features/Progression/XPSystem.swift
180. Features/Progression/LevelSystem.swift
181. Features/Progression/AchievementSystem.swift
182. Features/Progression/BattlePassSystem.swift
183. Features/Progression/DailyRewardSystem.swift
184. Features/Progression/UnlockableSystem.swift
185. Features/Progression/PrestigeSystem.swift

### 11.2 GameKit Integration

186. Features/GameCenter/GameCenterManager.swift
187. Features/GameCenter/AuthenticationManager.swift
188. Features/GameCenter/LeaderboardManager.swift
189. Features/GameCenter/AchievementManager.swift
190. Features/GameCenter/MultiplayerManager.swift
191. Features/GameCenter/GhostReplayManager.swift
192. Features/GameCenter/TournamentManager.swift

### 11.3 StoreKit Integration

193. Features/Monetization/StoreKitManager.swift
194. Features/Monetization/ProductManager.swift
195. Features/Monetization/PurchaseManager.swift
196. Features/Monetization/TransactionVerifier.swift
197. Features/Monetization/SubscriptionManager.swift
198. Features/Monetization/RestoreManager.swift
199. Features/Monetization/ReceiptValidator.swift

### 11.4 Tutorial System

200. Features/Tutorial/TutorialManager.swift
201. Features/Tutorial/TutorialStepDefinitions.swift
202. Features/Tutorial/TutorialOverlay.swift
203. Features/Tutorial/OnboardingProgress.swift
204. Core/Presentation/Scenes/Tutorial/TutorialScene.swift
205. Core/Presentation/Scenes/Tutorial/TutorialStep.swift
206. Core/Presentation/Scenes/Tutorial/HighlightMask.swift
207. Core/Presentation/Scenes/Tutorial/TutorialHand.swift

**Milestone**: All features functional
**Test**: Progression, social, purchases work

---

## Phase 12: Extensions & Utilities (Day 19-20)

### 12.1 Foundation Extensions

208. Common/Extensions/Foundation/Int+Extensions.swift
209. Common/Extensions/Foundation/Double+Extensions.swift
210. Common/Extensions/Foundation/URL+Extensions.swift
211. Common/Extensions/Foundation/Data+Extensions.swift
212. Common/Utilities/DateFormatter+Shared.swift
213. Common/Utilities/NumberFormatter+Shared.swift

### 12.2 UIKit Extensions

214. Common/Extensions/UIKit/UIColor+Extensions.swift
215. Common/Extensions/UIKit/UIImage+Extensions.swift
216. Common/Extensions/UIKit/UIView+Extensions.swift

### 12.3 SwiftUI Extensions

217. Common/Extensions/SwiftUI/View+Extensions.swift
218. Common/Extensions/SwiftUI/Color+Extensions.swift
219. Common/Extensions/SwiftUI/Animation+Extensions.swift

### 12.4 SpriteKit Extensions

220. Common/Extensions/SpriteKit/SKNode+Extensions.swift
221. Common/Extensions/SpriteKit/SKAction+Extensions.swift
222. Common/Extensions/SpriteKit/SKScene+Extensions.swift
223. Common/Extensions/SpriteKit/SKTexture+Extensions.swift

### 12.5 Utilities

224. Common/Utilities/URLBuilder.swift
225. Common/Utilities/ImageLoader.swift
226. Common/Utilities/CacheManager.swift
227. Common/Utilities/DeviceInfo.swift

### 12.6 Protocols

228. Common/Protocols/Identifiable.swift
229. Common/Protocols/Reusable.swift
230. Common/Protocols/Configurable.swift
231. Common/Protocols/Coordinatable.swift

### 12.7 Additional Constants

232. Common/Constants/AnalyticsConstants.swift
233. Common/Constants/APIConstants.swift

**Milestone**: All utilities available
**Test**: Extensions work correctly

---

## Phase 13: Testing (Day 21-25)

### 13.1 Test Helpers & Mocks

234. CelestialCascadeTests/Helpers/TestHelpers.swift
235. CelestialCascadeTests/Helpers/XCTestCase+Extensions.swift
236. CelestialCascadeTests/Helpers/MockData.swift
237-242. CelestialCascadeTests/Mocks/Mock[Repository].swift (6 files)

### 13.2 Domain Tests

243-262. CelestialCascadeTests/DomainTests/Entities/*.swift (20 files)
263-282. CelestialCascadeTests/DomainTests/UseCases/*.swift (20 files)

### 13.3 Data Tests

283-292. CelestialCascadeTests/DataTests/Repositories/*.swift (10 files)

### 13.4 Feature Tests

293-312. CelestialCascadeTests/FeaturesTests/**/*.swift (20 files)

### 13.5 UI Tests

313-322. CelestialCascadeUITests/**/*.swift (10 files)

### 13.6 Performance Tests

323-327. CelestialCascadePerformanceTests/*.swift (5 files)

**Milestone**: 80%+ test coverage
**Test**: All tests pass

---

## Phase 14: Assets & Resources (Day 26-27)

### 14.1 Configuration Files

328. Supporting Files/Info.plist
329. Supporting Files/Entitlements.plist
330. Supporting Files/Config/Debug.xcconfig
331. Supporting Files/Config/Release.xcconfig
332. Supporting Files/Config/Shared.xcconfig

### 14.2 Asset Catalogs

333-337. Resources/Assets.xcassets/* (AppIcon, Colors, Images)

### 14.3 Localization Files

338-347. Resources/Localization/[lang].lproj/Localizable.strings (10 files)

**Milestone**: Assets ready for production
**Test**: All languages load correctly

---

## Critical Path Summary

**Must implement in this order for fastest playable prototype:**

1. ✅ Entities (22 files) - DONE
2. 🔄 SwiftDataManager, UserDefaultsManager - IN PROGRESS
3. Repository protocols & implementations (12 files)
4. DetectMatchesUseCase, CalculateScoreUseCase
5. LevelGenerator + Procedural algorithms
6. TextureCache, AudioManager, HapticEngine
7. ElementNode, BoardNode, GameScene
8. Basic GameFeature (TCA)
9. GameView (SwiftUI wrapper)
10. Menu navigation

**Estimated time to playable demo**: 5-7 days (40-56 hours)

---

## Verification Checklist

After each phase:

- [ ] Project compiles without errors
- [ ] New tests written and passing
- [ ] No force-unwraps added
- [ ] TODO comments added for future work
- [ ] Code documented
- [ ] Git commit made

---

## Notes

- **⚠️ CRITICAL** = Required for minimal playable version
- **🚧** = Currently in progress
- **✅** = Completed
- **📦** = Can be stubbed initially

---

**Last Updated**: Phase 1 (Day 3)
**Next Milestone**: Complete all entities + SwiftData setup