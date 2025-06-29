// ignore_for_file: file_names

import 'package:coffeapp/core/utils/app_images.dart';

class DrinkModel {
  final String name;
  final String description;
  final String image;
  final String price;
  final int number;

  DrinkModel(
    this.number, {
    required this.description,
    required this.name,
    required this.image,
    required this.price,
  });

  static List<DrinkModel> drinks = [
    DrinkModel(
      0,
      name: 'Banana Milkshake',
      description:
          'A creamy blend of ripe bananas and chilled milk for a smooth, tropical treat.',
      image: Assets.drinksBanana,
      price: '\$3.99',
    ),
    DrinkModel(
      1,
      name: 'Brownie Milkshake',
      description:
          'Rich chocolate shake blended with chunks of fudgy brownie for a decadent dessert drink.',
      image: Assets.drinksBrownie,
      price: '\$5.49',
    ),
    DrinkModel(
      2,
      name: 'Chocolate Milkshake',
      description:
          'Classic chocolate goodness mixed into a velvety smooth milkshake.',
      image: Assets.drinksChocolate,
      price: '\$4.59',
    ),
    DrinkModel(
      3,
      name: 'Peanut Milkshake',
      description:
          'A nutty, protein-packed shake with a smooth peanut butter twist.',
      image: Assets.drinksPeanut_Butter,
      price: '\$4.79',
    ),
    DrinkModel(
      4,
      name: 'Salted Milkshake',
      description:
          'A unique blend of sweet and salty flavors with a caramel drizzle finish.',
      image: Assets.drinksSalted_Caramel,
      price: '\$4.99',
    ),
    DrinkModel(
      5,
      name: 'Strawberry Milkshake',
      description:
          'Fresh strawberries blended with ice cream and milk for a fruity delight.',
      image: Assets.drinksStrawberry,
      price: '\$4.29',
    ),

    // Repeated items with slightly different names
    DrinkModel(
      6,
      name: 'Banana Milkshake Deluxe',
      description:
          'Same creamy banana delight, now with extra banana slices on top.',
      image: Assets.drinksBanana,
      price: '\$4.29',
    ),
    DrinkModel(
      7,
      name: 'Brownie Blast Milkshake',
      description:
          'An explosion of brownie chunks in every sip of this chocolatey shake.',
      image: Assets.drinksBrownie,
      price: '\$5.79',
    ),
    DrinkModel(
      8,
      name: 'Double Chocolate Milkshake',
      description: 'Chocolate on chocolate—perfect for true chocolate lovers.',
      image: Assets.drinksChocolate,
      price: '\$4.99',
    ),
    DrinkModel(
      9,
      name: 'Peanut Punch Milkshake',
      description:
          'Peanut butter, milk, and a hint of cinnamon blended to perfection.',
      image: Assets.drinksPeanut_Butter,
      price: '\$4.89',
    ),
    DrinkModel(
      10,
      name: 'Salted Caramel Milkshake',
      description:
          'Indulgent caramel with a touch of sea salt. Sweet and salty harmony.',
      image: Assets.drinksSalted_Caramel,
      price: '\$5.19',
    ),
    DrinkModel(
      12,
      name: 'Strawberry Milkshake',
      description:
          'Dreamy pink milkshake with juicy strawberries and whipped cream.',
      image: Assets.drinksStrawberry,
      price: '\$4.49',
    ),
  ];
}
