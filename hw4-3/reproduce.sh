part1=`dirname "$1"`
part2=`basename "$1"`
python3  ./examples/run_squad.py \
	--model_type bert \
	--do_eval \
	--model_name_or_path $1 \
	--tokenizer_name ./ \
	--config_name ./config.json \
	--train_file $2 \
	--predict_file $2 \
	--max_seq_length 400 \
	--per_gpu_eval_batch_size 64 \
	--output_dir $part1 

python3 process_ans.py $part1/predictions_.json $3