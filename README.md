### **Dotfiles by Raeid-U**

**Personal dotfiles repository** containing my shell configurations, editor settings, and custom scripts for an optimized development workflow.

**GitHub:** [Raeid-U](https://github.com/Raeid-U)

---

## **Contents**
- **Shell Configs**
  - `.bashrc` – Custom shell aliases, functions, and environment settings
  - `.bash_profile` – Startup configurations for login shells
- **Editor Settings**
  - **Zed Editor** – Personalized settings and keybindings
- **Custom Scripts**
  - Scripts stored in `scripts/` to enhance productivity
  - Includes `ascii_welcome.sh` and other utilities

---

## **Installation**
To back up or apply these dotfiles on a new machine:
```bash
git clone https://github.com/Raeid-U/dotfiles.git ~/dotfiles
cd ~/dotfiles
```
Then manually link files or copy them to your home directory:
```bash
ln -sf ~/dotfiles/.bashrc ~/.bashrc
ln -sf ~/dotfiles/.bash_profile ~/.bash_profile
```
For scripts, ensure they are executable:
```bash
chmod +x ~/dotfiles/scripts/*.sh
```

---

## **Usage**
- **Reload `.bashrc` without restarting:**
  ```bash
  source ~/.bashrc
  ```
- **Run custom scripts:**
  ```bash
  ~/dotfiles/scripts/ascii_welcome.sh
  ```

---
