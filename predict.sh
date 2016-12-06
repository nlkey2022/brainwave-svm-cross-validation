#!/bin/bash
for i in {1..9}
do
	for j in {1..9}
	do
		echo $1$j' test / '$2$i' model'
		filename=$1'_test.'$2'_model'
		show=$j' test / '$i' model'
		./svm-predict $1/$1$j.single.test.clean.libsvm.scale $2/$2$i.except/$2$i.single.train.clean.libsvm.scale.model $2/$2$i.except/$2$i.predict.out
		awk '{sum+=$1} END { print "",sum/NR}' $2/$2$i.except/$2$i.predict.out >> $filename
	done
done
