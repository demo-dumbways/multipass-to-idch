---
sidebar_position: 4
---

# 4. Microservices

import useBaseUrl from '@docusaurus/useBaseUrl';

**Microservices** merupakan aplikasi kecil yang saling bekerjasama, setiap aplikasi tersebut memiliki fokus untuk mengerjakan satu fitur saja. Selain itu setiap aplikasi dapat di deploy pada server terpisah, yang akan saling berhubungan dengan service lain melalui network.

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/microservices.png')} height="400px"/>
  </center>

## 4.1 Kenapa Harus Microservices?

Berikut ini adalah beberapa kelebihan jika menggunakan arsitektur microservices :

- Mudah dimengerti, karena relatif lebih kecil ukuran servicenya.
- Lebih mudah di develop, maintenance, test dan deploy.
- Lebih mudah bergonta-ganti teknologi.
- Mudah di scale sesuai kebutuhan.
- Bisa dikerjakan dalam tim kecil.

## 4.2 Kekurangan Microservices

- Komunikasi antar service yang rawan error.
- Testing interaksi antar service lebih sulit.

## 4.3 Database Perservices

Kenapa harus database per service?

- Memastikan bahwa antar service tidak ketergantungan.
- Tiap service bisa menggunakan aplikasi database sesuai dengan kebutuhan.
- Service tidak perlu tahu kompleksitas internal database service lain.

  <center>
  <img alt="image1" src={useBaseUrl('img/docs/Perservices.png')} height="400px"/>
  </center>
