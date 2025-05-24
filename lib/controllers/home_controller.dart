import '../models/initiative_model.dart';

class HomeController {
  List<InitiativeModel> fetchInitiatives() {
    const placeholderImage = 'assets/images/placeholder.jpg';

    return [
      InitiativeModel(
        imageUrl: placeholderImage,
        title: 'Toplantı Anı',
        isPopular: true,
      ),
      InitiativeModel(
        imageUrl: placeholderImage,
        title: 'Sunum Yapılıyor',
        isPopular: true,
      ),
      InitiativeModel(
        imageUrl: placeholderImage,
        title: 'Yeni Katılan',
        isPopular: false,
      ),
      InitiativeModel(
        imageUrl: placeholderImage,
        title: 'Girişimci İmza Atıyor',
        isPopular: false,
      ),
    ];
  }
}
