wget -O ./End-to-end-ASR-Pytorch/ckpt/asr_dlhlp_jointly_sd0/best_att.pth https://www.dropbox.com/s/gb91on51ifxpvkp/best_att.pth?dl=0
wget -O ./End-to-end-ASR-Pytorch/ckpt/lm_dlhlp_sd0/best_ppx.pth https://www.dropbox.com/s/rk5jwj266cdxvzh/best_ppx.pth?dl=0


part1=`dirname "$1"`
part2=`basename "$1"`

sed -i "s/'test'/'$part2'/g" ./End-to-end-ASR-Pytorch/config/dlhlp/decode_jointly.yaml
sed -i 's|'data_path'|'$part1'|g' ./End-to-end-ASR-Pytorch/config/dlhlp/asr_dlhlp_jointly.yaml
python3 ./End-to-end-ASR-Pytorch/main.py --config ./End-to-end-ASR-Pytorch/config/dlhlp/decode_jointly.yaml --test --njobs $NJOBS
python3 ./hw1-speech-recognition-sample/format.py ./result/decode_jointly_test_output.csv $2