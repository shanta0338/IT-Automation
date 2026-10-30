# Google IT Automation with Python

A structured reference guide covering key concepts, terminology, file and directory operations, CSV processing, debugging and bisecting workflows, shell and Python scripting, software profiling, and concurrency and parallelism in Python.

## Key Terminology

### General & System Concepts

| Term | Definition |
| :--- | :--- |
| **Absolute path** | A full path to a resource in the file system starting from the root directory. |
| **Relative path** | A partial path showing where a resource is located in relation to the current working directory. |
| **File systems** | Methods and structures used by an operating system to organize and control how data is stored and accessed. |
| **System calls** | Requests made by running programs to the operating system kernel. |
| **Virtual machine (VM)** | A computer system simulated through software. |
| **Qwiklabs** | An online learning environment and virtual machine platform used to simulate real-world IT scenarios. |
| **Cache** | A storage layer that keeps data in a form that is faster to access than its original source. |

### Debugging, Troubleshooting & Profiling Terms

| Term | Definition |
| :--- | :--- |
| **Troubleshooting** | The process of diagnosing and solving any problem in the system running an application. |
| **Debugging** | The process of identifying, analyzing, and removing bugs in the source code of an application. |
| **Debuggers** | Tools that step through code line by line, inspect variable assignments, and pause execution when specific conditions are met. |
| **Linear search** | Searching through each line or item of data sequentially until the desired entry is located. |
| **Binary search** | A search algorithm that finds a specific item in a sorted list or array by repeatedly dividing the search space in half. |
| **Bisecting** | Dividing a range in two to isolate an issue (also a Git command: `git bisect`). |
| **Observer effect** | The principle that observing or measuring a system alters its behavior or performance. |
| **Profiler** | A diagnostic tool that measures resource usage, memory allocation, and execution time across code segments. |
| **Memory leak** | A defect where allocated memory that is no longer needed by a program is not released back to the system. |
| **Expensive actions** | Operations that consume significant time or computing resources to complete. |
| **Activity Monitor** | macOS utility that displays real-time usage of CPU, memory, energy, disk, and network resources. |
| **Resource Monitor / Performance Monitor** | Windows utilities that display real-time usage of CPU, memory, disk, and network resources. |
| **Real time** | The actual wall-clock elapsed time required to execute a command from start to finish. |
| **User time** | The CPU time spent executing operations in user space. |
| **Sys time** | The CPU time spent executing system-level kernel operations. |

### Concurrency & Execution Terms

| Term | Definition |
| :--- | :--- |
| **Threads** | Lightweight units of execution that run concurrent tasks within a single process. |
| **Executor** | The component responsible for distributing tasks across available worker threads or processes. |
| **Futures** | A Python module (`concurrent.futures`) providing high-level executors for managing thread pools and process pools. |

### Python Data, String & File Terms

| Term | Definition |
| :--- | :--- |
| **Lists** | Ordered, mutable sequences of elements in Python. |
| **Mode** | A parameter specifying the permitted operations (such as read, write, or append) on an opened file. |
| **Comma-separated values (CSV)** | A common plain-text data format that stores tabular records with fields separated by commas. |
| **Dialects** | Rules and parameters that define how a CSV file is structured and parsed. |
| **Reader objects** | Objects that iterate over and parse rows from a CSV source (or represent renderable entities in graphics contexts). |
| **Writer objects** | Objects that serialize and write tabular data to a CSV file. |
| **`strip()`** | String method that removes leading and trailing whitespace (or specified characters); useful for cleaning user input or parsing lines from text files. |
| **`join()`** | String method that concatenates an iterable of strings using a separator; useful for combining word lists into sentences or formatting CSV rows. |

## File Paths

### Absolute vs. Relative Paths

- **Absolute Path:** Specifies the complete location from the root directory.
  ```text
  /home/user/projects/linux/notes.txt
  ```
- **Relative Path:** Specifies the location relative to the current working directory.
  ```bash
  # If the current working directory is /home/user:
  cd projects/linux/
  # Moves to: /home/user/projects/linux/
  ```

### Special Path Symbols

- `.` (single dot): Refers to the current working directory.
- `..` (double dot): Refers to the parent directory.

## File Handling in Python

### Opening and Writing Files

Use the `with open(...)` context manager to ensure files are automatically closed after operations complete:

```python
with open("Software Needed.txt", "w", encoding="utf-8") as file:
    file.write("All the software has been installed. I have installed other software such as ML-Flow.")
```

### File Modes

