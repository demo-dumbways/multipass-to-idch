---
sidebar_position: 4
---

# 4. Set-up Frontend

import useBaseUrl from '@docusaurus/useBaseUrl';

Sekarang kita akan melakukan set-up aplikasi Front-End `Node.JS` untuk melakukannya kalian dapat mengikuti langkah-lagkah dibawah ini.

- Tahapan pertama kita akan melakukan instalasi `Node.JS` di server kita menggunakan `nvm`.
- `nvm` merupakan singkatan dari **Node Version Manager**. `nvm` adalah sebuah program yang akan membantu kita untuk menggunakan lebih dari satu versi Nodejs di dalam satu komputer. Untuk melakukan installasi `Node.JS` menggunakan `nvm` kalian dapat menggunakan perintah berikut :

  ```shell
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash
  ```

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/f1.png')} height="400px"/>
  </center>

  ```shell
  exec bash
  ```

  ```shell
  nvm install 14
  ```

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/f2.png')} height="400px"/>
  </center>

  **keterangan :** perintah di atas berguna untuk menginstall **Node.JS** dengan `versi 14`. Jika kalian ingin menggunakan **Node.JS** dengan `versi 16`, maka Jalankan perintah `nvm install 16`.

- Jika kalian sudah menjalankan beberapa perintah di atas, kalian dapat memeriksa `Node.JS` kalian menggunakan perintah berikut ini

  ```shell
  node -v
  ```

  ```shell
  npm -v
  ```

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/f3.png')} height="400px"/>
  </center>

- Sekarang kita akan menjalankan aplikasi `Node.JS`. Untuk menjalankanya kalian dapat menggunakan perintah dibawah ini.

  ```shell
  git clone https://github.com/dumbwaysdev/dumbplay-frontend.git
  ```

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/f4.png')} height="400px"/>
  </center>

  ```shell
  cd dumbplay-frontend
  ```

  ```shell
  npm install
  ```

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/f5.png')} height="400px"/>
  </center>

  **keterangan :** perintah di atas ini bertujuan untuk meng-install module dari aplikasi `Node.JS`

  ```shell
  npm start
  ```

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/f6.png')} height="400px"/>
  </center>

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/f7.png')} height="400px"/>
  </center>

  **keterangan :** perintah di atas ini bertujuam untuk menjalankan aplikasi `Node.JS`

- Sekarang kita coba akses browser kita, lalu masukkan **IP** dari server multipass kalian setelah itu masukkan port aplikasi

  http://10.206.130.20:3000

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/f8.png')} height="400px"/>
  </center>
