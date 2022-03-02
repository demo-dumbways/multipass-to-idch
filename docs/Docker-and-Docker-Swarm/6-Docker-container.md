---
sidebar_position: 6
---

# 6. Docker Container

import useBaseUrl from '@docusaurus/useBaseUrl';

**Docker container** merupakan wadah untuk mengemas dan menjalankan aplikasi. Wadah ini mencakup kode, runtime, system tools, dan pengaturan. **Container** hanya bisa mengakses resource yang telah ditentukan dalam **Docker images**.

## 6.1 Create Docker Container

Untuk membuat docker container kalian dapat menggunakan perintah di bawah ini :

```bash
docker container create --name (name) -p (custom-port):(application-port) (images):(tag)
```

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/doc32.png')} height="400px"/>
  </center>

Untuk melihat container yang telah kalian buat kalian dapat menggunakan perintah dibawah ini :

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/doc33.png')} height="400px"/>
  </center>

## 6.2 Run Docker container

Sekarang kita coba untuk menjalankan `Docker Container`.

- Pertama kita coba pull image terlebih dahulu kita coba menggunakan image `nginx`.

  ```shell
  docker pull nginx:alpine
  ```

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/doc34.png')} height="400px"/>
  </center>

- Untuk menjalankan kalian dapat menggunakan beberapa perintah berikut ini.

  :::info
  `-d` merupakan perintah untuk menjalakan container secara daemon/background
  :::

  ```shell
  docker run -d (images)
  ```

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/doc35.png')} height="400px"/>
  </center>

  **keterangan :** perintah diatas ini adalah perintah untuk mendownload dan menjalankan images.

  ```shell
  docker run -d --name (name) (images)
  ```

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/doc36.png')} height="400px"/>
  </center>

  **keterangan :** perintah diatas ini adalah perintah untuk mendownload dan menjalankan images serta memberi nama untuk container yang di akan di jalankan.

  ```shell
  docker run -d --name (name) -p (custom-port):(application-port) (images)
  ```

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/doc37.png')} height="400px"/>
  </center>

  **keterangan :** perintah diatas ini adalah perintah untuk mendownload dan menjalankan images serta memberi nama untuk container serta melakukan customisasi port untuk container yang akan di jalankan.

- Sekarang kita coba cek `docker container` yang telah kita buat.

  ```shell
  docker ps
  ```

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/doc38.png')} height="400px"/>
  </center>

## 6.3 Start Container

Kalau kalian lihat di point **6.1** kita telah membuat suatu docker container tetapi container yang telah kita buat itu belum berjalan, sekarang kita coba untuk menjalankan container yang telah kita buat di point **6.1**.

```shell
docker container start (container-name/container-id)
```

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/doc39.png')} height="400px"/>
  </center>

## 6.4 Stop Container

Sekarang kita coba untuk menghentikan `docker container`. Untuk menghentikan container kalian dapat menggunakan perintah di bawah ini :

```shell
docker container stop (container-name/container-id)
```

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/doc40.png')} height="400px"/>
  </center>

## 6.5 Delete Container

Pada point sebelumnya kita telah menghentikan container `docker container` yang ada. Sekarang kita coba untuk menghapus docker container yang ada pada server kita, untuk perintahnya kalian dapat menggunakan perintah di bawah ini :

```shell
docker container rm (container-name/container-id)
```

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/doc41.png')} height="400px"/>
  </center>

## 6.6 Go To Inside Container

Kalian juga dapat masuk ke dalam container untuk memproses konfigurasi/perintah menggunakan perintah di bawah ini :

- Contoh disini saya mempunya docker container mysql, sekarang kita akan mencoba untuk masuk ke dalam container mysql tersebut.

```shell
docker exec -it (container-name) bash
```

:::info
Jika kalian menggunakan docker images `alpine` cara untuk masuk ke dalam container, kalian dapat menggunakan perintah berikut ini

```bash
docker exec -it (container-name) sh
```

:::

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/doc42.png')} height="400px"/>
  </center>

## 6.7 Docker Container Logs

Kalian juga dapat melihat logs dari container yang telah kalian jalankan.

:::info
`logs` merupakan daftar proses yang sedang dijalankan dan melalui `logs` kita dapat menganalisa aplikasi. Analisa yang dilakukan dapat menampilkan jalanya aplikasi, eror dsb
:::

```shell
docker container logs (container-name/id)
```

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/doc43.png')} height="400px"/>
  </center>
