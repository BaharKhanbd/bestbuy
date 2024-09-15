import 'package:flutter/material.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    print("CartView Rebuilding");
    return const Scaffold(
      body: Center(child: Text("data")),
    );
  }
}
