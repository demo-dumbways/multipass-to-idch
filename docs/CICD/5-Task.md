---
sidebar_position: 5
---

# 5. Task

import useBaseUrl from '@docusaurus/useBaseUrl';

## 5.1 Instruksi

:::caution
Pastikan untuk melakukan screenshot step by step yang dilakukan, untuk digunakan sebagai dokumentasi tugas.
:::

Setelah mempelajari CI/CD mulai dari instalasi, konfigurasi hingga akhirnya dapat digunakan, maka silakan buat sebuah environment CICD dengan ketentuan sebagai berikut:

<center>
<img alt="image1" src={useBaseUrl('img/docs/w11.png')} />
</center>

### Ketentuan
- Server Gateway : Gunakan untuk deploy nginx
- Server App     : Gunakan untuk deploy aplikasi frontend dan backend serta database MySQL
- Server Jenkins : Gunakan untuk deploy jenkins

## 5.2 Pengumpulan
1. Pastikan untuk mengerjakan tugas mingguan pada medium.com.
2. Tulis step-by-step yang telah Anda lakukan secara detail dan sertakan screenshot setiap prosesnya. 
3. Setelah menyelesaikan tugas, silakan publish artikel yang sudah dibuat.
4. Clone aplikasi berikut ini https://github.com/dumbwaysdev/dumbplay-frontend.git
5. Clone aplikasi berikut ini https://github.com/dumbwaysdev/dumbplay-backend.git

Referensi:
- [Medium](/Getting-Started/Medium/Medium)

## 5.3 Project Management
Tambahkan deskripsi berikut ke dalam kanban pada project management Anda
```
Konfigurasi aplikasi frontend, backend dan database hingga proses CICD

- [ ] Buat 3 buah servers : server gateway untuk nginx, server app untuk aplikasi (frontend, backend, database), server jenkins untuk CICD
- [ ] Proses instalasi frontend, backend dan database serta jenkins wajib menggunakan docker dan docker compose
- [ ] Buatlah reverse proxy untuk frontend, backend dan jenkins (misal frontend = dumbways.xyz, backend = api.dumbways.xyz, jenkins = pipeline.dumbways.xyz)
- [ ] Buat sebuah Jenkinsfile untuk frontend dan backend
- [ ] Buat Jenkins Jobs untuk frontend dan backend
- [ ] Buat git webhook yang mengarah ke url jenkins di localtunnel / domain dan server publik
```

Referensi:
- [Membuat GitHub Project](/Getting-Started/Project-Management/Make-Project-Management)
- [Manage GitHub Issue](/Getting-Started/Project-Management/Issue-Dan-Status-Project)

## 5.4 Diskusi
Silakan diskusikan terkait kendala atau kesulitan selama pembelajaran pada platform diskusi (slack/talk.ink) dengan membuat thread, misalnya "Introduction DevOps: problem cannot connect to network in VMware" 