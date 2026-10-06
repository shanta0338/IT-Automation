# Google IT Automation with Python


## File paths


 - Absolute Path: /home/user/projects/linux/notes.txt <br>
 - Relative Path: <br>
    If the current directory is: /home/user
    Then the relative path: cd projects/linux/
    Moves to: /home/user/projects/linux/
    Special Symbols in Relative Paths:
    - . (dot) : Refers to the current directory
    - .. (double dot) : Refers to the parent directory
-----------------------------------------------------------------------------------------------------------------------------------------------------
## File Handling


- "Software Needed.txt"
with open(Software Needed.txt", 'w') as file:

    - r: read only
    - w: write only
    - a: append
    - t: text mode
    - +: open for updating
    - r+: read and write
    - x: exclusive creation
    
    **Important Notice:**


        Python distinguishes between binary mode (“b”) and text mode (“t”).
        f = open('workfile', 'w', encoding="utf-8") 

    

    - Example: file.write('All the software has been installed. I have install other sotware such as ML-Flow')

-----------------------------------------------------------------------------------------------------------------------------------------------------
## Python OS and directories 


- os.remove("novel.txt") This remove the txt file. <br>
- os.rename("first_draft.txt", "finished_masterpiece.txt") This rename the file. <br>


*Here we check the files exists or not*


- print(os.path.exists("finished_masterpiece.txt")) <br>
- print(os.path.exists("userlist.txt")) <br>
- os.path.getsize("spider.txt") This script returns size of the file <br>
- os.path.getmtime('spider.txt') This shows Unix time <br>
- os.path.abspath('spider.txt') This find absoulte path <br>
- os.mkdir('new_dir') This create new directory <br>
- os.chdir('new_dir') This change the directory <br>
- os.rmdir('new_dir') This remove directory <br>
- os.listdir() This provide list of directories <br>