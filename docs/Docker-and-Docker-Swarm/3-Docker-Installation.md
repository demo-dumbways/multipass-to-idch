---
sidebar_position: 3
---

# 3. Docker Installation 

import useBaseUrl from '@docusaurus/useBaseUrl';

:::info 
buat server multipass dengan spek berikut ini
```bash
multipass launch --name (your name) --cpus 2 --mem 4
```
:::

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


