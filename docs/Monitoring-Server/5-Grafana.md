---
sidebar_position: 5
---

# 5. Grafana

import useBaseUrl from '@docusaurus/useBaseUrl';

**Grafana** adalah alat yang populer untuk membuat dashboard untuk berbagai sistem monitoring dan non monitor, termasuk `Graphite, InfluxDB, Elasticsearch, dan PostgreSQL`. Ini adalah salah satu tools yang dapat digunakan untuk membuat dashboard saat menggunakan **Prometheus**.

## 5.1 Grafana Installation

Sekarang kita akan melakukan instalasi `grafana` untuk membantu kita agar lebih jelas saat membaca `prometheus` yang telah kita install sebelumnya.

- Pertama-tama kita lakukan installasi grafana terlebih dahulu.

  ```bash
  sudo su
  ```

  ```bash
  sudo wget -q -O - https://packages.grafana.com/gpg.key | apt-key add -
  ```

  ```bash
  exit
  ```

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/mon33.png')} height="400px"/>
  </center>

- Selanjutnya kita tambahakan repository dari `grafana`.

  ```bash
  sudo add-apt-repository "deb https://packages.grafana.com/oss/deb stable main"
  ```

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/mon34.png')} height="400px"/>
  </center>

- Sekarang kita lakukan instalasi `grafana`.

  ```bash
  sudo apt install grafana -y
  ```

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/mon35.png')} height="400px"/>
  </center>

- Langkah berikut nya kita akan menghidupukan `grafana` yang telah kita setup.

  ```bash
  sudo systemctl enable grafana-server
  ```

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/mon36.png')} height="400px"/>
  </center>

- Setelah kita mengaktifkan `grafana`, langkah berikut nya adalah kita akan menjalankan `grafana` yang telah kita hidupkan pada langkah sebelum nya, untuk menjalankan `grafana` silakan tuliskan perintah di bawah :

  ```bash
  sudo systemctl start grafana-server
  ```

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/mon37.png')} height="400px"/>
  </center>

- Jika tahapan diatas telah kalian jalankan sekarang kita coba cek apakah `grafana` kita telah berjalan atau tidak.

  ```bash
  sudo systemctl status grafana-server
  ```

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/mon38.png')} height="400px"/>
  </center>

- Selanjutnya edit konfigurasi pada `/etc/grafana/grafana.ini`

  ```bash
  sudo nano /etc/grafana/grafana.ini
  ```

- Ubah pada bagian `users` dan `auth.anonymous` seperti dibawah ini :

  ```bash
  [users]
  # disable user signup / registration
  allow_sign_up = false

  [auth.anonymous]
  # enable anonymous access
  enabled = false
  ```

  **keterangan:**
  allow_sign_up = false adalah misalkan ada orang yang dapat mengakses grafana kita tidak dapat melakukan registrasi.

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/mon39.png')} height="200px"/>
  </center>

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/mon40.png')} height="200px"/>
  </center>

- Untuk melihat perubahan konfigurasi yang di lakukan pada `grafana` kita perlu merestart `grafana`.

  ```bash
  sudo systemctl restart grafana-server
  ```

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/mon41.png')} height="400px"/>
  </center>

- Sekarang kita cek kembali status dari `grafana` yang telah selesai kita konfigurasi

  ```bash
  sudo systemctl status grafana-server
  ```

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/mon42.png')} height="400px"/>
  </center>

- Sekarang kita coba akses `grafana` kita, melalui port:3000 yang telah kita konfigurasi

  http://(your server IP):3000

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/mon43.png')} height="400px"/>
  </center>

- User dan pasword default dari grafana adalah User : `admin` Password : `admin`

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/mon44.png')} height="400px"/>
  </center>

- Selanjutnya masukkan password untuk `grafana` kalian

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/mon45.png')} height="400px"/>
  </center>

- Berikut adalah tampilan dari `grafana`

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/mon46.png')} height="400px"/>
  </center>

## 5.2 Setup Grafana Dashboard

- Pertama-tama kalian pergi ke menu `Configuration` setelah itu pilih `Data souce` setelah itu cari `Prometheus`.

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/mon47.png')} height="400px"/>
  </center>

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/mon48.png')} height="400px"/>
  </center>

- Pada bagian url masukkan IP dari server `Prometheus` kalian.

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/mon49.png')} height="400px"/>
  </center>

- Setelah itu tekan `save & test`
- Selanjutnya pergi ke `home`

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/mon46.png')} height="400px"/>
  </center>

- Selanjutnya pilih menu `+` setelah itu pilih `create`.

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/mon50.png')} height="400px"/>
  </center>

- Setelah itu pilih `add-newpanel` maka kalian akan di pindahkan ke halaman berikut ini :

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/mon51.png')} height="400px"/>
  </center>

- Sekarang kita akan melakukan Setup untuk dashboard `grafana` kita, untuk caranya kalian dapat mengikuti langkah-langkah di bawah ini :

- Pertama-tama kalian pergi ke `prometheus` kalian, setelah itu cari apa yang kalian inginkan, contoh disini saya ingin mencari `memory` selanjutnya tinggal kalian `execute`

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/mon52.png')} height="400px"/>
  </center>

- selanjutnya copy `query` yang ingin kita ambil.

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/mon53.png')} height="400px"/>
  </center>

- Selanjutnya `paste` query yang telah kalian copy ke dalam menu `Metrics Browser` yang ada pada `grafana`, Setelah itu sesuaikan dengan service apa yang sedang kalian monitoring.

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/mon54.png')} height="400px"/>
  </center>

- Jika sudah tinggal kalian tekan menu `apply`.

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/mon55.png')} height="400px"/>
  </center>

- Kalian juga dapat mengganti grafik menjadi seperti yang lain, Contoh seperti langkah di bawah ini :
- pilih bagian `add panel` setelah itu `add new panel`.
- Pergi ke `prometheus` setelah itu cari apa yang kalian inginkan setelah itu copy `query` tersebut dan masukkan ke `grafana`.

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/mon56.png')} height="400px"/>
  </center>

- Lalu pergi ke menu `Time Series` setelah itu pilih tampilan yang kalian inginkan.

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/mon57.png')} height="400px"/>
  </center>

- Jika sudah tekan `apply`.

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/mon58.png')} height="400px"/>
  </center>

- Hasil Akhir.

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/mon59.png')} height="400px"/>
  </center>
