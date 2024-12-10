#!/bin/bash

# Script để tự động clone các custom nodes từ GitHub
CUSTOM_NODES=(
    "https://github.com/ltdrdata/ComfyUI-Manager"
    "https://github.com/cubiq/ComfyUI_essentials"
    "https://github.com/ltdrdata/ComfyUI-Impact-Pack.git"
    "https://github.com/Fannovel16/comfyui_controlnet_aux.git"
    "https://github.com/Derfuu/Derfuu_ComfyUI_ModdedNodes.git"
    "https://github.com/city96/ComfyUI-GGUF.git"
    "https://github.com/pythongosssss/ComfyUI-Custom-Scripts.git"
    "https://github.com/ssitu/ComfyUI_UltimateSDUpscale.git"
    "https://github.com/melMass/comfy_mtb.git"
    "https://github.com/Suzie1/ComfyUI_Comfyroll_CustomNodes.git"
    "https://github.com/cubiq/ComfyUI_SimpleMath.git"
    "https://github.com/cubiq/ComfyUI_IPAdapter_plus.git"
    "https://github.com/cubiq/PuLID_ComfyUI.git"
    "https://github.com/nicofdga/DZ-FaceDetailer.git"
    "https://github.com/Kosinkadink/ComfyUI-Advanced-ControlNet.git"
    "https://github.com/Kosinkadink/ComfyUI-VideoHelperSuite.git"
    "https://github.com/JPS-GER/ComfyUI_JPS-Nodes.git"
    "https://github.com/rgthree/rgthree-comfy.git"
    "https://github.com/giriss/comfy-image-saver.git"
    "https://github.com/chrisgoringe/cg-use-everywhere.git"
    "https://github.com/kijai/ComfyUI-Florence2.git"
    "https://github.com/NimaNzrii/comfyui-photoshop.git"
    "https://github.com/if-ai/ComfyUI-IF_AI_tools.git"
    "https://github.com/zombieyang/sd-ppp.git"
    "https://github.com/SeaArtLab/ComfyUI-Long-CLIP.git"
    "https://github.com/PowerHouseMan/ComfyUI-AdvancedLivePortrait.git"
    "https://github.com/heshengtao/comfyui_LLM_party.git"
    "https://github.com/XLabs-AI/x-flux-comfyui.git"
    "https://github.com/Rvage0815/ComfyUI-RvTools.git"
    "https://github.com/silveroxides/ComfyUI_bnb_nf4_fp4_Loaders.git"
    "https://github.com/sipie800/ComfyUI-PuLID-Flux-Enhanced.git"
    "https://github.com/kijai/ComfyUI-HunyuanVideoWrapper.git"
)

# Tạo thư mục custom_nodes nếu chưa tồn tại
mkdir -p workspace/ComfyUI/custom_nodes
cd workspace/ComfyUI/custom_nodes

echo "Bắt đầu clone các custom nodes..."

# Clone từng repository
for repo in "${CUSTOM_NODES[@]}"; do
    echo "Đang clone $repo..."
    git clone "$repo"
    if [ $? -eq 0 ]; then
        echo "✅ Đã clone thành công: $repo"
    else
        echo "❌ Lỗi khi clone: $repo"
    fi
done

echo "Hoàn thành việc clone các custom nodes!"
