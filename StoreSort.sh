#!/bin/bash
read -p "Enter Value of a: " a
read -p "Enter Value of b: " b
read -p "Enter Value of c: " c

declare -A DictResult
sol1=$(( $a+$b*$c ))
DictResult[sol1]=$sol1
sol2=$(( $a*$b+$c ))
DictResult[sol2]=$sol2
sol3=$(( $c+$a/$b ))
DictResult[sol3]=$sol3
sol4=$(( $a%$b+$c ))
DictResult[sol4]=$sol4

count=0
for key in ${!DictResult[@]}
do
	arr[((count++))]=${DictResult[$key]}
	echo "$key : ${DictResult[$key]}"
done

echo "ARRAY VALUES : ${arr[@]}"

for((i=0; i<3; i++))
do
   for((j=$(( $i+1 )); j<4; j++))
   do
      if [ ${arr[$j]} -gt ${arr[$i]} ]
      then
         temp=${arr[$j]}
         arr[$j]=${arr[$i]}
         arr[$i]=$temp
      fi
   done
done

echo "DESCENDING ORDER IS : ${arr[@]}"

for((i=0; i<3; i++))
do
	for((j=$(( $i+1 )); j<4; j++))
	do
		if [ ${arr[$j]} -lt ${arr[$i]} ]
		then
			temp=${arr[$j]}
			arr[$j]=${arr[$i]}
			arr[$i]=$temp
		fi
	done
done

echo "ASCENDING ORDER IS : ${arr[@]}"
