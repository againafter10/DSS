#create a word list from a given file
cat words.txt | tr -s ' ' '\n'|tr -s '.' '\n'
