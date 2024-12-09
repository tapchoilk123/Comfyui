# For build automation - Allows building from any ai-dock base image
# Use a *cuda*base* image as default because pytorch brings the libs
ARG IMAGE_BASE="ghcr.io/ai-dock/python:3.10-v2-cuda-12.1.1-base-22.04"
FROM ${IMAGE_BASE}

LABEL org.opencontainers.image.source="https://github.com/tapchoilk123/Comfyui"
LABEL org.opencontainers.image.description="ComfyUI FluxVideo backend and GUI"
LABEL maintainer="PhuongNguyen <phuonglk0975@gmail.com>"

ENV COMFYUI_VENV=$VENV_DIR/comfyui
ENV COMFYUI_VENV_PYTHON=$COMFYUI_VENV/bin/python
ENV COMFYUI_VENV_PIP=$COMFYUI_VENV/bin/pip

ENV API_VENV=$VENV_DIR/api
ENV API_VENV_PYTHON=$API_VENV/bin/python
ENV API_VENV_PIP=$API_VENV/bin/pip

ENV IMAGE_SLUG="comfyui"
ENV OPT_SYNC=ComfyUI

# Prepare environment
ARG PYTHON_VERSION="3.10"
ENV PYTHON_VERSION=${PYTHON_VERSION}
ARG PYTORCH_VERSION="2.4.0"
ENV PYTORCH_VERSION="${PYTORCH_VERSION}"
COPY --chown=0:1111 ./COPY_ROOT_0/ /

# Fix line endings and make scripts executable for layer0
RUN tr -d '\r' < /opt/ai-dock/bin/build/layer0/init.sh > /opt/ai-dock/bin/build/layer0/init.sh.tmp && \
    mv /opt/ai-dock/bin/build/layer0/init.sh.tmp /opt/ai-dock/bin/build/layer0/init.sh && \
    tr -d '\r' < /opt/ai-dock/bin/build/layer0/common.sh > /opt/ai-dock/bin/build/layer0/common.sh.tmp && \
    mv /opt/ai-dock/bin/build/layer0/common.sh.tmp /opt/ai-dock/bin/build/layer0/common.sh && \
    tr -d '\r' < /opt/ai-dock/bin/build/layer0/nvidia.sh > /opt/ai-dock/bin/build/layer0/nvidia.sh.tmp && \
    mv /opt/ai-dock/bin/build/layer0/nvidia.sh.tmp /opt/ai-dock/bin/build/layer0/nvidia.sh && \
    tr -d '\r' < /opt/ai-dock/bin/build/layer0/amd.sh > /opt/ai-dock/bin/build/layer0/amd.sh.tmp && \
    mv /opt/ai-dock/bin/build/layer0/amd.sh.tmp /opt/ai-dock/bin/build/layer0/amd.sh && \
    tr -d '\r' < /opt/ai-dock/bin/build/layer0/cpu.sh > /opt/ai-dock/bin/build/layer0/cpu.sh.tmp && \
    mv /opt/ai-dock/bin/build/layer0/cpu.sh.tmp /opt/ai-dock/bin/build/layer0/cpu.sh && \
    tr -d '\r' < /opt/ai-dock/bin/build/layer0/clean.sh > /opt/ai-dock/bin/build/layer0/clean.sh.tmp && \
    mv /opt/ai-dock/bin/build/layer0/clean.sh.tmp /opt/ai-dock/bin/build/layer0/clean.sh && \
    chmod +x /opt/ai-dock/bin/build/layer0/*.sh

ARG IMAGE_BASE
RUN set -eo pipefail && /opt/ai-dock/bin/build/layer0/init.sh | tee /var/log/build.log

RUN echo "bust cache"
# Install software
ARG COMFYUI_BUILD_REF="master"
ENV COMFYUI_BUILD_REF=${COMFYUI_BUILD_REF}
COPY --chown=0:1111 ./COPY_ROOT_1/ /

# Fix line endings and make scripts executable for layer1
RUN tr -d '\r' < /opt/ai-dock/bin/build/layer1/init.sh > /opt/ai-dock/bin/build/layer1/init.sh.tmp && \
    mv /opt/ai-dock/bin/build/layer1/init.sh.tmp /opt/ai-dock/bin/build/layer1/init.sh && \
    tr -d '\r' < /opt/ai-dock/bin/build/layer1/common.sh > /opt/ai-dock/bin/build/layer1/common.sh.tmp && \
    mv /opt/ai-dock/bin/build/layer1/common.sh.tmp /opt/ai-dock/bin/build/layer1/common.sh && \
    tr -d '\r' < /opt/ai-dock/bin/build/layer1/nvidia.sh > /opt/ai-dock/bin/build/layer1/nvidia.sh.tmp && \
    mv /opt/ai-dock/bin/build/layer1/nvidia.sh.tmp /opt/ai-dock/bin/build/layer1/nvidia.sh && \
    tr -d '\r' < /opt/ai-dock/bin/build/layer1/amd.sh > /opt/ai-dock/bin/build/layer1/amd.sh.tmp && \
    mv /opt/ai-dock/bin/build/layer1/amd.sh.tmp /opt/ai-dock/bin/build/layer1/amd.sh && \
    tr -d '\r' < /opt/ai-dock/bin/build/layer1/cpu.sh > /opt/ai-dock/bin/build/layer1/cpu.sh.tmp && \
    mv /opt/ai-dock/bin/build/layer1/cpu.sh.tmp /opt/ai-dock/bin/build/layer1/cpu.sh && \
    tr -d '\r' < /opt/ai-dock/bin/build/layer1/clean.sh > /opt/ai-dock/bin/build/layer1/clean.sh.tmp && \
    mv /opt/ai-dock/bin/build/layer1/clean.sh.tmp /opt/ai-dock/bin/build/layer1/clean.sh && \
    chmod +x /opt/ai-dock/bin/build/layer1/*.sh

RUN set -eo pipefail && /opt/ai-dock/bin/build/layer1/init.sh | tee -a /var/log/build.log

# Copy overrides and models into later layers for fast rebuilds
COPY --chown=0:1111 ./COPY_ROOT_99/ /

# Fix line endings and make scripts executable for layer99
RUN tr -d '\r' < /opt/ai-dock/bin/build/layer99/init.sh > /opt/ai-dock/bin/build/layer99/init.sh.tmp && \
    mv /opt/ai-dock/bin/build/layer99/init.sh.tmp /opt/ai-dock/bin/build/layer99/init.sh && \
    chmod +x /opt/ai-dock/bin/build/layer99/init.sh

RUN set -eo pipefail && /opt/ai-dock/bin/build/layer99/init.sh | tee -a /var/log/build.log

# Copy Google Drive script but don't execute it
COPY --chown=0:1111 ./COPY_ROOT_1/google-drive.sh /opt/ai-dock/bin/
RUN chmod +x /opt/ai-dock/bin/google-drive.sh

ENV PYTHON_DEFAULT_VENV=comfyui

# Keep init.sh as-is and place additional logic in /opt/ai-dock/bin/preflight.d
CMD ["init.sh"]
