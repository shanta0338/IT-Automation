file = open(r"D:\Notepad\Git Commands.txt")
print(file.readline())
print(file.read())
file.close()
with open(r"D:\Notepad\Git Commands.txt") as file:
    print(file.readline())