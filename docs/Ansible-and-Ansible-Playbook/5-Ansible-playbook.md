---
sidebar_position: 5
---

# 5. Ansible Playbook

import useBaseUrl from '@docusaurus/useBaseUrl';

**Ansible playbook** merupakan kumpulan role yang dijalankan untuk melakukan konfigurasi pada sebuah server atau hal-hal lainnya. Dengan kata lain, **ansible-playbook** ini memudahkan kita dalam memanajemen server-server atau memudahkan kita melakukan hal yang berulang-ulang.

## 5.1 Make Ansible-Playbook Configuration

- Sekarang kita coba untuk membuat file configuration untuk menjalankan web.server `nginx`

  :::info
  Jika kalian ingin membuat file configuration untuk ansible-playbook kalian harus membuat sebuah file yang ber-extensikan `yaml`.
  :::

### 1. Nginx

```bash
nano nginx.yml
```

```bash
- hosts: (destination-server)
  become: true
  tasks:
  - name: (name of service)
    apt:
      name:
        - nginx
      state: latest

```

**keterangan :**

- Hosts adalah lokasi dimana konfigurasi `ansible` akan di jalankan
- become adalah memungkinkan Anda untuk 'menjadi' pengguna lain, berbeda dari pengguna yang masuk ke mesin (remote user)
- tasks adalah tugas apa yang akan di jalankan
- name adalah nama dari tugas yang ingin di jalankan (contoh `install nginx`)
- apt adalah package manager
- name adalah aplikasi apa yang ingin di install (contoh `nginx, git`)
- state adalah version dari aplikasi yang akan di install

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/ans13.png')} height="400px"/>
  </center>

- Jika kalian telah selesai untuk membuat file konfigurasi, tahapan selanjutnya adalah kalian coba cek apakah konfigurasi yang telah kalian buat sudah sesuai atau belum dengan menggunakan perintah berikut ini :

  ```bash
  ansible-playbook --syntax-check (name file)
  ```

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/ans14.png')} height="400px"/>
  </center>

  **keterangan :** jika muncul notifikasi seperti gambar di atas ini berati konfigurasi kalian berhasil dan tidak ada eror

- Sekarang kita coba jalankan file konfigurasi yang telah kita buat menggunakan `ansible-playbook`

  ```bash
  ansible-playbook (name file)
  ```

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/ans15.png')} height="400px"/>
  </center>

- Jika muncul notifikasi seperti gambar di atas maka kalian telah berhasil melakukan installasi `nginx` menggunakan `ansible`

- Sekarang kita coba akses IP dari server kalian ke dalam web.browser

  http://10.206.130.236

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/ans16.png')} height="400px"/>
  </center>

### 2. Install Docker

```bash
nano Docker.yml
```

```bash
- hosts: all
  become: true
  tasks:
  - name: update
    apt:
      update_cache: yes

  - name: upgrade
    apt:
      upgrade: dist

  - name: install docker dependencies
    apt:
      name:
        - ca-certificates
        - curl
        - gnupg
        - lsb-release

  - name: add docker gpg key
    apt_key:
       url: https://download.docker.com/linux/ubuntu/gpg

  - name: add docker repository
    apt_repository:
      repo: deb https://download.docker.com/linux/ubuntu focal stable

  - name: install docker
    apt:
      name:
        - docker-ce
        - docker-ce-cli
        - containerd.io

  - name: update
    shell: sudo apt update

  - name: install docker-compose
    shell: sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker->

  - name: set permission for docker
    shell: sudo chmod +x /usr/local/bin/docker-compose

  - name: setup docker command without sudo
    shell: sudo usermod -aG docker ubuntu
```

**keterangan:**

- shell adalah perintah untuk mengeksekusi sama seperti saat kalian berada di terminal.

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/ans17.png')} height="300px"/>
  </center>

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/ans18.png')} height="300px"/>
  </center>

- Sekarang kita coba cek apakah file konfigurasi untuk installasi `docker` yang telah kita buat apakah ada eror atau tidak.

  ```bash
  ansible-playbook --syntax-check (name file)
  ```

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/ans19.png')} height="400px"/>
  </center>

  **keterangan :** jika muncul notifikasi seperti gambar di atas ini berati konfigurasi kalian berhasil dan tidak ada eror.

