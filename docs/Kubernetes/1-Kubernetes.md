---
sidebar_position: 1
---

# 1. Kubernetes

import useBaseUrl from '@docusaurus/useBaseUrl';

**Kubernetes** merupakan teknologi yang dibuat untuk mempermudah distribusi aplikasi pada sebuah cluster yang terdiri dari beberapa server. Kubernetes memudahkan kita untuk memanajemen `pods` pods pada Kubernates dapat di artikan sebagai `container docker` yang di deploy pada beberapa server.

## 1.1 Kenapa Menggunakan Kubernetes?

Berikut ini adalah keuntungan menggunakan kubernetes:

- Mengatasi down lebih cepat (high availability)
- Mudah untuk scaling aplikasi (scale)

## 1.2 Arsitektur Kubernetes

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/kube.png')} height="400px"/>
  </center>

Kubernetes terdiri dari beberapa komponen:

- Control Plane : Merupakan server utama dalam sebuah cluster kubernetes yang berisi etcd, kube api, kube scheduler. Seluruh server dalam cluster tersebut akan terhubung dengan control plane.

- Etcd : Merupakan bagian yang akan menyimpan data-data key value cluster.

- Kubelet : Merupakan sebuah node agent yang akan terinstall di seluruh node, yang berguna untuk mengontrol node dan pods.

- Kube Proxy : Merupakan network proxy yang akan terinstall di seluruh node, yang berguna untuk mengubungkan seluruh node.

- Kube Controller Manager (Kubectl) : Merupakan sebuah aplikasi yang dapat digunakan untuk mengontrol cluster, seperti untuk deploy service, menghapus service, scale service dan lain sebagainya.

- Kube API : Merupakan salah satu komponen dari control plane yang akan menerima request dari seluruh node, supaya control plane mengetahui node / pods mengetahui statusnya (aktif/tidak).

- Kube Scheduler : Merupakan salah satu komponen dari control plane yang berguna untuk menjalankan pods ke dalam node dan melakukan antrian deployment.

- Node : Merupakan server yang akan menjadi tempat pods di jalankan.

- Pods : Satuan terkecil pada kubernetes, dalam 1 pods dapat terdiri dari satu container atau beberapa container.

- Container Network Interface (CNI) : Merupakan penghubung antara container dan menghapus koneksi jika container tersebut dihapus.

- Persistent Volume : Merupakan komponen yang dapat melakukan penyimpanan data di dalam server dan dapat sharing antar node.
