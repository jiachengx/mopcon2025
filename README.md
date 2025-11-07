# MOPCON 2025 簡報播放器

🎤 **離線到雲端的智慧候診系統：AI 聲音合成與多終端同步實戰**

講者：許家誠 Stephen Hsu  
會議：MOPCON 2025 行動科技年會  
演講時間：45分鐘

## 📋 專案概述

本專案包含 MOPCON 2025 技術演講的完整簡報播放器，支援專業級的簡報播放體驗，包含全螢幕播放、鍵盤控制、進度追蹤等功能。

### 🎯 主要特色

- ✅ **專業簡報播放器**：全螢幕播放、鍵盤快捷鍵、進度條
- ✅ **縮圖導航**：快速跳轉到任意頁面
- ✅ **演講計時器**：自動時間追蹤（40分鐘警告）
- ✅ **雷射筆效果**：點擊聚焦效果
- ✅ **URL 分享**：可直接分享特定頁面
- ✅ **響應式設計**：支援手機、平板、桌機
- ✅ **快捷鍵提示**：內建操作說明

### 📊 技術規格

- **總頁數**：32頁
- **解析度**：1280×720px (16:9)
- **格式**：HTML5 + CSS3 + JavaScript
- **字型**：Noto Sans TC（繁體中文優化）
- **相容性**：現代瀏覽器（Chrome, Firefox, Safari, Edge）

## 🎮 快捷鍵操作

| 按鍵 | 功能 |
|------|------|
| `→` / `Space` | 下一頁 |
| `←` | 上一頁 |
| `Home` | 第一頁 |
| `End` | 最後一頁 |
| `F` | 全螢幕切換 |
| `ESC` | 退出全螢幕/關閉縮圖 |
| `1-9` | 直接跳轉到指定頁面 |

## 📁 專案結構

```
mopcon2025-slides/
├── index.html              # 📱 簡報播放器主頁
├── README.md               # 📖 專案說明文件
├── .gitignore             # 🚫 Git 忽略檔案
├── deploy.sh              # 🚀 自動部署腳本
├── slides/                # 📄 簡報頁面資料夾
│   ├── slide-01.html      #     封面頁
│   ├── slide-02.html      #     講者介紹
│   ├── slide-03.html      #     演講大綱
│   ├── ...                #     (第4-31頁)
│   └── slide-32.html      #     聯絡方式
└── assets/                # 🖼️  資源檔案
    └── images/            #     圖片資源
```

## 🚀 快速開始

### 方法一：直接瀏覽

1. 下載並解壓縮專案檔案
2. 用瀏覽器開啟 `index.html`
3. 享受專業的簡報播放體驗！

### 方法二：本地伺服器

```bash
# 使用 Python 內建伺服器
cd mopcon2025-slides
python -m http.server 8000

# 或使用 Node.js
npx http-server -p 8000

# 開啟瀏覽器訪問
open http://localhost:8000
```

## 🌐 部署到雲端

### 選項 A：GitHub Pages（推薦）

#### 1. 建立 GitHub Repository

```bash
# 初始化 Git
git init
git add .
git commit -m "🎤 MOPCON 2025 簡報播放器初始提交"

# 連接到 GitHub（替換成您的 repository URL）
git remote add origin https://github.com/YOUR_USERNAME/mopcon2025-slides.git
git branch -M main
git push -u origin main
```

#### 2. 啟用 GitHub Pages

1. 進入您的 GitHub Repository
2. 點擊 **Settings**
3. 在左側選單選擇 **Pages**
4. **Source** 選擇 `Deploy from a branch`
5. **Branch** 選擇 `main` 分支
6. **Folder** 選擇 `/ (root)`
7. 點擊 **Save**

#### 3. 訪問您的簡報

✅ 幾分鐘後，您的簡報將在以下網址上線：
```
https://YOUR_USERNAME.github.io/mopcon2025-slides/
```

### 選項 B：Cloudflare Pages（進階）

#### 1. 連接 GitHub Repository

