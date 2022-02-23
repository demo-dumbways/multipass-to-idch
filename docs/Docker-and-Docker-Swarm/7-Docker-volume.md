---
sidebar_position: 7
---

# 7. Docker Volume

import useBaseUrl from '@docusaurus/useBaseUrl';

**Docker volume** merupakan perintah yang dapat menyimpan konfigurasi atau file-file penting yang akan disimpan pada komputer dan tidak akan terhapus jika docker container di hapus. Dan yang harus dan perlu kita beri `Docker Volume` ini adalah container untuk database.

## 7.1 Make Docker Volume
Secara spesifik `docker volume` berguna untuk menyimpan data kustom Anda di PC / server lokal kalian. Jadi, jika kalian menghapus kontainer, kalian dapat menjalankan kembali docker images kalian dan data masih ada.

```shell
docker container create --name (name) -p (custom-port):(application-port) -v (local):(application volumes) (images)
```

```shell
docker container start (container-name/container-id)
```

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/doc+.png')} height="400px"/>
  </center> 

