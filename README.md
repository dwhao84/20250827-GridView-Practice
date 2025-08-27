# 20250827-GridView-Practice

## 專案概述

這是一個專門練習 SwiftUI `Grid` 和 `GridRow` 佈局技術的學習專案。透過三個不同的實作範例，深入了解 SwiftUI 網格系統的各種功能，包括基礎網格佈局、嵌套網格、網格單元格跨越、以及圖片在網格中的大小調整。

專案由 Da Wei Hao 於 2025年8月27日創建，包含了從基礎到進階的 Grid 佈局實作練習。

## 功能特色

- 🧮 **計算機佈局練習**: 比較傳統 ForEach+HStack 與 Grid+GridRow 的差異
- 🎨 **彩色網格練習**: 展示複雜的嵌套網格和 `gridCellColumns` 跨欄功能
- 🖼️ **圖片網格練習**: 學習 `gridCellUnsizedAxes` 修飾符處理圖片大小
- 📱 支援 iOS 平台
- 🧪 包含完整的測試框架（Unit Tests 和 UI Tests）

## 系統需求

- **iOS**: 16.0 或更高版本（Grid 功能需求）
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
3. 應用程式將在選定的設備/模擬器上啟動（預設顯示 CalculatorView）

### 查看不同的 Grid 練習範例

專案包含多個 Preview，可以在 Xcode 中直接預覽：

#### 1. 計算機佈局範例
- 在 `CalculatorView.swift` 中查看兩個 Preview：
  - **"Calculator View"**: 傳統 ForEach + HStack 佈局
  - **"Grid View"**: 使用 Grid + GridRow 的優化佈局

#### 2. 彩色網格範例
- 在 `ColorView.swift` 中查看：
  - **"Grid Practice"**: 展示嵌套網格和 gridCellColumns 功能

