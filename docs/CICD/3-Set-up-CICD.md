---
sidebar_position: 3
---

# 3. Jenkins

import useBaseUrl from '@docusaurus/useBaseUrl';

**Jenkins** merupakan salah satu tool yang digunakan untuk proses CI/CD, dimana tool tersebut dapat membantu DevOps melakukan rilis aplikasi ke publik secara otomatis.

## 3.1 Instalasi OpenJDK

`Jenkins` dibangun dengan bahasa pemrograman `Java`, oleh karena itu Kita harus melakukan instalasi `OpenJDK` lebih dahulu.

Berikut adalah cara instalasi `OpenJDK`

```shell
sudo apt install openjdk-8-jdk
```

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/cicd-jenkins-1.png')} height="400px"/>
  </center>

## 3.2 Instalasi Jenkins

Jika `OpenJDK` telah terinstall, maka lakukan langkah berikut untuk menambahkan repository `Jenkins` ke dalam server.

```shell
wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -
```

```
sudo sh -c 'echo deb https://pkg.jenkins.io/debian-stable binary/ > \
/etc/apt/sources.list.d/jenkins.list'
```

agar repository `Jenkins` yang telah ditambahkan ke dalam server terbaca, sebaiknya jalankan perintah berikut :

```shell
sudo apt update -y
```

Terakhir jalankan perintah berikut untuk proses instalasi `Jenkins`.

```shell
sudo apt install jenkins
```

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/cicd-jenkins-2.png')} height="400px"/>
  </center>

Untuk mengetahui service `Jenkins` telah berjalan, jalankan perintah berikut :

```shell
sudo systemctl status jenkins
```

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/cicd-jenkins-3.png')} height="400px"/>
  </center>

## 3.3 Konfigurasi Reverse Proxy

Proses pembuatan reverse proxy dapat dilihat pada materi sebelumnya yaitu [Reverse Proxy](/CloudComputing-and-Multipass/Reverse-Proxy)

## 3.4 Konfigurasi Jenkins

Setelah melakukan instalasi dan reverse proxy, maka kita akan melakukan konfigurasi `Jenkis`. Berikut ini adalah tampilan yang akan muncul jika proses yang telah dilakukan sebelumnya berhasil.

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/cicd-jenkins-4.png')} height="400px"/>
  </center>

Untuk melanjutkan proses konfigurasi `Jenkins`, Kita perlu mengakses server `Jenkins` dan menjalankan perintah berikut untuk melihat password Admin dari `ß`.

```shell
sudo cat /var/jenkins_home/secrets/initialAdminPassword
```

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/cicd-jenkins-5.png')} height="400px"/>
  </center>

Masukan Admin password ke kolom tersebut dan klik continue untuk melanjutkan proses installasi.

Tahap selanjutnya Kita harus melakukan instalasi plugin, Pilih **Install suggested plugins**

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/cicd-jenkins-6.png')} height="400px"/>
  </center>

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/cicd-jenkins-7.png')} height="400px"/>
  </center>
    <br></br>

Selanjutnya kita harus membuat user baru dengan mengisi form berikut.

<br></br>

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/cicd-jenkins-8.png')} height="400px"/>
  </center>

<br></br>

Pada tahap ini pastikan untuk mengisi sesuai domain yang telah dibuat pada reverse proxy sebelumnya.

<br></br>

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/cicd-jenkins-9.png')} height="400px"/>
  </center>

<br></br>

Tampilan dashboard Jenkins yang telah berhasil di konfigurasi.

<br></br>

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/cicd-jenkins-9.png')} height="400px"/>
  </center>
