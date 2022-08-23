import 'package:Flutter_Study/chapter6/provider/viewmodels/cart_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/item.dart';

class ItemScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<CartViewModel>(context);

    List<Item> items = vm.items;
    List<Item> cartItems = vm.cartItems;

    return Scaffold(
      appBar: AppBar(
        title: Text('상품 목록'),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.of(context).pushNamed('/cart');
            },
          )
        ],
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Builder(
            builder: (context) {
              bool isInCart = cartItems.contains(items[index]);
              return ListTile(
                  title: Text(items[index].title),
                  subtitle: Text(items[index].price.toString()),
                  trailing: Padding(
                    padding: EdgeInsets.all(8),
                    child: GestureDetector(
                      child: isInCart ? Icon(Icons.check) : Icon(Icons.add),
                      onTap: () {
                        if (!isInCart) {
                          vm.addCart(items[index]);
                        }
                      },
                    ),
                  ));
            },
          );
        },
      ),
    );
  }
}
