# CubeConnect

## 📌 Proje Özeti
**CubeConnect**, girişimciler, yatırımcılar ve mentörleri tek bir dijital çatı altında buluşturan, rol bazlı akıllı eşleşme sistemine sahip bir mobil uygulamadır.  
Uygulama, girişimcilik ekosistemindeki iletişim kopukluklarını, dağınık mentörlük süreçlerini ve verimsiz toplantı organizasyonlarını ortadan kaldırmak için geliştirilmiştir.

Rol tabanlı kullanıcı deneyimi, sektörel filtreleme ve takvim entegrasyonu gibi özelliklerle CubeConnect; stratejik iş birliklerini kolaylaştırır, zamanı verimli kullanır ve potansiyel yatırım fırsatlarını görünür kılar.

## ⚙️ Kurulum ve Kullanım Talimatları
Uygulamayı yerel geliştirme ortamınızda çalıştırmak için aşağıdaki adımları izleyin:

1. Flutter SDK’yı resmi kaynak üzerinden kurun:  
   👉 [https://flutter.dev](https://flutter.dev)

2. Projeyi GitHub üzerinden klonlayın:
```bash
git clone https://github.com/kullaniciadi/cubeconnect.git
cd cubeconnect
```

3. Bağımlılıkları yükleyin:
```bash
flutter pub get
```

4. Firebase yapılandırması:
   - `google-services.json` dosyasını `android/app/` dizinine,
   - `GoogleService-Info.plist` dosyasını `ios/Runner/` dizinine yerleştirin.
   - Firebase Authentication ve Firestore modüllerinin aktif olduğundan emin olun.

5. Uygulamayı başlatın:
```bash
flutter run
```

> 📌 Not: Geliştirme ortamının sorunsuz çalışması için `flutter doctor` çıktısında tüm bileşenlerin yeşil olduğundan emin olun.

## 🧰 Kullanılan Teknolojiler
CubeConnect, modern mobil yazılım geliştirme prensiplerine uygun olarak aşağıdaki teknoloji yığını ile oluşturulmuştur:

- **Flutter** – Performans odaklı, çok platformlu mobil geliştirme
- **Dart** – Uygulama mantığını yöneten modern ve sade programlama dili
- **Firebase Authentication** – Güvenli kimlik doğrulama
- **Firebase Firestore** – Gerçek zamanlı bulut veritabanı
- **BLoC Pattern** – State management ve mantıksal ayrım için güçlü yapı
- **StreamBuilder** – Anlık veri akışlarını yönetmek için

## 👥 Katılımcı Bilgileri

| İsim             | Rolü                          | Katkı Alanı |
|------------------|-------------------------------|--------------|
| **Metehan Zengin** | Ürün Tasarımı & Sunum Lideri | Figma arayüz tasarımları, kullanıcı akışı modellemesi, sunum & dökümantasyon |
| **Ayfer Yakışır** | Mobil Geliştirici             | Flutter ile UI kodlaması, ekran geçişleri ve etkileşim geliştirmeleri |
| **Enes Odabaş**   | Backend Entegrasyon Uzmanı    | Firebase yapılandırması, kimlik doğrulama, veritabanı bağlantıları |

> Her ekip üyesi, hackathon süresince belirli bir modüle odaklanarak proje içinde maksimum verimlilik sağlamıştır.

## 📜 Şartlar

Bu proje, **CubeIncubation Mobile Hackathon 2025** kapsamında geliştirilmiş olup yalnızca yarışma ve değerlendirme amaçlı sunulmuştur.

- Projede yer alan kodlar, içerikler ve tasarımlar ticarileştirilmemiştir.  
- Üçüncü taraflar tarafından kullanılmadan önce proje ekibinden izin alınması gerekmektedir.  
- Lisans: *Hackathon içi kullanım serbest, dış kullanım izne tabidir.*

📬 Daha fazla bilgi ve iletişim için: `yakisirayfer@gmail.com`