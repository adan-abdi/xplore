import 'package:flutter/material.dart';
import 'package:shamiri/core/presentation/model/product_category.dart';

class Constants {
  /// Firebase
  static const USER_COLLECTION = 'users';
  static const PRODUCTS_COLLECTION = 'products';

  /// Hive
  static const USER_PREFS_BOX = 'user_prefs';

  /// Product Categories
  static List<ProductCategory> productCategories = <ProductCategory>[
    ProductCategory(
        categoryName: 'All', categoryIcon: Icons.shopping_basket_rounded),
    ProductCategory(
        categoryName: 'Entertainment', categoryIcon: Icons.tv_rounded),
    ProductCategory(
        categoryName: 'Food & Drinks', categoryIcon: Icons.fastfood_rounded),
    ProductCategory(
        categoryName: 'Hardware', categoryIcon: Icons.hardware_rounded),
    ProductCategory(
        categoryName: 'Health & Beauty',
        categoryIcon: Icons.health_and_safety_rounded),
    ProductCategory(
        categoryName: 'Computing', categoryIcon: Icons.computer_rounded),
    ProductCategory(
        categoryName: 'Other', categoryIcon: Icons.question_mark_rounded),
  ];

  static List<ProductCategory> productCategoriesFiltered = <ProductCategory>[
    ProductCategory(
        categoryName: 'Entertainment', categoryIcon: Icons.tv_rounded),
    ProductCategory(
        categoryName: 'Food & Drinks', categoryIcon: Icons.fastfood_rounded),
    ProductCategory(
        categoryName: 'Hardware', categoryIcon: Icons.hardware_rounded),
    ProductCategory(
        categoryName: 'Health & Beauty',
        categoryIcon: Icons.health_and_safety_rounded),
    ProductCategory(
        categoryName: 'Computing', categoryIcon: Icons.computer_rounded),
    ProductCategory(
        categoryName: 'Other', categoryIcon: Icons.question_mark_rounded),
  ];
}
