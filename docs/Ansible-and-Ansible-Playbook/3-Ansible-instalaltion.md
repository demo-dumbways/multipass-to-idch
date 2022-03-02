---
sidebar_position: 3
---

# 3. Ansible Installation

import useBaseUrl from '@docusaurus/useBaseUrl';

Sekarang kita akan mencoba untuk melakukan instalasi ansible. Untuk langkah-langkah nya kalian dapat mengikuti beberapa perintah di bawah ini :

:::caution
Lakukan Instalasi pada local server kalian
:::

```bash
sudo apt update
```

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/ans1.png')} height="400px"/>
  </center>

```bash
sudo apt install software-properties-common
```

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/ans2.png')} height="400px"/>
  </center>

```bash
sudo add-apt-repository --yes --update ppa:ansible/ansible
```

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/ans3.png')} height="400px"/>
  </center>

```bash
sudo apt install ansible
```

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/ans4.png')} height="400px"/>
  </center>

```bash
ansible --version
```

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/ans5.png')} height="400px"/>
  </center>
