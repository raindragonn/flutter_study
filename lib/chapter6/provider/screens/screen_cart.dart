import 'package:Flutter_Study/chapter6/provider/viewmodels/cart_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<CartViewModel>(context);
    final cartItems = vm.cartItems;
    return Scaffold(
      appBar: AppBar(
        title: Text('내 카트'),
        actions: [
          Center(
            child: Container(
              padding: EdgeInsets.all(10),
              child: Text(
                '총액 : ' + vm.getTotalPrice().toString(),
                style: TextStyle(fontSize: 15),
              ),
            ),
          )
        ],
      ),
      body: ListView.builder(
        itemCount: cartItems.length,
        itemBuilder: (context, index) {
          return Builder(
            builder: (context) {
              return ListTile(
                title: Text(cartItems[index].title),
                subtitle: Text(cartItems[index].price.toString()),
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () {
                    vm.deleteCart(cartItems[index].id);
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
