📚 Dinamik Kütüphane Yönetim Sistemi

ASP Classic (VBScript) Tabanlı Web Uygulaması

1. Proje Hakkında

Bu proje, ASP Classic (VBScript) kullanılarak geliştirilmiş, veritabanı kullanmadan, uygulama seviyesinde (Application Object) çalışan dinamik bir kütüphane yönetim sistemidir.
Kullanıcılar kitapları arayabilir, yeni kitap ekleyebilir, kitapları silebilir ve kitap detaylarını görüntüleyebilir.

Sistem, küçük ölçekli kütüphaneler veya kişisel kitap arşivleri için temel bir dijital yönetim altyapısı sunar.

2. Projenin Amaçları

Kitap yönetim işlemlerini dijitalleştirmek

Kullanıcıya hızlı arama ve erişim imkânı sağlamak

Dinamik veri ekleme ve silme işlemlerini öğretmek

ASP Classic ve Application Object kullanımını pekiştirmek

Kullanıcı dostu ve estetik bir arayüz sunmak

3. Kullanılan Teknolojiler
Teknoloji	Açıklama
ASP Classic (VBScript)	Sunucu taraflı programlama
HTML5	Sayfa yapısı
CSS3	Arayüz ve görsellik
Application Object	Dinamik veri yönetimi
JavaScript	Kullanıcı etkileşimleri (onay pencereleri vb.)
4. Proje Mimarisi

Proje, MVC benzeri sade bir yapı izler:

index.asp → Ana sayfa ve kitap arama

search.asp → Arama sonuçlarının listelenmesi

add.asp → Yeni kitap ekleme formu

addandsave.asp → Kitap ekleme işlemi

detail.asp → Kitap detay görüntüleme

delete.asp → Kitap silme işlemi

bookdata.asp → Application içindeki kitap verileri

style.css → Tüm arayüz tasarımı

5. Temel Özellikler
🔍 Kitap Arama

Kitap adı veya yazar adına göre arama yapılabilir

Büyük/küçük harf duyarsızdır

Arama kutusu boş bırakıldığında tüm kitaplar listelenir

➕ Kitap Ekleme

Kitap adı

Yazar adı

Yayın yılı

Tür bilgisi

Girişler doğrulandıktan sonra Application dizisine eklenir

🗑️ Kitap Silme

Silme işlemi öncesinde JavaScript onay penceresi gösterilir

Onay sonrası kitap Application dizisinden kaldırılır

Liste otomatik güncellenir

📄 Kitap Detay Görüntüleme

Seçilen kitabın tüm bilgileri ayrı sayfada gösterilir

Estetik ve okunabilir bir detay tasarımı sunulur

🔄 Dinamik Veri Yönetimi

Veriler Application Object içinde tutulur

Tüm kullanıcılar aynı kitap listesini görür

Application.Lock / Unlock ile veri bütünlüğü sağlanır

6. Kod Sayfalarının Açıklamaları
6.1. index.asp

Ana giriş sayfasıdır.
Kullanıcıya kitap arama alanı sunar ve mevcut kitapları listeler.
Ayrıca yeni kitap eklemek için add.asp sayfasına yönlendirme içerir.

6.2. search.asp

Kullanıcının girdiği arama kriterine göre kitapları filtreler.
Kitap adı veya yazar adına göre arama yapılabilir.
Sonuçlar liste halinde gösterilir ve her kitap için Detay ve Sil butonları sunulur.

6.3. add.asp

Yeni kitap eklemek için kullanılan form sayfasıdır.
Kullanıcıdan kitap bilgilerini alır ve addandsave.asp sayfasına POST eder.

6.4. addandsave.asp

Formdan gelen verileri işler.

Giriş doğrulaması yapar

Verileri Application dizisine ekler

Veri eklerken Application.Lock kullanır

İşlem sonrası kullanıcıyı ana sayfaya yönlendirir

6.5. detail.asp

Seçilen kitabın tüm bilgilerini detaylı şekilde gösterir.
Kullanıcı buradan ana sayfaya geri dönebilir veya işlem yapabilir.

6.6. delete.asp

Kitap silme işlemini gerçekleştirir.
ID’ye göre ilgili kitabı Application dizisinden kaldırır.
İşlem sonrası liste güncellenir.

6.7. bookdata.asp

Uygulama genelinde kullanılan kitap listesini tanımlar.
Eğer Application içinde kitap listesi yoksa, varsayılan kitapları yükler.

6.8. style.css

Tüm sayfaların arayüz tasarımını yönetir.

Koyu tema

Kart yapıları

Animasyonlar

Responsive form ve butonlar

7. Güvenlik ve Veri Tutarlılığı

Application.Lock / Application.Unlock kullanılarak eşzamanlı erişim kontrol edilir

Form girişleri sunucu tarafında doğrulanır

Silme işlemleri kullanıcı onayı gerektirir

8. Geliştirme Önerileri

Veritabanı (Access / SQL Server) entegrasyonu

Kullanıcı girişi ve yetkilendirme

Kitap güncelleme (edit) özelliği

Sayfalama (pagination)

Arama filtreleri (tür, yıl aralığı vb.)

9. Sonuç

Bu proje, ASP Classic ile dinamik web uygulaması geliştirme,
Application Object kullanımı,
form tabanlı veri yönetimi ve
kullanıcı dostu arayüz tasarımı konularında güçlü bir örnek sunmaktadır.

Hem akademik ödevler hem de temel web programlama öğrenimi için uygundur.