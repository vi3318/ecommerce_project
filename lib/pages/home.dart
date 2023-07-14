import 'package:ecommerce_project/models/catalog.dart';
import 'package:ecommerce_project/utils/routes.dart';
import 'package:ecommerce_project/widgets/themes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:ecommerce_project/widgets/drawer.dart';
// import 'package:ecommerce_project/models/catalog.dart';
// import 'package:ecommerce_project/widgets/item_widget.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:velocity_x/velocity_x.dart';
import '../widgets/home_widgets/catalog_header.dart';
import '../widgets/home_widgets/catalog_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(const Duration(seconds: 2));
    var catalogJson = await rootBundle.loadString("assets/files/catalog.json");
    var decodeData = jsonDecode(catalogJson);
    var productsData = decodeData["products"];
    CatalogModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: MyTheme.creamColor,
        floatingActionButton:FloatingActionButton(onPressed: () => Navigator.pushNamed(context, MyRoutes.cartRoute),
        backgroundColor: MyTheme.darkBlueColor,
        child: const Icon(CupertinoIcons.cart) ,),
        body: SafeArea(
          child: Container(
              padding: Vx.m32,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CatalogHeader(),
                  if (CatalogModel.items.isNotEmpty)

                    const CatalogList().py16().expand()
                  else
                    const CircularProgressIndicator().centered().expand(),
                ],
              )),
        ));
  }
}
