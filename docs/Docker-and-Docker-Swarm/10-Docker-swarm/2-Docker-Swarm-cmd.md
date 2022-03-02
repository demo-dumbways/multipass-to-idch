---
sidebar_position: 2
---

# 2. Docker Swarm Command

## 2.1 Setup Docker Swarm

import useBaseUrl from '@docusaurus/useBaseUrl';

Berikut ini adalah beberapa contoh perintah untuk menjalankan Docker Swarm.

- :::info
  Buat 3 buah server multipass dengan spek berikut ini :

  ```bash
  multipass launch --name (your name) --cpus 2 --mem 4
  ```

  :::

- Selanjutnya lakukan instalasi `docker engine` dan `docker compose` pada 3 buah server yang telah kalian buat.

  **Docker Instalation**: [Here](/Docker-and-Docker-Swarm/Docker-installation)

  **Docker Compose Instalation**: [Here](/Docker-and-Docker-Swarm/Docker-compose)

- Selanjutnya jalankan perintah dibawah ini pada server manager kalian.

  ```bash
  docker swarm init --addvertise-addr (IP server)
  ```

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/swm2.png')} height="400px"/>
  </center>

  **keterangan :** perintah di atas untuk melakukan inisialisai manager untuk docker swarm.

- Jika sudah copy token yang ada pada saat kalian menjalankan perintah diatas, setelah itu paste ke dalam server worker kalian.

  ```bash
  docker swarm join --token SWMTKN-1-3252q1quecso9jtwselzfpdawb4d8tztelms563o4g9u2psvty-5evcyhlecvdtnvdauaoxaybvw 10.206.130.212:2377
  ```

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/swm3.png')} height="400px"/>
  </center>

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/swm4.png')} height="400px"/>
  </center>

  **keterangan :** perintah di atas untuk menginisialisasi server kalian sebagai worker.

- Untuk memeriksa apakah worker sudah join ke server manager kalian dapat menggunakan perintah di bawah ini.

  ```bash
  docker node ls
  ```

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/swm5.png')} height="400px"/>
  </center>

## 2.2 Docker Swarm Command

### 1.Create Docker service

```bash
docker service create --replicas 1 --name helloworld alpine ping google.com
```

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/swm6.png')} height="400px"/>
  </center>

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/swm8.png')} height="400px"/>
  </center>

**keterangan :** untuk menjalankan sebuah service dengan jumlah 1 container dengan nama helloworld dengan image alpine dan menjalankan perintah `ping google.com`.

### 2.Docker Service Scale

```bash
docker service scale helloworld=5
```

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/swm6.png')} height="400px"/>
  </center>

**keterangan :** perintah untuk melakukan scaling service `helloworld` sebanyak 5.

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/swm7.png')} height="400px"/>
  </center>

### 3.Docker Service Inspect

```bash
docker service inspect helloworld
```

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/swm9.png')} height="400px"/>
  </center>

**keterangan :** perintah diatas berguna untuk melihat configurasi dari kontainer.

### 4.Remove Service

```bash
docker service rm helloworld
```

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/swm10.png')} height="400px"/>
  </center>
