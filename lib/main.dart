import 'package:flutter/material.dart';
import 'package:belanja/models/item.dart';
import 'package:belanja/pages/item_page.dart';
import 'package:belanja/pages/home_page.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Shop App',
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(), // Halaman utama
      },
      onGenerateRoute: (settings) {
        // Cek jika rute adalah '/item' dan settings.arguments adalah tipe Item
        if (settings.name == '/item') {
          if (settings.arguments is Item) {
            final Item item = settings.arguments as Item;
            return MaterialPageRoute(
              builder: (context) => ItemPage(), // Buka ItemPage
              settings: RouteSettings(arguments: item), // Kirim argumen ke ItemPage
            );
          }
        }
        // Default fallback jika rute tidak dikenali
        return MaterialPageRoute(
          builder: (context) => HomePage(),
        );
      },
    ),
  );
}