| Mode | Description |
| :--- | :--- |
| `r` | Read-only mode (default). |
| `w` | Write-only mode (truncates existing file or creates a new one). |
| `a` | Append mode (writes data to the end of the file). |
| `t` | Text mode (default; decodes/encodes strings). |
| `b` | Binary mode (reads/writes raw bytes). |
| `+` | Open for updating (both reading and writing). |
| `r+` | Open for both reading and writing without truncating. |
| `x` | Exclusive creation (fails if the file already exists). |

> **Note:** Python distinguishes between binary mode (`"b"`) and text mode (`"t"`). When working with text files, explicitly specify the character encoding (for example, `encoding="utf-8"`):
> ```python
> f = open("workfile", "w", encoding="utf-8")
> ```

## Python `os` Module and Directory Operations

The built-in `os` and `os.path` modules provide functions for interacting with the file system:

```python
import os

# Remove and rename files
os.remove("novel.txt")                                 # Deletes the specified file
os.rename("first_draft.txt", "finished_masterpiece.txt") # Renames a file

# Check whether files exist
print(os.path.exists("finished_masterpiece.txt"))
print(os.path.exists("userlist.txt"))

# Inspect file metadata and paths
os.path.getsize("spider.txt")  # Returns the file size in bytes
os.path.getmtime("spider.txt") # Returns the last modification timestamp (Unix epoch time)
os.path.abspath("spider.txt")  # Returns the full absolute path of the file

# Manage directories
os.mkdir("new_dir")            # Creates a new directory
os.chdir("new_dir")            # Changes the current working directory
os.rmdir("new_dir")            # Removes an empty directory
os.listdir()                   # Returns a list of files and directories in the current path
```

## CSV Processing in Python

### Dialects and Formatting Parameters

Dialects define the structural rules of a `.csv` file and control how reader and writer objects parse or format fields:

- **`Dialect.delimiter`**: A one-character string used to separate fields (defaults to `,`).
- **`Dialect.quotechar`**: A one-character string used to quote fields containing special characters (defaults to `"`).
- **`Dialect.strict`**: A boolean flag (defaults to `False`). When set to `True`, raises a `csv.Error` exception if malformed CSV input is detected.

### Core `csv` Module Functions and Classes

- **`csv.reader`**: Returns a reader object that iterates over lines in the given CSV file.
- **`csv.writer`**: Returns a writer object that converts user data into delimited strings on the given file-like object.
- **`csv.DictReader`**: Creates a reader object that maps the information in each row to a dictionary whose keys are defined by the header row or optional `fieldnames` parameter.

### Reader Objects

A CSV reader object provides the following public method and attribute:

- **`csvreader.__next__()`**: Returns the next row of the reader's iterable object as a list or dictionary, parsed according to the current dialect (typically called via `next(reader)`).
- **`csvreader.dialect`**: A read-only description of the dialect currently used by the parser.

### Writer Objects

A CSV writer object provides the following public method and attribute:

- **`csvwriter.writerows(rows)`**: Writes all elements in `rows` (an iterable of row sequences) to the writer's file object formatted according to the current dialect.
- **`csvwriter.dialect`**: A read-only description of the dialect currently used by the writer.

## Debugging Data Imports via Bisecting (Command Line)

When an import script fails on a large dataset (such as `contacts.csv`), you can combine `wc`, `head`, and `tail` in a binary search (bisecting) workflow to isolate the exact malformed row causing the failure:

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

# 4. Inspect the isolated subset of rows to identify and fix the corrupted entry
/import_data$ head -50 contacts.csv | tail -25 | tail -12 | head -6 | head -3

# 5. Re-run the full import after fixing the corrupted record
/import_data$ cat contacts.csv | ./import.py --server test
```

## Meeting Reminder Application (`meeting_reminder`)

This tool collects meeting details through a graphical `zenity` form in Bash and passes the pipe-delimited string to a Python script (`send_reminders.py`) to format and send email reminders.

### Executing the Script

```bash
/meeting_reminder$ ./meeting_reminder.sh
```

### Initial Shell Script (`meeting_reminder.sh`)

Captures the meeting date, title, and recipient emails via `zenity --forms` and passes the result to `send_reminders.py`:

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

Adds `--forms-date-format='%Y-%m-%d'` so the calendar widget outputs dates in ISO format (`YYYY-MM-DD`) expected by Python's `strptime`:

```bash
#!/bin/bash