- Sekarang tinggal kita jalankan file konfigurasi yang telah kita buat menggunakan `ansible playbook`.

  ```bash
  ansible-playbook (name file)
  ```

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/ans20.png')} height="420px"/>
  </center>

- Jika muncul notifikasi seperti gambar di atas maka kalian telah berhasil melakukan installasi `docker` menggunakan `ansible`.
- Sekarang kita coba untuk masuk ke dalam server kita lalu kita cek apakah `docker` telah terinstall.

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/ans21.png')} height="400px"/>
  </center>

### 3. Create User

```bash
nano user.yml
```

```bash
- hosts: all
  become: true
  tasks:
    - name: Create user
      user:
        name: alvin
        password: "$$6$1iAc4k8IMunxbIyj$p9QyQx7mSBCnIkt67PEpZFK5PzvIn1AA1AkV9Vu/ZDKplyb1gr08mp.7XsnjUHlt2P31lg.fV1SRnw1Au/Css1"
        groups: sudo
        state: present
        shell: /bin/bash
        system: no
        createhome: yes
        home: /home/alvin

    - name: change PasswordAuthentication
      lineinfile:
        path: /etc/ssh/sshd_config
        regexp: 'PasswordAuthentication no'
        line: PasswordAuthentication yes

    - name: reload sshd
      systemd:
        name: sshd
        state: reloaded
```

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/ans22.png')} height="400px"/>
  </center>

:::info
Untuk membuat password kalian dapat menggunakan `mkpasswd` untuk installasi `mkpasswd` kalian dapat menggunakan perintah dibawah ini :

```bash
sudo apt update
```

```bash
sudo apt install whois
```

Jalankan perintah dibawah ini untuk melakukan generate password jika muncul notifikasi password kalian tinggal masukkan password yang kalian inginkan jika sudah tekan saja `enter`, setelah itu copy password yang muncul dan paste ke dalam file konfigurasi `ansible` untuk membuat user.

```bash
mkpasswd --method=sha-512
```

:::

- Sekarang kita coba cek apakah file konfigurasi untuk membuat `user` yang telah kita buat apakah ada eror atau tidak.

  ```bash
  ansible-playbook --syntax-check (name file)
  ```

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/ans23.png')} height="400px"/>
  </center>

- Sekarang tinggal kita jalankan file konfigurasi yang telah kita buat menggunakan `ansible playbook`.

  ```bash
  ansible-playbook (name file)
  ```

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/ans24.png')} height="400px"/>
  </center>

- Jika muncul notifikasi seperti gambar di atas, berarti kalian telah berhasil untuk membuat user di server kalian.
- Sekarang kita coba cek ke dalam server kita apakah sudah terbuat `user` nya dan kita coba install `nginx` untuk memeriksa apakah user yang telah kita buat dapat menggunakan perintah `sudo`.

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/ans25.png')} height="400px"/>
  </center>

### 4. Monitoring

- Sekarang kita akan coba untuk membuat file konfigurasi `ansible` untuk menjalankan instalasi monitoring yang telah kita pelajari sebelumnya.

- Pertama tama kita buat file terlebih dahulu yang berisikan service-service yang diperlukan oleh monitoring kita.

  ```bash
  mkdir files
  ```

  ```bash
  nano node-exporter.service
  ```

  **Node Exporter**: [Here](/Monitoring-Server/Node-exporter)

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/ans26.png')} height="400px"/>
  </center>

  ```bash
  nano prometheus.service
  ```

  **Prometheus**: [Here](/Monitoring-Server/Prometheus)

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/ans27.png')} height="400px"/>
  </center>

  ```bash
  nano prometheus.yml
  ```

  **Prometheus**: [Here](/Monitoring-Server/Prometheus)

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/ans28.png')} height="400px"/>
  </center>

