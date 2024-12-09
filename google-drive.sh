#!/bin/bash

# Script để download models từ Google Drive
# Sử dụng gdown để download

APT_PACKAGES=(
    "wget"
    "curl"
    "python3-pip"
)

PIP_PACKAGES=(
    "gdown"
    "googledrivedownloader"
    "torch"
    "torchvision"
    "torchaudio"
    "opencv-python"
    "pillow"
    "numpy"
    "transformers"
    "safetensors"
    "aiohttp"
    "accelerate"
    "pytorch-lightning"
    "tensorflow"
    "scikit-image"
    "scipy"
    "requests"
)

# Folder ID chứa models
GOOGLE_DRIVE_FOLDER_ID="1LhOUBP9pTouk-SiIk0t5A6Je9B8O0ckR"

# Base directory cho models
BASE_DIR="./models"

function install_dependencies() {
    # Kiểm tra OS
    if [[ "$OSTYPE" == "linux-gnu"* ]]; then
        # Cài đặt các package cần thiết trên Linux
        sudo apt-get update
        for package in "${APT_PACKAGES[@]}"; do
            sudo apt-get install -y "$package"
        done
    elif [[ "$OSTYPE" == "darwin"* ]]; then
        # macOS - sử dụng brew
        for package in "${APT_PACKAGES[@]}"; do
            brew install "$package"
        done
    elif [[ "$OSTYPE" == "msys" || "$OSTYPE" == "win32" ]]; then
        # Windows - giả định Python và pip đã được cài đặt
        echo "Windows detected - skipping system package installation"
    fi

    # Cài đặt Python packages
    for package in "${PIP_PACKAGES[@]}"; do
        pip install "$package"
    done
}

function download_folder() {
    local folder_id="$GOOGLE_DRIVE_FOLDER_ID"
    local base_dir="$BASE_DIR"
    
    echo "Downloading models from Google Drive folder..."
    
    # Tạo script Python tạm thời để download folder
    cat > download_folder.py << EOL
import gdown
import os

folder_id = "$folder_id"
output_dir = "$base_dir"

# Đảm bảo thư mục đích tồn tại
os.makedirs(output_dir, exist_ok=True)

# Download toàn bộ folder
url = f"https://drive.google.com/drive/folders/{folder_id}"
gdown.download_folder(url=url, output=output_dir, quiet=False)
EOL

    # Chạy script Python
    python3 download_folder.py
    
    # Xóa script tạm
    rm download_folder.py
    
    if [ $? -eq 0 ]; then
        echo "Successfully downloaded models to $base_dir"
    else
        echo "Failed to download models from folder"
    fi
}

function main() {
    # Tạo thư mục models nếu chưa tồn tại
    mkdir -p "$BASE_DIR"
    
    # Cài đặt dependencies
    install_dependencies
    
    # Download folder
    download_folder
}

# Chạy script
main
