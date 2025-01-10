import 'package:flutter/material.dart';

class AdminPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Administrativo')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Botão Alunos
            Container(
              width: 200,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(
                      context, '/students'); // Direciona para a StudentsPage
                },
                child: Text('Alunos'),
              ),
            ),
            SizedBox(height: 16), // Espaço entre os botões
            // Botão Responsáveis
            Container(
              width: 200,
              child: ElevatedButton(
                onPressed: () {
                  // Adicione a ação desejada para este botão
                },
                child: Text('Responsáveis'),
              ),
            ),
            SizedBox(height: 16), // Espaço entre os botões
            // Botão Veículos
            Container(
              width: 200,
              child: ElevatedButton(
                onPressed: () {
                  // Adicione a ação desejada para este botão
                },
                child: Text('Veículos'),
              ),
            ),
            SizedBox(height: 16), // Espaço entre os botões
            // Botão Saída Eventual
            Container(
              width: 200,
              child: ElevatedButton(
                onPressed: () {
                  // Adicione a ação desejada para este botão
                },
                child: Text('Saída Eventual'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
