import 'package:flutter/material.dart';

class MenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title:
              Text('Drive Thru Escolar')), // Alterado para "Drive Thru Escolar"
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Botão 1
            Container(
              width: 200, // Defina a largura desejada
              child: ElevatedButton(
                onPressed: () => Navigator.pushNamed(context, '/itemsList'),
                child: Text('Lista (Monitor)'),
              ),
            ),
            SizedBox(height: 16), // Espaço de 16 pixels entre os botões
            // Botão 2
            Container(
              width: 200, // A mesma largura
              child: ElevatedButton(
                onPressed: () =>
                    Navigator.pushNamed(context, '/itemsListShort'),
                child: Text('Checkout'),
              ),
            ),
            SizedBox(height: 16), // Espaço de 16 pixels entre os botões
            // Botão 3
            Container(
              width: 200, // A mesma largura
              child: ElevatedButton(
                onPressed: () => Navigator.pushNamed(context, '/admin'),
                child: Text('Administrativo'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