#### 3. 圖片網格範例
- 在 `UnsizedAxesView.swift` 中查看：
  - 展示 gridCellUnsizedAxes 修飾符的使用

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
│   ├── _0250827_GridView_PracticeApp.swift    # 應用程式入口點
│   ├── CalculatorView.swift                   # 計算機佈局練習（Grid vs ForEach比較）
│   ├── ColorView.swift                        # 彩色網格練習（嵌套Grid和gridCellColumns）
│   ├── UnsizedAxesView.swift                  # 圖片網格練習（gridCellUnsizedAxes）
│   └── Assets.xcassets/                       # 應用程式資源檔案
│       ├── tom.imageset                       # 練習用圖片
│       ├── topGunPost.imageset               # 練習用圖片
│       └── yt.imageset                       # 練習用圖片
├── 20250827-GridView-PracticeTests/
│   └── _0250827_GridView_PracticeTests.swift  # Unit 測試
├── 20250827-GridView-PracticeUITests/
│   ├── _0250827_GridView_PracticeUITests.swift      # UI 測試
│   └── _0250827_GridView_PracticeUITestsLaunchTests.swift # 啟動測試
└── 20250827-GridView-Practice.xcodeproj/     # Xcode 專案檔案
```

## Grid 練習內容詳解

### 1. CalculatorView.swift - 計算機佈局練習

此檔案展示了兩種不同的佈局方式：

#### 傳統方式 (`CalculatorView`)
```swift
ForEach(calculatorInput, id: \.self) { row in
    HStack {
        ForEach(row, id: \.self) { item in
            TextButton(text: item)
        }
    }
}
```

#### Grid 方式 (`CalculatorGridView`)
```swift
Grid {
    ForEach(calculatorInput.dropLast(1), id: \.self) { inputs in
        GridRow {
            ForEach(inputs, id: \.self) { row in
                TextButton(text: row)
            }
        }
    }
    
    GridRow {
        // 調整0的寬度 gridCellColumns(2)可以拿來處理排版問題
        TextButton(text: "0").gridCellColumns(2)
        TextButton(text: ".")
        TextButton(text: "=")
    }
}
```

**學習重點**:
- 比較 `Grid + GridRow` 與 `ForEach + HStack` 的差異
- 使用 `gridCellColumns(2)` 讓某個按鈕跨越兩欄
- Grid 提供更好的對齊和排版控制

### 2. ColorView.swift - 彩色網格練習

展示複雜的嵌套網格佈局：

```swift
Grid(horizontalSpacing: 10, verticalSpacing: 10) {
    GridRow {
        ColorView(.pink)
            .gridCellColumns(2)    // 跨越兩欄
        
        Grid {                     // 嵌套的Grid
            ColorView(.blue)
            ColorView(.purple)
            ColorView(.brown)
        }
    }
    
    Grid {
        GridRow {
            ColorView(.orange)
            ColorView(.indigo)
            
            Grid {
                GridRow {
                    ColorView(.cyan)
                    Color(.yellow)
                }
                ColorView(.mint)
                ColorView(.green)
            }.gridCellColumns(2)   // 整個嵌套Grid跨越兩欄
        }
    }
}
```

**學習重點**:
- 設定 `horizontalSpacing` 和 `verticalSpacing` 調整間距
- 使用 `gridCellColumns()` 修飾符讓元素跨越多欄
- 嵌套 Grid 的使用方式
- 複雜佈局的組合技巧

### 3. UnsizedAxesView.swift - 圖片網格練習

展示如何在網格中處理圖片大小：

```swift
Grid {
    GridRow {
        Color.yellow
            .gridCellUnsizedAxes(.vertical)
            .gridCellUnsizedAxes(.horizontal)
        
        Image("topGunPost")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .gridCellColumns(2)
    }
    
    GridRow {
        Image("yt")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .gridCellColumns(2)
            .gridCellUnsizedAxes(.vertical)
        
        Image("tom")
            .resizable()
            .aspectRatio(contentMode: .fit)
    }
}
```

**學習重點**:
- 使用 `gridCellUnsizedAxes(.vertical)` 讓元素不影響該軸的網格大小
- 使用 `gridCellUnsizedAxes(.horizontal)` 控制水平軸大小影響
- 結合 `resizable()` 和 `aspectRatio()` 處理圖片在網格中的顯示
- 圖片與其他元素的混合佈局

## 開發說明

### 主要檔案說明

- **`_0250827_GridView_PracticeApp.swift`**: 應用程式的主要入口點，設定啟動時顯示 `CalculatorView`
- **`CalculatorView.swift`**: 
  - `CalculatorView`: 使用傳統 ForEach + HStack 方式實作的計算機佈局
  - `CalculatorGridView`: 使用 Grid + GridRow 方式實作的計算機佈局，展示 Grid 的優勢
  - `NumberDisplayView`: 計算機的顯示區域元件
  - `TextButton`: 可重用的按鈕元件
- **`ColorView.swift`**:
  - `ColorView`: 彩色矩形元件，顯示顏色名稱
  - `GridPracticeView`: 複雜的嵌套網格練習，展示 gridCellColumns 和嵌套 Grid 的使用
- **`UnsizedAxesView.swift`**: 展示 gridCellUnsizedAxes 修飾符的使用，特別適用於圖片佈局

### 技術架構

- **框架**: SwiftUI
- **主要技術**: Grid, GridRow, gridCellColumns, gridCellUnsizedAxes
- **設計模式**: 元件化設計，可重用的 View 結構
- **測試框架**: XCTest
- **UI 測試**: XCUITest

### Grid vs 傳統佈局的優勢

1. **更好的對齊**: Grid 自動處理欄寬對齊，無需手動調整
2. **跨欄支援**: 使用 `gridCellColumns()` 輕鬆實現元素跨欄
3. **嵌套支援**: 可以在 Grid 內嵌套另一個 Grid
4. **大小控制**: 使用 `gridCellUnsizedAxes()` 精確控制元素對網格大小的影響
5. **簡潔的程式碼**: 相較於複雜的 HStack/VStack 組合，Grid 程式碼更直觀

## 學習目標

完成此專案後，您將學會：

1. **基礎 Grid 佈局**: 了解 Grid 和 GridRow 的基本使用方法
2. **網格修飾符**: 掌握 gridCellColumns 和 gridCellUnsizedAxes 的使用時機
3. **佈局比較**: 理解 Grid 相對於傳統佈局方式的優勢
4. **嵌套網格**: 學會在複雜佈局中使用嵌套 Grid
5. **圖片處理**: 了解如何在網格中正確處理圖片大小和比例
6. **元件設計**: 學習創建可重用的 SwiftUI 元件

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

- **v1.0.0** (2025-08-27): 
  - 初始版本發布
  - 完成計算機佈局練習（Grid vs ForEach 比較）
  - 完成彩色網格練習（嵌套Grid和gridCellColumns）
  - 完成圖片網格練習（gridCellUnsizedAxes）
  - 建立完整的專案結構和測試框架

---

*最後更新: 2025年8月27日*

## 常見問題

### Q: 什麼時候應該使用 Grid 而不是 HStack/VStack？
A: 當您需要：
- 多行多列的規整佈局
- 某些元素需要跨越多欄或多行
- 不同行之間需要對齊
- 複雜的表格型佈局

### Q: gridCellColumns 和 gridCellUnsizedAxes 有什麼區別？
A: 
- `gridCellColumns(n)`: 讓元素跨越 n 欄，影響佈局結構
- `gridCellUnsizedAxes(.vertical/.horizontal)`: 讓元素不影響該軸向的網格大小計算

### Q: 可以在 Grid 內嵌套 Grid 嗎？
A: 可以！如 ColorView.swift 中的範例所示，嵌套 Grid 是處理複雜佈局的有效方法。

### Q: 支援哪些 iOS 版本？
A: 目前支援 iOS 16.0 及以上版本（Grid 是 iOS 16+ 的功能）。

### Q: 如何回報問題？
A: 請在 GitHub 上開啟 Issue，詳細描述遇到的問題。

## 相關資源

- [SwiftUI 官方文件](https://developer.apple.com/documentation/swiftui/)
- [SwiftUI Grid 官方文件](https://developer.apple.com/documentation/swiftui/grid)
- [SwiftUI GridRow 官方文件](https://developer.apple.com/documentation/swiftui/gridrow)
- [iOS 開發指南](https://developer.apple.com/ios/)
- [SwiftUI Layout 系統詳解](https://developer.apple.com/documentation/swiftui/layout)

---

*最後更新: 2025年8月27日*