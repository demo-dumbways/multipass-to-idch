---
sidebar_position: 5
---

# 5. Task

import useBaseUrl from '@docusaurus/useBaseUrl';

## 5.1 Instruksi

:::caution
Pastikan untuk melakukan screenshot step by step yang dilakukan, untuk digunakan sebagai dokumentasi tugas.
:::

Setelah mempelajari deployment aplikasi backend dan database, maka silakan buat sebuah environment linux dengan ketentuan sebagai berikut:

<center>
<img alt="image1" src={useBaseUrl('img/docs/w12.png')} />
</center>

### Ketentuan
- Server App   : Gunakan untuk deploy aplikasi frontend backend dan database MySQL
- Database user: waysgallery
- Database pass: waysgallery123
- Reverse Proxy: api.yourname.studentdumbways.my.id

## 5.2 Pengumpulan
1. Pastikan untuk mengerjakan tugas mingguan pada medium.com.
2. Tulis step-by-step yang telah Anda lakukan secara detail dan sertakan screenshot setiap prosesnya. 
3. Setelah menyelesaikan tugas, silakan publish artikel yang sudah dibuat.
4. Clone Aplikasi berikut ini https://github.com/dumbwaysdev/waysgallery-backend.git

Referensi:
- [Medium](https://ebook.dumbways.id/do-s1-gettingstarted/Getting-Started/Medium/Medium)

## 5.3 Project Management
Tambahkan deskripsi berikut ke dalam kanban pada project management Anda
```
Konfigurasi aplikasi backend dan database hingga proses migrasi database dengan sequelize

- [ ] Definisikan apa itu Database menurut pemahamanmu
- [ ] Jelaskan jenis aplikasi yang harus menggunakan SQL atapun NoSQL
- [ ] Pada server yang telah dibuat sebelumnya, gunakan server app untuk menjalankan aplikasi backend dan database
- [ ] Buat sebuah user baru untuk database waysgallery dengan ketentuan seperti di atas
- [ ] Deploy aplikasi waysgallery backend ke server app dan jalankan menggunakan PM2
- [ ] Buatlah reverse proxy pada server gateway ke server app backend yang sudah di setup
- [ ] Buatlah virtual domain dengan domain api.yourname.studentdumbways.my.id
- [ ] Ubah konfigurasi aplikasi frontend agar mengarah ke aplikasi backend 
- [ ] Ubah konfigurasi aplikasi backend agar mengarah ke aplikasi database
- [ ] Install sequelize untuk migrate database tersebut
- [ ] Aplikasi waysgallery dapat digunakan hingga proses register dan login
```

Referensi:

- [Membuat GitHub Project](https://ebook.dumbways.id/do-s1-gettingstarted/Getting-Started/Project-Management/Make-Project-Management)
- [Manage GitHub Issue](https://ebook.dumbways.id/do-s1-gettingstarted/Getting-Started/Project-Management/Issue-Dan-Status-Project)
- [PM2](https://www.npmjs.com/package/pm2)

## 5.4 Diskusi
Silakan diskusikan terkait kendala atau kesulitan selama pembelajaran pada platform diskusi (slack/talk.ink) dengan membuat thread, misalnya "Introduction DevOps: problem cannot connect to network in VMware" 