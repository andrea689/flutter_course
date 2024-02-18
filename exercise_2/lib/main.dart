import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    const description =
        'Generica descrizione del piatto di pasta o della pizza presente nel menu di questo Ristorante Pizzeria da Pippo.';
    final products = [
      Product(
        name: 'Matriciana',
        description: description,
        price: 7.0,
      ),
      Product(
        name: 'Carbonara',
        description: description,
        price: 8.5,
      ),
      Product(
        name: 'Margherita',
        description: description,
        price: 6.5,
      ),
      Product(
        name: 'Capricciosa',
        description: description,
        price: 7,
      ),
      Product(
        name: 'Bufala',
        description: description,
        price: 10.5,
      ),
      Product(
        name: 'Pistacchiosa',
        description: description,
        price: 12,
      ),
    ];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Ristorante Pizzeria da Pippo'),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const Text(
                'Benvenuto nel nostro Ristorante Pizzeria!',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              Image.network(
                'https://media-cdn.tripadvisor.com/media/photo-s/1b/bb/a9/b6/ristorante-da-pippo.jpg',
              ),
              const SizedBox(height: 16),
              const Text(
                'Troverai un vasto assortimento di cibi prelibati in grado di soddisfare i palati di tutti i nostri clienti.',
              ),
              const SizedBox(height: 16),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Chip(label: Text('Pasta')),
                  Chip(label: Text('Pizza')),
                  Chip(label: Text('Bibite')),
                  Chip(label: Text('Dolci')),
                ],
              ),
              const SizedBox(height: 16),
              ...products.map((product) => ProductItem(product: product)),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}

class Product {
  final String name;
  final String description;
  final double price;

  Product({
    required this.name,
    required this.description,
    required this.price,
  });
}

class ProductItem extends StatelessWidget {
  final Product product;

  const ProductItem({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: const TextStyle(fontSize: 24),
                  ),
                  Text(product.description),
                ],
              ),
            ),
            const SizedBox(width: 8),
            Text('${product.price.toStringAsFixed(2)}€'),
          ],
        ),
      ),
    );
  }
}
