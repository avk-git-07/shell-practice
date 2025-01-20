#!/bin/bash

# SOURCE_DIR=$1
# DEST_DIR=$2
# NO_DAYS=${3:-15} # if user is not providing number of days to consider the logs, then the default days will be 15.
# TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)

# R="\e[31m" # Red
# G="\e[32m" # Green
# Y="\e[33m" # Yellow
# N="\e[0m" # Reset

# USAGE(){
#     echo -e "${R}USAGE:: sh 19-backup.sh <Source> <Destination> <no. of days(optional)> ${N}"
# }

# # now check the distination directory and source directory provided or not
# if [ $# -lt 2 ] || [ $# -gt 3 ]
# then 
#     USAGE
# fi

# if [ ! -d $SOURCE_DIR ]
# then
#     echo -e "${R}The source folder $SOURCE_DIR does not exist.. please check ${N}"
#     exit 1
# fi

# if [ ! -d $DEST_DIR ]
# then
#     echo -e "${R}The destination folder $DEST_DIR does not exist.. please check ${N}"
#     exit 1
# fi

# FILES=$(find ${SOURCE_DIR} -name "*.log" -mtime +${NO_DAYS})

# # $FILES should have the quotes, like this "$FILES"
# if [ -n "$FILES" ] # TRUE if FILES are not empty, i.e., some files are there
# then 
#     echo "Files are found"
#     echo "$FILES"
#     ZIP_FILE="$DEST_DIR/app-logs-$TIMESTAMP.zip" # in this command line it's only preparing the output file name, it is just a filename which is going to be created
#     find ${SOURCE_DIR} -name "*.log" -mtime +${NO_DAYS} | zip "$ZIP_FILE" -@ # the "-@"" flag to read the file names from standard input (supplied by find). "zip" command will compresses those files into the ZIP file specified by the "ZIP_FILE" variable.

#     # check if zip file is successfuly created or not.
#     if [ -f "ZIP_FILE" ]
#     then
#         echo "The files older than $NO_DAYS are zipped successfully"
#         # Removing/deleting the files after zipping
#         while IFS= read -r file; do
#            echo "Deleting the file $file, which is older than $NO_DAYS days ..."
#            rm -rf $file
#         done <<< "$FILES"
#     else
#         echo "zipping the files is failed..."
#     fi

# else 
#     echo "No files found older than $NO_DAYS"
# fi

###########################################################
source_dir=$1
dest_dir=$2
days=${3:-15} # default to 15 days if not provided
timestamp=$(date +%Y-%m-%d-%H-%M-%S)

R="\e[31m" # Red
G="\e[32m" # Green
Y="\e[33m" # Yellow
N="\e[0m" # Reset

# check destination directory and source directory correctly provided or not
if [ $# -lt 2 ] || [ $# -gt 3 ]
then 
    echo -e "${R}Usage:: 19-backup.sh <source> <destination> <no. of days> ${N}"
    exit 1
fi

# check whether the source directory is given correct or not
if [ -d ${source_dir} ]
then 
    echo -e "${G}Source Directory is found ${N}"
else 
    echo -e "${R}Source Directory is not found, please check... ${N} "
    exit 1
fi

# check whether the destination directory is given correct or not
if [  -d ${dest_dir} ]
then 
    echo -e "${G}Destination Directory is found ${N}"
else 
    echo -e "${R}Destination Directory is not found, please check...  ${N} "
    exit 1
fi

# collect the log files more than 15 days in this files variable
files=$(find ${source_dir} -name "*.log" -mtime ${days})

# zip the collected files in destination directory and delete the collected files from the source directory
if [ -n ${files} ]
then 
    echo -e "${G}the log files more than 15 days are found ${N}"
    echo -e "${files}"
    dest_zip_file=$(${dest_dir}/app_logs-${timestamp}.zip)
    find ${source_dir} -name "*.log" -mtime ${days} | zip ${dest_zip_file} -@
    echo -e "${G}the log files more than 15 days are zippied in the destination directory ${N}"
    
    while IFS= read -r file
    do 
        echo -e "${G}removing the older log files more than 15 days from the source directory ${N}"
        rm -rf $file
    done <<< $files
else 
    echo -e "${R}the log files more than 15 days are not found ${N}"
    exit 1
fi



##########################################################

# Corrected script with chatgpt

#!/bin/bash

# SOURCE_DIR=$1
# DEST_DIR=$2
# NO_DAYS=${3:-15} # Default to 15 days if not provided.

# # Color codes
# R="\e[31m" # Red
# G="\e[32m" # Green
# Y="\e[33m" # Yellow
# N="\e[0m"  # Reset

# # Function to display usage
# USAGE(){
#     echo -e "${R}USAGE:: sh 19-backup.sh <Source> <Destination> <no. of days(optional)>${N}"
#     exit 1
# }

# # Check the number of arguments
# if [ $# -lt 2 ] || [ $# -gt 3 ]; then
#     USAGE
# fi

# # Check if source directory exists
# if [ ! -d "$SOURCE_DIR" ]; then
#     echo -e "${R}The source folder $SOURCE_DIR does not exist.${N}"
#     exit 1
# fi

# # Check if destination directory exists
# if [ ! -d "$DEST_DIR" ]; then
#     echo -e "${R}The destination folder $DEST_DIR does not exist.${N}"
#     exit 1
# fi

# # Find log files older than specified days
# FILES=$(find "$SOURCE_DIR" -name "*.log" -mtime +"$NO_DAYS" 2>/dev/null)

# # Check if files are found
# if [ -n "$FILES" ]; then # Check if FILES is not empty
#     echo -e "${G}Files found:${N}"
#     echo "$FILES"

#     # Copy files to destination directory
#     echo -e "${Y}Copying files to $DEST_DIR...${N}"
#     while IFS= read -r file; do
#         cp "$file" "$DEST_DIR"
#     done <<< "$FILES"

#     echo -e "${G}Files have been successfully backed up to $DEST_DIR.${N}"
# else
#     echo -e "${Y}No files found older than $NO_DAYS days in $SOURCE_DIR.${N}"
# fi
