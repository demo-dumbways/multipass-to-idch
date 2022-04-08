---
sidebar_position: 6
---

# 6. Task

import useBaseUrl from '@docusaurus/useBaseUrl';

## 6.1 Instruksi

:::caution
Pastikan untuk melakukan screenshot step by step yang dilakukan, untuk digunakan sebagai dokumentasi tugas.
:::

Setelah mempelajari bagaimana cara monitoring bekerja. Maka silahkan buat environtment monitoring sebagai berikut:

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/mon59.png')}/>
  </center>

### Ketentuan
- Server App   : Gunakan untuk deploy aplikasi frontend 
- Monitoring   : Install beberapa tools untuk memonitoring suatu server dalam bentuk Docker
- Monitoring grafana menampilkan penggunaan
  - cpu
  - memory
  - network
  - storage

- Reverse Proxy: 
  - Node-exporter : exporter.(name).dumbways.xyz
  - Prometheus    : prometheus.(name).dumbways.xyz
  - Grafana       : monitoring.(name).dumbways.xyz

## 6.2 Pengumpulan
1. Pastikan untuk mengerjakan tugas mingguan pada medium.com.
2. Tulis step-by-step yang telah Anda lakukan secara detail dan sertakan screenshot setiap prosesnya. 
3. Setelah menyelesaikan tugas, silakan publish artikel yang sudah dibuat.

Referensi:
- [Medium](/Getting-Started/Medium/Medium)

## 6.3 Project Management
Tambahkan deskripsi berikut ke dalam kanban pada project management Anda
```
- [ ] Definisikan apa itu Monitoring menurut pemahamanmu
- [ ] Jelaskan mengapa perlu memonitoring suatu server
- [ ] Instalasi Monitoring Node-exporter
- [ ] Instalasi Monitoring Prometheus
- [ ] Instalasi Monitoring Grafana
- [ ] Buatlah reverse proxy pada server gateway ke server monitoring yang telah di setup
- [ ] Buatlah virtual domain dengan menggunakan nama domain seperti ketentuan pada bagian task
```

Referensi:
- [Membuat GitHub Project](/Getting-Started/Project-Management/Make-Project-Management)
- [Manage GitHub Issue](/Getting-Started/Project-Management/Issue-Dan-Status-Project)

## 6.4 Diskusi
Silakan diskusikan terkait kendala atau kesulitan selama pembelajaran pada platform diskusi (slack/talk.ink) dengan membuat thread, misalnya "Introduction DevOps: problem cannot connect to network in VMware" 