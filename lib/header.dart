import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient:
          LinearGradient(colors: [Color(0xFF3e60ac), Color(0xFF55a4e0)])),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              "Accueil",
              style: TextStyle(color: Colors.white),
            ),
            Text("Nouveau", style: TextStyle(color: Colors.white)),
            Text("Rechercher", style: TextStyle(color: Colors.white)),
          ],
        ),
      ),
    );
  }
}