#!/bin/bash

# Activate conda environment
source ~/miniconda3/etc/profile.d/conda.sh
conda activate LLFF

# Define paths
DATA_ROOT="/home/lyc/research/vggt/LYC_data/vggt_NoFlash_Images"
SCRIPT_PATH="/home/lyc/research/LLFF/imgs2poses.py"

# Process each scene
for scene_dir in "$DATA_ROOT"/*/; do
    echo "Processing scene: $scene_dir"
    python "$SCRIPT_PATH" "$scene_dir"
done
