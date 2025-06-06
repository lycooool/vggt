#!/bin/bash
# 啟用 gaussian_splattting conda 環境（請確認你使用的是 conda，否則改成正確的方式）
source ~/storage/miniconda3/etc/profile.d/conda.sh
conda activate gaussian_splatting

BASE_DIR="LYC_data/NoFlash_Images"

# 遍歷每個子資料夾並呼叫 convert.py
for dir in "$BASE_DIR"/*/; do
    scene_dir=$(realpath "$dir")
    echo "執行: python convert.py -s \"$scene_dir\""
    python /home/lyc/research/gaussian-splatting/convert.py -s "$scene_dir"
done