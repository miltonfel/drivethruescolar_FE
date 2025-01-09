import 'package:flutter/material.dart';

class ItemsListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Fila de saída')), // Título da AppBar
      body: ListView.builder(
        itemCount: 12,
        itemBuilder: (context, index) {
          // Alterna entre cinza e branco
          Color backgroundColor =
              (index % 2 == 0) ? Colors.grey[300]! : Colors.white;

          // Define o estilo do texto
          TextStyle textStyle;
          if (index >= 3 && index <= 6) {
            // Itens 4 a 7 (índices 3 a 6)
            textStyle = TextStyle(
                fontWeight: FontWeight.bold, fontSize: 18); // Negrito e maior
          } else {
            textStyle = TextStyle(fontSize: 16); // Tamanho normal
          }

          return Container(
            color: backgroundColor,
            child: ListTile(
              title: Text('Aluno ${index + 1}',
                  style: textStyle), // Aplicar estilo ao texto
            ),
          );
        },
      ),
    );
  }
}
