import 'package:flutter/material.dart';

class FavouriteView extends StatelessWidget {
  const FavouriteView({super.key});

  @override
  Widget build(BuildContext context) {
    print("FavouriteView Rebuilding");
    return const Scaffold(
      body: Center(child: Text("data")),
    );
  }
}