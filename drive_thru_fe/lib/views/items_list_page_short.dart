import 'package:flutter/material.dart';

class ItemsListPageShort extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Lista de 6 Itens')),
      body: ListView.builder(
        itemCount: 6,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Item ${index + 1}'),
          );
        },
      ),
    );
  }
}
