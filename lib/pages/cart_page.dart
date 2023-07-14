// import 'package:ecommerce_project/widgets/themes.dart';
import 'package:ecommerce_project/models/cart.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../core/store.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: "Cart".text.make(),
      ),
      body: Column(children: [
        _CartList().p32().expand(),
        const Divider(),
        const _CartTotal(),
      ]),
    );
  }
}

class _CartTotal extends StatelessWidget {
  const _CartTotal();

  @override
  Widget build(BuildContext context) {
    // ignore: no_leading_underscores_for_local_identifiers
    final CartModel _cart = (VxState.store as MyStore).cart;
    return SizedBox(
      height: 200,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        VxConsumer(builder: (context, _) {
          return "\$${_cart.totalPrice}".text.xl5.color(Colors.amber).make();
        },
        mutations:const {RemoveMutation} ,
        notifications: const {},
        ),
        30.widthBox,
        ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: "Buying not supoorted yet".text.make()));
                },
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.black)),
                child: "Buy".text.white.make())
            .w32(context),
      ]),
    );
  }
}

class _CartList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    VxState.watch(context,  on: [RemoveMutation]);
    final CartModel _cart = (VxState.store as MyStore).cart;
    return _cart.items!.isEmpty
        ? "Nothing to show".text.makeCentered()
        : ListView.builder(
            itemCount: _cart.items.length,
            itemBuilder: ((context, index) => ListTile(
                  leading: const Icon(Icons.done),
                  trailing: IconButton(
                    icon: const Icon(Icons.remove_circle_outline),
                    onPressed: () => RemoveMutation(_cart.items[index]),
                  ),
                  title: _cart.items[index].name.text.make(),
                )));
  }
}
