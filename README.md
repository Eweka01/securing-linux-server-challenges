# Securing a Linux Server – Challenge Series

This project documents a series of real-world, hands-on challenges I completed to strengthen and secure a Linux server using industry tools and techniques. Each part simulates a unique threat or task from the perspective of both Red and Blue Team operations.

---

## 📂 Project Structure

| Part | Title                                           | Status     |
|------|--------------------------------------------------|------------|
| 1    | Password Cracking with John the Ripper (JTR)    | ✅ Completed |
| 2    | Vulnerability Scanning with Nmap                | 🔜 Upcoming |
| 3    | Hardening the Server with Netfilter & Iptables  |  ✅ Completed  |

---

## 🔓 Part 1 – Password Cracking with John the Ripper

This challenge involved:

- Creating a test Linux user with a known password
- Extracting the user's password hash from `/etc/shadow`
- Identifying the modern `yescrypt` format
- Compiling the **John the Ripper Jumbo** edition to support it
- Cracking the password using a built-in wordlist

📁 See: [`part1-password-cracking-jtr/`](./part1-password-cracking-jtr)

📸 Screenshots included for reference and validation.

---

## 📌 Notes

Each challenge in this repo is structured to demonstrate:
- Clear step-by-step execution
- Screenshots where applicable
- Lessons learned and troubleshooting notes

---

## 🔗 Author

**Gabriel Eweka**  
Cybersecurity | DevSecOps | Cloud Security  
[LinkedIn](https://linkedin.com/in/yourprofile) | [GitHub](https://github.com/yourusername)