- Jika sudah sekarang kita akan membuat file konfigurasi `ansible` untuk menjalankan instalasi monitoring

  ```bash
  nano monitoring.yml
  ```

  ```bash
  - hosts: all
    become: true
    gather_facts: yes
    tasks:
      - name: "Update and upgrade systems"
        apt:
          update_cache: yes
          upgrade: dist

      - name: "Install node exporter"
        shell: "wget https://github.com/prometheus/node_exporter/releases/download/v0.15.2/node_exporter-0.15.2.linux-amd64.tar.gz; tar -xf node_exporter-0.15.2.linux-amd64.tar.gz; sudo mv node_exporter-0.15.2.linux-amd64/node_exporter /usr/local/bin; sudo useradd -rs /bin/false node_exporter"
        args:
          executable: /bin/bash

      - name: "Create service for node exporter"
        copy:
          src: node-exporter.service
          dest: /etc/systemd/system/node-exporter.service

      - name: "Reload service for node exporter"
        shell: "sudo systemctl daemon-reload; sudo systemctl enable node-exporter; sudo systemctl start node-exporter"
        args:
          executable: /bin/bash

      - name: "Install prometheus"
        shell: "wget https://github.com/prometheus/prometheus/releases/download/v2.1.0/prometheus-2.1.0.linux-amd64.tar.gz; tar -xf prometheus-2.1.0.linux-amd64.tar.gz; sudo mv prometheus-2.1.0.linux-amd64/prometheus prometheus-2.1.0.linux-amd64/promtool /usr/local/bin; sudo mkdir /etc/prometheus /var/lib/prometheus; sudo mv prometheus-2.1.0.linux-amd64/consoles prometheus-2.1.0.linux-amd64/console_libraries /etc/prometheus"
        args:
          executable: /bin/bash

      - name: "Add node exporter to prometheus"
        copy:
          src: prometheus.yml
          dest: /etc/prometheus/prometheus.yml

      - name: "Add user prometheus"
        shell: "sudo useradd -rs /bin/false prometheus; sudo chown -R prometheus: /etc/prometheus /var/lib/prometheus"
        args:
          executable: /bin/bash

      - name: "Create service for prometheus"
        copy:
          src: prometheus.service
          dest: /etc/systemd/system/prometheus.service

      - name: "Reload service for prometheus"
        shell: "sudo systemctl daemon-reload; sudo systemctl enable prometheus; sudo systemctl start prometheus"
        args:
          executable: /bin/bash

      - name: "Install grafana"
        shell: 'sudo wget -q -O - https://packages.grafana.com/gpg.key | apt-key add -; sudo add-apt-repository "deb https://packages.grafana.com/oss/deb stable main"; sudo apt install grafana -y'
        args:
            executable: /bin/bash

      - name: "Reload service for grafana"
        shell: "sudo systemctl daemon-reload; sudo systemctl enable grafana-server; sudo systemctl start grafana-server"
        args:
          executable: /bin/bash
  ```

  **keterangan :**

  - src adalah source,jadi dia mengambil data dari file yg dimasukkan pada `src`
  - dest adalah destination, di bagian ini kita tinggal memasukkan lokasi dari data yang telah kita buat ingin kita masukkan kemana

  <br></br>

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/ans29.png')} height="400px"/>
  </center>

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/ans30.png')} height="400px"/>
  </center>

- Sekarang kita coba cek apakah file konfigurasi untuk melakukan instalasi `monitoring` yang telah kita buat apakah ada eror atau tidak

  ```bash
  ansible-playbook --syntax-check (name file)
  ```

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/ans32.png')} height="400px"/>
  </center>

- Sekarang tinggal kita jalankan file konfigurasi yang telah kita buat menggunakan `ansible playbook`

  ```bash
  ansible-playbook (name file)
  ```

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/ans31.png')} height="400px"/>
  </center>

- Sekarang kita coba akses `node-exporter`, `prometheus`, dan `grafana` kita di web.browser

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/ans32.png')} height="400px"/>
  </center>

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/ans33.png')} height="400px"/>
  </center>

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/ans34.png')} height="400px"/>
  </center>

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/ans35.png')} height="400px"/>
  </center>
