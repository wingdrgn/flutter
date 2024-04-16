import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartModel>(context);

    // 创建一个Map来存储每种商品的数量
    Map<Product, int> productCountMap = {};

    // 遍历购物车中的产品列表，并统计每种商品的数量
    for (var product in cart.products) {
      if (productCountMap.containsKey(product)) {
        productCountMap[product] = (productCountMap[product] as int) + 1;
      } else {
        productCountMap[product] = 1;
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: ListView.builder(
        itemCount: cart.products.length,
        itemBuilder: (context, index) {
          final product = cart.products[index];
          return ListTile(
            title: Text(product.name),
            subtitle: Text('\$${product.price}'),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Total Products: ${cart.products.length}',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_shopping_cart),
            label: 'Products Count:',
          ),
        ],
        // 显示每种商品的数量
        onTap: (index) {
          showModalBottomSheet(
            context: context,
            builder: (BuildContext context) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: productCountMap.entries.map((entry) {
                  return ListTile(
                    title: Text('${entry.key.name}'),
                    trailing: Text('${entry.value}'),
                  );
                }).toList(),
              );
            },
          );
        },
      ),
    );
  }
}
