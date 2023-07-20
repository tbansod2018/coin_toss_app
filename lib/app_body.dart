import 'package:coin_toss/get_coin.dart';
import 'package:flutter/material.dart';

const startAlignment = Alignment.topLeft;
const endAlignment = Alignment.bottomRight;

class AppBody extends StatelessWidget {
  const AppBody({super.key});

  @override
  Widget build(context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            colors: [Colors.deepPurple, Colors.purple],
            begin: startAlignment,
            end: endAlignment),
      ),
      child: const Center(
        child: GetCoin(),
      ),
    );
  }
}
