---
sidebar_position: 6
---

# 6. Task

import useBaseUrl from '@docusaurus/useBaseUrl';

## 6.1 Instruksi

:::caution
Pastikan untuk melakukan screenshot step by step yang dilakukan, untuk digunakan sebagai dokumentasi tugas.
:::

Setelah mempelajari terkait materi multipass, deployment aplikasi `Node.JS` dan reverse proxy, maka silakan buat sebuah environment linux dengan ketentuan sebagai berikut:

<center>
<img alt="image1" src={useBaseUrl('img/docs/w12.png')} />
</center>

### Ketentuan

- Multipass : 2 Server (1 Server Gateway, 1 Server App)
- CPU : 1 vCPU
- Memory : 1 GB
- Disk : 10 GB
- Reverse Proxy: dumbways.xyz

## 6.2 Pengumpulan

1. Pastikan untuk mengerjakan tugas mingguan pada medium.com.
2. Tulis step-by-step yang telah Anda lakukan secara detail dan sertakan screenshot setiap prosesnya.
3. Setelah menyelesaikan tugas, silakan publish artikel yang sudah dibuat.
4. Gunakan aplikasi berikut untuk tugas https://github.com/dumbwaysdev/waysgallery-frontend.git

Referensi:

- [Medium](/Getting-Started/Medium/Medium)

## 6.3 Project Management

Tambahkan deskripsi berikut ke dalam kanban pada project management Anda

```
Membuat server dengan custom server, hingga melakukan proses instalasi dan konfigurasi aplikasi frontend hingga dapat diakses

- [ ] Definisikan apa itu Cloud Computing menurut pemahamanmu
- [ ] Sebutkan alasan menggunakan Multipass dibandingkan dengan Vagrant
- [ ] Buat 2 buat server menggunakan multipass dengan ketentuan 1 vCPU, 1 GB Memory, Disk 10 GB
- [ ] Install NVM pada salah satu server (server app)
- [ ] Deploy aplikasi waysgallery ke server app dan jalankan menggunakan PM2
- [ ] Install Nginx pada salah satu server (server gateway)
- [ ] Buatlah reverse proxy pada server gateway ke server app
- [ ] Buatlah virtual domain dengan domain dumbways.xyz
```

Referensi:

- [Membuat GitHub Project](/Getting-Started/Project-Management/Make-Project-Management)
- [Manage GitHub Issue](/Getting-Started/Project-Management/Issue-Dan-Status-Project)
- [PM2](https://www.npmjs.com/package/pm2)

## 6.4 Diskusi

Silakan diskusikan terkait kendala atau kesulitan selama pembelajaran pada platform diskusi (slack/talk.ink) dengan membuat thread, misalnya "Introduction DevOps: problem cannot connect to network in VMware"
