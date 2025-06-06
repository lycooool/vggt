#!/bin/bash

# Activate conda environment
source ~/storage/miniconda3/etc/profile.d/conda.sh
conda activate FSGS

# Define paths
DATASET_ROOT="/home/lyc/research/vggt/LYC_data/vggt_NoFlash_Images"
SCRIPT_PATH="/home/lyc/research/FSGS/train.py"

# Auto-generate MODEL_ROOT by prefixing "FSGS_"
DATASET_BASENAME=$(basename "$DATASET_ROOT")
MODEL_BASENAME="FSGS_${DATASET_BASENAME}"
MODEL_ROOT=$(dirname "$DATASET_ROOT")/"$MODEL_BASENAME"

# Make sure model root exists
mkdir -p "$MODEL_ROOT"

# Iterate over each subfolder (scene)
for scene_dir in "$DATASET_ROOT"/*/; do
    scene_name=$(basename "$scene_dir")

    source_path="$DATASET_ROOT/$scene_name"
    model_path="$MODEL_ROOT/${scene_name}_out"

    echo "Training scene: $scene_name"
    python "$SCRIPT_PATH" --source_path "$source_path" --model_path "$model_path" --eval 
done
