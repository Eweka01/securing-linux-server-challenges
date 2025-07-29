# Part 1 – Password Cracking with John the Ripper (Yescrypt Hash)

This marks the first stage of my hands-on project: **Securing a Linux Server**.

The focus here was to simulate a real-world password cracking scenario on a modern Linux system using `John the Ripper (Jumbo Edition)`.

---

## 🧱 Objective

- Create a test user on a Linux VM
- Extract the password hash from `/etc/shadow`
- Identify the hashing algorithm (`yescrypt`)
- Compile John the Ripper from source
- Crack the password using a wordlist

---

## 👤 Step 1: Creating a Test User

```bash
sudo useradd adminuser
echo 'adminuser:iloveyou!' | sudo chpasswd
```

The goal was to create a known password that I could attempt to crack. User existence was verified using:

```bash
tail /etc/passwd | grep adminuser
```

---

## 🔐 Step 2: Extracting the Password Hash

```bash
sudo grep adminuser /etc/passwd > passwd_admin.txt
sudo grep adminuser /etc/shadow > shadow_admin.txt
sudo unshadow passwd_admin.txt shadow_admin.txt > adminuser.hash
```

The resulting hash format was identified as `yescrypt` (starts with `$y$`), which isn’t supported by default on most John binaries.

---

## ⚙️ Step 3: Building John the Ripper (Jumbo Edition)

```bash
sudo apt install -y build-essential git libssl-dev zlib1g-dev libbz2-dev libgmp-dev libpcap-dev yasm pkg-config

git clone https://github.com/openwall/john.git
cd john/src
./configure && make -sj$(nproc)
```

This was required to ensure support for yescrypt hashes.

---

## 🧠 Step 4: Cracking the Password

Using John’s internal wordlist:

```bash
cd ../run
./john --wordlist=./password.lst ~/adminuser.hash
```

The password was successfully cracked:

```plaintext
adminuser:iloveyou!
```

---

## ✅ Step 5: Verifying the Cracked Password

```bash
./john --show ~/adminuser.hash
```

John confirmed the password was cracked and saved internally.

---

## 📸 Screenshots

> All screenshots related to this part are located in:  
<img width="1668" height="405" alt="Screenshot 2025-07-29 at 8 36 42 AM" src="https://github.com/user-attachments/assets/94b5244a-2aec-4708-ac19-a4b4e1946d7e" />
<img width="3456" height="2234" alt="Screenshot 2025-07-29 at 8 39 30 AM" src="https://github.com/user-attachments/assets/93dcd9ac-fcf7-4f0a-b518-fb221fd163b4" />
<img width="1655" height="343" alt="Screenshot 2025-07-29 at 9 30 23 AM" src="https://github.com/user-attachments/assets/8edc1a16-9bc1-43d7-9e7b-4206315c2d3b" />
<img width="3456" height="2234" alt="Screenshot 2025-07-29 at 9 37 54 AM" src="https://github.com/user-attachments/assets/5dae0d97-b89b-4f25-9055-c27a6a1642d3" />
<img width="1728" height="181" alt="Screenshot 2025-07-29 at 9 38 18 AM" src="https://github.com/user-attachments/assets/1050298b-a41e-4608-85c9-02658699dc44" />


---

## 💡 Key Takeaways

- Most modern Linux systems now use `yescrypt` hashing
- Building tools from source is often necessary
- Understanding how hashes are stored and processed is critical in offensive and defensive roles
- Always validate the hash format before attempting a crack

---

## 🔜 Next Part: Steganography Detection on Linux

The next part of the project focuses on finding hidden data in files using open-source steganography detection tools.

---

## 🧾 Files in This Directory

- `adminuser.hash` — extracted password hash
- `cracked_output.txt` — cracked password result
- `writeup.md` — this write-up
- `screenshots/` — folder for all visuals
