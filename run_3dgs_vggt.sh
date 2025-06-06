#!/bin/bash
# 啟用 gaussian_splattting conda 環境（請確認你使用的是 conda，否則改成正確的方式）
source ~/storage/miniconda3/etc/profile.d/conda.sh
conda activate gaussian_splatting
# 設定資料夾路徑
BASE_DIR="/home/lyc/research/vggt/LYC_data/vggt_ba_NoFlash_Images"

# 遍歷每個子資料夾
for dir in "$BASE_DIR"/*/; do
    scene_dir=$(realpath "$dir")
    out_dir="${scene_dir}_out"
    echo "執行: python train.py -s \"$scene_dir\" -m \"$out_dir\" --eval"
    python /home/lyc/research/gaussian-splatting/train.py -s "$scene_dir" -m "$out_dir" --eval
done
