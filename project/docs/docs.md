# 📱 CubeConnect

## 🧠 Sloganlar
- “Girişimler Büyür, Yatırımlar Değerlenir”
- “Güvenilir Yatırımlar, Güçlü Girişimler”

## ❓ Problem Tanımı

Girişimcilik ekosisteminde yatırımcı ve girişimciler arasındaki etkileşim, çoğu zaman rastlantısal, düzensiz ve yapılandırılmamış süreçler üzerinden yürümektedir. Mevcut platformlar, sadece temel bir iletişim ağı sağlamakta, ancak tarafların hedeflerine ulaşmasını kolaylaştıracak veri odaklı eşleşme algoritmaları, alan bazlı filtreleme, profesyonel mentorluk desteği gibi araçlardan yoksundur.

Yatırımcılar, ilgi duydukları sektöre veya yatırım alanına uygun girişimleri bulmakta zorluk çekmekte; bu da potansiyel fırsatların gözden kaçmasına, kaynakların verimsiz kullanımına ve stratejik yatırımların ertelenmesine yol açmaktadır. Öte yandan girişimciler, iş fikirlerini doğru yatırımcılarla buluşturmak yerine, sınırlı çevrelerinde rastlantıya dayalı fırsatlar kovalamak zorunda kalmaktadır.

Toplantılar ise çoğu zaman profesyonel olmayan bir zeminde, ölçülebilir kriterler olmadan, sadece fikir alışverişi düzeyinde gerçekleşmekte ve bu da yatırım sürecini belirsiz, verimsiz ve sürdürülemez kılmaktadır.

Bu sistemsizlik içinde, mentörlük mekanizması da eksik kalmakta, girişimciler yatırımcı karşısına hazırlıksız ve stratejisiz çıkmakta; yatırımcılar ise değerlendirilecek fikirlerin olgunluk düzeyine dair net bir çerçeve bulamamaktadır.

## 🎯 Hedef Kitle

🏛️ Yatırımcılar
Yatırım stratejilerini belirli sektörler veya girişim alanları çerçevesinde şekillendiren bireysel yatırımcılar, melek yatırımcılar ya da kurumsal yatırım temsilcileridir. Bu kişiler, sermayelerini potansiyel vaat eden girişimlerde değerlendirmek isterken; fikir olgunluğu, ekip yeterliliği ve sektör analizleri gibi unsurları göz önünde bulundurarak daha bilinçli yatırım kararları almak istemektedirler. CubeConnect, yatırımcıların bu kriterlere uygun girişimcilere doğrudan ulaşmasını sağlayarak zaman ve kaynak verimliliği sunar.

🚀 Girişimciler
İnovatif ürün, hizmet veya iş fikrine sahip; ancak bu fikrini gerçeğe dönüştürmek için sermayeye, stratejik yönlendirmeye ve bağlantılara ihtiyaç duyan bireyler veya ekiplerdir. CubeConnect, girişimcilere hem yatırımcılarla profesyonel toplantı imkânı sunar, hem de mentörlük desteğiyle onları yatırım sürecine hazırlayarak iş fikirlerini daha sürdürülebilir ve cazip hale getirir.

🎓 Mentörler
Sektör deneyimine sahip, girişimcilik yolculuğunu anlayan ve genç girişimcilere rehberlik edecek bilgi ve vizyona sahip kişilerdir. CubeConnect, mentörlerin ekosisteme aktif olarak katılmalarını sağlayarak girişimcilerin sadece yatırım almalarını değil, aynı zamanda yatırım sürecine entelektüel ve stratejik olarak hazır hale gelmelerini hedefler.

## 💎 Değer Önerisi

CubeConnect, girişimcilik ekosisteminin üç temel aktörü olan yatırımcıları, girişimcileri ve mentörleri tek bir dijital platformda bir araya getirerek süreci sadece kolaylaştırmakla kalmaz; aynı zamanda veriye dayalı, stratejik ve sürdürülebilir bir işleyiş sağlar.

