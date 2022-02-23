---
sidebar_position: 11
---

# 11. Task

import useBaseUrl from '@docusaurus/useBaseUrl';

## 11.1 Instruksi

:::caution
Pastikan untuk melakukan screenshot step by step yang dilakukan, untuk digunakan sebagai dokumentasi tugas.
:::

Setelah mempelajari terkait konfigurasi dan instalasi linux server, maka silakan buat sebuah environment linux dengan ketentuan sebagai berikut:

<center>
<img alt="image1" src={useBaseUrl('img/docs/w12.png')} />
</center>

### VMware Environment
- Disk       : 10 Gb
- Memory     : 4 Gb
- Processors : 2 Cores
- Network    : Bridge

### Ubuntu Settings
- Bahasa       : English
- Network      : Static
- Storage      : Custom Storage Layout
- Username     : (your-user-name)
- Password     : (your-password)
- Server Name  : (your-name)
- OpenSSH      : True

## 11.2 Pengumpulan
1. Pastikan untuk mengerjakan tugas mingguan pada medium.com.
2. Tulis step-by-step yang telah Anda lakukan secara detail dan sertakan screenshot setiap prosesnya. 
3. Setelah menyelesaikan tugas, silakan publish artikel yang sudah dibuat.
4. Clone Aplikasi berikut ini https://github.com/dumbwaysdev/waysgallery-frontend.git

Referensi:
- [Medium](/Getting-Started/Medium/Medium)

## 11.3 Project Management
Tambahkan deskripsi berikut ke dalam kanban pada project management Anda
```
Konfigurasi environment dan instalasi linux server, dimana server tersebut dapat terkoneksi ke internet dan juga dapat di akses melalui SSH / Browser.

- [ ] Definisikan apa itu DevOps menurut pemahamanmu
- [ ] Buatlah environment untuk server (CPU, Memory, Storage dan Network)
- [ ] Install linux ubuntu server 18.x / 20.x dengan VMware
- [ ] Gunakan IP static untuk linux ubuntu server
- [ ] Buat swap memory and root partition
- [ ] Local server dapat terkoneksi dengan internet
- [ ] Remote server
- [ ] Jalankan aplikasi menggunakan PM2 agar aplikasi dapat dijalankan secara daemon
```

Referensi:
- [Membuat GitHub Project](/Getting-Started/Project-Management/Make-Project-Management)
- [Manage GitHub Issue](/Getting-Started/Project-Management/Issue-Dan-Status-Project)
- [PM2](https://www.npmjs.com/package/pm2)

## 11.4 Diskusi
Silakan diskusikan terkait kendala atau kesulitan selama pembelajaran pada platform diskusi (slack/talk.ink) dengan membuat thread, misalnya "Introduction DevOps: problem cannot connect to network in VMware" 