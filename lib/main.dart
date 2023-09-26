import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProductList(),
    );
  }
}

class ProductList extends StatefulWidget {
  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  List<Product> products = [
    Product(name: 'Product 1', price: 10.99),
    Product(name: 'Product 2', price: 19.99),
    Product(name: 'Product 3', price: 29.99),
    Product(name: 'Product 4', price: 10.99),
    Product(name: 'Product 5', price: 19.99),
    Product(name: 'Product 6', price: 29.99),
    Product(name: 'Product 7', price: 10.99),
    Product(name: 'Product 8', price: 19.99),
    Product(name: 'Product 9', price: 29.99),
    Product(name: 'Product 10', price: 10.99),
    Product(name: 'Product 11', price: 19.99),
    Product(name: 'Product 12', price: 29.99),
    Product(name: 'Product 13', price: 10.99),
    Product(name: 'Product 14', price: 19.99),
    Product(name: 'Product 15', price: 29.99),
    Product(name: 'Product 16', price: 10.99),
    Product(name: 'Product 17', price: 19.99),
    Product(name: 'Product 18', price: 29.99),
    Product(name: 'Product 19', price: 10.99),
    Product(name: 'Product 20', price: 19.99),
    Product(name: 'Product 21', price: 29.99),
    Product(name: 'Product 22', price: 10.99),
    Product(name: 'Product 23', price: 19.99),
    Product(name: 'Product 24', price: 29.99),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product List'),
        actions:[
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CartPage(products: products)),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: products.length,
        itemBuilder: (BuildContext context, int index) {
          return ProductItem(
            product: products[index],
            onBuy: () {
              setState(() {
                products[index].incrementCounter();
                if (products[index].counter == 5) {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Congratulations!'),
                        content: Text('You\'ve bought 5 ${products[index].name}!'),
                        actions: <Widget>[
                          TextButton(
                            child: Text('OK'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                }
              });
            },
          );
        },
      ),
    );
  }
}

class Product {
  String name;
  double price;
  int counter;

  Product({required this.name, required this.price, this.counter = 0});

  void incrementCounter() {
    counter++;
  }
}

class ProductItem extends StatelessWidget {
  final Product product;
  final Function()? onBuy;

  ProductItem({required this.product, this.onBuy});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(product.name),
      subtitle: Text('\$${product.price.toStringAsFixed(2)}'),
      trailing: FittedBox(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Count: ${product.counter}'),
            ElevatedButton(
              onPressed: onBuy,
              child: Text('Buy Now'),
            ),
          ],
        ),
      ),
    );
  }
}

class CartPage extends StatelessWidget {
  final List<Product> products;

  CartPage({required this.products});

  @override
  Widget build(BuildContext context) {
    int totalItems = products.fold(0, (sum, product) => sum + product.counter);

    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: Center(
        child: Text('Total Items in Cart: $totalItems'),
      ),
    );
  }
}