Uygulama, yatırımcıların ilgi alanlarına, sektör tercihlerine ve yatırım ölçeklerine göre girişimcileri filtreleyerek, klasik ağ temelli arayışların ötesine geçer. Girişimciler içinse yalnızca yatırım bulma aracı değil; aynı zamanda mentörlük desteğiyle hazırlık yapabilecekleri, gelişimlerini izleyebilecekleri ve toplantılarını zamanlayabilecekleri bütüncül bir platform sunar.

Mentörler, girişimcilerin yatırım görüşmelerine stratejik olarak hazırlanmasına yardımcı olurken, yatırımcılar da görüşecekleri girişimlerin vizyon, olgunluk ve potansiyel açısından değerlendirilmiş olduklarından emin bir şekilde sürece katılır.

CubeConnect’in sunduğu bu yapı sayesinde:

Eşleşmeler daha isabetli,

Toplantılar daha verimli,

Yatırımlar daha doğru adreslere yönlendirilir.

Bu da hem bireysel girişimciler hem de yatırımcılar için kaynakların doğru kullanıldığı, ölçülebilir başarıların elde edildiği bir sistem oluşturur.

🛠️ Teknik Dokümantasyon
🧱 Mimari Genel Bakış
CubeConnect uygulaması, modern mobil uygulama geliştirme prensipleri doğrultusunda Flutter tabanlı olarak inşa edilmiştir. Uygulama, arka uç servisleri olarak Firebase altyapısını kullanmakta ve BLoC (Business Logic Component) mimarisi ile yönetilmektedir. Bu sayede hem kullanıcı arayüzü ile iş mantığı birbirinden ayrılmış, hem de yüksek okunabilirlik ve sürdürülebilirlik sağlanmıştır.

Uygulama katmanları şu şekilde organize edilmiştir:

Presentation Layer (UI): Flutter widget’ları ile oluşturulmuş ekranlar.

Business Logic Layer: BLoC mimarisi ile kontrol edilen state ve event yapıları.

Data Layer: Firebase Firestore üzerinden alınan ve gönderilen verileri yöneten servisler.

Authentication Layer: Firebase Authentication ile kimlik doğrulama (email/password).

🧰 Kullanılan Teknoloji Yığını ve Kütüphaneler
Katman	Teknoloji / Kütüphane
Mobil Geliştirme	Flutter
UI Durum Yönetimi	flutter_bloc
Backend & Realtime DB	Firebase Firestore
Kimlik Doğrulama	Firebase Authentication
Durum Gözlemi & Eşzamanlılık	Equatable, Stream
Diğer	Cloud Firestore Rules, Firebase Console, Provider (opsiyonel)


🔌 API Dokümantasyonu
Bu sürümde özel bir RESTful API kullanılmamıştır. Uygulamanın veri yönetimi ve sunucu taraflı tüm işlemleri doğrudan Firebase Firestore ve Firebase Authentication hizmetleri üzerinden yürütülmektedir.

Firebase’in sunduğu güvenli ve gerçek zamanlı veritabanı sistemi, girişimci-yatırımcı-mentör etkileşimleri için gerekli olan kullanıcı yönetimi, eşleşme takibi ve toplantı planlama gibi işlemleri API geliştirmeye ihtiyaç kalmadan doğrudan gerçekleştirebilmemizi sağlamıştır.

Bu tercih sayesinde:

🧩 Harici API bağımlılığı azaltılmış,

🚀 Geliştirme süreci hızlandırılmış,

🔐 Güvenlik Firebase üzerinden merkezi şekilde yönetilmiştir.

Gelecekteki sürümlerde, özelleştirilmiş backend çözümleri ve dış servislerle entegrasyon gerektiğinde REST veya GraphQL tabanlı API yapısı projeye entegre edilebilir.




⚙️ Ortam Kurulum Talimatları 
Aşağıdaki adımları takip ederek CubeConnect uygulamasını lokal ortamınızda çalıştırabilirsiniz:

1️⃣ Flutter SDK Kurulumu
Geliştirme ortamınızı hazırlamak için Flutter SDK'yı indirip sisteminize tanımlamanız gerekmektedir:

🔗 Flutter Kurulum Rehberi

