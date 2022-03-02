---
sidebar_position: 3
---

# 3. Deploy Application With Docker Swarm

import useBaseUrl from '@docusaurus/useBaseUrl';

Kita akan mencoba untuk mendeploy aplikasi yang sudah kita gunakan sebelumnya.

- Clone Repository berikut ini ke tiga buah server yang telah kalian buat sebelumnya.

  ```shell
  git clone https://github.com/RizqyAlvindra/dumbflix-frontend.git
  ```

  ```shell
  git clone https://github.com/RizqyAlvindra/dumbflix-backend.git
  ```

- Selanjutnya build `Dockerfile` yang telah ada, dan jalankan container `MySQL` untuk database.

  :::info
  sebelum melakukan build pastikan kalian telah menyesuaikan konfigurasi pada frontend, backend dan database sesuai dengan server kalian (konfigurasi sama seperti saat kita sedang membahas manage-database)
  :::

  **Frontend**

  ```shell
  FROM node:dubnium-alpine3.11
  WORKDIR /usr/src/app
  COPY ..
  RUN npm install
  EXPOSE 3000
  CMD [ "npm", "start" ]
  ```

  **Backend**

  ```shell
  FROM node:dubnium-alpine3.11
  WORKDIR /usr/src/app
  COPY . .
  RUN npm install
  RUN npm install sequelize-cli -g
  EXPOSE 5000
  CMD [ "npm", "start" ]
  ```

  **Database**

  ```shell
  docker run -d --name (your-name) -p (custom-port):3306 -v /home/(user)/mysql:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=4esz3wa2q1 -e MYSQL_DATABASE=dumbflix mysql:latest
  ```

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/1.png')} height="400px"/>
  </center>

- Setelah kalian selesai melakukan build dan menjalankan container database. Selanjutnya masuk ke dalam directory `dumbflix-frontend` setelah itu jalankan perintah di bawah ini :

  ```shell
  docker stack deploy --compose-file docker-compose.yml (name service)
  ```

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/2.png')} height="400px"/>
  </center>

- Untuk melihat aplikasi yang telak kalian deploy menggunakan `docker swarm` kalian dapat menggunakan perintah dibawah ini :

  ```shell
  docker service ls
  ```

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/3.png')} height="400px"/>
  </center>

- Sekarang kita coba untuk melakukan Scaling aplikasi backend kita, untuk melakukannya kalian dapat menggunakan perintah berikut ini :

  ```shell
  docker service scale (service id)=(jumlah yang di inginkan)
  ```

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/4.png')} height="400px"/>
  </center>

- Jika sudah sekarang kita coba akses ke dalam web.browser kita.

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/5.png')} height="400px"/>
  </center>
