import 'package:flutter/material.dart';
import 'package:belanja/models/item.dart';
import 'package:go_router/go_router.dart';

class ItemPage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    final itemArgs = GoRouterState.of(context).extra as Item;

    return Scaffold(
      appBar: AppBar(
        title: Text(itemArgs.name),
      ),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Hero(
                tag: itemArgs.imageURL, // unique tag for each image
                child: Image.network(itemArgs.imageURL),
              ),
              const SizedBox(height: 16),
              Text(
                itemArgs.name,
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              Text(
                'Price: ${itemArgs.price}',
                style: const TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 16),
              Text(
                'Rating: ${itemArgs.rating}',
                style: const TextStyle(fontSize: 20),
              )
            ],
          ),
        ));
  }
}