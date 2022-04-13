---
sidebar_position: 4
---

# 4. Set-up Backend

import useBaseUrl from '@docusaurus/useBaseUrl';

Sekarang kita akan melakukan set-up aplikasi Backend `Node.JS` untuk melakukannya kalian dapat mengikuti langkah-lagkan dibawah ini.

- Sekarang kita masuk ke dalam server yang telah kita buat di hari lalu pada saat kita belajar tentang setup frontend

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/cloud9.png')} />
  </center>

- Karena kemarin kita telah melakukan instalasi `node.js`, maka sekarang kita sudah tidak perlu untuk melakukan installasinya kembali, untuk make sure apakah `node.js` telah terinstall gunakan perintah di bawah ini

  ```shell
  node -v
  ```

  ```shell
  npm -v
  ```

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/bck6.png')} height="400px"/>
  </center>

- Sekarang kita akan menjalankan aplikasi backend. Untuk menjalankanya kalian dapat menggunakan perintah dibawah ini.

  ```shell
  git clone https://github.com/dumbwaysdev/dumbplay-backend.git
  ```

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/bck7.png')} height="400px"/>
  </center>

- Setelah itu masuk ke dalam directory tersebut setelah itu jalankan perintah di bawah ini.

  ```shell
  cd dumbplay-backend
  ```

  ```shell
  npm install
  ```

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/bck8.png')} height="400px"/>
  </center>

- Selanjutnya kita akan melakukan instalasi `sequelize cli`.
- **Sequelize** adalah sebuah `ORM (Object Relationship Mapping)` yang berbasis promise jadi secara tidak langsung `ORM` dapat bertindak sebagaimana database dapat memigrasi sebuah table maupun data dari backend ke server database yang telah kita buat, dan **Sequelize** dapat mendukung database berbasis `SQL`.

  ```shell
  npm install -g sequelize cli
  ```

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/bck9.png')} height="400px"/>
  </center>

- Setelah itu kita akan coba memastikan apakah `sequelize cli` telah terinstall atau tidak

  :::info
  jika muncul notifikasi seperti dibawah ini artinya sequelize telah berhasil kalian install
  :::

  ```shell
  sequelize -version
  ```

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/bck10.png')} height="400px"/>
  </center>

- Sebelum kita melakukan migrasi kita harus melakukan konfigurasi di dalam file config/config.json

  ```shell
  cd config
  ```

  ```shell
  sudo nano config.json
  ```

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/bck11.png')} height="400px"/>
  </center>

- Selanjutnya kita akan ubah konfigurasi pada bagian `Development`, setelah itu sesuaikan dengan **user**, **password**, **database**, **host** server database yang telah kalian buat sebelumnya

  - **user** adalah user dari mysql kalian
  - **password** adalah password dari user mysql kalian
  - **database** adalah nama database yang telah kalian buat
  - **host** adalah alamat dari server database kalian

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/bck12.png')} height="400px"/>
  </center>

- Setalah itu kita akan menyalin file `.env-copy` lalu kita rubah nama file tersebut menjadi `.env`.

  ```shell
  cp .env-copy .env
  ```

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/bck13.png')} height="400px"/>
  </center>

- Jika kalian telah selesai melakukan konfigurasi di atas, tahapan selanjutnya adalah kita akan melakukan migrasi data dari server **backend** kita ke server **database** yang telah kita buat. Untuk melakukan migrasi kalian dapat menggunakan perintah dibawah ini :

  ```shell
  npx sequelize db:migrate
  ```

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/bck14.png')} height="400px"/>
  </center>

- Jika kalian telah berhasil melakukan migrasi, sekarang kita akan coba lihat ke dalam server database kita untuk memastikan apakah datanya behasil tereksekusi atau tidak.

  ```shell
  mysql -u (user) -p
  ```

  ```shell
  show databases;
  ```

  ```shell
  use (db-name);
  ```

  ```shell
  show tables;
  ```

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/bck15.png')} height="400px"/>
  </center>

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/bck16.png')} height="400px"/>
  </center>

- Jika semua tahapan telah selesai sekarang kita akan mencoba menjalankan aplikasi tersebut.

  ```shell
  npm start
  ```

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/bck111.png')} height="400px"/>
  </center>

- Setelah itu kita coba akses melalu web browser kita dengan mengetikan akses point beserta port seperti di bawah ini.

```bash
  10.206.130.205:5000
```

:::info
aplikasi backend ini berjalan di atas port 5000
:::

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/bck17.png')} height="400px"/>
  </center>

- Sekarang kita coba untuk mengkoneksikan aplikasi frontend kita pada pertemuan sebelumnya agar bisa dapat terkoneksi dengan server backend dan database kita.

  ```shell
  sudo nano src/config/api.js
  ```

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/bck18.png')} height="400px"/>
  </center>

- Selanjutnya ubah pada bagian `baseURL` sesuaikan dengan lokasi dari Server backend kalian.

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/bckk.png')} height="400px"/>
  </center>

- Sekarang kita coba jalankan aplikasi frontend.

  ```shell
  npm start
  ```

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/f6.png')} height="400px"/>
  </center>

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/f7.png')} height="400px"/>
  </center>

- Sekarang kita coba akses di web server kita setelah itu kalian coba untuk melakukan register.

```bash
  10.206.130.20:3000
```

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/bck20.png')} height="400px"/>
  </center>

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/bck21.png')} height="400px"/>
  </center>

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/bck22.png')} height="400px"/>
  </center>
