import 'package:flutter/material.dart';
import 'package:flutter_learn/models/cart.dart';
import 'package:provider/provider.dart';

class MyCart extends StatelessWidget {
  const MyCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title:
                Text('Cart', style: Theme.of(context).textTheme.displayLarge)),
        body: Container(
            color: Colors.yellow,
            child: Column(
              children: [
                Expanded(
                    child: Padding(
                  padding: EdgeInsets.all(32),
                  child: _CartList(),
                )),
              ],
            )));
  }
}

class _CartList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var itemNameStyle = Theme.of(context).textTheme.titleLarge;
    var cart = context.watch<CartModel>();
    return ListView.builder(
      itemCount: cart.items.length,
      itemBuilder: (context, index) => ListTile(
          leading: const Icon(Icons.done),
          trailing: IconButton(
            icon: const Icon(Icons.remove_circle_outline),
            onPressed: () {
              cart.remove(cart.items[index]);
            },
          ),
          title: Text(cart.items[index].name)),
    );
  }
}