Kurulum sonrası terminalde aşağıdaki komutla Flutter'ın doğru kurulduğunu test edebilirsiniz:

bash
Kopyala
Düzenle
flutter doctor
2️⃣ Projeyi Klonlayın
GitHub deposunu kendi makinenize klonlayın:

bash
Kopyala
Düzenle
git clone https://github.com/kullaniciadi/cubeconnect.git
cd cubeconnect
3️⃣ Gerekli Paketleri Yükleyin
Flutter bağımlılıklarını indirin:

bash
Kopyala
Düzenle
flutter pub get
4️⃣ Firebase Yapılandırması
Firebase Console üzerinden yeni bir proje oluşturun.

Android için google-services.json, iOS için GoogleService-Info.plist dosyalarını indirin.

Bu dosyaları aşağıdaki klasörlere yerleştirin:

Android:

bash
Kopyala
Düzenle
android/app/google-services.json
iOS:

swift
Kopyala
Düzenle
ios/Runner/GoogleService-Info.plist
Firebase Authentication ve Firestore Database modüllerini etkinleştirin.

5️⃣ Uygulamayı Başlatın
Emülatörünüzü veya fiziksel cihazınızı bağladıktan sonra aşağıdaki komutla uygulamayı başlatabilirsiniz:

bash
Kopyala
Düzenle
flutter run
📝 Not: Gerekli durumlarda, flutter clean komutunu çalıştırarak önbelleği temizlemeniz önerilir.



📲 Kullanım Kılavuzu
CubeConnect, üç ana kullanıcı profili (Girişimci, Yatırımcı, Mentör) için özelleştirilmiş kullanıcı deneyimi sunar. Bu bölüm, uygulamanın kurulumu, kullanıcı yolculuğu, temel fonksiyonları ve arayüz dinamiklerini detaylı bir biçimde açıklamaktadır.

⚙️ 1. Kurulum Adımları (Özet)
Uygulamayı lokal ortamınızda çalıştırmak için aşağıdaki adımları izleyin:

Flutter SDK'yı kurun: Flutter Kurulum Rehberi

Projeyi klonlayın:

bash
Kopyala
Düzenle
git clone https://github.com/kullaniciadi/cubeconnect.git
cd cubeconnect
Bağımlılıkları yükleyin:

bash
Kopyala
Düzenle
flutter pub get
Firebase yapılandırmasını tamamlayın:

Firebase Console’da proje oluşturun

google-services.json ve GoogleService-Info.plist dosyalarını ilgili klasörlere yerleştirin

Uygulamayı çalıştırın:

bash
Kopyala
Düzenle
flutter run
🔐 Firebase Authentication ve Firestore Database modüllerinin aktif olduğundan emin olun.

🔄 2. Kullanıcı Akışı
CubeConnect, kullanıcıların uygulama içerisinde yönlendirilmiş, rol bazlı bir yolculuk deneyimi yaşamalarını hedefler.

👨‍💼 Girişimci Akışı
Girişimci olarak kayıt olunur

Profil bilgileri, proje özeti ve sektör tercihi girilir

Mentör talebinde bulunulur ve eşleşme beklenir

Yatırımcılarla eşleştirme algoritması sayesinde uygun görüşme fırsatları oluşur

Takvim üzerinden toplantı planlanır ve onay süreci başlatılır

💰 Yatırımcı Akışı
Yatırımcı olarak giriş yapılır

İlgi duyulan sektörler ve yatırım tipi belirtilir

Sistem, ilgili girişimcileri önerir

Uygun girişimcilerle toplantılar planlanır

Toplantı geçmişi ve girişim profilleri takip edilir

🎓 Mentör Akışı
Mentör profili oluşturulur

Girişimcilerden gelen talepler görüntülenir

Kabul edilen girişimcilere mentörlük sağlanır

Görüşme saatleri belirlenir ve yönlendirmeler yapılır

Kullanıcılar yalnızca kendi rollerine uygun ekranlara erişebilir ve sistem akışı bu doğrultuda kişiselleştirilmiştir.

