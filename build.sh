#!/usr/bin/env bash
# Build and push the multi-arch "Music Assistant (YouTube Music Family)" image
# to GHCR. Run from the ma_provider/ directory (or pass the repo root as $1).
#
# Prereqs:
#   - docker (with buildx) and `docker login ghcr.io`
#   - GITHUB_TOKEN in the environment (for CI) or an interactive login
#
# Usage:
#   ./build.sh [IMAGE_TAG]
#   IMAGE_TAG defaults to the MA version (2.11.0b3)

set -euo pipefail

MA_VERSION="${MA_VERSION:-2.11.0b3}"
IMAGE_TAG="${1:-${MA_VERSION}}"
IMAGE="ghcr.io/${GITHUB_REPOSITORY_OWNER:-peraltagroup}/ma-ytmusic-family:${IMAGE_TAG}"

cd "$(dirname "$0")/.."   # ma_provider/

echo "==> Building ${IMAGE} (amd64 + aarch64)"
docker buildx build \
  --platform linux/amd64,linux/aarch64 \
  --build-arg "MA_VERSION=${MA_VERSION}" \
  -f docker/Dockerfile \
  -t "${IMAGE}" \
  --push \
  .

echo "==> Done: ${IMAGE}"
echo "==> Add-on repo: push this repo (addon/) as the HA add-on store."
