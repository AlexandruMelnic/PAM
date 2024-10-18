import 'package:flutter/material.dart';

void main() {
  runApp(DrinkStoreApp());
}

class DrinkStoreApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Drink Store',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Drink Store'),
      ),
      body: DrinkList(),
    );
  }
}

class DrinkList extends StatelessWidget {
  final List<Drink> drinks = [
    Drink('Red Wine', 'assets/red_wine.png', 23256596),
    Drink('White Wine', 'assets/white_wine.png', 23256596),
    Drink('Rose Wine', 'assets/rose_wine.png', 23256596),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: drinks.length,
      itemBuilder: (context, index) {
        return DrinkCard(drink: drinks[index]);
      },
    );
  }
}

class DrinkCard extends StatelessWidget {
  final Drink drink;

  DrinkCard({required this.drink});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Image.asset(drink.imageUrl),
        title: Text(drink.name),
        subtitle: Text('₹ ${drink.price.toString()}'),
        trailing: IconButton(
          icon: Icon(Icons.favorite_border),
          onPressed: () {
            // Add to favorites
          },
        ),
      ),
    );
  }
}

class Drink {
  final String name;
  final String imageUrl;
  final int price;

  Drink(this.name, this.imageUrl, this.price);
}
