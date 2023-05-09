import 'package:shoes_app_ui/helpers/constants.dart';
import 'package:shoes_app_ui/models/shoe_model.dart';

class ShoeServices {
  static getShoesList() {
    final List<Shoe> shoes = [
      Shoe(
          title: 'Nike Air Max 90',
          category: 'Men shoes',
          imageUrl: '${Constants.imagesUrl}/shoes_1.png',
          price: 120),
      Shoe(
          title: 'Nike Air force XXV',
          category: 'Running Shoes',
          imageUrl: '${Constants.imagesUrl}/shoes_2.png',
          price: 180),
      Shoe(
          title: 'Nike Air Max 343',
          category: 'Women shoes',
          imageUrl: '${Constants.imagesUrl}/shoes_3.png',
          price: 120),
      Shoe(
          title: 'Nike Air force XXV',
          category: 'Running Shoes',
          imageUrl: '${Constants.imagesUrl}/shoes_4.png',
          price: 180),
    ];
    return shoes;
  }
}
