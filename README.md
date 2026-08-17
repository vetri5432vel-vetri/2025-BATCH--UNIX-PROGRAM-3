# UNIX PRACTICAL – CREATE A DIRECTORY IN LINUX

## Aim

To create a directory on a Linux machine using the mkdir command.

---

## Algorithm

Step 1: Open the Terminal on your Linux machine.

Step 2: Create a directory using the mkdir command.

Step 3: Create a directory along with its parent directories using the -p option.

Step 4: Create multiple directories using the mkdir command.

Step 5: Verify the directory creation using the ls command.

Step 6: Close the terminal.

---

# Commands

## 1. Create a Single Directory

Use:

mkdir bscit

---

## 2. Create Parent Directories

Use:

mkdir -p /home/user/my_folder/sub_folder

---

## 3. Create Multiple Directories

Use:

mkdir projects documents downloads

---

## 4. Verify Directory Creation

Use:

ls

---

# Student Task

Complete the file:

mkdir_practical.sh

Your program must contain the following operations:

1. Create the directory bscit.
2. Create the parent directories using mkdir -p.
3. Create projects, documents and downloads.
4. Verify the directories using ls.

---

# Linux VM Practical

Open your CentOS/Linux Virtual Machine.

Execute:

mkdir bscit

Then:

mkdir -p /home/user/my_folder/sub_folder

Then:

mkdir projects documents downloads

Finally:

ls

Verify that the directories have been created.

---

# GitHub Submission

1. Open mkdir_practical.sh.
2. Complete the program.
3. Save the file.
4. Commit your changes.
5. Push the changes to GitHub.
6. Open the Actions tab.
7. Wait for the autograder to complete.
8. Check whether the result is PASS.

---

# GitHub Actions

Go to:

Repository
↓
Actions
↓
Unix Practical - Create Directory

The autograder will automatically test your program.

Successful submission:

RESULT: PASS

If the result is FAIL:

1. Read the error message.
2. Correct mkdir_practical.sh.
3. Commit the changes.
4. Push again.
5. Check GitHub Actions again.

---

# Important

Do not modify:

tests/test_mkdir.sh

.github/workflows/autograde-mkdir.yml

Only modify:

mkdir_practical.sh

---

# Screenshot Submission

Submit the following screenshots in Google Classroom:

## Screenshot 1

Linux terminal showing the commands and the result of:

ls

The created directories should be visible.

## Screenshot 2

GitHub Actions showing:

RESULT: PASS

---

# Marks

| Test | Marks |
|---|---:|
| Create bscit directory | 2 |
| Create parent directories using -p | 3 |
| Create multiple directories | 2 |
| Verify using ls | 2 |
| Successful execution | 1 |
| Total | 10 |

---

# Submission Checklist

- [ ] Completed mkdir_practical.sh
- [ ] Created bscit
- [ ] Created parent directories
- [ ] Created projects
- [ ] Created documents
- [ ] Created downloads
- [ ] Used ls for verification
- [ ] Performed the practical in Linux VM
- [ ] Committed changes to GitHub
- [ ] Pushed changes
- [ ] GitHub Actions executed
- [ ] RESULT: PASS obtained
- [ ] Linux screenshot taken
- [ ] GitHub Actions screenshot taken
- [ ] Screenshots submitted in Google Classroom

Total Marks: 10