✨ 3. Uygulama Özellikleri
Uygulama, profesyonel ilişki yönetimi ve yatırım sürecini optimize edecek şu özelliklerle donatılmıştır:

Özellik	Açıklama
🔐 Rol Bazlı Giriş	Girişimci, yatırımcı ve mentör olarak kayıt ve giriş
📝 Profil Oluşturma	Kapsamlı kullanıcı profili ve girişim bilgileri girilmesi
🧠 Mentörlük Sistemi	Mentörlere talep gönderme, kabul ve görüşme süreci
🔍 Sektörel Filtreleme	Yatırımcıların sektör bazlı eşleşme yapabilmesi
📅 Takvim Entegrasyonu	Tüm roller için toplantı tarih/saat planlama
📩 Bildirimler	Toplantı talepleri, eşleşme sonuçları, hatırlatıcılar
📊 Gelişim İzleme	Yapılan toplantıların ve mentörlük süreçlerinin geçmişi

🖼️ 4. Arayüzlerden Örnekler
Arayüzler, kullanıcı akışını destekleyecek şekilde sade, anlaşılır ve fonksiyonel olarak tasarlanmıştır. Aşağıda temel ekranlara ait örnek görüntülemeler yer almaktadır:

🧭 Giriş Ekranı
Kullanıcının rol seçimi yaptığı, modern tasarımlı ilk karşılama ekranı.

🔐 Kayıt ve Giriş
Her kullanıcı rolüne özel giriş/kayıt ekranları.

🗓️ Toplantı Planlama
Seçilen kullanıcıyla uygun zaman diliminde görüşme oluşturulmasını sağlar.

🧑‍🏫 Mentörlük Paneli
Mentörlerin gelen talepleri ve aktif girişimcileri görüntüleyebileceği ekran.

Görseller screenshots/ klasörüne eklenerek dökümantasyon içerisinde referanslanabilir.

Bu yapı sayesinde, CubeConnect yalnızca bir yatırım eşleşme aracı değil; aynı zamanda yönlendirilmiş, organize edilmiş ve ölçülebilir bir girişimcilik platformu sunar.

🛠️ Geliştirme Süreci
CubeConnect’in geliştirme süreci boyunca karşılaşılan teknik ve yapısal zorluklar, sistematik çözüm yollarıyla ele alınmış ve uygulamanın mimarisi kullanıcı odaklı bir yaklaşımla şekillendirilmiştir. Bu süreçte alınan her karar, kullanıcı deneyimi, teknik sürdürülebilirlik ve hackathon süresine uygunluk kriterleri göz önünde bulundurularak verilmiştir.

❗ Karşılaşılan Zorluklar ve Uygulanan Çözümler
🔐 1. Rol Bazlı Kimlik Doğrulama Karmaşıklığı
Zorluk: Firebase Authentication temel olarak tüm kullanıcıları aynı sistemde tutarken, yatırımcı, girişimci ve mentör ayrımını yapmak için yapılandırılmış bir kimlik yönetimi sistemi eksikti.

Çözüm: Her kullanıcı kaydında Firestore üzerinde kullanıcıya ait rol bilgisi (role: entrepreneur/investor/mentor) ayrı olarak saklandı. Uygulama açılışında bu veri çekilerek kullanıcıya özel sayfa yönlendirmesi sağlandı. Böylece tek kimlik doğrulama sistemine bağlı kalınırken rol ayrımı arayüzde etkin şekilde yönetildi.

🧭 2. Kullanıcı Akışı Tasarımında Dengesizlik
Zorluk: Üç farklı kullanıcı profiline hizmet veren bir sistemde, her rol için akışın hem sade hem de detaylı olması gerekiyordu. Ancak tek bir uygulama çerçevesi içinde kullanıcı deneyimini karmaşıklaştırmadan bu ayrımı sağlamak zordu.

Çözüm: Flutter BLoC yapısı ile her rolün event/state yönetimi ayrı ayrı tanımlandı. Ekranlar modüler hale getirilerek kod tekrarının önüne geçildi. Akışlar sadeleştirildi, kullanıcı sadece kendi rolüne ait ekranları görür hale getirildi.

