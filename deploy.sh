#!/bin/bash

# MOPCON 2025 簡報播放器 - 自動部署腳本
# 用途：自動化部署到 GitHub Pages 和 Cloudflare Pages

set -e  # 遇到錯誤立即停止

# 顏色定義
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# 印出彩色訊息
print_status() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# 檢查必要條件
check_requirements() {
    print_status "檢查部署環境..."

    # 檢查 Git
    if ! command -v git &> /dev/null; then
        print_error "Git 未安裝，請先安裝 Git"
        exit 1
    fi

    # 檢查是否在 Git repository 中
    if ! git rev-parse --git-dir > /dev/null 2>&1; then
        print_warning "目前不在 Git repository 中，將初始化新的 repository"
        git init
    fi

    # 檢查是否有遠端 repository
    if ! git remote get-url origin > /dev/null 2>&1; then
        print_error "未設定 Git 遠端 repository"
        print_status "請先設定遠端 repository："
        echo "  git remote add origin https://github.com/YOUR_USERNAME/mopcon2025-slides.git"
        exit 1
    fi

    print_success "環境檢查完成"
}

# 部署到 GitHub
deploy_to_github() {
    print_status "準備部署到 GitHub Pages..."

    # 檢查檔案
    if [ ! -f "index.html" ]; then
        print_error "找不到 index.html 檔案"
        exit 1
    fi

    if [ ! -d "slides" ]; then
        print_error "找不到 slides 資料夾"
        exit 1
    fi

    # 計算簡報頁面數量
    slide_count=$(ls slides/slide-*.html 2>/dev/null | wc -l)
    if [ "$slide_count" -ne 32 ]; then
        print_warning "預期32頁簡報，實際發現 $slide_count 頁"
    fi

    print_status "新增所有檔案到 Git..."
    git add .

    # 檢查是否有變更
    if git diff --cached --quiet; then
        print_warning "沒有檔案變更，跳過提交"
        return
    fi

    # 提交變更
    current_time=$(date "+%Y-%m-%d %H:%M:%S")
    git commit -m "🚀 自動部署 MOPCON 2025 簡報 - $current_time"

    print_status "推送到 GitHub..."
    git push origin main

    print_success "成功部署到 GitHub"
    print_status "您的簡報將在幾分鐘後在以下網址上線："

    # 取得 repository 資訊
    origin_url=$(git remote get-url origin)
    if [[ $origin_url == *"github.com"* ]]; then
        repo_name=$(basename "$origin_url" .git)
        username=$(basename "$(dirname "$origin_url")" | sed 's/.*://')
        echo "  https://$username.github.io/$repo_name/"
    fi
}

# 檢查 GitHub Pages 狀態
check_github_pages() {
    print_status "檢查 GitHub Pages 設定..."
    print_status "請確認已在 GitHub Repository 設定中啟用 Pages："
    echo "  1. 進入 Repository → Settings → Pages"
    echo "  2. Source 選擇 'Deploy from a branch'"
    echo "  3. Branch 選擇 'main'"
    echo "  4. Folder 選擇 '/ (root)'"
}

# 生成部署報告
generate_report() {
    print_status "生成部署報告..."

    report_file="deployment-report.md"
    cat > "$report_file" << EOF
# MOPCON 2025 簡報部署報告

**部署時間**: $(date "+%Y年%m月%d日 %H:%M:%S")
**Git Commit**: $(git rev-parse --short HEAD)

## 檔案清單

### 核心檔案
- [x] index.html (簡報播放器)
- [x] README.md (部署說明)
- [x] .gitignore (Git 忽略檔案)
- [x] deploy.sh (部署腳本)

### 簡報檔案
$(find slides -name "slide-*.html" | sort | sed 's/^/- [x] /')

## 部署連結

- **GitHub Repository**: $(git remote get-url origin)
- **GitHub Pages**: (等待啟用)
- **Cloudflare Pages**: (需手動設定)

## 下一步

1. 確認 GitHub Pages 已啟用
2. 等待 3-5 分鐘讓網站上線
3. 測試簡報播放器功能
4. (可選) 設定 Cloudflare Pages

EOF

    print_success "部署報告已保存至 $report_file"
}

# 主要執行流程
main() {
    echo "🎤 MOPCON 2025 簡報播放器 - 自動部署工具"
    echo "============================================"

    check_requirements
    deploy_to_github
    check_github_pages
    generate_report

    echo "============================================"
    print_success "🎉 部署完成！"
    echo ""
    print_status "接下來請："
    echo "  1. 檢查 GitHub Pages 設定"
    echo "  2. 等待網站上線（約3-5分鐘）"
    echo "  3. 測試簡報播放器功能"
    echo ""
    print_status "如有問題，請參考 README.md 故障排除章節"
}

# 執行主程式
main "$@"
