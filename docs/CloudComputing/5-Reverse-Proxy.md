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

## 5.3 Create Gateway Server

- Tahapan pertama yang harus kita lakukan adalah membuat server baru untuk gateway.
- Untuk membuatnya sekarang kita coba untuk menggunakan fitur **App Catalog** pada menu compute yang dimiliki oleh IdCloudHost.
- Lalu pilih aplikasi nginx dengan versi ubuntu

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/cloud10.png')} />
  </center>

- Setelah itu sesuaikan spesifikasi dari server nginx yang kalian inginkan.
- Lalu Checklist bagian public IP agar server kalian mendapatkan IP public.
- Setelah itu SetUp user, password, dan Hostname.

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/cloud11.png')} />
  </center>

- Tunggu sampai server terbuat, jika sudah langsung saja masuk ke dalam server nginx yang sudah kalian buat.

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/cloud12.png')} />
  </center>

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/cloud13.png')} />
  </center>

## 5.4 Create Reverse Proxy
Untuk membuat reverse proxy dapat mengikuti langkah-langkah berikut :

-  Untuk membuat konfigurasi reverse proxy kalian dapat masuk terlebih dahulu ke directory di bawah ini

  ```bash
  cd /etc/nginx
  ```

- Selanjutnya buat suatu directory terlebih dahulu

  ```bash
  sudo mkdir (directoy name)
  ```

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/cloud14.png')} />
  </center>

- Jika sudah masuk ke dalam Directory yang telah kalian buat, setelah itu buatlah suati file

  ```bash
  cd (Directory name)
  ```

  ```bash
  sudo nano (Your file name)
  ```

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/cloud15.png')} />
  </center>


- Lalu masukkan konfigurasi berikut ini 
  ```
  server {
        server_name demo.studentdumbways.my.id;
  
        location / {
                 proxy_pass http://103.176.78.25:3000;
        }
  }
  ```

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/cloud16.png')} />
  </center>

  :::info
  Pada bagian **server_name** pastikan telah sesuai dengan nama domain yang kalian inginkan, pada bagian Proxy juga pastikan telah sesuai dengan **IP** dan **PORT** dari server dan aplikasi kalian.
  :::

- Tahapan selanjutnya adalah kita akan menambahkan konfigurasi di dalam file `nginx.conf`
- Selanjutnya pergi ke-bagian include, setelah itu masukan lokasi dari directory yang bersi konfigurasi yang sudah kalian buat tadi.

  ```bash
  sudo nano nginx.conf
  ```

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/cloud17.png')} />
  </center>

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/cloud18.png')} />
  </center>

  :::info
  `/*;` menandakan file `nginx.conf` akan membaca seluruh file yang berada di dalam directory `dumbways`.
  :::

- Sekarang kita coba cek apakah konfigurasi yang sudah kita buat itu benar dan tidak ada eror

  ```bash
  sudo nginx -t
  ```

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/cloud19.png')} />
  </center>

- Jika ternyata tidak ada eror tahapan selanjutnya adalah kita akan melakukan restart untuk nginx kita.

  ```bash
  sudo systemctl restart nginx
  ```

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/cloud20.png')} />
  </center>

## 5.5 SetUp Cloudflare

