---
sidebar_position: 8
---

# 8. Docker Network

import useBaseUrl from '@docusaurus/useBaseUrl';

**Docker network** merupakan suatu perintah yang dapat menghubungkan antara container dengan container lainnya.

## 8.1 Create Docker Network

Untuk membuat `docker network` kalian dapat menggunakan perintah dibawah ini :

```shell
docker network create (network-name)
```

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/doc45.png')} height="400px"/>
  </center>

## 8.2 Inspect Docker Network

Kalian dapat melihat informasi network dan container apa saja yang tersambung dengan docker network yang telah kalian buat menggunakan perintah di bawah ini :

```shell
docker network inspect (network-name)
```

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/doc46.png')} height="400px"/>
  </center>

## 8.3 List Docker Network

Untuk melihat network apa saja yang ada pada server kalian

```shell
docker network ls
```

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/doc47.png')} height="400px"/>
  </center>

## 8.4 Use Docker Network

Untuk menggunakan `docker network` yang telah kalian buat, kalian dapat menambahkan sedikit perintah pada saat akan membuat suatu `docker container`, contoh seperti perintah di bawah ini :

```shell
docker container create --name (name) -p (custom-port):(application-port) -v (local):(application volumes) --network (network name) (images)
```

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/doc48.png')} height="400px"/>
  </center>

## 8.5 Disconect Docker Network

Kalian juga dapat menghentikan koneksi network antar container. Untuk menjalankanya kalian dapat menggunakan perintah berikut ini.

- kalau kalian lihat disini saat saya menjalankan perintah `docker inspect network` container yang sebelumnya saya jalankan pada point **8.4** tercatat pada network yang telah saya buat.

```shell
docker network inspect (network name)
```

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/doc49.jpg')} height="400px"/>
  </center>

- Sekarang kita coba untuk menghentikan koneksi container pada network tersebut.

```shell
docker network disconect (network name) (container name)
```

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/doc50.png')} height="400px"/>
  </center>

- Sekarang kita coba untuk menjalankan `docker inspect network` lagi. Kalau kalian lihat gambar di bawah ini container yang sebelumnya tercatat pada saat kita menjalankan `docker inspect network` tadi sudah menghilang.

```shell
docker network inspect (network name)
```

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/doc51.png')} height="400px"/>
  </center>

## 8.6 Remove Docker Network

Untuk menghapus `docker network` yang telah kalian buat kalian dapat menggunakan perintah di bawah ini :

```shell
docker network rm (network name)
```

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/doc52.png')} height="400px"/>
  </center>
