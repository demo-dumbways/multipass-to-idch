---
sidebar_position: 4
---

# 4. Setup Ansible

Pada tahap ini kita akan mencoba melakukan setup `Ansible` pada local server kita.

import useBaseUrl from '@docusaurus/useBaseUrl';

## 4.1 Ansible Inventory

**Ansible Inventory** adalah list dimana kita menampung semua alamat dari server kita.

:::info
Buatlah server dengan `multipass` terlebih dahulu sebelum mencoba melakukan setup `ansible`.

```bash
multipass launch --name (your-name)
```

:::

```bash
mkdir my-ansible
```

```bash
touch Inventory
```

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/ans6.png')} height="400px"/>
  </center>

```bash
nano Inventory
```

:::info
pada file `Inventory` masukkan Ip dari server kalian setelah itu ikuti dengan user dari server kalian. Contoh seperti gambar di bawah ini :
:::

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/ans7.png')} height="400px"/>
  </center>

## 4.2 Ansible Config

**Ansible Config** adalah penghubung antara `Inventory` dan `ssh-key` dari server kalian. Untuk konfigurasinya seperti di bawah ini :

:::info
Lokasi ssh-key multipass ada di bawah ini :

```bash
sudo cat /var/snap/multipass/common/data/multipassd/ssh-keys/id_rsa
```

:::

- Copy multipass `ssh-key` lalu, buat sebuah file dengan nama `sshkey.pem` lalu masukkan `ssh-key` yang telah kalian copy kedalam file tersebut

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/ans8.png')} height="400px"/>
  </center>

  ```bash
  nano sshkey.pem
  ```

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/ans9.png')} height="400px"/>
  </center>

- Lalu set permission untuk `ssh-key` kalian

  ```bash
  sudo chmod 400 sshkey.pem
  ```

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/ans10.png')} height="400px"/>
  </center>

- Sekarang kita buat file dengan nama `ansible.cfg`
- Lalu masukkan konfigurasi berikut ini :

  ```bash
  nano ansible.cfg
  ```

  ```bash
  [defaults]
  inventory = Inventory
  private_key_file = sshkey.pem
  ```

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/ans11.png')} height="400px"/>
  </center>

## 4.3 Ansible Test Connection

Sekarang kita coba untuk test koneksi local kita dengan server yang berada pada `Inverntory`

```bash
ansible all -m ping
```

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/ans12.png')} height="400px"/>
  </center>

Jika pada saat kalian menjalankan ping ada balasan seperti gambar diatas (pong) berati local kalian telah terkoneksi dengan server yang ada pada `Inverntory`.
