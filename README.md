# Dinamik Kütüphane Sistemi (ASP Classic) – Teknik Tasarım Dokümanı

## Genel Bakış

Bu proje, kullanıcıların kitapları **dinamik olarak arayabildiği**, **yeni kitap ekleyebildiği**, **kitap silebildiği** ve **kitap detaylarını görüntüleyebildiği** web tabanlı bir kütüphane uygulamasıdır.  
Uygulama **ASP Classic (VBScript)** ile geliştirilmiştir ve veri saklama için **Application dizisi** kullanır (RAM tabanlı, veritabanı yok).

---

## Sistem Yapısı

### Modüller

- **Veri Yönetimi (Application Dizisi) Modülü**  
  Kitap kayıtlarını Application seviyesinde tutar. Uygulama çalıştığı sürece veri bellekte saklanır.

- **Arama Modülü**  
  Kitap adı veya yazar adına göre filtreleme yapar ve sonuçları listeler.

- **Kitap Ekleme Modülü**  
  Form üzerinden yeni kitap ekler. Girdi doğrulaması uygulanır.

- **Silme Modülü**  
  Seçilen kitabı Application dizisinden çıkarır. (Onay/popup kullanılabilir.)

- **Detay Görüntüleme Modülü**  
  Seçilen kitabın tüm bilgilerini ayrı sayfada gösterir.

### Veri Kaynağı

- Veri kaynağı **Application("Books")** benzeri bir yapı ile RAM’de tutulur.
- Uygulama yeniden başlatılırsa veri sıfırlanır (bu tasarım gereği).

---

## İşlevler

### 1) Başlangıç Verisi Oluşturma
- Sistem ilk kez açıldığında örnek kitap listesi oluşturulur.
- Veri tutarlılığı için eşzamanlılık kontrolü yapılır (**Application.Lock / Unlock**).

### 2) Arama
- Kullanıcı arama terimi girer.
- Terim kitap adı/yazar alanlarında aranır.
- Sonuçlar kart/liste şeklinde ekrana basılır.

### 3) Kitap Ekleme + Doğrulama
- Kitap adı, yazar, yıl ve tür alanları alınır.
- Kurallara uygun değilse hata mesajı gösterilir.
- Uygunsa listeye eklenir ve kullanıcı yönlendirilir.

### 4) Silme
- URL üzerinden gelen index/id bilgisine göre ilgili kayıt silinir.
- Liste güncellenmiş şekilde tekrar görüntülenir.

### 5) Detay Görüntüleme
- Seçilen kitabın tüm alanları detay sayfasında gösterilir.
- Kullanıcı geri dönebilir veya silme işlemine gidebilir.

---

## Sayfalar (ASP Dosyaları)

- **index.asp**  
  Ana sayfa: arama formu + (isteğe göre) tüm kitapları listeleme + add sayfasına geçiş.

- **search.asp**  
  Arama sonuçlarını listeler. Sonuç yoksa uyarı gösterir.

- **add.asp**  
  Kitap ekleme formu (kullanıcıdan veri alır).

- **addandsave.asp**  
  Form verilerini doğrular ve Application dizisine ekler. Başarılıysa yönlendirir.

- **delete.asp**  
  Seçilen kitabı siler, ardından uygun sayfaya geri gönderir.

- **detail.asp**  
  Seçilen kitabın detaylarını gösterir.

- **style.css**  
  UI/UX görünüm dosyası (kartlar, butonlar, form alanları vs.)

---

## Kurulum ve Çalıştırma

1. Windows’ta **IIS** etkinleştir:
   - “Windows özelliklerini aç/kapat” → IIS + ASP + Static Content
2. Proje klasörünü IIS’te site/virtual directory olarak ekle.
3. Tarayıcıdan aç:
   - `http://localhost/<projeKlasoru>/index.asp`

---

## Bağımlılıklar

- IIS (ASP Classic desteği açık olmalı)
- Tarayıcı (Chrome/Edge)
- Ek kütüphane gerektirmez.

---

## Notlar

- Veri RAM’de tutulduğu için sunucu yeniden başlatılırsa kayıtlar sıfırlanır.
- Çoklu kullanıcı senaryosunda eşzamanlılık için Application.Lock/Unlock önemlidir.

---
