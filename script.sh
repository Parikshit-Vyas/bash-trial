#VARIABLES

var=5 (no space in bw variable_name,=,value) 
echo $var

#INPUT OUTPUT
read first
read last
echo hello $first $last


#POSITIONAL ARGUMENTS
echo Hello $1 $2   (positional arguments .. pass them as bash script.sh first_name last_name )

#PIPING / INPUT OUTPUT REDIRECTION
use > or >> symbol
echo Hello Anon > file.txt  .... (for writing to file.txt the output of echo)
echo Hello Anon2 >> file.txt   ... (for appending to file.txt)

# < or << or <<<  symbol
# wc -w < file.txt  #(passing file.txt as input to wc command to print wordcount.. if not it will show wordcount filename)
# cat << EOF 
# This is a test file
# EOF
# wc -w <<< "Hello There Wordcount"
  
#TEST OPERATORS
echo $[ hello = hello ] (exit code 0 .. no error ... also space of each element everywhere is important)
echo $?[ 1 = 0 ]   (gives an error exit code)

#IF ELSE 
if [ ${1,,} = herbert ]; then #( ${1,,} means 1st argument after bash script.sh .. parameter expansion)    
	echo "Hello BOSS"      #( indent and next line after then is important )
elif [ $ {1,,} = help ]; then 
	echo "Just use your name"
else 
	echo "Who are you ? "
fi #( closes the block of if elif else staements)

#CASE STMTS :
case ${1,,} in 
	herbert | admin)
		echo "Hello BOSS"
		;; # ( closing the case statement similar to  break stmt)
	help)
		echo "You need help  BUDDY "
		;;
	*)
		echo "Like default option"
		;;
esac    #( closing case stmts )

#LISTS / ARRAYS
list=(one two three)
echo ${list[@]} #prints all elements
echo ${list[1]} # print 0th index

#FOR LOOP
list=(one two three four)
for item in ${list[@]}; do
	echo -n $item | wc -c ;
done

#FUNCTIONS (for reusable code)
showuptime(){
	local up=$(uptime -p| cut -c4-)
	local since=$(uptime -s)
	cat << EOF
-----------
This machine has been up for ${up}
It has been running since ${since}
-----------
EOF
}
showuptime

# VARIABLES ARE GLOBAL BY DEFAULT IN BASH
# use local keyword before variable to make them local variable


showname(){
	echo hello $1
	if [ ${1,,} = herbert ]; then
		return 0
	else
		return 1
	fi
}
showname $1

if [ $? = 1 ]; then
	echo "Error 1" 
fi


#EXIT CODES
#code  0 - successful execution
#code  1 - error while executing

#AWK filter file content / filter parts of command
echo one,two,three > f.txt
awk -F, '{print $1}' f.txt
awk -F, '{print $2}' f.txt # prints second element of f.txt

#AWK DETAILED
# {print $1} prints the first column .. in f.txt
awk -F, '{print $1,$3}' f.txt # prints 1st and 3rd column 
#Chaining commands
ls -al | awk '{print $2,$3}'

echo "Hello from linux tv" | awk '{print $1,$3}'

awk '{print $NF}' f.txt # NF no of fields .. last column will be printed

awk -F':' '{print}' f.txt # here : delimiter is used .. 



#AWK by default uses space as separator
# AWK -F flag for comma delimiter


#SED change values in txt file using regex  (sed - stream editor)
echo This is a sed test txt file lesgooo > sedtest.txt
sed 's/sed/test/g' sedtest.txt

# s - string search
# word1 - we want to replace
# word2 - that will betake place
# g - globally  .. means every occurence in txxt file

#SED command returns modified text but by default doesnt overwrite original file
# to modify actual file (inplace)
sed -i 's/pineapple/feta' f.txt

#delimiter here is / .. but if we want to replace / .. change the delimiter (use case pathaddresses)

sed -i 's:pineapple/:feta' f.txt # here delimiter is : and pineapple/ is replaced by feta

# any symbol directly following s becomes delimiter

#Removing something 
sed -i 's/pineapple//' f.txt

#GREP command (searching a file .. CASE SENSITIVE BY DEFAULT)
grep Port f.txt # (Prints every line that contains Port word)

grep -v Port f.txt # (prints every line that doesnt contain Port word)

grep -n Human f.txt # (Print line no also along with the line containing human word)

grep -c Human f.txt # (No of Human words in entire file)

grep -i human f.txt #(turns off case sensitivity )

#multiple files
grep gedit *

#Recursive search in all subfolder etcs
grep -r gedit *

#COmbining flags
grep -ri Error *



