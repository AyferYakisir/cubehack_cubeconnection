# 📊 CubeConnect – Teknik ve Kullanıcı Analiz Raporu

## 1. Teknik Analiz

### 1.1 Mimari Yapı
CubeConnect, Flutter + Firebase tabanlı modern mobil mimariye sahiptir. BLoC mimarisi sayesinde UI ile iş mantığı ayrılmış, sürdürülebilir ve test edilebilir bir yapı oluşturulmuştur.

### 1.2 Kullanılan Teknolojiler
- Flutter (mobil geliştirme)
- Dart (programlama dili)
- Firebase Authentication (güvenli oturum)
- Firebase Firestore (gerçek zamanlı veri)
- BLoC Pattern (durum yönetimi)
- StreamBuilder (veri akışı)

### 1.3 Veri Yapısı
Firestore’da 3 ana koleksiyon:
- `users/`: rol, isim, email bilgisi
- `meetings/`: yatırımcı, girişimci, saat, durum
- `mentorship_requests/`: talep eden, alan, onay durumu

### 1.4 Karşılaşılan Zorluklar
- Rol bazlı akışın ayrıştırılması
- Gerçek zamanlı veri senkronizasyonu
- Firebase güvenlik kurallarının doğru yapılandırılması

### 1.5 Çözümler
- Firestore’da `role` alanı ile yönlendirme çözüldü
- `StreamBuilder` ile senkron veri güncelleme sağlandı
- Firestore Rules yapılandırılarak erişim güvenliği sağlandı

---

## 2. Kullanıcı Analizi

### 2.1 Hedef Kitle
- **Girişimciler:** yatırım arayan startup sahipleri
- **Yatırımcılar:** sektör odaklı bireysel ve kurumsal yatırımcılar
- **Mentörler:** deneyimlerini aktarmak isteyen uzmanlar

### 2.2 Kullanıcı Yolculuğu
- Giriş → Rol seçimi → Profil oluşturma → Mentör talebi → Yatırımcı eşleşmesi → Toplantı planlama

### 2.3 UX Tasarım Gerekçeleri
- Rol bazlı arayüz sadeliği
- Kullanıcıyı yormayan 3–4 adımda tamamlanabilir akış
- Temiz, minimalist ve profesyonel görünüm
- Renk kontrastı ve ikonlar ile rol farkındalığı

### 2.4 Geri Bildirimler (Varsa)
> Hackathon süresince yapılan testlerde kullanıcılar arayüzün sade ve yönlendirici olduğunu belirtti.

---

## 3. Sonuç

CubeConnect, teknik olarak sürdürülebilir, kullanıcı deneyimi açısından anlaşılır ve erişilebilir bir çözüm sunmayı hedeflemektedir. Hem kullanıcı ihtiyaçları hem de teknik gereksinimler başarıyla uyumlaştırılmıştır.
