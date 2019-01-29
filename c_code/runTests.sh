#!/bin/bash

names='test1 test2 test3 test4 test5 test6 test7 test8 test9 test10'
seeds=(347834 87179 70162 14070 78361 16196 54320 53808 07511 08652)
i=0
for name in $names
do
	echo
	echo $name 50 ${seeds[$i]}
	./ts_ga 50 $name ${seeds[$i]}

	echo
	echo $name 500 ${seeds[$i]}
	./ts_ga 500 $name ${seeds[$i]}

	echo
	echo $name 5000 ${seeds[$i]}
	./ts_ga 5000 $name ${seeds[$i]}

	echo
	echo $name 50000 ${seeds[$i]}
	./ts_ga 50000 $name ${seeds[$i]}

	echo
	echo $name FINISHED
	echo
	i=$((i+1))

done

echo ALL done
