---
sidebar_position: 5
---

# 5. Docker Images

import useBaseUrl from '@docusaurus/useBaseUrl';

## 5.1 Docker images

**Docker images** secara sederhana merupakan sebuah template read-only, dimana di dalamnya terdapat sebuah sistem operasi yang di install banyak aplikasi. **Docker image** juga berfungsi untuk membuat docker container. Dan **satu docker image dapat digunakan untuk membuat banyak container**. Berikut adalah beberapa perintah docker images.

```bash
docker images
```

  <center>ƒ
  <img alt="image1" src={useBaseUrl('img/docs/doc17.png')} height="400px"/>
  </center>

Kalian dapat mengambil images yang telah tersedia di `docker.hub` untuk mengambil suatu images tersebut kalian dapat membuka link berikut ini https://hub.docker.com/

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/doc6.png')} height="400"/>
  </center>

Setelah itu cari image apa yang ingin kalian cari, contoh disini saya ingin mencari `node.js` dengan versi tertentu.

- Tahapan pertama kalian search terlebih dahulu **node**.

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/doc18.png')} height="400px"/>
  </center>

- Selanjutnya masuk ke dalam official images yang ada.

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/doc19.png')} height="400px"/>
  </center>

- Setelah itu kalian dapat pergi ke bagian `Tags` setelah itu kalian dapat mencari node version berapa yang ingin kalian gunakan.

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/doc20.png')} height="400px"/>
  </center>

- Setelah itu jika kalian telah mendapatkan `images` yang ingin kalian gunakan kalian dapat meng-copy perintah `docker pull` yang ada pada sebelah kanan images kalian.

  :::info
  Images yang berekstensikan `alpine` adalah suatu docker images yang memupunyai spesifikasi lebih ringan ketimbang images yang lain.
  :::

  ```bash
  docker pull node:alpine3.14
  ```

  :::info
  Docker pull merupakan perintah yang dapat digunakan untuk mengambil images dari docker registry
  :::

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/doc21.png')} height="400px"/>
  </center>

## 5.2 Make Docker Images

Kalian juga dapat membuat Docker images kalian sendiri untuk caranya kalian dapat mengikuti langkah langkah di bawah ini.

- Pertama-tama kalian dapat melakukan cloning aplikasi berikut ini.

  ```bash
  git clone https://github.com/dumbwaysdev/dumbflix-frontend.git
  ```

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/doc22.png')} height="400px"/>
  </center>

- Selanjutnya masuk ke dalam directory dumbflix-frontend selanjutnya buat suatu file dengan nama `dockerfile`.

  ```bash
  cd dumbflix-frontend
  ```

  ```bash
  touch Dockerfile
  ```

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/doc23.png')} height="400px"/>
  </center>

- Selanjutnya masuk ke dalam `dockerfile` yang telah kalian buat setelah itu masukkan konfigurasi di bawah ini.

  ```bash
  nano Dockerfile
  ```

  ```shell
  FROM node:alpine3.14
  WORKDIR /usr/src/app
  COPY . .
  RUN npm install
  EXPOSE 3000
  CMD [ "npm", "start" ]
  ```

  **keterangan :**

  - FROM adalah Images yang ingin kita gunakan.
  - WORKDIR adalah workdirectory.
  - COPY . . adalah dockerfile kita akan melakukan copy semua extensi pada aplikasi yang akan kita jalankan.
  - RUN adalah perintah apa yang ingin kalian jalankan sebelum menjalankan aplikasi nantinya.
  - EXPOSE adalah karena aplikasi yang kita jalankan berjalan di atas port 3000 (menyesuaikan aplikasi yang akan kalian jalankan).
  - CMD adalah Perintah untuk menjalankan aplikasi kita nantinya.

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/doc24.png')} height="400px"/>
  </center>

- Jika sudah simpan `dockerfile` kalian.
- Sekarang kita akan menjalankan perintah `build` untuk melakukan build `dockerfile` yang telah kalian buat agar dapat menjadi `docker images`.

  ```bash
  docker build -t dumbways/dumbflix-fe:1.0 .
  ```

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/doc25.png')} height="400px"/>
  </center>

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/doc26.png')} height="400px"/>
  </center>

- Setelah build telah selesai sekarang kita coba cek apakah images kita telah berhasil terbuat.

  ```bash
  docker images
  ```

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/doc27.png')} height="400px"/>
  </center>

## 5.3 Remove Docker Images

Kalian dapat menghapus docker images yang telah kalian buat maupun yang telah kalian ambil untuk perintah nya kalian dapat menggunakan perintah berikut ini.

```bash
docker rmi (name-images):(tag)
```

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/doc28.png')} height="400px"/>
  </center>

Atau kalian juga dapat menghapus images menggunakan perintah di bawah ini.

```bash
docker rmi (image-id)
```

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/doc29.png')} height="400px"/>
  </center>

## 5.4 Push Images to Registry

Pada tahapan ini kita akan mencoba untuk melakukan `push` images yang ada di local komputer kalian ke dalam server di dockerhub/docker registry. Untuk caranya kalian dapat menggunakan perintah dibawah ini.

```bash
docker push user/(images):(tag)
```

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/doc30.png')} height="400px"/>
  </center>

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/doc31.png')} height="400px"/>
  </center>
