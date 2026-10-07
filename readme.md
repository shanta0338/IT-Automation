# Google IT Automation with Python


### Some Important Terms:
Absolute path: A full path to the resource in the file system

- Comma separated values (CSV): A very common data format used to store data as segment of text separated by commas<br>

- Dialects: Rules that define how a CSV file is structured<br>

- File systems: Methods and structures used to organize and control how data is stored and accessed<br>

- Mode: The format controlling what you can do with a recently opened file<br>

- Qwiklabs: An online learning environment or virtual machine to simulate real-world scenarios<br>

- Reader objects:  Object that represents an element or entity within a scene that needs to be rendered to the screen<br>

- Relative path: A portion of a path to show where the resource is located in relation to the current working directory<br>

- Virtual machine (VM): A computer simulated through software<br>

- Writer objects: The capability to write data to a CSV file<br>
- **strip()**: Removes leading and trailing whitespace (or specified characters) from a string.	Cleaning up messy user input or parsing lines from a text file.<br>
**join()**: Concatenates an iterable (like a list) of strings into a single string using a separator.	Combining a list of words into a single sentence or formatting data as CSV.<br>
-----------------------------------------------------------------------------------------------------------------------------------------------------


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
-----------------------------------------------------------------------------------------------------------------------------------------------------
## Dialects and formatting parameters


Dialects are rules that define how a .csv file is structured, and parameters are formed to control the behavior of the .csv reader and writer and live within dialects. The following  features are supported by dialects:

- Dialect.delimiter This attribute is a one-character string used to separate fields and defaults to a comma.<br>

- Dialect.quotechar  This attribute is a one-character string used to quote fields containing special characters and defaults to ‘ ‘’ ‘.<br>

- Dialect.strict  This attribute’s default is False, but when True, exception csv.Error will be raised if an error is detected.<br>

## CSV file Editing


The .csv module is a built-in Python functionality used to read and work with .csv files. Let’s look at how the .csv module defines some of these functions:

- csv.reader This function returns a reader object that iterates over lines in the .csv file.<br>

- csv.writer This function returns a writer object that’s responsible for converting the user’s data into delimited strings on the given file-like object.<br>

- class csv.DictReader This function creates an object that functions as a regular reader but maps the information in each row to a dictionary whose keys are given by the optional fieldname parameters.<br>

### Reader objects


A reader object contains the following public methods and attributes:

- csvreader._next_() This method returns the next row of the reader’s iterable object as a list or a dictionary, parsed properly to the current dialect. Typically, you would call this next(reader).

- csvreader.dialect This attribute is a read-only description of the dialect in use by the parser.

### Writer objects


- Writer objects provide you the capability to write data to a .csv file. Let’s look at a couple of public methods and attributes for writer objects:

- csvwriter.writerows(rows) This method writes all elements in rows to the writer’s file object and formats following the current dialect.

- csvwriter.dialect This attribute is a read-only description of the dialect being used by the writer.

-----------------------------------------------------------------------------------------------------------------------------------------------------