meeting_info=$(zenity --forms \
    --title 'Meeting' --text 'Reminder information' \
    --add-calendar 'Date' --add-entry 'Title' \
    --add-entry 'Emails' \
    --forms-date-format='%Y-%m-%d' \
    2>/dev/null)

echo $meeting_info

if [[ -n "$meeting_info" ]]; then
    python3 send_reminders.py "$meeting_info"
fi
```

### Python Reminder Logic (`send_reminders.py`)

#### Day-of-Week Helper (`dow`)

Parses a `YYYY-MM-DD` date string and returns the full weekday name (e.g., `Monday`):

```python
def dow(date):
    dateobj = datetime.datetime.strptime(date, r"%Y-%m-%d")
    return dateobj.strftime("%A")
```

#### Main Function and Error Handling (`main`)

Splits the pipe-delimited input argument from `zenity` and includes detailed exception logging to output specific error messages to `stderr`:

```python
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

*(Note: During debugging, replacing a generic `print("Failure to send email", file=sys.stderr)` handler with `print("Failure to send email: {}".format(e), file=sys.stderr)` reveals the exact exception cause.)*

## Software Profiling and Benchmarking

### Overview of Profiling and Benchmarking

- **Software Profiling:** A diagnostic technique used to analyze real-time resource utilization and monitor application behavior. Profiling examines key performance metrics such as CPU utilization, memory consumption, and disk space usage to guide performance improvements and optimization strategies.
- **Benchmarking:** A deep analysis of where an application spends its time and computing cycles by assessing consumed time and resources. Benchmarking measures code speed against a baseline or competing software.
- **Benchmarking in Python (`timeit`):** Python's built-in `timeit` module measures the execution time of small code segments, enabling developers to run mini-benchmarks on individual functions and pinpoint bottlenecks.

### Types of Profiling Tools

Developers use profiling tools to generate detailed source code reports showing how an application behaves and consumes resources:

- **Flat Profilers:** Compute the average call times and total execution time spent within individual functions without tracking call hierarchy.
- **Call-Graph Profilers:** Report execution times for functions along with the call chains showing which functions called which other functions.
- **Input-Sensitive Profilers:** Analyze how performance and resource consumption scale in relation to the size or characteristics of the input data.

### Applications in Architecture, Compilers, and IT

- **Profile-Guided Optimization (PGO):** Extends profiling to computer architecture and compiler design. By analyzing runtime profiles, developers and compilers can predict program behavior on new hardware configurations, refine optimization algorithms, and improve execution speed.
- **Evolution and IT Impact:** Over the past four decades, software profiling has evolved into an essential asset for programmers, computer architects, compiler designers, and IT professionals. Monitoring and analyzing real-time resource allocation ensures responsive, high-performance software aligned with modern operational standards.

## Concurrency and Parallelism in Python

### Core Concepts

- **Concurrency:** Allows multiple tasks to make progress over overlapping time periods, even if they do not execute at the exact same instant. Concurrency optimizes task scheduling and resource utilization, making it ideal for **I/O-bound tasks**.
- **Parallelism:** Executes multiple tasks simultaneously across multiple processors or CPU cores. By dividing work across cores, parallelism accelerates **CPU-bound tasks** and reduces total processing time.
- **Combined Power:** Combining concurrency and parallelism in Python makes applications both more responsive during I/O waits and faster at heavy computations.

| Approach | Target Workload | Python Modules | Key Mechanism |
| :--- | :--- | :--- | :--- |
| **Concurrency** | I/O-bound tasks (file I/O, network requests, API calls) | `threading`, `asyncio` | Overlaps waiting times via threads or an asynchronous event loop. |
| **Parallelism** | CPU-bound tasks (calculations, simulations, video rendering) | `multiprocessing` | Distributes work across multiple CPU cores with separate memory spaces. |

### Concurrency for I/O-Bound Tasks

Python provides two main approaches to concurrency:

1. **`threading`**:
   - Overlaps waiting times efficiently for tasks involving frequent file I/O or network operations.
   - Constrained by Python's **Global Interpreter Lock (GIL)**, which prevents multiple native threads from executing Python bytecodes simultaneously across multiple CPU cores.
2. **`asyncio`**:
   - Uses a cooperative **event loop** and coroutines to manage task switching.
   - Provides greater control, scalability, and lower overhead than threading for I/O-bound workloads.
   - Bypasses GIL contention by running cooperatively in a single thread, making it significantly faster for applications that read and write large volumes of data.

### Parallelism for CPU-Bound Tasks

