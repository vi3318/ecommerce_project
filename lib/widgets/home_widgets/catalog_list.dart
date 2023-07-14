import 'package:ecommerce_project/pages/home_detailpage.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_project/models/catalog.dart';

import 'catalog_item.dart';

class CatalogList extends StatelessWidget {
  const CatalogList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: CatalogModel.items.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        final catalog = CatalogModel.items[index];
        return InkWell(
      onTap: () => Navigator.push(
        context,
    MaterialPageRoute(
      builder: (context) => HomeDetailPage(catalog: catalog),
    ),
  ),
  child: CatalogItem(catalog: catalog),
);

      },
    );
  }
}
