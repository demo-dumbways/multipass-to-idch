---
sidebar_position: 4
---

# 4. Prometheus

import useBaseUrl from '@docusaurus/useBaseUrl';

**Prometheus** adalah open source, sistem monitoring berbasis metrics. Prometheus mudah di gunakan serta memiliki model data yang powerful dan bahasa query yang dapat menganalisa aplikasi dan infrastruktur yang kita miliki.

## 4.1 Prometheus Installation

Sekarang kita akan melakukan instalasi prometheus pada salah satu server yang telah kalian buat.

- Pertama-tama kita lakukan installasi prometheus terlebih dahulu.

  ```bash
  wget https://github.com/prometheus/prometheus/releases/download/v2.1.0/prometheus-2.1.0.linux-amd64.tar.gz
  ```

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/mon12.png')} height="400px"/>
  </center>

- Selanjutnya extract prometheus yang telah kalian install.

  ```bash
  tar -xf prometheus-2.1.0.linux-amd64.tar.gz
  ```

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/mon13.png')} height="400px"/>
  </center>

- Selanjutnya pindah kan isi dari directory `prometheus-2.1.0.linux-amd64` yaitu `prometheus` dan `promtool` ke dalam `/usr/local/bin`

  ```bash
  sudo mv prometheus-2.1.0.linux-amd64/prometheus prometheus-2.1.0.linux-amd64/promtool /usr/local/bin
  ```

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/mon14.png')} height="400px"/>
  </center>

- Setelah itu buat sebuah directory di dalam `/etc` dan `/var/lib` dengan nama prometheus.

  ```bash
  sudo mkdir /etc/prometheus /var/lib/prometheus
  ```

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/mon15.png')} height="400px"/>
  </center>

- Selanjutnya pindahkan lagi isi dari directory `prometheus-2.1.0.linux-amd64` yaitu `consoles` dan `console_libraries` ke dalam `/etc/prometheus`

  ```bash
  sudo mv prometheus-2.1.0.linux-amd64/consoles prometheus-2.1.0.linux-amd64/console_libraries /etc/prometheus
  ```

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/mon16.png')} height="400px"/>
  </center>

- Selanjutnya buat file konfigurasi pada `/etc/prometheus/` dengan nama `prometheus.yml`. Lalu masukkan konfigurasi berikut ini :

  ```bash
  sudo nano /etc/prometheus/prometheus.yml
  ```

  ```bash
    global:
     scrape_interval: 10s
    scrape_configs:
     - job_name: 'prometheus_metrics'
       scrape_interval: 5s
       static_configs:
       - targets: ['localhost:9090']
     - job_name: 'node_exporter_metrics'
       scrape_interval: 5s
       static_configs:
   	   - targets: ['localhost:9100','prometheus-target-1:9100','prometheus-target-2:9100']
  ```

  :::info
  ubah pada bagian target, pastikan sesuai dengan IP dari server kalian
  :::

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/mon17.png')} height="400px"/>
  </center>

- Sekarang kita tambahkan user untuk `prometheus` yang telah kita pindahkan sebelumnya.

  ```bash
  sudo useradd -rs /bin/false prometheus
  ```

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/mon18.png')} height="400px"/>
  </center>

- Selanjutnya kita akan mengganti ownership untuk prometheus kita.

  ```bash
  sudo chown -R prometheus: /etc/prometheus /var/lib/prometheus
  ```

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/mon19.png')} height="400px"/>
  </center>

- Selanjut buat file konfigurasi pada `/etc/systemd/system/` dengan nama `prometheus.service`, setelah itu masukkan konfigurasi berikut ini :

  ```bash
  sudo nano /etc/systemd/system/prometheus.service
  ```

  ```bash
  [Unit]
  Description=Prometheus
  After=network.target

  [Service]
  User=prometheus
  Group=prometheus
  Type=simple
  ExecStart=/usr/local/bin/prometheus \
     --config.file /etc/prometheus/prometheus.yml \
     --storage.tsdb.path /var/lib/prometheus/ \
     --web.console.templates=/etc/prometheus/consoles \
     --web.console.libraries=/etc/prometheus/console_libraries

  [Install]
  WantedBy=multi-user.target
  ```

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/mon20.png')} height="400px"/>
  </center>

  **keterangan :**

  - [Unit] adalah nama dari si aplikasinya
  - [Service] adalah informasi dari aplikasi
  - [Install] adalah informasi untuk `prometheus` bisa di jalankan oleh user lain selain `prometheus`

- Karena kita tadi telah menambahkan konfigurasi untuk file service `Prometheus`, sekarang kita akan melakukan reload untuk si servicenya. Untuk perintahnya kalian dapat menggunakan perintah dibawah ini :

  ```bash
  sudo systemctl daemon-reload
  ```

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/mon21.png')} height="400px"/>
  </center>

- Sekarang kita tinggal menghidupukan `prometheus` kita.

  ```bash
  sudo systemctl enable prometheus
  ```

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/mon22.png')} height="400px"/>
  </center>

- Karena kita pertama kali membuat `prometheus` ini, sekarang kita akan menjalankan service dari `prometheus`.

  ```bash
  sudo systemctl start prometheus
  ```

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/mon23.png')} height="400px"/>
  </center>

- Jika tahapan diatas telah kalian jalankan sekarang kita coba cek apakah `prometheus` kita telah berjalan atau tidak.

  ```bash
  sudo systemctl status prometheus
  ```

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/mon24.png')} height="400px"/>
  </center>

- Sekarang kita coba akses `prometheus` kita pada web.browser. Prometheus berjalan di atas port:8080

  http://(your server IP):9090

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/mon25.png')} height="400px"/>
  </center>

## 4.2 Use prometheus

Untuk menggunakan `prometheus` ini kalian hanya tinggal cari apa yang kalian ingin kan pada bagian `expression`. Contoh disini saya akan mencari `cpu`, jika sudah sesuai dengan yang kalian cari kalian tinggal klik pada bagian `Execute`

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/mon26.png')} height="400px"/>
  </center>
  
<br></br>

Kalian dapat memilih menu bagian `graph` jika kalian ingin menampilkan monitoring `cpu` berbentuk grafik, Kalian juga dapat melakukan setup ingin menampilkan data setiap berapa jam maupun menit.

<br></br>

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/mon28.png')} height="400px"/>
  </center>

<br></br>

Untuk informasi dari grafik yang ada kalian dapat scroll kebawah lalu kalian akan menemukan informasi grafik berdasarkan warna dari grafik monitoring kalian.

<br></br>

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/mon27.png')} height="200px"/>
  </center>

<br></br>

Selanjutnya untuk melihat server kalian apakah ada yang down atau tidak kalian dapat pergi ke bagian `status` selanjutnya `targets`.

<br></br>

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/mon29.png')} height="400px"/>
  </center>

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/mon30.png')} height="400px"/>
  </center>

<br></br>

Untuk membuktikkannya sekarang kita coba untuk menghentikan salah satu server multipass kita

```bash
multipass stop (server name)
```

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/mon31.png')} height="400px"/>
  </center>

Selanjutnya cek pada prometheus kalian lalu refresh web.browser kalian

<br></br>

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/mon32.png')} height="400px"/>
  </center>