Parallelism is designed for programs that rely heavily on the CPU to process large volumes of data continuously (such as numerical calculations, simulations, compression, and data processing):

- **`multiprocessing`**:
  - Distributes tasks across multiple CPU cores so computations run simultaneously in real time.
  - Gives each process its own independent Python interpreter and memory space, avoiding GIL limitations and resource-sharing conflicts.
  - Requires careful resource management to avoid excessive memory overhead when spawning multiple processes.

### Combining Concurrency and Parallelism

Complex applications that include both I/O-bound and CPU-bound workloads can combine `asyncio` and `multiprocessing`:

- Use **`asyncio`** to keep the program responsive while waiting on file or network operations.
- Use **`multiprocessing`** to offload heavy CPU computations across multiple processor cores.

### Selecting the Right Approach

Decide whether your program requires concurrency or parallelism early in the design phase (as it is generally easier to add concurrency later than to remove it). Base your choice on the workload profile:

- **Choose Concurrency (`asyncio` or `threading`):** When your application is **I/O-bound** (communicating and waiting on external resources such as disk, databases, or network sockets). Taking advantage of idle wait times allows the program to handle many tasks concurrently.
- **Choose Parallelism (`multiprocessing`):** When your application is **CPU-bound** (performing heavy processing such as data compression, rendering high-definition video, or running complex simulations). Distributing computational tasks across multiple cores maximizes hardware utilization and reduces processing time.

### `asyncio` Events and Task Loops

Python's `asyncio` library enables concurrent execution through **event loops** and **coroutines**:

- **Coroutines:** Functions defined with `async def` that can pause execution (`await`) while waiting for an I/O operation (such as reading or saving data) to complete, yielding control back to the event loop.
- **Event Loops:** Schedule and manage coroutines so long-running I/O operations never block the main application thread.
- **Practical Use Cases:**
  - Sending emails or notifications rapidly without spawning numerous OS threads.
  - Combining `asyncio` with **`aiohttp`** to manage and execute multiple web requests or API calls concurrently.
  - Optimizing data input/output pipelines for high-performance, responsive applications.

### Resources for understanding crashes

- **Blue screen of death (BSoD):** A common disruption in computing systems is the kernel panic in Mac OS, also known as the notorious "Blue Screen of Death" (BSoD) in Windows, both of which require restarting the computer. Although rare, analyzing these occurrences is essential for uncovering OS issues. BSoDs are usually caused by hardware glitches, problematic drivers, or abrupt process terminations. These failure screens display error codes, memory locations, and technical insights related to the crash.
- **Reading system logs:** System logs are crucial for understanding and resolving issues across multiple operating systems. Whether you're using a Mac, Linux, or another system, delving into these logs can yield valuable insights. Analyzing logs is critical for identifying system errors and crashes on Windows computers. The Windows logs such as System and Application carefully record data retrieval events, providing insight into software, hardware, and user interaction.
- **Process Monitor:** Monitoring tools like Process Monitor in Windows provide real-time visibility into file system actions, registry changes, and process behavior. With features from legacy tools such as Regmon and Filemon, Process Monitor captures input/output parameters, uses non-destructive filtering, identifies root causes, and compiles comprehensive process data. This includes details such as image paths, commands, user information, and session IDs. The tool offers customizable columns, flexible filters, and scalable logging to enhance event management. Tooltips provide quick access to log files and reveal process relationships. It also records boot-time operations for comprehensive tracking, troubleshooting, malware detection, and system activity analysis.
- **Linux strace command:** You can use a Linux strace command to trace system calls and signals. It aids in debugging and diagnostics by analyzing application and process behavior. It captures system calls, pinpoints issues, optimizes code, and enhances system performance. You use strace by entering the program's name and any arguments at the command line. This tool logs detailed system call information, enabling you to analyze bottlenecks, unintended behaviors, and misconfigurations. The strace command contributes to a better understanding of OS and application interactions, ultimately leading to efficient software development and effective issue resolution.
- **Tracing system calls:** Tracing system calls on Linux is useful for identifying security risks and tracing system calls, which reveal the intricate interactions between processes and operating systems. You can trace a Linux system call using the ptrace API and the strace command, and you can trace a Mac OS X system call using the dtrace system. Windows uses the GUI tool Process Monitor, and additional projects enhance system call tracing. Tools like Logger, LogView, and NtTrace leverage Microsoft's Event Tracing for Windows (ETW) capabilities. Across operating systems, tracing system calls remains pivotal for development and monitoring, anchoring system analysis and optimization.