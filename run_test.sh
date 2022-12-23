#!/bin/bash
for filename in test/*_test.rb; do
  ruby $filename
done

clear_test(){
if [ $1 = 'clear' ]
then
  bash clean_test.sh
fi
}

clear_test $1 2>/dev/null
