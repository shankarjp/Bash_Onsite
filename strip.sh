#! /bin/bash

echo -n "File Name : "
read filename
echo -n "Enter Column Name : "
read column
echo -n "Entry to be replaced : "
read entry
echo -n "Parameter to be inserted : "
read param

>temp.txt
>temp2.txt
>temp3.txt
head -1 $filename | tr "," "\n" | sed 's/^ *//g' > temp.txt
declare -i i=1
while read col;
do
    if [ $column == $col ]
    then
        awk -v n="$i" -F, '{print $n}' $filename | sed "s/$entry/$param/g" >> temp2.txt
        awk -v n="$i" -F, 'BEGIN{OFS=","};FNR==NR{array[NR]=$1;next}{$n=array[FNR]}{print $0}' temp2.txt $filename >> temp3.txt
        cat temp3.txt > $filename
    fi
    i=$((i+1))
done < temp.txt
rm temp.txt
rm temp2.txt
rm temp3.txt
