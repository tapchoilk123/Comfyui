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
# Folder ID chứa custom nodes
GOOGLE_DRIVE_FOLDER_ID_CUSTOM_NODES="1jNtiaRBm9pqk2BdD1pRqagQxio88p3pv"

# Base directory cho models
BASE_DIR="./models"
# Base directory cho custom nodes
CUSTOM_NODES_DIR="./custom_nodes"

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

function download_custom_nodes() {
    local folder_id="$GOOGLE_DRIVE_FOLDER_ID_CUSTOM_NODES"
    local base_dir="$CUSTOM_NODES_DIR"
    
    echo "Downloading custom nodes from Google Drive folder..."
    
    # Tạo script Python tạm thời để download folder
    cat > download_custom_nodes.py << EOL
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
    python3 download_custom_nodes.py
    
    # Xóa script tạm
    rm download_custom_nodes.py
    
    if [ $? -eq 0 ]; then
        echo "Successfully downloaded custom nodes to $base_dir"
    else
        echo "Failed to download custom nodes from folder"
    fi
}

function main() {
    # Tạo thư mục models và custom_nodes nếu chưa tồn tại
    mkdir -p "$BASE_DIR"
    mkdir -p "$CUSTOM_NODES_DIR"
    
    # Cài đặt dependencies
    install_dependencies
    
    # Download folder models
    download_folder
    
    # Download folder custom nodes
    download_custom_nodes
}

# Chạy script
main
