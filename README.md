# Bash_script
collage project
bash script include 3 task 
read the discription for better understanding

Assignment : Bash scripting

Task 1
Write a bash script that searches for patterns in files located in a folder. The script should be 
called with two input parameter arguments. Ensure that arguments are provided. The first 
parameter should be a path of a folder and the second parameter should be a string pattern. 
The script should search the provided folder and print out the following details for only files 
identified (that is no sub-folder should be considered):
• Name of the file. 
• Size of the file in bytes. 
• How many times the input string pattern (second parameter) appeared in the file (case 
insensitive). 
Use an array structure to store the file names for those that contain the input string pattern
(second parameter) at least twice.
An until loop should be used to iterate through the above array and print out to the terminal all 
the file names as well as write them into a file named report.txt. Use comments to properly 
document your script.
 
 **********************************************************************************************************************************************************
Task 2
Write an interactive bash script that implements a set of menus for writing to a file, printing 
out a file content, renaming a file and exiting the script. The write, print and rename operations 
should be implemented using functions. 
When the user selects the write option, the script should demand for the name of the file to 
write into, and continuously demand for inputs and write them to the file until the user enters 
the word “end” then the script should finish writing and return back to the menu options. 
When the print option is selected, the script should demand for the name of the file to be printed
and output its content. Then return back to the menu options. Ensure that file exist before
outputting all of its content to the screen.
When the rename option is selected, the script should demand for the name of the file to be 
renamed and the new target name. Ensure that the file exist before renaming. The exit option 
should terminate the script with goodbye message. Properly comment your code.
****************************************************************************************************************************************************************

Task 3
Write a bash script that automates the creation and deletion of user accounts. The script should 
accept as input argument, a file containing a list of user names to be created on the system. 
Enforce that the user provides this input file when running the script. 
The script should check if the usernames already exist on the system before creating the 
accounts. If a user account exit, the script should notify the user and skip that user name to the 
next one. Make sure to create a home directory as well. When the input list has been exhausted 
and all the user account created, output the content of “/etc/passwd” file and “/home” directory 
to the terminal for verification. 
In a next step, the script should ask if user wants to delete the newly created accounts? If yes, 
the script should delete the accounts including their home directories and output again the 
content of “/etc/passwd” file and “/home” directory for verification. If no, the script should 
terminate with appropriate message.
Use functions to implement the account creation and deletion operations. The functions should 
in each case accept one parameter. This script should only be tested/executed with root user
privileges. Ensure its enforcement. Properly comment your code.
************************************************************************************************************************************************************************
by:Ahraz khan
