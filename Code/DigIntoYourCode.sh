> out.c
read -p 'Enter the desired file name: ' file
gnome-terminal -- nano -l $file
count=1
while [ $count -eq 1 ]; do
	read -p 'Enter the first line number of the desired section: ' first
	read -p 'Enter the last line number of the desired section: ' last
	max=$last
	min=$(($last-$first+1))
	cat $file | head -$max | tail -$min >out.c
	gcc -S -O3 -fno-asynchronous-unwind-tables out.c
	echo "Assembly interpretation of section $first-$last from $file"
	cat out.s
done
