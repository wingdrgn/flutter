import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models.dart';

class ProductListScreen extends StatelessWidget {
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
      bottomNavigationBar: BottomAppBar(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text('Total Products: ${cart.products.length}'),
              SizedBox(height: 8.0),
              Text('Products Count:', style: TextStyle(fontWeight: FontWeight.bold)),
              // 显示每种商品的数量
              ...productCountMap.entries.map((entry) => Text('${entry.key.name}: ${entry.value}')),
            ],
          ),
        ),
      ),
    );
  }
}
