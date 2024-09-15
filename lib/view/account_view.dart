import 'package:flutter/material.dart';

class AccountView extends StatelessWidget {
  const AccountView({super.key});

  @override
  Widget build(BuildContext context) {
    print("AccountView Rebuilding");
    return const Scaffold(
      body: Center(child: Text("data")),
    );
  }
}
