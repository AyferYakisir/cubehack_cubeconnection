import '../models/initiative_model.dart';

class HomeController {
  List<InitiativeModel> fetchInitiatives() {
    const placeholderImage = 'assets/images/placeholder.jpg';

    return [
      InitiativeModel(
        title: 'Toplantı Anı',
        isPopular: true,
        imageUrl: "assets/images/foto4.jpeg",
      ),
      InitiativeModel(
        imageUrl: "assets/images/foto3.jpeg",
        title: 'Sunum Yapılıyor',
        isPopular: true,
      ),
      InitiativeModel(
        imageUrl: "assets/images/foto2.jpeg",
        title: 'Yeni Katılan',
        isPopular: false,
      ),
      InitiativeModel(
        imageUrl: "assets/images/foto1.jpeg",
        title: 'Girişimci İmza Atıyor',
        isPopular: false,
      ),
    ];
  }
}
