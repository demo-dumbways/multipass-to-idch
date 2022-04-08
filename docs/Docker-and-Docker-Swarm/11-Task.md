---
sidebar_position: 11
---

# 11. Task

import useBaseUrl from '@docusaurus/useBaseUrl';

## 11.1 Instruksi

:::caution
Pastikan untuk melakukan screenshot step by step yang dilakukan, untuk digunakan sebagai dokumentasi tugas.
:::

Setelah mempelajari terkait Docker, Docker-Compose serta Docker Swarm. Maka silahkan buat sebuah environtment dengan ketentuan sebagai berikut:

<center>
<img alt="image1" src={useBaseUrl('img/docs/w12.png')} />
</center>

## Ketentuan
- Buatlah 3 buah server dengan menggunakan multipass dengan spesifikasi 2 cpus 2 mem
- Lakukan Instalasi Docker pada ke 3 buah server yang telah kalian buat
- Server pertama untuk nginx 
- Server kedua untuk aplikasi
- Server ketiga untuk database
- Buatlah docker image untuk aplikasi `frontend` dan `backend`
- Push Docker Images ke docker-hub https://hub.docker.com
- Aplikasi di jalankan menggunakan docker-compose
- Aplikasi dapat berjalan dan dapat melakukan registrasi

## 11.2 Pengumpulan
1. Pastikan untuk mengerjakan tugas mingguan pada medium.com.
2. Tulis step-by-step yang telah Anda lakukan secara detail dan sertakan screenshot setiap prosesnya. 
3. Setelah menyelesaikan tugas, silakan publish artikel yang sudah dibuat.
4. Clone Aplikasi berikut ini ```https://github.com/dumbwaysdev/waysgallery-frontend.git``` | ```https://github.com/dumbwaysdev/waysgallery-frontend.git```

Referensi:
- [Medium](/Getting-Started/Medium/Medium)

## 11.3 Project Management
Tambahkan deskripsi berikut ke dalam kanban pada project management Anda
```
- [ ] Definisikan apa itu Docker menurut pemahamanmu
- [ ] Buat docker images untuk aplikasi frontend dan backend
- [ ] Push images ke docker registry https://hub.docker.com
- [ ] Jalankan aplikasi menggunakan docker-compose
```                                     

Referensi:
- [Membuat GitHub Project](/Getting-Started/Project-Management/Make-Project-Management)
- [Manage GitHub Issue](/Getting-Started/Project-Management/Issue-Dan-Status-Project)

## 11.4 Diskusi
Silakan diskusikan terkait kendala atau kesulitan selama pembelajaran pada platform diskusi (slack/talk.ink) dengan membuat thread, misalnya "Introduction DevOps: problem cannot connect to network in VMware" 