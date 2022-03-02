---
sidebar_position: 4
---

# 4. Setup Docker

import useBaseUrl from '@docusaurus/useBaseUrl';

## 4.1 SetUp Docker command without sudo

Pada tahapan kali ini kita akan mencoba melakukan setup untuk root command `docker` yang akan kita pakai nantinya agar saat kita menggunakan command `docker` tersebut kita sudah tidak perlu menggunakan perintah `sudo`. Untuk tahapnya kalian dapat mengikuti beberapa perintah dibawah ini :

```bash
sudo groupadd docker
```

**keterangan :** perintah di atas ini adalah suatu perintah untuk menambahkan group `docker`

```bash
sudo usermod -aG docker (user)
```

**keterangan :** perintah di atas ini adalah suatu perintah untuk mengizinkan user yang kalian gunakan agar dapat menjalankan perintah `docker` tanpa menggunakan perintah `sudo`

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/doc14.png')} height="400px"/>
  </center>

sekarang kita coba mengakses perintah `docker` ini tanpa menggunakan perintah sudo

```bash
docker ps
```

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/doc15.png')} height="400px"/>
  </center>

## 4.2 Docker Login

**Docker Registry** berfungsi untuk menampung image-image yang telah dibuat oleh docker daemon. Bisa dikatakan seperti repository pada git (public / private).

Karena di tahapan sebelumnya kita sudah melakukan registrasi ke `docker.hub` sekarang kita akan coba untuk melakukan login ke dalam `docker.hub` kita di dalam terminal

```bash
docker login
```

:::info
selanjutnya akan muncul notifikasi untuk memasukkan **user** dari docker.hub kalian setelah itu masukkan juga **password** dari docker.hub kalian
:::

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/doc16.png')} height="400px"/>
  </center>
