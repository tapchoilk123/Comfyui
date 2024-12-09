[![Docker Build](https://github.com/ai-dock/comfyui/actions/workflows/docker-build.yml/badge.svg)](https://github.com/ai-dock/comfyui/actions/workflows/docker-build.yml)

# AI-Dock + ComfyUI Docker Image

Run [ComfyUI](https://github.com/comfyanonymous/ComfyUI) in a highly-configurable, cloud-first AI-Dock container.

>[!NOTE]
>These images do not bundle models or third-party configurations. You should use a [provisioning script](https://github.com/ai-dock/base-image/wiki/4.0-Running-the-Image#provisioning-script) to automatically configure your container. You can find examples, including `SD3` & `FLUX.1` setup, in `config/provisioning`.

## Supported Custom Nodes

This image includes support for the following custom nodes:

1. [ComfyUI-Manager](https://github.com/ltdrdata/ComfyUI-Manager) - Node management and installation
2. [ComfyUI Essentials](https://github.com/cubiq/ComfyUI_essentials) - Essential utility nodes
3. [ComfyUI Impact Pack](https://github.com/ltdrdata/ComfyUI-Impact-Pack) - Advanced image processing nodes
4. [ComfyUI ControlNet Aux](https://github.com/Fannovel16/comfyui_controlnet_aux) - Additional ControlNet preprocessors
5. [Derfuu ComfyUI ModdedNodes](https://github.com/Derfuu/Derfuu_ComfyUI_ModdedNodes) - Various utility nodes
6. [ComfyUI-GGUF](https://github.com/city96/ComfyUI-GGUF) - GGUF model support
7. [ComfyUI Custom Scripts](https://github.com/pythongosssss/ComfyUI-Custom-Scripts) - Additional workflow scripts
8. [ComfyUI Ultimate SD Upscale](https://github.com/ssitu/ComfyUI_UltimateSDUpscale) - Advanced upscaling nodes
9. [ComfyUI MTB](https://github.com/melMass/comfy_mtb) - Multi-tool bundle
10. [Comfyroll Custom Nodes](https://github.com/Suzie1/ComfyUI_Comfyroll_CustomNodes) - Various workflow nodes
11. [ComfyUI Simple Math](https://github.com/cubiq/ComfyUI_SimpleMath) - Mathematical operation nodes
12. [ComfyUI IP-Adapter Plus](https://github.com/cubiq/ComfyUI_IPAdapter_plus) - Enhanced IP-Adapter implementation
13. [PuLID ComfyUI](https://github.com/cubiq/PuLID_ComfyUI) - PuLID integration
14. [DZ Face Detailer](https://github.com/nicofdga/DZ-FaceDetailer) - Face enhancement nodes
15. [ComfyUI Advanced ControlNet](https://github.com/Kosinkadink/ComfyUI-Advanced-ControlNet) - Extended ControlNet features
16. [ComfyUI Video Helper Suite](https://github.com/Kosinkadink/ComfyUI-VideoHelperSuite) - Video processing tools
17. [JPS Nodes](https://github.com/JPS-GER/ComfyUI_JPS-Nodes) - Additional utility nodes
18. [RGThree Comfy](https://github.com/rgthree/rgthree-comfy) - Various workflow nodes
19. [Comfy Image Saver](https://github.com/giriss/comfy-image-saver) - Enhanced image saving
20. [CG Use Everywhere](https://github.com/chrisgoringe/cg-use-everywhere) - Utility nodes
21. [ComfyUI Florence2](https://github.com/kijai/ComfyUI-Florence2) - Florence2 model integration
22. [ComfyUI Photoshop](https://github.com/NimaNzrii/comfyui-photoshop) - Photoshop integration
23. [IF AI Tools](https://github.com/if-ai/ComfyUI-IF_AI_tools) - Additional AI tools
24. [SD PPP](https://github.com/zombieyang/sd-ppp) - Post-processing pipeline
25. [ComfyUI Long CLIP](https://github.com/SeaArtLab/ComfyUI-Long-CLIP) - Extended CLIP support
26. [Advanced Live Portrait](https://github.com/PowerHouseMan/ComfyUI-AdvancedLivePortrait) - Portrait enhancement
27. [LLM Party](https://github.com/heshengtao/comfyui_LLM_party) - Language model integration
28. [X-Flux ComfyUI](https://github.com/XLabs-AI/x-flux-comfyui) - Flux model integration
29. [RvTools](https://github.com/Rvage0815/ComfyUI-RvTools) - Additional utility tools
30. [BNB NF4 FP4 Loaders](https://github.com/silveroxides/ComfyUI_bnb_nf4_fp4_Loaders) - Optimized model loaders
31. [PuLID Flux Enhanced](https://github.com/sipie800/ComfyUI-PuLID-Flux-Enhanced) - Enhanced PuLID for Flux
32. [Hunyuan Video Wrapper](https://github.com/kijai/ComfyUI-HunyuanVideoWrapper) - Hunyuan video integration

## Documentation

All AI-Dock containers share a common base which is designed to make running on cloud services such as [vast.ai](https://link.ai-dock.org/vast.ai) as straightforward and user friendly as possible.

Common features and options are documented in the [base wiki](https://github.com/ai-dock/base-image/wiki) but any additional features unique to this image will be detailed below.

#### Version Tags

The `:latest` tag points to `:latest-cuda` and will relate to a stable and tested version.  There may be more recent builds

Tags follow these patterns:

##### _CUDA_
- `:cuda-[x.x.x-base|runtime]-[ubuntu-version]`

##### _ROCm_
- `:rocm-[x.x.x-runtime]-[ubuntu-version]`

##### _CPU_
- `:cpu-[ubuntu-version]`


Browse [ghcr.io](https://github.com/ai-dock/comfyui/pkgs/container/comfyui) for an image suitable for your target environment. Alternatively, view a select range of [CUDA](https://hub.docker.com/r/aidockorg/comfyui-cuda) and [ROCm](https://hub.docker.com/r/aidockorg/comfyui-rocm) builds at DockerHub.

Supported Platforms: `NVIDIA CUDA`, `AMD ROCm`, `CPU`

## Additional Environment Variables

| Variable                 | Description |
| ------------------------ | ----------- |
| `AUTO_UPDATE`            | Update ComfyUI on startup (default `false`) |
| `CIVITAI_TOKEN`          | Authenticate download requests from Civitai - Required for gated models |
| `COMFYUI_ARGS`           | Startup arguments. eg. `--gpu-only --highvram` |
| `COMFYUI_PORT_HOST`      | ComfyUI interface port (default `8188`) |
| `COMFYUI_REF`            | Git reference for auto update. Accepts branch, tag or commit hash. Default: latest release |
| `COMFYUI_URL`            | Override `$DIRECT_ADDRESS:port` with URL for ComfyUI |
| `HF_TOKEN`               | Authenticate download requests from HuggingFace - Required for gated models (SD3, FLUX, etc.) |

See the base environment variables [here](https://github.com/ai-dock/base-image/wiki/2.0-Environment-Variables) for more configuration options.

### Additional Python Environments

| Environment    | Packages |
| -------------- | ----------------------------------------- |
| `comfyui`      | ComfyUI and dependencies |
| `api`          | ComfyUI API wrapper and dependencies |


The `comfyui` environment will be activated on shell login.

~~See the base micromamba environments [here](https://github.com/ai-dock/base-image/wiki/1.0-Included-Software#installed-micromamba-environments).~~

## Additional Services

The following services will be launched alongside the [default services](https://github.com/ai-dock/base-image/wiki/1.0-Included-Software) provided by the base image.

### ComfyUI

The service will launch on port `8188` unless you have specified an override with `COMFYUI_PORT_HOST`.

You can set startup flags by using variable `COMFYUI_ARGS`.

To manage this service you can use `supervisorctl [start|stop|restart] comfyui`.


### ComfyUI API Wrapper

This service is available on port `8188` and is a work-in-progress to replace previous serverless handlers which have been depreciated; Old Docker images and sources remain available should you need them.

You can access the api directly at `/ai-dock/api/` or you can use the Swager/openAPI playground at `/ai-dock/api/docs`.

>[!NOTE]
>All services are password protected by default. See the [security](https://github.com/ai-dock/base-image/wiki#security) and [environment variables](https://github.com/ai-dock/base-image/wiki/2.0-Environment-Variables) documentation for more information.

## Pre-Configured Templates

**Vast.​ai**

- [comfyui:latest-cuda](https://link.ai-dock.org/template-vast-comfyui)

- [comfyui:latest-cuda + FLUX.1](https://link.ai-dock.org/template-vast-comfyui-flux)

- [comfyui:latest-rocm](https://link.ai-dock.org/template-vast-comfyui-rocm)

---

_The author ([@robballantyne](https://github.com/robballantyne)) may be compensated if you sign up to services linked in this document. Testing multiple variants of GPU images in many different environments is both costly and time-consuming; This helps to offset costs_
