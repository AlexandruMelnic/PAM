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
        scaffoldBackgroundColor: Colors.white,
      ),
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Icon(Icons.location_on),
            SizedBox(width: 8),
            Text('Donnerville Drive'),
            Icon(Icons.arrow_drop_down),
          ],
        ),
        actions: [
          Stack(
            alignment: Alignment.center,
            children: [
              IconButton(
                icon: Icon(Icons.notifications_none),
                onPressed: () {},
              ),
              Positioned(
                right: 8,
                top: 8,
                child: Container(
                  padding: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  constraints: BoxConstraints(
                    minWidth: 16,
                    minHeight: 16,
                  ),
                  child: Text(
                    '19',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                prefixIcon: Icon(Icons.search),
                suffixIcon: Icon(Icons.mic),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: [
                Text('Shop wines by',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(width: 10),
                Chip(
                  label: Text('Type',
                      style: TextStyle(color: Colors.white, fontSize: 12)),
                  backgroundColor: Colors.pink,
                  padding: EdgeInsets.symmetric(horizontal: 4),
                ),
                SizedBox(width: 10),
                Chip(
                  label: Text('Style', style: TextStyle(fontSize: 12)),
                  backgroundColor: Colors.grey[200],
                  padding: EdgeInsets.symmetric(horizontal: 4),
                ),
                SizedBox(width: 10),
                Chip(
                  label: Text('Countries', style: TextStyle(fontSize: 12)),
                  backgroundColor: Colors.grey[200],
                  padding: EdgeInsets.symmetric(horizontal: 4),
                ),
                SizedBox(width: 10),
                Chip(
                  label: Text('Grape', style: TextStyle(fontSize: 12)),
                  backgroundColor: Colors.grey[200],
                  padding: EdgeInsets.symmetric(horizontal: 4),
                ),
              ],
            ),
          ),
          SizedBox(height: 8),
          Flexible(
            child: DrinkList(),
          ),
        ],
      ),
    );
  }
}

class DrinkList extends StatelessWidget {
  final List<Drink> drinks = [
    Drink(
      name: '2021 Petit Chablis - Passy Le Clou',
      type: 'White wine',
      origin: 'From Champagne Blanc',
      price: 156,
      isAvailable: true,
      criticsScore: 75,
      tags: ['Green and Flinty'],
      imagePath:
          'https://images.unsplash.com/photo-1700893417238-ce7c7f427996?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8d2luZSUyMGJvdHRsZXxlbnwwfHwwfHx8MA%3D%3D',
    ),
    Drink(
      name: 'Philippe Fontaine Champagne Brut Rosé, Rose de Saignée, NV',
      type: 'Sparkling wine',
      origin: 'From Champagne Blanc',
      price: 238,
      isAvailable: false,
      criticsScore: 98,
      tags: [],
      imagePath:
          'https://images.unsplash.com/photo-1700893417219-221864536e99?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8cmVkJTIwd2luZSUyMGJvdHRsZXxlbnwwfHwwfHx8MA%3D%3D',
    ),
    Drink(
      name: '2021 Cicada\'s Song Rosé',
      type: 'Rosé wine',
      origin: 'From Champagne Blanc',
      price: 250,
      isAvailable: true,
      criticsScore: 90,
      tags: ['Green and Flinty'],
      imagePath:
          'https://images.unsplash.com/photo-1700893417216-44e85c0a77d7?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OHx8d2luZSUyMGJvdHRsZXxlbnwwfHwwfHx8MA%3D%3D',
    ),
    Drink(
      name: 'Ocone Bozzovich Beneventano Bianco IGT',
      type: 'Red wine',
      origin: 'From Champagne Blanc',
      price: 400,
      isAvailable: true,
      criticsScore: 84,
      tags: ['Green and Flinty'],
      imagePath:
          'https://cdn.pixabay.com/photo/2013/07/12/16/28/wine-150955_640.png',
    ),
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
      margin: EdgeInsets.all(8),
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Row(
          children: [
            Image.network(
              drink.imagePath,
              width: 80,
              height: 120,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  width: 80,
                  height: 120,
                  color: Colors.grey[300],
                  child: Icon(Icons.error),
                );
              },
            ),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        color: drink.isAvailable ? Colors.green : Colors.red,
                        child: Text(
                          drink.isAvailable ? 'Available' : 'Unavailable',
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 4),
                  Text(drink.name,
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Row(
                    children: [
                      Icon(Icons.wine_bar, size: 16, color: Colors.grey),
                      SizedBox(width: 4),
                      Text(drink.type, style: TextStyle(color: Colors.grey)),
                    ],
                  ),
                  SizedBox(height: 4),
                  Text(drink.origin, style: TextStyle(color: Colors.grey)),
                  ...drink.tags
                      .map((tag) => Chip(
                            label: Text(tag, style: TextStyle(fontSize: 10)),
                            backgroundColor: Colors.grey[200],
                          ))
                      .toList(),
                  Text('€ ${drink.price.toString()}',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Row(
                    children: [
                      Text('Critics\' Score: ',
                          style: TextStyle(color: Colors.grey)),
                      Text('${drink.criticsScore}/100',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                ],
              ),
            ),
            Column(
              children: [
                IconButton(
                  icon: Icon(
                      drink.isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: Colors.red),
                  onPressed: () {
                    // Toggle favorite
                  },
                ),
                Text(drink.isFavorite ? 'Added' : 'Favourite',
                    style: TextStyle(fontSize: 12)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Drink {
  final String name;
  final String type;
  final String origin;
  final int price;
  final bool isAvailable;
  final int criticsScore;
  final List<String> tags;
  final String imagePath;
  bool isFavorite;

  Drink({
    required this.name,
    required this.type,
    required this.origin,
    required this.price,
    required this.isAvailable,
    required this.criticsScore,
    required this.tags,
    required this.imagePath,
    this.isFavorite = false,
  });
}
