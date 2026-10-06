# Google IT Automation with Python


- Here, I upload the codes and files that I think important.
-----------------------------------------------------------------------------------------------------------------------------------------------------
## File paths


 - Absolute Path: 
    /home/user/projects/linux/notes.txt
 - Relative Path:
    If the current directory is: /home/user
    Then the relative path: cd projects/linux/
    Moves to: /home/user/projects/linux/
    Special Symbols in Relative Paths:
    - . (dot) : Refers to the current directory
    - .. (double dot) : Refers to the parent directory

    -------------------------------------------------------------------------------------------------------------------------------------------------

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
    