import 'package:shoes_app_ui/helpers/constants.dart';
import 'package:shoes_app_ui/models/cart_model.dart';
import 'package:shoes_app_ui/models/shoe_model.dart';

class ShoeServices {
  static List<Cart> shoesInMyCart = [];

  static getShoesList() {
    final List<Shoe> shoes = [
      Shoe(
          id: 1,
          title: 'Nike Air Max 90',
          category: 'Men shoes',
          imageUrl: '${Constants.imagesUrl}/shoes_1.png',
          price: 120),
      Shoe(
          id: 2,
          title: 'Nike Air Max 343',
          category: 'Women shoes',
          imageUrl: '${Constants.imagesUrl}/shoes_3.png',
          price: 120),
      Shoe(
          id: 3,
          title: 'Nike Air force XXV',
          category: 'Running Shoes',
          imageUrl: '${Constants.imagesUrl}/shoes_4.png',
          price: 180),
      Shoe(
          id: 4,
          title: 'Nike Air Max 128',
          category: 'Babies shoes',
          imageUrl: '${Constants.imagesUrl}/shoes_1.png',
          price: 120),
      Shoe(
          id: 5,
          title: 'Air Max original',
          category: 'Old man shoes',
          imageUrl: '${Constants.imagesUrl}/shoes_2.png',
          price: 180),
      Shoe(
          id: 6,
          title: 'Nike Air Max 10',
          category: 'Couple shoes',
          imageUrl: '${Constants.imagesUrl}/shoes_3.png',
          price: 120),
      Shoe(
          id: 7,
          title: 'Nike Air force XXV',
          category: 'Running Shoes',
          imageUrl: '${Constants.imagesUrl}/shoes_4.png',
          price: 180),
      Shoe(
          id: 8,
          title: 'Nike Air force XXV',
          category: 'Running Shoes',
          imageUrl: '${Constants.imagesUrl}/shoes_2.png',
          price: 180),
    ];
    return shoes;
  }

  static getShoesInMyCart() {
    return shoesInMyCart;
  }

  static addShoeInCart(Cart shoeToAdd) {
    return shoesInMyCart.add(shoeToAdd);
  }
  
  static bool checkIfShoeExistsInCart(Shoe shoeToCheck) {
    return shoesInMyCart.any((element) => element.shoe == shoeToCheck);
  }

  static removeShoeInCart(shoeId) {
    return shoesInMyCart.removeWhere((Cart shoeToRemove) => shoeToRemove.shoe.id == shoeId);
  }
}
