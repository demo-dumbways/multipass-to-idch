---
sidebar_position: 3
---

# 3. Node Exporter

import useBaseUrl from '@docusaurus/useBaseUrl';

**Node Eksporter** adalah perangkat lunak yang di gunakan tepat di samping aplikasi yang ingin diperoleh metriknya. dengan kata lain Node Eksporter berfungsi untuk mengambil suatu informasi yang nantinya akan diterima oleh sistem monitoring seperti `Prometheus`, mengumpulkan data yang diperlukan dari aplikasi, mengubahnya menjadi format yang lebih mudah, kemudian mengembalikannya sebagai respons terhadap sistem monitoring.

## 3.1 Node Exporter Installation

Sekarang kita akan melakukan instalasi **node exporter** untuk landasan monitoring server dengan prometheus dan grafana yang akan kita buat nantinya. Untuk melakukan instalasi kalian dapat mengikuti langkah-langkah di bawah ini :

:::info
Buatlah server dengan multipass sebanyak 3 buah dengan spek berikut ini :

```bash
multipass launch --name (your name) --cpus 1 --mem 2
```

:::

- Masuk ke dalam server yang telah kalian buat selanjutnya lakukan update dan upgrade.

  ```bash
  sudo apt update; sudo apt upgrade
  ```

- Selanjutnya kita lakukan instalasi terlebih dahulu **node exporter**nya.

  :::info
  Lakukan instalasi pada ketiga buah server yang telah kalian buat.
  :::

  ```bash
  wget https://github.com/prometheus/node_exporter/releases/download/v0.15.2/node_exporter-0.15.2.linux-amd64.tar.gz
  ```

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/mon1.png')} height="400px"/>
  </center>

- Selanjutnya extract `node exporter` yang telah kalian lakukan instalasi.

  ```bash
  tar -xf node_exporter-0.15.2.linux-amd64.tar.gz
  ```

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/mon2.png')} height="400px"/>
  </center>

- Selanjutnya pindahkan isi dari `node exporter` yang telah kalian install ke dalam `/usr/local/bin`.

  ```bash
  sudo mv node_exporter-0.15.2.linux-amd64/node_exporter /usr/local/bin
  ```

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/mon3.png')} height="400px"/>
  </center>

- Sekarang kita tambahkan user untuk `node exporter` yang telah kita pindahkan sebelumnya.

  ```bash
  sudo useradd -rs /bin/false node_exporter
  ```

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/mon4.png')} height="400px"/>
  </center>

- Selanjut buat file konfigurasi pada `/etc/systemd/system/` dengan nama `node_exporter.service`, setelah itu masukkan konfigurasi berikut ini :

  ```bash
  sudo nano /etc/systemd/system/node_exporter.service
  ```

  ```bash
  [Unit]
  Description=Node Exporter
  After=network.target

  [Service]
  User=node_exporter
  Group=node_exporter
  Type=simple
  ExecStart=/usr/local/bin/node_exporter

  [Install]
  WantedBy=multi-user.target
  ```

  keterangan :
  [Unit] adalah nama dari si aplikasinya
  [Service] adalah informasi dari aplikasi
  [Install] adalah informasi untuk `node exporter` bisa di jalankan oleh user lain selain `node exporter`

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/mon5.png')} height="400px"/>
  </center>

- Karena kita tadi telah menambahkan konfigurasi untuk file service `node exporter`, sekarang kita akan melakukan reload untuk si servicenya. Untuk perintahnya kalian dapat menggunakan perintah dibawah ini :

  ```bash
  sudo systemctl daemon-reload
  ```

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/mon6.png')} height="400px"/>
  </center>

- Sekarang kita tinggal menghidupukan `node exporter` kita.

  ```bash
  sudo systemctl enable node_exporter
  ```

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/mon7.png')} height="400px"/>
  </center>

- Karena kita pertama kali membuat `node exporter` ini, sekarang kita akan menjalankan service dari si `node exporter`.

  ```bash
  sudo systemctl start node_exporter
  ```

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/mon8.png')} height="400px"/>
  </center>

- Jika tahapan diatas telah kalian jalankan sekarang kita coba cek apakah `node exporter` kita telah berjalan atau tidak.

  ```bash
  sudo systemctl status node_exporter
  ```

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/mon9.png')} height="400px"/>
  </center>

- Sekarang kita coba akses `node exporter` kita pada web.browser. Node exporter berjalan di atas port:9100

  http://(your server IP):9100

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/mon10.png')} height="400px"/>
  </center>

- Sekarang coba kalian klik pada bagian `metrics` selanjutnya kalian akan diarahkan ke menu seperti gambar dibawah ini, disini kalian dapat melihat sistem yang sedang berjalan maupun apa saja yang sedang dijalankan tetapi tampilannya kurang mengenakkan makannya disini kita perlu prometheus agar dapat membaca kinerja sistem kita secara mudah.

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/mon11.png')} height="400px"/>
  </center>
