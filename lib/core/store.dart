import 'package:ecommerce_project/models/cart.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:ecommerce_project/models/catalog.dart';

class MyStore extends VxStore {
  CatalogModel catalog;
  CartModel cart;

  MyStore()
      : catalog = CatalogModel(),
        cart = CartModel() {
    cart.catalog = catalog;
  }
}