- Tahapan pertama kalian harus melakukan registrasi akun cloudflare terlebih dahulu. Untuk melakukan regisrasi kalian dapat meng-klik link di bawah ini.

  [Cloudflare](https://dash.cloudflare.com/sign-up)

- Setelah kalian berhasil melakukan registrasi diharapkan berikan email kalian yang telah terdaftar di akun cloudflare.
- Jika sudah kalian nantinya akan dapat mengakses account cloudflare untuk bahan pembelajaran kalian.
- Jika sudah kalian sudah mendapatkan akses klik email yang telah disediakan untuk bahan pembelajaran kalian. Setelah itu langsung klik saja domain yang sudah di sediakan.

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/cloud21.png')} />
  </center>

- Sekarang masuk kedalam menu `dns`.
  <center>
  <img alt="image1" src={useBaseUrl('img/docs/cloud22.png')} />
  </center>

- Setelah itu tekan menu `add record`, selanjutnya masukkan IP dari server `nginx` kalian lalu masukkan sub domain yang kalian inginkan, dan pastikan telah sesuai dengan `server_name` dari konfigurasi reverse.proxy kalian.

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/cloud23.png')} />
  </center>
- Jika sudah langsung saja simpan lalu coba akses domain yang telah kalian buat barusan tadi.
- Jika muncul halaman seperti gambar di bawah ini maka kalian telah berhasil untuk melakukan setup cloudflare. 

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/cloud24.png')} />
  </center>

- Sekarang kita coba untuk menjalankan aplikasi kita. Lalu kita coba lagi untuk mengakses domain kita.

  http://demo.studentdumbways.my.id

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/cloud25.png')} />
  </center>
## 5.6 SSL COnfiguration
SSL adalah singkatan dari **Secure Socket Layer**, salah satu komponen penting yang harus dimiliki website. Dengan SSL, transfer data di dalam website menjadi lebih aman dan terenkripsi. Untuk SSL disini kita menggunakan Let’s Encrypt, Let’s Encrypt adalah Otoritas Sertifikasi (CA) yang gratis, terotomatisasi dan terbuka, ada untuk keuntungan publik. Kami adalah layanan yang disediakan oleh Internet Security Research Group (ISRG).

### Keuntungan menggunakan Let’s Encrypt
1. Gratis: Semua orang yang memiliki nama domain dapat menggunakan Let’s Encrypt untuk memperoleh sertifikat terpercaya dengan tanpa biaya.
2. Otomatis: Perangkat Lunak yang berjalan di Server Web dapat berinteraksi dengan Let’s Encrypt untuk mendapatkan sertifikat terpecaya secara mudah, dengan aman memasangnya, dan secara otomatis akan memperbaharui sertifikat tersebut.
3. Aman: Let’s Encrypt akan bertindak sebagai platform yang memajukan kiat-kiat praktik terbaik untuk keamanan TLS, pada sisi CA dan dengan membantu operator situs untuk mengamankan server mereka secara layak.

Sekarang kita coba untuk melakukan konfigurasi SSL untuk reverse proxy yang telah kita buat.

- Tahapan pertama kalian masuk ke menu profile di cloudflare kalian.
- Setelah itu pilih menu `API Tokens` 
  
  <center>
  <img alt="image1" src={useBaseUrl('img/docs/cloud26.png')} />
  </center>

- Lalu klik `view` pada **Global API Key**, lalu masukkan password akun kalian.
- Jika sudah tekan pilih `view`, lalu copy API key yang muncul.

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/cloud27.png')} />
  </center>

- lalu buat directory `.secret`. setelah itu buat file dengan nama `yourname.ini`.

  ```bash
  mkdir .secret
  ```

  ```bash
  touch .ini
  ```

  ```bash
  nano .ini
  ```

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/cloud28.png')} />
  </center>

- Setelah itu masukkan `api key` dan `email` yang kalian gunakan di akun cloudflare kalian.

  ```bash
  dns_cloudflare_email = "youremail@gmail.com"
  dns_cloudflare_api_key = "a6vdf696f88916b0dbe62773a3a70ad2as2777"
  ```

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/cloud29.png')} />
  </center>

- Jika sudah setup permision nya menjadi 400.

  ```bash
  sudo chmod 400 .ini
  ```

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/cloud30.png')} />
  </center>

- Sekarang kita lakukan instalasi certbot.
  **Certbot** adalah salah satu client yang membangun atau membuat sertifikat SSL/ TLS untuk web server secara otomatis.

  ```bash
  sudo snap install --classic certbot
  ```

  ```bash
  sudo ln -s /snap/bin/certbot /usr/bin/certbot
  ```

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/cloud31.png')} />
  </center>

- Sekarang kita coba jalankan certbot yang telah kita install dan sesuaikan seperti gambar di bawah ini.

  ```bash
  sudo certbot
  ```

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/cloud32.png')} />
  </center>

- Sekarang kita coba untuk cek di konfigurasi reverse.proxy kita sebelumnya.
- Kalau kalian lihat konfigurasi kita sekarang telah secara otomatis mendapatkan certificate dari Let’s Encrypt.

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/cloud33.png')} />
  </center>

- Selanjutnya sekarang kita tinggal masuk ke cloudflare kita lalu mematikan proxy yang ada pada domain kita. Setelah itu langsung tekan `save`.

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/cloud34.png')} />
  </center>

- Sekarang kita coba untuk mengakses domain kita menggunakan https://
  https://demo.studentdumbways.my.id

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/cloud35.png')} />
  </center>