# Given a number, determine wether or not it is vallid per luhn formula
number="4539 3195 8343 6467"

# trim/remove spaces in the string
number="${number// }"
length=$(echo -n $number | wc -c) # -n removes the trailing newline character
echo $number
echo $length

for (( i=0; i<=length; 2i++ )); do
        echo ${number:i:i}
done

