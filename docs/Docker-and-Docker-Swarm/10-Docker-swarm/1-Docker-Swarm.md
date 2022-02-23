---
sidebar_position: 1
---

# 1. Docker Swarm

import useBaseUrl from '@docusaurus/useBaseUrl';

## 1.1 Docker Swarm
**Docker swarm** merupakan teknologi yang dibuat untuk mempermudah distribusi aplikasi pada sebuah cluster yang terdiri dari beberapa server. **Docker swarm** memudahkan kita untuk memanajemen docker containers yang di deploy pada beberapa server.

Keuntungan menggunakan docker swarm :
- Mengatasi down lebih cepat (high availability)
- Mudah untuk scaling aplikasi (scale)

## 2.1 Docker Swarm Architecture

Untuk membuat docker swarm membutuhkan minimal 3 server, yang dimana salah satu akan menjadi master/manager dan yang lainnya akan menjadi worker. Kurang lebih gambaran cara kerjanya seperti gambar di bawah ini

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/swm1.png')} height="300px"/>
  </center>

- Manager bertugas untuk mengelola manajemen cluster .
- Worker adalah pekerja yang tujuannya untuk mengeksekusi container 

