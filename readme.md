Readme · MD
# IT Automation with Python
 
A structured reference guide covering key terminology, file and directory operations, CSV processing, debugging and bisecting workflows, shell and Python scripting, software profiling, and concurrency and parallelism in Python.

- Reference: [GitHub](https://github.com/google/it-cert-automation-practice)
 
## Table of Contents
 
1. [Key Terminology](#key-terminology)
2. [File Paths](#file-paths)
3. [File Handling in Python](#file-handling-in-python)
4. [The `os` Module and Directory Operations](#the-os-module-and-directory-operations)
5. [CSV Processing in Python](#csv-processing-in-python)
6. [Debugging Data Imports via Bisecting](#debugging-data-imports-via-bisecting)
7. [Meeting Reminder Application](#meeting-reminder-application)
8. [Debugging Methods](#debugging-methods)
9. [Understanding Crashes and Tracing](#understanding-crashes-and-tracing)
10. [Writing Effective Postmortems](#writing-effective-postmortems)
11. [Software Profiling and Benchmarking](#software-profiling-and-benchmarking)
12. [Concurrency and Parallelism in Python](#concurrency-and-parallelism-in-python)
13. [Common Python Errors](#common-python-errors)
## Key Terminology
 
### General & System Concepts
 
| Term | Definition |
| :--- | :--- |
| **Absolute path** | A full path to a resource in the file system, starting from the root directory. |
| **Relative path** | A partial path showing where a resource is located in relation to the current working directory. |
| **File system** | The methods and structures an operating system uses to organize and control how data is stored and accessed. |
| **System calls** | Requests made by running programs to the operating system kernel. |
| **Virtual machine (VM)** | A computer system simulated through software. |
| **Qwiklabs** | An online learning environment and virtual machine platform used to simulate real-world IT scenarios. |
| **Cache** | A storage layer that keeps data in a form that is faster to access than its original source. |
| **Wrapper** | A function or program that provides a compatibility layer between two functions or programs so they can work well together. |
 
### Debugging, Troubleshooting & Profiling Terms
 
| Term | Definition |
| :--- | :--- |
| **Troubleshooting** | The process of diagnosing and solving any problem in the system running an application. |
| **Debugging** | The process of identifying, analyzing, and removing bugs in the source code of an application. |
| **Debugger** | A tool that steps through code line by line, inspects variable assignments, and pauses execution when specific conditions are met. |
| **Breakpoint** | A debugging feature that lets code run until a certain line is reached. |
| **Watchpoint** | A debugging feature that lets code run until a variable or expression changes. |
| **Core file** | A file that stores all the information related to a crash, used to debug the issue afterwards. |
| **Pointer** | A variable that stores a memory address. |
| **Undefined behavior** | Code that does something that is not valid in the programming language. |
| **Valgrind** | A tool that detects invalid operations in code (such as bad memory accesses), whether or not the code crashes. |
| **Watchdog** | A separate process that checks whether a program is running and restarts it when it is not. |
| **Linear search** | Searching through each item sequentially until the desired entry is found. |
| **Binary search** | Finding an item in a sorted list by repeatedly dividing the search space in half. |
| **Bisecting** | Dividing a range in two to isolate an issue (also a Git command: `git bisect`). |
| **Observer effect** | The principle that observing or measuring a system alters its behavior or performance. |
| **Profiler** | A diagnostic tool that measures resource usage, memory allocation, and execution time across code segments. |
| **Memory leak** | A defect where memory that is no longer needed by a program is not released back to the system. |
| **Expensive actions** | Operations that consume significant time or computing resources. |
| **Activity Monitor** | macOS utility that displays real-time usage of CPU, memory, energy, disk, and network resources. |
| **Resource Monitor / Performance Monitor** | Windows utilities that display real-time usage of CPU, memory, disk, and network resources. |
| **Real time** | The wall-clock time elapsed while a command runs, from start to finish. |
| **User time** | CPU time spent executing operations in user space. |
| **Sys time** | CPU time spent executing system-level kernel operations. |
| **Postmortem** | A document describing the details of an incident in order to learn from mistakes. |
| **Incident commander** | The person who looks at the big picture and decides the best use of available resources during an incident. |
| **Communications lead** | The person who receives and distributes timely, important updates during an incident. |
 
### Concurrency & Execution Terms
 
| Term | Definition |
| :--- | :--- |
| **Thread** | A lightweight unit of execution that runs tasks concurrently within a single process. |
| **Executor** | The component responsible for distributing tasks across available worker threads or processes. |
| **`concurrent.futures`** | A Python module providing high-level executors for managing thread pools and process pools. |
 
### Python Data, String & File Terms
 
| Term | Definition |
| :--- | :--- |
| **List** | An ordered, mutable sequence of elements in Python. |
| **Mode** | A parameter specifying the permitted operations (read, write, append, ...) on an opened file. |
| **CSV (comma-separated values)** | A plain-text format that stores tabular records with fields separated by commas. |
| **Dialect** | The set of rules and parameters that define how a CSV file is structured and parsed. |
| **Reader object** | An object that iterates over and parses rows from a CSV source. |
| **Writer object** | An object that serializes and writes tabular data to a CSV file. |
| **`strip()`** | String method that removes leading and trailing whitespace (or specified characters); useful for cleaning user input or lines read from files. |
| **`join()`** | String method that concatenates an iterable of strings using a separator; useful for combining word lists into sentences or building CSV rows. |
 
## File Paths
 
### Absolute vs. Relative Paths
 
- **Absolute path:** the complete location from the root directory.
```text
  /home/user/projects/linux/notes.txt
```
 
- **Relative path:** the location relative to the current working directory.
```bash
  # If the current working directory is /home/user:
  cd projects/linux/
  # Moves to: /home/user/projects/linux/
```
 
### Special Path Symbols
 
- `.` (single dot): the current working directory.
- `..` (double dot): the parent directory.
## File Handling in Python
 
### Opening and Writing Files
 
Use the `with open(...)` context manager so the file is closed automatically when the block ends:
 
```python
with open("Software Needed.txt", "w", encoding="utf-8") as file:
    file.write("All the software has been installed. I have installed other software such as ML-Flow.")
```
 
### File Modes
 
| Mode | Description |
| :--- | :--- |
| `r` | Read-only (default). |
| `w` | Write-only (truncates an existing file or creates a new one). |
| `a` | Append (writes data to the end of the file). |
| `x` | Exclusive creation (fails if the file already exists). |
| `t` | Text mode (default; encodes/decodes strings). |
| `b` | Binary mode (reads/writes raw bytes). |
| `+` | Open for updating (reading and writing). |
| `r+` | Read and write without truncating the file. |
 
> **Note:** Python distinguishes between binary mode (`"b"`) and text mode (`"t"`). When working with text files, explicitly specify the encoding:
>
> ```python
> f = open("workfile", "w", encoding="utf-8")
> ```
 
## The `os` Module and Directory Operations
 
The built-in `os` and `os.path` modules provide functions for interacting with the file system:
 
```python
import os
 
# Remove and rename files
os.remove("novel.txt")                                    # Deletes the file
os.rename("first_draft.txt", "finished_masterpiece.txt")  # Renames a file
 
# Check whether files exist
print(os.path.exists("finished_masterpiece.txt"))
print(os.path.exists("userlist.txt"))
 
# Inspect file metadata and paths
os.path.getsize("spider.txt")   # File size in bytes
os.path.getmtime("spider.txt")  # Last modification time (Unix timestamp)
os.path.abspath("spider.txt")   # Full absolute path
 
# Manage directories
os.mkdir("new_dir")             # Creates a new directory
os.chdir("new_dir")             # Changes the current working directory
os.rmdir("new_dir")             # Removes an empty directory
os.listdir()                    # Lists files and directories in the current path
```
 
## CSV Processing in Python
 
### Dialects and Formatting Parameters
 
Dialects define the structural rules of a `.csv` file and control how reader and writer objects parse or format fields:
 
- **`Dialect.delimiter`**: one-character string used to separate fields (default `,`).
- **`Dialect.quotechar`**: one-character string used to quote fields containing special characters (default `"`).
- **`Dialect.strict`**: boolean flag (default `False`). When `True`, a `csv.Error` is raised on malformed CSV input.
### Core `csv` Module Functions and Classes
 
- **`csv.reader`**: returns a reader object that iterates over lines in the given CSV file.
- **`csv.writer`**: returns a writer object that converts user data into delimited strings on the given file-like object.
- **`csv.DictReader`**: creates a reader that maps each row to a dictionary, with keys taken from the header row or the optional `fieldnames` parameter.
### Reader Objects
 
- **`csvreader.__next__()`**: returns the next row of the reader's iterable as a list (or dictionary for `DictReader`), parsed according to the current dialect. Normally called via `next(reader)`.
- **`csvreader.dialect`**: a read-only description of the dialect used by the parser.
### Writer Objects
 
- **`csvwriter.writerow(row)`**: writes a single row, formatted according to the current dialect.
- **`csvwriter.writerows(rows)`**: writes all elements in `rows` (an iterable of row sequences) to the file object.
- **`csvwriter.dialect`**: a read-only description of the dialect used by the writer.
### Example
 
```python
import csv
 
with open("contacts.csv", newline="", encoding="utf-8") as f:
    for row in csv.DictReader(f):
        print(row["name"], row["email"])
```
 
## Debugging Data Imports via Bisecting
 
When an import script fails on a large dataset (such as `contacts.csv`), combine `wc`, `head`, and `tail` in a binary-search (bisecting) workflow to isolate the malformed row:
 
```bash
# 1. Attempt to import the full dataset
/import_data$ cat contacts.csv | ./import.py --server test
 
# 2. Count total lines and inspect the beginning and end of the file
/import_data$ wc -l contacts.csv
/import_data$ head -15 contacts.csv
/import_data$ tail -20 contacts.csv
 
# 3. Bisect the file to narrow down which half contains the faulty record
/import_data$ head -50 contacts.csv | ./import.py --server test
/import_data$ head -50 contacts.csv | head -25 | ./import.py --server test
/import_data$ head -50 contacts.csv | tail -25 | ./import.py --server test
/import_data$ head -50 contacts.csv | tail -25 | head -13 | ./import.py --server test
/import_data$ head -50 contacts.csv | tail -25 | tail -12 | head -6 | ./import.py --server test
 
# 4. Inspect the isolated rows to identify and fix the corrupted entry
/import_data$ head -50 contacts.csv | tail -25 | tail -12 | head -6 | head -3
 
# 5. Re-run the full import after fixing the corrupted record
/import_data$ cat contacts.csv | ./import.py --server test
```
 
## Meeting Reminder Application
 
The `meeting_reminder` tool collects meeting details through a graphical `zenity` form in Bash and passes the pipe-delimited result to a Python script (`send_reminders.py`), which formats and sends email reminders.
 
### Running the Script
 
```bash
/meeting_reminder$ ./meeting_reminder.sh
```
 
### Initial Shell Script (`meeting_reminder.sh`)
 
```bash
#!/bin/bash
 
meeting_info=$(zenity --forms \
    --title 'Meeting' --text 'Reminder information' \
    --add-calendar 'Date' --add-entry 'Title' \
    --add-entry 'Emails' \
    2>/dev/null)
 
if [[ -n "$meeting_info" ]]; then
    python3 send_reminders.py "$meeting_info"
fi
```
 
### Updated Shell Script with Explicit Date Formatting
 
Adding `--forms-date-format='%Y-%m-%d'` makes the calendar widget output ISO dates (`YYYY-MM-DD`), which is the format Python's `strptime` expects below. The `echo` line is a debugging aid and can be removed once the script works.
 
```bash
#!/bin/bash
 
meeting_info=$(zenity --forms \
    --title 'Meeting' --text 'Reminder information' \
    --add-calendar 'Date' --add-entry 'Title' \
    --add-entry 'Emails' \
    --forms-date-format='%Y-%m-%d' \
    2>/dev/null)
 
echo "$meeting_info"
 
if [[ -n "$meeting_info" ]]; then
    python3 send_reminders.py "$meeting_info"
fi
```
 
### Python Reminder Logic (`send_reminders.py`)
 
#### Day-of-Week Helper (`dow`)
 
Parses a `YYYY-MM-DD` string and returns the weekday name (for example, `Monday`):
 
```python
import datetime
 
def dow(date):
    dateobj = datetime.datetime.strptime(date, r"%Y-%m-%d")
    return dateobj.strftime("%A")
```
 
#### Main Function and Error Handling (`main`)
 
Splits the pipe-delimited argument from `zenity` and reports the specific exception to `stderr`:
 
```python
import sys
 
def main():
    if len(sys.argv) < 2:
        return usage()
 
    try:
        date, title, emails = sys.argv[1].split('|')
        message = message_template(date, title)
        send_message(message, emails)
        print("Successfully sent reminders to:", emails)
    except Exception as e:
        print("Failure to send email: {}".format(e), file=sys.stderr)
```
 
> **Tip:** Replacing a generic `print("Failure to send email", file=sys.stderr)` with `print("Failure to send email: {}".format(e), file=sys.stderr)` reveals the exact cause of the exception.
 
## Debugging Methods
 
### Debugging with `pdb`
 
When an application processes data, it can crash on unexpected formats. With large volumes of data and complex code, finding the root cause with `print()` statements alone becomes difficult. Python's built-in interactive debugger, `pdb` ("Python DeBugger"), helps by letting you:
 
1. Set breakpoints
2. Step through code
3. Inspect variables
4. Evaluate arbitrary Python expressions interactively
With `pdb` you can pause your program at any point, inspect variable values, and even change them if needed.
 
### `try` / `except`
 
Python's version of the "try and catch" paradigm found in many languages. It handles runtime errors (exceptions) gracefully without crashing the program:
 
```python
try:
    value = int(user_input)
except ValueError as e:
    print("Invalid number: {}".format(e))
```
 
### Using `assert`
 
Assertions are logical sanity checks written while coding. The condition in an `assert` statement should **always be true**. If it is false, the program stops and displays an error message, which is a strong indicator of a bug. Fix the bug before continuing so you don't introduce additional ones.
 
```python
assert len(rows) > 0, "Expected at least one row of data"
```
 
### The `logging` Module
 
The `logging` module categorizes messages by severity: `DEBUG`, `INFO`, `WARNING`, `ERROR`, and `CRITICAL`. This makes it easy to filter and prioritize issues.
 
For example, on an e-commerce site you might log:
 
- Product browsing at `DEBUG`
- Cart additions at `INFO`
- Successful purchases at `WARNING`
- Failed transactions at `ERROR`
- System crashes at `CRITICAL`
You can then focus on the areas that need immediate attention while keeping a detailed record of all user interactions.
 
## Understanding Crashes and Tracing
 
- **Blue Screen of Death (BSoD) / kernel panic:** A serious crash that requires restarting the computer. Windows shows a "Blue Screen of Death"; macOS shows a kernel panic. Though rare, analyzing these events is essential for uncovering OS issues. They are usually caused by hardware faults, problematic drivers, or abruptly terminated processes, and the screens display error codes, memory locations, and other technical details.
- **Reading system logs:** System logs are crucial for understanding and resolving issues on any operating system. On Windows, the System and Application logs record software, hardware, and user-interaction events; on Mac and Linux, system logs serve the same purpose.
- **Process Monitor (Windows):** Provides real-time visibility into file system actions, registry changes, and process behavior, combining features of the legacy tools Regmon and Filemon. It supports non-destructive filtering, customizable columns, and boot-time logging, and records details such as image paths, commands, users, and session IDs. It is useful for troubleshooting, malware detection, and system-activity analysis.
- **`strace` (Linux):** Traces system calls and signals made by a program. Run it by entering the program's name and arguments after `strace`. The logged output helps you find bottlenecks, unintended behavior, and misconfigurations.
- **Tracing system calls across platforms:** On Linux use the `ptrace` API or `strace`; on macOS use `dtrace`; on Windows use Process Monitor. Tools such as Logger, LogView, and NtTrace build on Event Tracing for Windows (ETW). Tracing system calls helps identify security risks and reveals how processes interact with the operating system.
## Writing Effective Postmortems
 
1. Postmortems document the details of an incident to **learn from mistakes, not to assign blame**. They identify what happened, why, how it was diagnosed and fixed, and how to prevent recurrence.
2. Include the **root cause, impact, diagnosis, short-term fix, and long-term recommendations**. Provide a summary that highlights key points for broader audiences, and note what went well to recognize effective systems and justify their use.
## Software Profiling and Benchmarking
 
### Overview
 
- **Software profiling:** A diagnostic technique for analyzing real-time resource use and application behavior. It examines metrics such as CPU utilization, memory consumption, and disk usage to guide optimization.
- **Benchmarking:** A deeper analysis of where an application spends its time and computing cycles. It measures code speed against a baseline or competing software.
- **`timeit`:** Python's built-in module for measuring the execution time of small code segments, useful for mini-benchmarks that pinpoint bottlenecks.
```python
import timeit
 
print(timeit.timeit("sum(range(1000))", number=10_000))
```
 
### Types of Profilers
 
- **Flat profilers:** Compute average call times and total execution time within individual functions, without tracking call hierarchy.
- **Call-graph profilers:** Report execution times along with call chains showing which functions called which.
- **Input-sensitive profilers:** Analyze how performance and resource consumption scale with the size or characteristics of the input.
### Applications in Architecture, Compilers, and IT
 
- **Profile-guided optimization (PGO):** Uses runtime profiles to help compilers and developers predict program behavior on new hardware, refine optimizations, and improve execution speed.
- **Impact:** Over four decades, profiling has become essential for programmers, computer architects, compiler designers, and IT professionals. Monitoring real-time resource allocation keeps software responsive and performant.
## Concurrency and Parallelism in Python
 
### Core Concepts
 
- **Concurrency:** Multiple tasks make progress over overlapping time periods, even if they do not run at the exact same instant. It optimizes scheduling and resource use, which makes it ideal for **I/O-bound** tasks.
- **Parallelism:** Multiple tasks run simultaneously across multiple processors or CPU cores. It accelerates **CPU-bound** tasks and reduces total processing time.
- **Combined:** Using both makes applications responsive during I/O waits and faster at heavy computation.
| Approach | Target Workload | Python Modules | Key Mechanism |
| :--- | :--- | :--- | :--- |
| **Concurrency** | I/O-bound (file I/O, network requests, API calls) | `threading`, `asyncio` | Overlaps waiting times via threads or an asynchronous event loop. |
| **Parallelism** | CPU-bound (calculations, simulations, video rendering) | `multiprocessing` | Distributes work across CPU cores with separate memory spaces. |
 
### Concurrency for I/O-Bound Tasks
 
1. **`threading`**
   - Overlaps waiting times for tasks with frequent file or network operations.
   - Constrained by Python's **Global Interpreter Lock (GIL)**, which prevents multiple native threads from executing Python bytecode simultaneously.
2. **`asyncio`**
   - Uses a cooperative **event loop** and coroutines to manage task switching.
   - Offers more control, scalability, and lower overhead than threads for I/O-bound work.
   - Runs cooperatively in a single thread, avoiding GIL contention, which makes it well suited to applications that read and write large volumes of data.
### Parallelism for CPU-Bound Tasks
 
For programs that process large volumes of data continuously (numerical calculations, simulations, compression, data processing):
 
- **`multiprocessing`**
  - Distributes tasks across CPU cores so computations run simultaneously.
  - Gives each process its own Python interpreter and memory space, avoiding GIL limits and resource-sharing conflicts.
  - Requires careful resource management to avoid excessive memory overhead when spawning many processes.
### Combining Concurrency and Parallelism
 
Applications with both I/O-bound and CPU-bound work can combine `asyncio` and `multiprocessing`:
 
- Use **`asyncio`** to stay responsive while waiting on file or network operations.
- Use **`multiprocessing`** to offload heavy computations across cores.
### Selecting the Right Approach
 
Decide early in design whether you need concurrency or parallelism, based on the workload:
 
- **Concurrency (`asyncio` or `threading`):** when the program is **I/O-bound**, waiting on disks, databases, or network sockets. Idle wait time is used to handle many tasks at once.
- **Parallelism (`multiprocessing`):** when the program is **CPU-bound**, such as compressing data, rendering HD video, or running complex simulations.
### `asyncio` Events and Task Loops
 
- **Coroutines:** Functions defined with `async def` that can pause with `await` while an I/O operation completes, yielding control back to the event loop.
- **Event loops:** Schedule and manage coroutines so long-running I/O never blocks the main thread.
- **Practical use cases:**
  - Sending emails or notifications rapidly without spawning many OS threads.
  - Combining `asyncio` with **`aiohttp`** to run many web requests or API calls concurrently.
  - Optimizing data input/output pipelines for high-performance, responsive applications.
## Common Python Errors
 
| Error | Meaning |
| :--- | :--- |
| `ModuleNotFoundError` | The imported module is not installed or not on the import path. |
| `FileNotFoundError` | The file or directory being opened does not exist. |
| `KeyError` | A dictionary key (for example, a missing CSV column in a `DictReader` row) was not found. |