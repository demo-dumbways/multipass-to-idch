---
sidebar_position: 3
---

# 3. MySQL

import useBaseUrl from '@docusaurus/useBaseUrl';

**MySQL** adalah sistem manajemen database relasional (RDBMS) berbasis SQL (Structured Query Language) yang bersifat open-source dengan model client-server. RDBMS merupakan software untuk membuat dan mengelola database berdasarkan model relasional.

## 3.1 MySQL Installation

- Tahapan pertama yang harus kalian lakukan adalah membuat satu buah server untuk database menggunakan multipass.

  ```shell
  multipass launch --name (name)
  ```

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/d1.png')} height="400px"/>
  </center>

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/d2.png')} height="400px"/>
  </center>

- Selanjutnya jalankan perintah dibawah ini untuk melakukan instalasi mysql-server.

  ```shell
  sudo apt update; sudo apt upgrade
  ```

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/d3.png')} height="400px"/>
  </center>

  ```shell
  sudo apt install mysql*
  ```

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/d4.png')} height="400px"/>
  </center>

- Setelah selesai, tahap selanjutnya adalah mengamankan database kalian. untuk mengamankan nya kalian dapat menggunakan perintah dibawah ini.

  ```shell
  sudo mysql_secure_installation
  ```

  :::info
  Sesuaikan jawaban dari pertanyaan yang diajukan oleh mysql.
  :::

````bash
  - Press y|Y for Yes, any other key for No: y
  - Please enter 0 = LOW, 1 = MEDIUM and 2 = STRONG: 0
  - Do you wish to continue with the password provided?(Press y|Y for Yes, any other key for No) : y
  - Remove anonymous users? (Press y|Y for Yes, any other key for No) : y
  - Disallow root login remotely? (Press y|Y for Yes, any other key for No) : n
  - Reload privilege tables now? (Press y|Y for Yes, any other key for No) : y
  - Remove test database and access to it? (Press y|Y for Yes, any other key for No) : y


  <center>
  <img alt="image1" src={useBaseUrl('img/docs/d5.png')} height="400px"/>
  </center>

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/d6.png')} height="400px"/>
  </center>

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/d7.png')} height="400px"/>
  </center>

- Setelah selesai untuk menjalankan semua konfigurasi di atas, sekarang kita coba login ke dalam **mysql** menggunakan akun **root**

  ```shell
  sudo mysql -u root -p
````

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/d8.png')} height="400px"/>
  </center>

## 3.2 Create User

- Setelah melakukan instalasi `MySQL` server, sekarang kita akan mencoba membuat user untuk `MySQL` pembuataun user ini bertujuan untuk menentukan hak akses siapa saja yang nanti nya dapat mengakses database tersebut. Untuk bagaimana cara membuatnya kalian dapat menggunakan perintah di bawah ini.

  ```shell
  sudo mysql -u root -p
  ```

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/d8.png')} height="400px"/>
  </center>

  ```shell
  CREATE USER 'newuser'@'%' IDENTIFIED BY 'password';
  ```

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/d9.png')} height="400px"/>
  </center>

  **keterangan :** perintah di atas ini adalah perintah untuk membuat user baru di mysql.

  ```shell
  GRANT ALL PRIVILEGES ON *.* TO 'newuser'@'%';
  ```

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/d10.png')} height="400px"/>
  </center>

  **keterangan :** perintah di atas ini adalah perintah untuk mengizinkan user yang sudah kalian buat dapat login tanpa menggunakan perintah `sudo`.

  ```shell
  FLUSH PRIVILEGES;
  ```

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/d11.png')} height="400px"/>
  </center>

  **keterangan :** perintah di atas ini adalah perintah untuk me-restart `MySQL` kalian.

- Jika sudah sekarang coba untuk masuk ke dalam user yang telah kalian buat.

  ```shell
  mysql -u (mysql user) -p
  ```

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/d12.png')} height="400px"/>
  </center>

## 3.3 Create Database

- Sekarang kita akan mencoba untuk membuat database untuk aplikasi yang akan kita jalankan.
- Kalian dapat mengikuti langkah-langkah di bawah ini :

  ```shell
  create database (db name);
  ```

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/d13.png')} height="400px"/>
  </center>

  **keterangan :** perintah diatas adalah perintah untuk membuat database.

  ```shell
  show databases;
  ```

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/d14.png')} height="400px"/>
  </center>

  **keterangan :** perintah di atas adalah perintah untuk melihat database apa saja yang tersedia.

  ```shell
  use (db name);
  ```

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/d15.png')} height="400px"/>
  </center>

  **keterangan :** perintah di atas adalah perintah untuk masuk ke dalam database yang telah kalian buat.

  ```shell
  show tables;
  ```

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/d16.png')} height="400px"/>
  </center>

  **keterangan :** perintah di atas adalah perintah untuk melihat isi dari database yang telah kalian buat.

## 3.4 Change config Database

- Sekarang kita akan ubah pada bagian `/etc/mysql/mysql.conf/mysql.cnf`.

  ```shell
  sudo nano /etc/mysql/mysql.conf/mysql.cnf
  ```

- Kita ubah pada bagian bind address dan `MySQL` bind addres menjadi all-trafic `0.0.0.0`.

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/d+.png')} height="400px"/>
  </center>

- Jika sudah silakan `save` lalu restart service `MySQL` kalian.

  ```shell
  sudo systemctl restart mysql
  ```

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/d++.png')} height="400px"/>
  </center>
