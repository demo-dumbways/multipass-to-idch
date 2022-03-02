---
sidebar_position: 9
---

# 9. Docker Compose

import useBaseUrl from '@docusaurus/useBaseUrl';

**Docker compose** merupakan tools yang dapat digunakan untuk menjalankan beberapa container sekaligus. Untuk menggunakan **docker compose** ini kita hanya perlu membuat file berextensikan `yaml`.

## 9.1 Docker Compose Installation

Sebelum membuat `docker compose` kalian perlu melakukan instalasi docker compose. Untuk melakukan instalasi kalian dapat menggunakan beberapa perintah di bawah ini :

```bash
sudo apt update
```

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/doc53.png')} height="400px"/>
  </center>

```bash
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
```

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/doc54.png')} height="400px"/>
  </center>

```bash
sudo chmod +x /usr/local/bin/docker-compose
```

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/doc55.png')} height="400px"/>
  </center>

:::info
jika kalian tidak dapat menggunakan perintah di atas, kalian dapat menggunakan perintah berikut ini

```bash
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
```

:::

```bash
docker compose --version
```

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/doc56.png')} height="400px"/>
  </center>

## 9.2 Create Docker Compose

Sekarang kita akan mencoba untuk membuat file dengan nama `docker-compose.yaml` pada aplikasi yang sudah kita clone pada saat membuat custom `docker images`.

- Pertama tama kita masuk terlebih dahulu ke dalam directory `dumbflix-frontend` setelah itu buat sebuah file dengan nama `docker-compose.yaml`.

  ```bash
  cd dumbflix-frontend
  ```

  ```bash
  touch docker-compose.yaml
  ```

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/doc57.png')} height="400px"/>
  </center>

- Sekarang kita buka `teks editor nano` lalu masukkan konfigurasi di bawah ini :

  ```bash
  sudo nano docker-compose.yaml
  ```

:::warningAttention
Pada saat kalian membuat file berextensikan `yaml` jangan pernah kalian sesekali menggunakan `tab` gunakanlah `spasi` karena file `yaml` tidak akan membaca konfigurasi yang kalian buat jika kalian menggunakan `tab`.
:::

```bash
version: '3.7'
services:
 (name service):
   container_name: (container name)
   image: (docker images):(tags)
   stdin_open: true
   ports:
    - (custom port):(application port)
 (name service):
  container_name: (container name)
   image: (docker images):(tags)
   ports:
    - (custom port):(application port)
   volumes:
    - "(local):(application volume)"
```

**keterangan :**

- version : versi `Docker Compose`.
- services : Perintah services yang ingin di jalankan.
- name service : nama dari service yang ingin kalian jalankan, contoh **frontend**.
- container name : nama dari container yang ingin di jalankan.
- image : docker images yang ingin digunakan.
- stdin_open true : karena aplikasi yang ingin kita jalankan berbasic `react` maka kita perlu menambahan perintah ini, karena jika tidak aplikasi kita tidak akan berjalan.
- ports : aplikasi yang ingin kalian jalankan berjalan di atas port berapa.
- volumes : untuk menyimpan data kustom Anda di PC / server lokal kalian.

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/doc58.png')} height="400px"/>
  </center>

- Sekarang kita coba untuk menjalakan `docker compose` yang telah kita buat. Untuk menjalankannya kalian dapat menggunakan perintah berikut ini :

  ```bash
  docker-compose up -d
  ```

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/doc59.png')} height="400px"/>
  </center>

- Sekarang kita coba mengakses kedua aplikasi yang telah kita deploy menggunakan `docker compose` ini pada web.browser kita.

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/doc60.png')} height="400px"/>
  </center>

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/doc61.png')} height="400px"/>
  </center>

- Lalu untuk menghentikan container yang telah kalian buat menggunakan `docker compose` ini kalian tidak perlu menggunakan perintah `docker container stop (name container)`, kalian hanya perlu menggunakan perintah seperti di bawah ini :

  ```bash
  docker-compose down
  ```

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/doc62.png')} height="400px"/>
  </center>
