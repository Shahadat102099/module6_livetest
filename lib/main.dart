import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:

      homePage(),
    );
  }
}
class homePage extends StatelessWidget{
  final List<ShoppingItem> shoppingItems = [
    ShoppingItem(name: 'Apples', icon: Icons.shopping_basket),
    ShoppingItem(name: 'Bananas', icon: Icons.shopping_basket),
    ShoppingItem(name: 'Milk', icon: Icons.shopping_cart),
    ShoppingItem(name: 'Bread', icon: Icons.shopping_cart),
    ShoppingItem(name: 'Eggs', icon: Icons.shopping_cart),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Shopping List'),
        centerTitle: true,
        actions: [
          Icon(Icons.shopping_cart),
        ],
      ),

      // Body Starts

      body: ListView.builder(
        itemCount: shoppingItems.length,
        itemBuilder: (context, index) {
          final item = shoppingItems[index];
          return ListTile(
            leading: Icon(item.icon),
            title: Text(item.name),
            onTap: () {
              // Implement item tap functionality here
            },
          );
        },
      ),
    );
  }
}

class ShoppingItem {
  final String name;
  final IconData icon;

  ShoppingItem({required this.name, required this.icon});
}