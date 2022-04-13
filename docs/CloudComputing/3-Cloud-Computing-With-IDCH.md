---
sidebar_position: 3
---

# 3. IdCloudHost

import useBaseUrl from '@docusaurus/useBaseUrl';

**IdCloudhost** adalah sebuah platoform as a service yang sangat populer di indonesia. dan mempunyai banyak sekali fitur yang dapat kita gunakan untuk membuat suatu server maupun melakukan instalasi suatu aplikasi ke dalam server kita dengan menggunakan fitur **App Catalog**. 

## Kenapa menggunakan IdCloudhost?
Karena dengan menggunakan IdCloudhost ini kita dapat membuat suatu server dengan sangat mudah dan kita juga dapat menggunakan platform IdCloudhost ini seperti contoh dibawah ini:

- Membuat server baru
- Mengatur spesifikasi server yang dibuat
- Mengatur load balance
- Melakukan SetUp Floating IP
- Membuat Virtual Private Cloud
- Dan sebagainya

## 3.1 Registration
Untuk menggunakan platform dari **IdCloudhost** pertama-tama kalian harus melakukan registrasi terlebih dahulu. Jika kalian telah melakukan registrasi alangkah baiknya kalian langsung melakukan konfirmasi kepada mentor kalian agar kalian dapat mengakses IdCloudhost dengan menggunakan user yang sudah disediakan oleh Dumbways.id

- [Registration](https://console.idcloudhost.com/hub/login#signup)

## 3.2 Create Server With IdCloudhost

- Pertama-tama lakukan login pada platform IDCH (IdCloudhost)

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/cloud1.png')} />
  </center>

- Setelah itu masuk ke dalam profile kalian.
- Lalu Accept invitation yang ada.

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/cloud2.png')} />
  </center>

- Jika sudah tekan `access user`.

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/cloud3.png')} />
  </center>

- Lalu nanti kalian akan secara langsung di arahkan ke user yang telah kami sediakan.
- Sekarang kita akan coba untuk membuat server. Kalian dapat klik menu pada bagian `create virtual machine`
  
  <center>
  <img alt="image1" src={useBaseUrl('img/docs/cloud4.png')} />
  </center>

- Jika sudah kalian akan di alihkan ke halaman seperti di bawah ini, nah disini kalian dapat memilih ingin menggunakan Operating System apa, tapi disini kita coba untuk menggunakan Ubuntu 21.04.

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/cloud5.png')} />
  </center>

- Kita juga dapat memilih spesifikasi server apa yang ingin kita gunakan, kita juga dapat melakukan customisasi spesifikasi server yang kita inginkan sesuai yang kita butuhkan.
- Untuk location data center kalian bebas ingin menggunakan dimana, tapi disini kita akan pakai defaultnya saja yang berlokasi di South-Jakarta

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/cloud6.png')} />
  </center>

- Checklist bagian public IP agar server kalian mendapatkan IP public.
- Untuk VPC Network kalian dapat memilih ingin menggunakan Floating IP atau VPC 
    - Floating IP adalah dimana nantinya server yang kalian buat nanti akan mendapatkan 2 buah IP address yang bersifat Public dan Private.
    - VPC adalah dimana server yang kalian buat hanya akan mendapatkan IP Private saja.
- Selanjutnya kalian bisa melakukan Setup username, password, dan hostname yang kalian inginkan, Jika semua telah terasa sesuai kalian dapat klik tombol `create`. Maka server yang sudah kalian akan secara langsung melakukan build.

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/cloud7.png')} />
  </center>

## 3.3 SSH To Server

- Sekarang kita akan coba masuk ke dalam server yang telah kita buat.
- Kalian dapat pergi ke menu compute, setelah itu klik untuk melihat informasi dari server kalian.

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/cloud8.png')} />
  </center>

- Setelah itu copy IP Public kalian.
- Lalu buka terminal kalian. Lalu masukan perintah seperti dibawah ini, lalu masukkan password yang telah kalian setup sebelumnya.

  ```bash
  ssh username@youripaddress
  ```

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/cloud9.png')} />
  </center>