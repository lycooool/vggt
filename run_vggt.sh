#!/bin/bash

# 啟用 vggt conda 環境（請確認你使用的是 conda，否則改成正確的方式）
source ~/storage/miniconda3/etc/profile.d/conda.sh
conda activate VGGT

# 資料夾路徑
BASE_DIR="/home/lyc/research/vggt/LYC_data/vggt_ba_NoFlash_Images"

# 遍歷子資料夾
for scene_dir in "$BASE_DIR"/*/; do
    echo "處理中: $scene_dir"
    python demo_colmap.py --scene_dir "$scene_dir" --use_ba
done
