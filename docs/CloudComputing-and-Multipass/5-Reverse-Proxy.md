---
sidebar_position: 5
---

# 5. Reverse Proxy

import useBaseUrl from '@docusaurus/useBaseUrl';

## 5.1 Apa itu Reverse Proxy?

**Reverse proxy** adalah konfigurasi standar yang digunakan untuk mengubah jalur traffic, misalkan aplikasi menggunakan `PORT 3000` tetapi kita ingin mengakses menggunakan `PORT 80` agar dapat di akses melalui `PORT 80` maka kita perlu menggunakan reverse proxy.

Berikut adalah konfigurasi dari **revese proxy**.

```shell
server {
    server_name domain.com;

    location / {
             proxy_pass http://127.0.0.1:3000;
    }
}
```

## 5.2 Kenapa Menggunakan Reverse Proxy?

Untuk mengamankan aplikasi yang berjalan pada server maka kita perlu untuk melakukan reverse proxy, supaya pengguna tidak dapat mengakses aplikasi kita secara langsung.

## 5.3 Reverse Proxy Frontend Application

Untuk membuat reverse proxy dapat mengikuti langkah-langkah berikut :

- Tahapan pertama kita harus melakukan instalasi web.server `Nginx` terlebih dahulu.

  ```shell
  sudo apt install nginx
  ```

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/f9.png')} height="400px"/>
  </center>

  Lalu nanti akan muncul notifikasi **Do you want to continue? [Y/n]** kalian ketik saja **Y**. Jika sudah maka instalasi akan berjalan.

- Selanjutnya kita akan membuat suatu file konfigurasi, untuk membuatnya kalian dapat menggunakan perintah di bawah ini.

  ```shell
  cd /etc/nginx
  ```

  ```shell
  sudo mkdir (Directory name)
  ```

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/f10.png')} height="400px"/>
  </center>

- Selanjutnya masuk ke dalam directory yang sudah kalian buat, lalu buatlah suatu file di dalam directory tersebut.

  ```shell
  cd (Directory name)
  ```

  ```shell
  sudo nano (Your file name)
  ```

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/f11.png')} height="400px"/>
  </center>

- Setelah itu masukkan konfigurasi berikut ini.

  ```shell
  server {
        server_name mydomain.xyz;

        location / {
                 proxy_pass http://127.0.0.1:3000;
        }
  }
  ```

  :::info
  Pada bagian **server_name** pastikan telah sesuai dengan nama domain yang kalian inginkan, pada bagian Proxy juga pastikan telah sesuai dengan **IP** dan **PORT** dari server dan aplikasi kalian.
  :::

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/f12.png')} height="400px"/>
  </center>

- Tahapan selanjutnya adalah kita akan menambahkan konfigurasi di dalam file `nginx.conf`
- Selanjutnya pergi ke-bagian **include**, setelah itu masukan lokasi dari directory yang bersi konfigurasi yang sudah kalian buat tadi.

  ```shell
  sudo nano nginx.conf
  ```

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/f13.png')} height="400px"/>
  </center>

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/f14.png')} height="400px"/>
  </center>

  :::info
  `/*;` menandakan file `nginx.conf` akan membaca seluruh file yang berada di dalam directory **dumbways**.
  :::

- Jika sudah sekarang kita akan coba cek apakah konfigurasi yang sudah kita buat terdapat eror atau tidak. Kalian dapat menggunakan perintah di bawah ini.

  ```shell
  sudo nginx -t
  ```

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/f15.png')} height="400px"/>
  </center>

- Jika ternyata tidak ada eror tahapan selanjutnya adalah kita akan melakukan restart untuk nginx kita.

  ```shell
  sudo systemctl restart nginx
  ```

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/f18.png')} height="400px"/>
  </center>

- Sekarang kita akan membuat sebuah virtual host. Untuk membuat virtual host kita harus masuk ke local server kita setelah itu masuk ke dalam file `/etc/hosts`.

  ```shel
  sudo nano /etc/hosts
  ```

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/f16.png')} height="400px"/>
  </center>

- Setelah itu masukkan IP server kita selanjutnya masukkan nama domain yang kalian inginkan.

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/f17.png')} height="400px"/>
  </center>

- Jika sudah sekarang Jalankan aplikasi yang sudah kalian clone sebelumnya.

  ```shell
  cd dumbplay-frontend
  ```

  ```shell
  npm start
  ```

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/f6.png')} height="400px"/>
  </center>

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/f7.png')} height="400px"/>
  </center>

- Sekarang kita akan coba akses melalui web browser, selanjutnya akses nama domain yang sudah kita buat.

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/f19.png')} height="400px"/>
  </center>
