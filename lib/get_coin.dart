import 'dart:math';

import 'package:flutter/material.dart';

final randomizer = Random();

class GetCoin extends StatefulWidget {
  const GetCoin({super.key});

  @override
  State<GetCoin> createState() {
    return _FlipCoinState();
  }
}

class _FlipCoinState extends State<GetCoin> {
  int currentNumber = 0;
  String name = "assets/images/head.png";
  String decision = "Head";
  bool isLoading = false;

  void toss() {
    setState(() {
      isLoading = true;
    });

    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        currentNumber = randomizer.nextInt(10) % 2;
        if (currentNumber == 0) {
          name = "assets/images/head.png";
          decision = "Head";
        } else {
          name = "assets/images/tail.png";
          decision = "Tail";
        }

        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const SizedBox(
            height: 200,
          ),
          Text(
            decision,
            style: const TextStyle(color: Colors.blue, fontSize: 50),
          ),
          Image.asset(
            name,
            width: 200,
          ),
          const SizedBox(height: 20),
          // Show different UI based on isLoading variable
          isLoading
              ? const CircularProgressIndicator() // Show loading indicator while tossing
              : TextButton(
                  onPressed: toss,
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.blue,
                    textStyle: const TextStyle(fontSize: 28),
                  ),
                  child: const Text('Toss'),
                ),
        ],
      ),
    );
  }
}
