---
sidebar_position: 3
---

# 3. Multipass

import useBaseUrl from '@docusaurus/useBaseUrl';

**Multipass** adalah sebuah tools yang dapat memudahkan Anda untuk menjalankan versi Ubuntu yang diperlukan secara virtual. Multipass dirancang untuk pengembang yang menginginkan lingkungan Ubuntu dengan satu perintah.

Multipass dapat berjalan seperti membuat cloud computing, tapi pada local komputer Anda seperti :

- Membuat server baru
- Mengatur spesifikasi server yang dibuat
- Mengatur keamanan server
- Mengatur load balance
- Dan sebagainya

Kebutuhan minimum :

- CPU i3 - 3115C (mendukung virtualisasi)
- Memory 8 Gb
- Sistem operasi linux ubuntu 18.04

## Kenapa Menggunakan Multipass?

Karena `Multipass` lebih ringan dibandingkan dengan vmware, serta sistem yang digunakanpun berbasis command line. Sedangkan untuk `vmware` berbasis gui dimana memakan lebih banyak resource ketika dijalankan.

## 3.1 Multipass Installation

Untuk Melakukan instalasi multipass kalian dapat menggunakan beberapa perintah dibawah ini.

- Pertama-tama kalian harus melakukan installasi package manager ubuntu yaitu `snap`.

  ```shell
  sudo apt install snapd
  ```

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/m1.png')} height="350px"/>
  </center>

- Tahapan selanjutnya adalah kita akan melakukan installasi `multipass` menggunakan package manager `snap` yang sudah kalian intall sebelumnya.
- Untuk melakukan installasi multipass kalian dapat menggunakan perintah dibawah ini.

  ```shell
  sudo snap install multipass
  ```

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/m2.png')} height="350px"/>
  </center>

- Jika kalian sudah menjalankan beberapa perintah di atas ini, kalian dapat memeriksa version dari multipass yang kalian gunakan menggunakan perintah di bawah ini.

  ```shell
  multipass version
  ```

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/m+.png')} height="350px"/>
  </center>

## 3.2 Multipass Command

- Untuk membuat suatu virtual machine kalian dapat menggunakan perintah di bawah ini.

  ```shell
  multipass launch --name (your-name)
  ```

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/m3.png')} height="350px"/>
  </center>

- Kalian juga dapat melakukan customisasi virtual machine yang ingin kalian buat. Contoh seperti gambar di bawah ini.

  ```shell
  multipass launch --name (your-name) --cpus 1 --mem 1G
  ```

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/m4.png')} height="350px"/>
  </center>

  **keterangan :** perintah di atas ini adalah suatu perintah untuk membuat virtual machine dengan cpu 1 core serta menggunakan memory sebesar 1Gb.

- Untuk melihat virtual machine dan IP yang digunakan dari virtual machine yang kalian buat, kalian dapat menggunakan perintah di bawah ini.

  ```shell
  multipass ls
  ```

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/m5.png')} height="350px"/>
  </center>

- Kalian juga dapat menjalankan suatu perintah dari local kalian untuk di jalankan di server kalian. Contoh seperti perintah dibawah ini.

  ```shell
  multipass exec (Your server name) -- lsb_release -a
  ```

  ```shell
  multipass exec (Your server name) -- ls -la
  ```

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/m6.png')} height="350px"/>
  </center>

- Selanjutnya untuk masuk ke dalam server yang sudah kalian buat, kalian dapat menggunakan perintah dibawah ini.

  ```shell
  multipass shell (Your server name)
  ```

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/m7.png')} height="350px"/>
  </center>

- Selanjutnya ini adalah cara untuk menghentikan Virtual machine yang sudah kalian buat.

  ```shell
  multipass stop (Your server name)
  ```

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/m8.png')} height="350px"/>
  </center>

- Lalu jika kalian ingin menjalankan kembali virtual machine yang sudah kalian hentikan, kalian dapat menggunakan perintah berikut ini.

  ```shell
  multipass start (Your server name)
  ```

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/m9.png')} height="350px"/>
  </center>

- Selanjutnya perintah di bawah ini adalah perintah untuk mengahapus virtual machine yang sudah kalian buat.

  ```shell
  multipass delete (Your server name)
  ```

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/m10.png')} height="350px"/>
  </center>

- Kalian juga bisa menghapus server kalian yang sudah tidak terpakai, untuk melakukan hal tersebut kalian dapat menggunakan perintah di bawah ini.

  ```shell
  multipass purge
  ```

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/m11.png')} height="350px"/>
  </center>

- Untuk memeriksa informasi dari multipass server kalian, kalian dapat menggunakan perintah di bawah ini.

  ```shell
  multipass info (Your name server)
  ```

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/m12.png')} height="350px"/>
  </center>

- Kalian juga dapat meng-alokasikan local directory/file kalian ke dalam server. Untuk melakukankannya kalian dapat menggunakan perintah di bawah ini.

  ```shell
  multipass mount (file/directory name) (name server):/home/ubuntu/(location)
  ```

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/m13.png')} height="350px"/>
  </center>

- Kalian juga dapat memulihkan server yang sudah di hapus. Untuk melakukannya kalian dapat menggunakan perintah dibawah ini.

  ```shell
  multipass recover (Your server name)
  ```

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/m14.png')} height="350px"/>
  </center>
