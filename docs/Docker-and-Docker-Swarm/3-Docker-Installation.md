---
sidebar_position: 3
---

# 3. Docker Installation 

import useBaseUrl from '@docusaurus/useBaseUrl';

:::info 
Buat server di **IdClouHost** dengan spek 1 core dan 2gb mem
:::
## 3.1 Manual Installation
Sekarang kita akan mencoba untuk melakukan installasi `Docker` di dalam server yang telah kalian buat. Untuk melakukan installasi kalian dapat menggunakan beberapa perintah dibawah ini.

```bash
sudo apt update
```
  <center>
  <img alt="image1" src={useBaseUrl('img/docs/doc7.png')} height="400px"/>/>
  </center> 

```bash
sudo apt-get install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release
```

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/doc8.png')} height="400px"/> 
  </center> 

```shell
 curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
```

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/doc9.png')} height="400px"/>
  </center> 

```bash
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
```

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/doc10.png')} height="400px"/> 
  </center> 

```bash
sudo apt-get update
```

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/doc11.png')} height="400px"/>
  </center> 

```bash
sudo apt-get install docker-ce docker-ce-cli containerd.io
```

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/doc12.png')} height="400px"/>
  </center> 

Jika kalian telah melakukan beberapa perintah di atas maka kalian telah berhasil untuk melakukan installasi docker. Kalian bisa memeriksa apakah docker telah terinstall atau belum menggunakan perintah berikut ini

```bash
docker -v
```

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/doc13.png')} height="400px"/>
  </center>


## 3.2 Auto Installation

Untuk melakukan instalasi docker secara langsung kedalam vm yang akan kita buat, kita dapat memanfaatkan fitur `app catalog` yang dimiliki oleh **IdCloudHost**. Kalian dapat mengikuti langkah-langkah di bawah ini

Pastikan kalian telah login ke dalam akun yang telah disediakan untuk bahan pembelajaran kalian, setelah itu klik menu `virtual machine` 

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/docidch1.png')} height="400px"/>
  </center>

Lalu pilih menu `app catalog` setelah itu pilih `docker` dengan version 20.10.

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/docidch2.png')} height="400px"/>
  </center>

Untuk spesifikasi server sesuaikan dengan gambar di bawah, lalu untuk username dan yang lain sebagainya sesuaikan juga dengan apa yang kalian inginkan.

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/docidch3.png')} height="400px"/>
  </center>

Jika sudah tunggu sampai proses pembuatan server selesai.

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/docidch4.png')} height="400px"/>
  </center>

jika sudah selesai sekarang kita coba untuk masuk ke server dan kita cek apakah docker telah berhasil terinstall

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/docidch5.png')} height="550px"/>
  </center>