🔄 3. Gerçek Zamanlı Veri Senkronizasyonu
Zorluk: Toplantı eşleşmeleri, mentör talepleri ve onay mekanizmaları gibi kritik işlemlerin sistemde anlık olarak güncellenmesi gerekiyordu.

Çözüm: Firebase Firestore’un gerçek zamanlı veritabanı yapısından faydalanılarak StreamBuilder ile tüm veri senkronizasyonu canlı tutuldu. Kullanıcılar arası değişiklikler anında ekranlara yansıdı ve manuel yenileme ihtiyacı ortadan kaldırıldı.

🎨 Tasarım Kararları ve Gerekçeleri
Rol Bazlı Renk ve İkon Kullanımı: Her kullanıcı tipi için farklı ikonlar ve vurgu renkleri kullanılarak, kullanıcı hangi rolde olduğunu arayüzden kolayca anlayabilmektedir.

Takvim Entegrasyonu: Manuel saat seçimi yerine saat bloğu seçimi yöntemi tercih edilerek yanlış zaman girişlerinin önüne geçildi.

Sade ve Modüler UI: Hackathon süresi içinde test edilebilirliği ve genişletilebilirliği artırmak adına minimum karmaşıklıkla maksimum işlevsellik hedeflendi.

Responsive Tasarım: Farklı cihaz çözünürlüklerinde düzgün çalışan esnek bir yapı oluşturuldu.

🚀 Gelecekteki İyileştirme Alanları
Gelişmiş Eşleşme Algoritması: Kullanıcıların geçmiş etkileşimleri, ilgi alanları ve geri bildirimlerine göre yapay zeka destekli eşleştirme sistemi planlanmaktadır.

Anlık Bildirim Sistemi: Firebase Cloud Messaging (FCM) entegrasyonu ile toplantı onayları, mentör eşleşmeleri ve hatırlatmalar için push notification desteği entegre edilecektir.

Profil Onay Sistemi: Yatırımcı ve mentör profilleri için bir doğrulama sistemi ile platformun güvenliği daha üst seviyeye çıkarılacaktır.

Raporlama Modülü: Kullanıcılar kendi performanslarını, geçmiş toplantı sayılarını ve eşleşme başarılarını grafiksel olarak görüntüleyebileceklerdir.

👥 Takım Bilgisi
CubeConnect, sınırlı süre içerisinde etkili bir iş bölümü ile geliştirilmiş bir mobil uygulamadır. Üç kişilik ekip, her üyenin kendi uzmanlık alanında katkı sağlamasıyla uyumlu bir şekilde çalışmıştır.

Takım Üyesi	Rolü	Sorumluluk Alanı
Metehan Zengin	Ürün ve Arayüz Tasarımı	Figma üzerinden kullanıcı arayüzü tasarımlarının oluşturulması, sunum ve dokümantasyon süreçlerinin yürütülmesi
Ayfer Yakışır	Mobil Arayüz Geliştirici	Figma'dan alınan tasarımların Flutter ile koda dönüştürülmesi ve uygulama arayüzlerinin oluşturulması
Enes Odabaş	Backend Entegrasyon Sorumlusu	Firebase bağlantılarının kurulması, kimlik doğrulama ve veritabanı yapılandırmaları

Takım üyeleri, proje süreci boyunca etkin iletişimle hareket etmiş ve sınırlı hackathon süresi içinde ortaya kullanılabilir bir ürün çıkarmayı başarmıştır.

📫 İletişim Bilgileri
📧 E-posta: yakisirayfer@gmail.com

🌐 GitHub: github.com/AyferYakisir


## 📹 Uygulama Tanıtım Videosu

📁 [Tanıtım videosunu izlemek için indirin](../video/cubehack_cubeconnect_demo.mp4)

> Bu video, CubeConnect uygulamasının giriş, rol seçimi ve toplantı planlama akışlarını göstermektedir. Süre: 2 dakika 55 saniye.

Projeye dair detaylı sunum veya demo talepleri için yukarıdaki adreslerden iletişime geçebilirsiniz.