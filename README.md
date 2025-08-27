# 20250827-GridView-Practice

## 專案概述

這是一個使用 SwiftUI 開發的 GridView 練習專案，旨在學習和實踐 SwiftUI 中的網格佈局功能。專案由 Da Wei Hao 於 2025年8月27日創建。

## 功能特色

- 🎯 SwiftUI GridView 實作練習
- 📱 支援 iOS 平台
- 🎨 現代化的使用者介面設計
- 🧪 包含完整的測試框架（Unit Tests 和 UI Tests）

## 系統需求

- **iOS**: 15.0 或更高版本
- **Xcode**: 14.0 或更高版本
- **Swift**: 5.7 或更高版本
- **macOS**: 12.0 或更高版本（用於開發）

## 安裝與設定

### 前置條件

1. 確保您的 Mac 已安裝 Xcode
2. 確認 Xcode 版本符合系統需求

### 下載專案

```bash
git clone https://github.com/dwhao84/20250827-GridView-Practice.git
cd 20250827-GridView-Practice
```

### 開啟專案

1. 在 Finder 中找到專案資料夾
2. 雙擊 `20250827-GridView-Practice.xcodeproj` 檔案
3. 等待 Xcode 載入專案

## 使用說明

### 執行應用程式

1. 在 Xcode 中選擇目標設備或模擬器
2. 按下 `⌘ + R` 或點擊執行按鈕
3. 應用程式將在選定的設備/模擬器上啟動

### 執行測試

#### Unit Tests
```bash
# 在 Xcode 中按 ⌘ + U，或使用以下指令：
xcodebuild test -scheme "20250827-GridView-Practice" -destination "platform=iOS Simulator,name=iPhone 15"
```

#### UI Tests
UI 測試會自動包含在測試套件中，使用相同的測試指令即可執行。

## 專案結構

```
20250827-GridView-Practice/
├── 20250827-GridView-Practice/
│   ├── _0250827_GridView_PracticeApp.swift    # 主要應用程式入口點
│   ├── ContentView.swift                      # 主要視圖內容
│   └── Assets.xcassets/                       # 應用程式資源檔案
├── 20250827-GridView-PracticeTests/
│   └── _0250827_GridView_PracticeTests.swift  # Unit 測試
├── 20250827-GridView-PracticeUITests/
│   ├── _0250827_GridView_PracticeUITests.swift      # UI 測試
│   └── _0250827_GridView_PracticeUITestsLaunchTests.swift # 啟動測試
└── 20250827-GridView-Practice.xcodeproj/     # Xcode 專案檔案
```

## 開發說明

### 主要檔案

- **`_0250827_GridView_PracticeApp.swift`**: 應用程式的主要入口點，定義應用程式的基本結構
- **`ContentView.swift`**: 主要的使用者介面視圖，目前包含基本的 "Hello, world!" 顯示
- **測試檔案**: 包含 Unit Tests 和 UI Tests，確保應用程式功能正常運作

### 技術架構

- **框架**: SwiftUI
- **設計模式**: MVVM (Model-View-ViewModel)
- **測試框架**: XCTest
- **UI 測試**: XCUITest

## 貢獻指南

歡迎任何形式的貢獻！如果您想要為此專案做出貢獻，請：

1. Fork 此專案
2. 創建您的功能分支 (`git checkout -b feature/AmazingFeature`)
3. 提交您的更改 (`git commit -m 'Add some AmazingFeature'`)
4. 推送到分支 (`git push origin feature/AmazingFeature`)
5. 開啟一個 Pull Request

## 授權

此專案僅供學習和練習使用。

## 作者

**Da Wei Hao**
- 創建日期: 2025年8月27日
- GitHub: [@dwhao84](https://github.com/dwhao84)

## 版本歷史

- **v1.0.0** (2025-08-27): 初始版本，基本專案架構建立

## 常見問題

### Q: 如何在專案中實作 GridView？
A: 此專案正在開發中，GridView 的實作將會在後續版本中加入。目前可以參考 SwiftUI 的 `LazyVGrid` 和 `LazyHGrid` 元件。

### Q: 支援哪些 iOS 版本？
A: 目前支援 iOS 15.0 及以上版本。

### Q: 如何回報問題？
A: 請在 GitHub 上開啟 Issue，詳細描述遇到的問題。

## 相關資源

- [SwiftUI 官方文件](https://developer.apple.com/documentation/swiftui/)
- [SwiftUI GridView 教學](https://developer.apple.com/documentation/swiftui/lazyvgrid)
- [iOS 開發指南](https://developer.apple.com/ios/)

---

*最後更新: 2025年8月27日*