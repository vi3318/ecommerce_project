import 'package:ecommerce_project/widgets/home_widgets/add_to_cart.dart';
import 'package:ecommerce_project/widgets/themes.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../models/catalog.dart';

class HomeDetailPage extends StatelessWidget {
  final Item catalog;

  const HomeDetailPage({super.key, required this.catalog});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: MyTheme.creamColor,
      bottomNavigationBar: Container(
        color: Colors.white,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: EdgeInsets.zero,
          children: [
            "\$${catalog.price}".text.bold.xl4.red800.make(),
            AddToCart(catalog: catalog,)
          ],
        ).p32(),
      ),
      body: SafeArea(
        bottom: false,
        child: Column(children: [
          Hero(
            tag: Key(catalog.id.toString()),
            child: Image.network(catalog.image),
          ).h32(context),
          Expanded(
              child: VxArc(
            height: 30.0,
            arcType: VxArcType.convey,
            edge: VxEdge.top,
            child: Container(
              color: Colors.white,
              width: context.screenWidth,
              child: Column(children: [
                catalog.name.text.xl4.color(MyTheme.darkBlueColor).bold.make(),
                catalog.desc.text.xl.textStyle(context.captionStyle).make(),
                10.heightBox,
                "Nam mus maecenas taciti. Tortor luctus ultricies curae; justo sociis cras. Sem mi lacus cum eget hymenaeos aptent Fusce, hymenaeos porttitor fames tortor purus id. Interdum pretium lacinia feugiat eros, consequat pharetra Porta nibh risus duis sit curabitur commodo. Enim primis nibh sollicitudin aenean tempus vivamus fusce ullamcorper varius et.".text.textStyle(context.captionStyle).make().p16()
              ]).py(64),
            ),
          ))
        ]),
      ),
    );
  }
}
