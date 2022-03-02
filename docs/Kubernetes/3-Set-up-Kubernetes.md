---
sidebar_position: 3
---

# 3. Setup Kubernetes

import useBaseUrl from '@docusaurus/useBaseUrl';

Proses installasi kubernetes dapat dilakukan dengan cara manual, jika ingin installasi kubernetes secara otomatis dapat menggunakan `kubespray`.

## 3.1 Menyediakan Server

Berikut adalah spesifikasi minimum server untuk dapat menginstall `kubernetes`.

### Requirements

- Ubuntu Server 20.04
- CPU 2 Core
- Memory 2 Gb
- Disk 10 Gb

Minimal membuat 3 server dengan spesifikasi diatas dengan multipass atau server cloud.

Beri nama server tersebut :

- Manager
- Node1
- Node2

## 3.2 Konfigurasi Server

Sebelum melakukan instalasi kubernetes, terdapat beberapa hal yang perlu di lakukan.

### Menonaktifkan firewall

Karena kubernetes memerlukan banyak port yang akan digunakan secara random maka perlu menonaktifkan firewall. Untuk menonaktifkan firewall silakan ketikan perintah dibawah ini :

```shell
ufw disable
```

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/kube-install-1.png')} height="400px"/>
  </center>

### Menonaktifkan swap

Agar kubernetes dapat berjalan secara optimal dalam menggunakan seluruh memory maka harus menonaktifkan `swap memory`.

```shell
swapoff -a; sed -i '/swap/d' /etc/fstab
```

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/kube-install-2.png')} height="400px"/>
  </center>

### Update kernel system

Kubernetes memerlukan kernel yang terupdate secara konfigurasi pada system.

```shell
cat >>/etc/sysctl.d/kubernetes.conf<<EOF
net.bridge.bridge-nf-call-ip6tables = 1
net.bridge.bridge-nf-call-iptables = 1
EOF
```

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/kube-install-3.png')} height="400px"/>
  </center>

```shell
sysctl --system
```

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/kube-install-4.png')} height="400px"/>
  </center>

### Install docker

Lakukan installasi `docker` dan `docker compose`.

```shell
wget -O - https://gist.githubusercontent.com/sgnd/8ac5130ec4439985d14d118c77b7b418/raw/c351376fd4d7afbca587f8ed1f2fd57f87e113ce/docker.sh | bash
```

### Konfigurasi docker

Terkadang ketika melakukan installasi `kubernetes` tidak dapat berjalan dengan baik, maka kita perlu mengupdate `docker configuration` terlebih dahulu.

```shell
cat <<EOF | sudo tee /etc/docker/daemon.json
{
"exec-opts": ["native.cgroupdriver=systemd"],
"log-driver": "json-file",
"log-opts": {
"max-size": "100m"
},
"storage-driver": "overlay2"
}
EOF
```

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/kube-install-6.png')} height="400px"/>
  </center>

Lakukan restart `docker`, jika telah selesai melakukan konfigurasi.

```shell
sudo systemctl enable docker
sudo systemctl daemon-reload
sudo systemctl restart docker
```

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/kube-install-7.png')} height="400px"/>
  </center>

## 3.3 Installasi Kubernetes

Kemudian kita akan melakukan beberapa installasi untuk dapat mengimplementasikan kubernetes.

- kubelet
- kubeadm
- kubectl

  ```shell
  sudo apt -y install curl apt-transport-https
  curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
  echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list
  sudo apt update -y; sudo apt -y install kubelet kubeadm kubectl
  ```

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/kube-install-8.png')} height="400px"/>
  </center>

### Konfigurasi Kubeadm

Berikut ini adalah perintah yang akan digunakan untuk menginisialisasi sebuah cluster. Jalankan perintah ini pada server **manager**.

```shell
sudo kubeadm init --apiserver-advertise-address=ip-address --pod-network-cidr=192.168.0.0/16  --ignore-preflight-errors=all
```

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/kube-install-9.png')} height="400px"/>
  </center>

Ganti **ip-address** dengan IP server yang digunakan, kemudian akan ada perintah untuk `join cluster`.

### Konfigurasi Kubeconfig

Lakukan copy konfigurasi tersebut untuk digunakan pada `kubectl`

```shell
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config
```

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/kube-install-10.png')} height="400px"/>
  </center>

### Instalasi CNI

Selanjutnya kita akan melakukan installasi `CNI Calico`

```shell
kubectl --kubeconfig=/etc/kubernetes/admin.conf create -f https://projectcalico.docs.tigera.io/manifests/calico.yaml
```

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/kube-install-11.png')} height="400px"/>
  </center>

Lakukan pengecekan apakah `CNI Calico` sudah terinstall

```shell
kubectl get pods --all-namespaces
```

### Melakukan Join Cluster

Jalankan perintah berikut pada server **Manager**

```shell
kubeadm token create --print-join-command
```

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/kube-install-12.png')} height="400px"/>
  </center>

Output dari perintah diatas perlu dijalankan pada server **Node1** dan **Node2**.

Kemudian pastikan untuk memeriksa apakah server dari **Node1** dan **Node2** sudah terkoneksi dengan cluster.

```shell
kubectl get nodes
```

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/kube-install-14.png')} height="400px"/>
  </center>

### Update Label Node (Optional)

Jalankan perintah berikut pada server **Manager**

```shell
kubectl label server-node worker node-role.kubernetes.io/worker=worker
```

Ganti **server-node** dengan nama **Node1** dan **Node2**

### 3.4 Deploy Simple App

Jalankan perintah berikut untuk menjalankan aplikasi sederhana.

```shell
kubectl create deploy nginx --image nginx
```

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/kube-install-15.png')} height="400px"/>
  </center>

Untuk mengetahui apakah pods sudah ready, gunakan perintah berikut :

```shell
kubectl get pods
```

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/kube-install-16.png')} height="400px"/>
  </center>

Untuk `mengexpose` aplikasi yang dijalankan pada `kubernetes` dapat menggunakan aplikasi berikut

```shell
kubectl expose deploy nginx --port 80 --type NodePort
```

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/kube-install-17.png')} height="400px"/>
  </center>

Untuk memeriksa `port` yang telah di `expose` perlu menjalankan berikut :

```shell
kubectl get svc
```

Tampilan jika aplikasi telah berhasil di akses melalui IP dan Port

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/kube-install-18.png')} />
  </center>

Untuk menghapus pods dapat menggunakan perintah

```shell
kubectl delete deploy nginx
```

Untuk menghapus service dapat menggunakan perintah

```shell
kubectl delete service nginx
```
