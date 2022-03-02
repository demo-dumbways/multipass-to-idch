---
sidebar_position: 4
---

# 3. Pipeline

import useBaseUrl from '@docusaurus/useBaseUrl';

**Pipeline** merupakan fitur yang dimiliki oleh semua tool CI/CD, yang berguna untuk membuat daftar perintah yang harus dilakukan saat melakukan proses update aplikasi.

## 3.1 Membuat Konfigurasi SSH Agent

Pastikan untuk melakukan instalasi plugin bernama **SSH Agent Plugin**, yang berguna untuk meremote server lain dan mengeksekusi perintah linux pada server tersebut. Untuk proses instalasinya dapat membuka menu **Manage Jenkins -> Manage Plugins**, kemudian cara nama plugin tersebut pada tab **Available**.

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/jenkins-conf-1.png')} height="400px"/>
  </center>
    <br></br>

Klik **Install without restart** untuk melakukan instalasi plugin tanpa harus merestart `Jenkins`.

## 3.2 Membuat SSH Access Git dan Server

Tahap ini dibutuhkan untuk Jenkins agar dapat terintegrasi dengan git private dan server lain (tempat aplikasi berada). Untuk tahapan yang harus dilakukan adalah dengan membuka menu **Manage Jenkins -> Manage Credentials**.

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/jenkins-conf-2.png')} height="400px"/>
  </center>

<br></br>

Pada menu **Stores scoped to Jenkins -> Jenkins -> Global credentials (unrestricted) -> Add credentials**

<br></br>

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/jenkins-conf-3.png')} height="400px"/>
  </center>

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/jenkins-conf-4.png')} height="400px"/>
  </center>

<br></br>
Berikut adalah data yang harus di isi:

- **Kind** : SSH Username with private key.
- **Scope** : Global.
- **ID** : Sesuaikan dengan kebutuhan (misal: GitHub).
- **Username**: Sesuaikan dengan kebutuhan (misal: sgnd).
- **Private Key** : Enter directly (masukan ssh key yang digunakan untuk GitHub).

<br></br>

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/jenkins-conf-5.png')} height="400px"/>
  </center>

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/jenkins-conf-6.png')} height="400px"/>
  </center>

<br></br>

Lakukan hal yang sama untuk server agar server jenkins dan server aplikasi dapat saling terhubung.

## 3.3 Membuat Jenkinsfile

`Jenkinsfile` merupakan file yang digunakan untuk menjalankan proses pipeline dari CI/CD, berisi tahapan yang harus diselesaikan. Berikut ini adalah bentuk `Jenkinsfile` yang akan digunakan.

```shell
def secret = 'Server'
def server = 'ubuntu@10.200.253.211'
def directory = 'dumbways-cicd'
def branch = 'main'

pipeline{
    agent any
    stages{
        stage ('docker delete & git pull'){
            steps{
                sshagent([secret]) {
                    sh """ssh -o StrictHostKeyChecking=no ${server} << EOF
                    cd ${directory}
                    docker-compose down
                    docker system prune -f
                    git pull origin ${branch}
                    exit
                    EOF"""
                }
            }
        }
        stage ('docker build'){
            steps{
                sshagent([secret]) {
                    sh """ssh -o StrictHostKeyChecking=no ${server} << EOF
                    cd ${directory}
                    docker-compose build
                    exit
                    EOF"""
                }
            }
        }
        stage ('docker up'){
            steps{
                sshagent([secret]) {
                    sh """ssh -o StrictHostKeyChecking=no ${server} << EOF
                    cd ${directory}
                    docker-compose up -d
                    exit
                    EOF"""
                }
            }
        }
    }
}
```

:::info
Pastikan untuk mengubah variable dibawah ini

```bash
def secret = 'Server' (Ganti sesuai dengan ID pada Jenkins Credentials)
def server = 'ubuntu@10.200.253.211' (Ganti sesuai dengan IP dan username server)
def directory = 'dumbways-cicd' (Ganti sesuai dengan nama repository)
def branch = 'main' (Ganti sesuai dengan branch repository)
```

:::

Kemudian push `Jenkinsfile` tersebut ke repository aplikasi.

## 3.4 Membuat Jenkins Jobs

`Jenkins Jobs` merupakan konfigurasi untuk setiap aplikasi yang membutuhkan proses CI/CD, Kita dapat membuat konfigurasi tersebut sesuai dengan branch atau server yang digunakan dan akan otomatis mendeteksi ketika ada update ke branch tertentu.

Klik **New Item** pada dashboard, kemudian masukkan nama `Jenkins Jobs` yang diinginkan dan pilih bagian **pipeline**.

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/jenkins-conf-7.png')} height="400px"/>
  </center>

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/jenkins-conf-8.png')} height="400px"/>
  </center>

<br></br>

Pada bagian **Build Trigger** centang bagian **GitHub hook trigger for GITScm polling**, kemudian bagian pipeline pilih **Pipeline script from SCM** dan masukan **git url** dari repository Kita serta pilih **credentials** yang digunakan untuk git dan pilih **branch** yang digunakan.

<br></br>

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/jenkins-conf-9.png')} height="400px"/>
  </center>

:::info
Build trigger dapat disesuaikan dengan Git platform yang digunakan seperti GitHub, BitBucket atau GitLab. Jika tidak menemukannya maka perlu melakukan instalasi plugin untuk platform tersebut.
:::

Kemudian pada bagian **Script Path** isikan **Jenkinsfile**

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/jenkins-conf-10.png')} height="400px"/>
  </center>

## 3.5 Membuat WebHook

Agar jenkins mengetahui seluruh aktivitas yang terjadi pada repository, perlu melakukan konfigurasi webhook pada setiap repository aplikasi.

Pada contoh kali ini, kita akan menggunakan GitHub dengan cara pergi repository dan buka tab **settings**

Pilih **webhooks** -> **add webhook** kemudian isi bagian Payload URL seperti berikut :

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/jenkins-conf-11.png')} height="400px"/>
  </center>

<br></br>

:::info
Domain yang Kita gunakan wajib domain publik, bukan virtual domain. Supaya github dapat mengakses url kita maka kita perlu menggunakan localtunnel jika menggunakan lokal server. Untuk server bersifat online dapat menggunakan dns seperti cloudflare.
:::
