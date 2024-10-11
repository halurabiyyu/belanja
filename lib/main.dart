import 'package:flutter/material.dart';
import 'package:belanja/models/item.dart';
import 'package:belanja/pages/item_page.dart';
import 'package:belanja/pages/home_page.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(MaterialApp.router(
    theme: ThemeData(
      useMaterial3: true,
    ),
    routerConfig: router,
  ));
}

final GoRouter router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => HomePage(),
      ),
      GoRoute(
        path: '/item',
        builder: (context, state) {
          return ItemPage();
        },
      ),
    ],
    errorBuilder: (context, state) => HomePage(),
  );