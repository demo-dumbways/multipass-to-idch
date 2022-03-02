---
sidebar_position: 1
---

# 1. Docker

import useBaseUrl from '@docusaurus/useBaseUrl';

**Docker** adalah perangkat lunak yang dapat digunakan untuk membuat, menguji dan menerapkan aplikasi dengan cepat. Docker menjadikan perangkat lunak ke dalam unit yang disebut container, dimana di dalamnya memiliki semua yang diperlukan perangkat lunak agar dapat berfungsi termasuk aplikasi dan dependencies.

## 1.1 Kenapa Docker?

Karena **Docker** sebagai alat virtualisasi yang sangat mengunggulkan efisiensi penggunaan resource hardware. Penggunaan resource hardware pada docker sangat efisien, dan tidak memakan banyak resource, sehingga ketika menjalankan banyak container pada seluruh host docker, host masih mampu menanganinya. Serta aplikasi kita pun menjadi lebih terisolasi.

## 1.2 Docker Architecture

<center>
<img alt="image1" src={useBaseUrl('img/docs/doc1.png')} />
</center>

- **Docker daemon** merupakan kumpulan fungsi yang dapat membuat, mendistribusikan file images. Dimana kita hanya bisa mengakses melalui docker client (CLI).

- **Docker registry** berfungsi untuk menampung image-image yang telah dibuat oleh docker daemon. Bisa dikatakan sama seperti repository pada git (public / private).

## 1.3 Docker Account Registration

Untuk melakukan registrasi kalian dapat mengikuti langkah-langkah dibawah ini.

- Untuk melakukan registrasi kalian dapat klik link di bawah ini

  **LINK Hub.Docker : [Docker](https://hub.docker.com/signup)**

- Selanjutnya masukkan **username**,**email**, dan **password** yang kalian inginkan

<center>
<img alt="image1" src={useBaseUrl('img/docs/doc2.png')} />
</center>

- Setelah itu kalian akan di alihkan ke dalam halaman seperti gambar dibawah ini
- Selanjutnya masukkan **username/email** yang kalian gunakan tadi

<center>
<img alt="image1" src={useBaseUrl('img/docs/doc3.png')} />
</center>

- Setelah itu masukkan **password** yang telah kalian setup sebelumnya

<center>
<img alt="image1" src={useBaseUrl('img/docs/doc5.png')} />
</center>

- Tahapan selanjutnya cek di email kalian apakah ada email masuk dari docker untuk melakukan verifikasi.
- Jika ada email masuk langsung saja tekan `Verify email address`

<center>
<img alt="image1" src={useBaseUrl('img/docs/doc4.jpg')} />
</center>

- Setelah itu kalian coba refresh web.browser kalian. Setelah itu maka kalian telah berhasil untuk melakukan registrasi pada docker.hub

<center>
<img alt="image1" src={useBaseUrl('img/docs/doc6.png')} />
</center>
