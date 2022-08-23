import 'package:Flutter_Study/chapter6/provider/repositories/item_list.dart';
import 'package:Flutter_Study/chapter6/provider/screens/screen_cart.dart';
import 'package:Flutter_Study/chapter6/provider/screens/screen_item.dart';
import 'package:Flutter_Study/chapter6/provider/viewmodels/cart_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const ProviderApp());
}

class ProviderApp extends StatelessWidget {
  const ProviderApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => CartViewModel(repository: ItemList()),
        ),
      ],
      builder: (context, child) => MaterialApp(
        title: 'Provider Example',
        initialRoute: '/',
        routes: {
          "/": (context) => ItemScreen(),
          "/cart": (context) => CartScreen(),
        },
      ),
    );
  }
}