1. 登入 [Cloudflare Dashboard](https://dash.cloudflare.com/)
2. 選擇 **Workers & Pages** → **Create application**
3. 選擇 **Pages** → **Connect to Git**
4. 授權 Cloudflare 存取您的 GitHub
5. 選擇 `mopcon2025-slides` repository

#### 2. 設定建置配置

```yaml
Framework preset: None
Build command: (留空)
Build output directory: (留空)
Root directory: (留空)
```

#### 3. 部署設定

- **Project name**: `mopcon2025-slides`
- **Production branch**: `main`
- **Environment variables**: (不需要)

#### 4. 自訂網域（可選）

如果您有自己的網域：
1. 在 Cloudflare Pages 設定中選擇 **Custom domains**
2. 添加您的網域（例如：`slides.yourdomain.com`）
3. 按照指示設定 DNS 記錄

✅ 完成後，您的簡報將在 `https://mopcon2025-slides.pages.dev` 上線！

### 選項 C：其他部署平台

| 平台 | 難度 | 設定時間 | 客製化程度 |
|------|------|----------|------------|
| **Netlify** | 簡單 | 5分鐘 | 高 |
| **Vercel** | 簡單 | 5分鐘 | 高 |
| **Firebase Hosting** | 中等 | 15分鐘 | 高 |
| **AWS S3 + CloudFront** | 困難 | 30分鐘 | 最高 |

## 🛠️ 自訂化設定

### 修改播放器設定

在 `index.html` 中，您可以調整以下參數：

```javascript
class SlidePlayer {
    constructor() {
        this.currentSlide = 1;
        this.totalSlides = 32;          // 修改總頁數
        this.timerWarning = 40;         // 計時器警告時間（分鐘）
        this.timerDanger = 43;          // 計時器危險時間（分鐘）
        // ...
    }
}
```

### 修改視覺樣式

在 `index.html` 的 `<style>` 區塊中調整：

```css
/* 修改主題色彩 */
:root {
    --primary-color: #2196F3;
    --secondary-color: #4CAF50;
    --background-color: #0a1929;
}

/* 調整簡報框架大小 */
.slide-frame {
    width: 1280px;
    height: 720px;
    /* 或改為其他比例，如 4:3 */
}
```

### 添加 Google Analytics

在每個簡報頁面的 `<head>` 中加入：

```html
<!-- Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=G-XXXXXXXXXX"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());
  gtag('config', 'G-XXXXXXXXXX');
</script>
```

## 📱 行動裝置優化

播放器已針對手機和平板進行優化：

- **響應式設計**：自動適應螢幕尺寸
- **觸控支援**：左右滑動切換頁面
- **縮圖面板**：全螢幕顯示（手機）
- **按鈕優化**：適合觸控操作的大小

## 🔧 故障排除

### 常見問題

**Q: 簡報無法載入？**
- 確認瀏覽器支援 JavaScript
- 檢查網路連線（需載入 Google Fonts）
- 確認檔案路徑正確

**Q: 全螢幕無法使用？**
- 確認瀏覽器支援 Fullscreen API
- 嘗試按 F11 進入瀏覽器全螢幕

**Q: 字型顯示異常？**
- 確認網路連線正常（Google Fonts）
- 清除瀏覽器快取

**Q: 如何更新簡報內容？**
- 修改 `slides/slide-XX.html` 檔案
- 保持檔案命名格式不變
- 重新推送到 Git repository

### 瀏覽器相容性

| 瀏覽器 | 版本要求 | 支援度 |
|--------|----------|--------|
| **Chrome** | 60+ | 完全支援 ✅ |
| **Firefox** | 55+ | 完全支援 ✅ |
| **Safari** | 12+ | 完全支援 ✅ |
| **Edge** | 79+ | 完全支援 ✅ |
| **IE** | 不支援 | ❌ |

## 📞 技術支援

如果您在部署過程中遇到任何問題：

1. **檢查文件**：仔細閱讀本 README 文件
2. **查看 Issues**：檢查 GitHub Issues 是否有類似問題
3. **聯絡講者**：透過 QR Code 或電子郵件聯絡

## 📄 授權資訊

- **簡報內容**：Licensed to MOPCON 2025
- **播放器代碼**：MIT License
- **字型授權**：Google Fonts (Open Source)
- **圖示授權**：Font Awesome (Free License)

---

## 🎉 感謝使用

感謝您使用 MOPCON 2025 簡報播放器！

如果這個播放器對您有幫助，歡迎：
- ⭐ 給專案一個 Star
- 🔄 分享給更多朋友
- 💬 提供回饋建議

**祝您演講順利！** 🚀

---

*最後更新：2025年11月*
