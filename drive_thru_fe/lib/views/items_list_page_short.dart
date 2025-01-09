import 'package:flutter/material.dart';

class ItemsListPageShort extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Checkout')), // Alterado para "Checkout"
      body: ListView.builder(
        itemCount: 6,
        itemBuilder: (context, index) {
          // Alterna entre cinza e branco
          Color backgroundColor =
              (index % 2 == 0) ? Colors.grey[300]! : Colors.white;

          return Container(
            color: backgroundColor,
            child: ListTile(
              title: Text(
                  'Item ${index + 1}'), // Mantenha o texto aqui conforme sua necessidade
            ),
          );
        },
      ),
    );
  }
}
