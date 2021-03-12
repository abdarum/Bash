#!/bin/bash
# for f in 2021_03_12T17_43_44Z.log 2021_03_12T17_42_14Z.log 2021_03_12T17_45_54Z.log
read -r pass_var
for f in *
do
if ! diff -q "base.log" $f &>/dev/null; then
	# >&2 echo "different"
	# echo "diff Processing $f"
	if cat $f | grep "Motion: True" &>/dev/null; then
		# echo "diff and True: $f"
		if ! ls ../differentt_config/${f/.log/.jpg} &>/dev/null; then
			echo "diff and True: $f"
			cp $f ../differentt_config
			sshpass -p "$pass_var" rsync -av -e "ssh" kornel@192.168.0.90:/home/kornel/webcam/motion/True/${f/.log/.jpg} ../differentt_config/${f/.log/.jpg}
		fi
		# echo "cp ../webcam/motion/True/${f/.log/.jpg} ../differentt_config &>/dev/null"
		# cp ../webcam/motion/True/${f/.log/.jpg} ../differentt_config &>/dev/null
		
		# check if second file exist
		# if ls ../webcam/motion/True/${f/.log/.jpg} &>/dev/null; then
		#	echo "diff and True: $f"
		# fi
	fi
fi
 # do something on $f
done