file_list="avg.sh odd* T* es*"
# List of files as argument(s) to a command.

# Add two files to the list, and list all.
ls -l quo* tri* $file_list

echo "-------------------------------------------------------------------------"

# What happens if we escape a couple of spaces?
ls -l quotes.sh\ /trial.sh\ $file_list
# Error: the first three files concatenated into a single argument to 'ls -l'
#        because the two escaped spaces prevent argument (word) splitting.

exit 113
