import 'package:flutter/material.dart';

class ItemsListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Lista de 12 Itens')),
      body: ListView.builder(
        itemCount: 12,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Item ${index + 1}'),
          );
        },
      ),
    );
  }
}
