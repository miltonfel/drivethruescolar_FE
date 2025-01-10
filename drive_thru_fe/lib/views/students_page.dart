import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:xml/xml.dart' as xml;

class StudentsPage extends StatefulWidget {
  @override
  _StudentsPageState createState() => _StudentsPageState();
}

class _StudentsPageState extends State<StudentsPage> {
  List<dynamic> students = [];
  List<dynamic> filteredStudents = []; // Lista filtrada
  int pageNumber = 0;
  static const int itemsPerPage = 100;
  bool isLoading = false; // Indica se estamos carregando os alunos
  String searchQuery = ''; // Armazena texto de busca

  @override
  void initState() {
    super.initState();
    fetchStudents();
  }

  Future<void> fetchStudents() async {
    setState(() {
      isLoading = true; // Inicia o carregamento
    });

    try {
      final response = await http.get(Uri.parse(
          'https://api.sponteeducacional.net.br/WSAPIEdu.asmx/GetAlunos?nCodigoCliente=23325&sToken=mcpSl2kx4bjJ&sParametrosBusca=SituacaoAlunoID=-1'));

      if (response.statusCode == 200) {
        final document = xml.parse(response.body);

        // Supondo que cada aluno esteja em um nó como <wsAluno>
        final studentsList = document.findAllElements('wsAluno').map((node) {
          return {
            'nome': node.findElements('Nome').single.text,
            'turma': node.findElements('TurmaAtual').single.text,
          };
        }).toList();

        setState(() {
          students = studentsList;
          filteredStudents =
              studentsList; // Inicialmente, a lista filtrada é igual à lista completa
        });
      } else {
        throw Exception('Failed to load students');
      }
    } catch (e) {
      // Tratamento de erro para depuração
      print('Erro ao buscar alunos: $e');
    } finally {
      setState(() {
        isLoading = false; // Encerra o carregamento
      });
    }
  }

  void filterStudents(String query) {
    setState(() {
      searchQuery = query;
      if (searchQuery.isEmpty) {
        filteredStudents =
            students; // Se a busca estiver vazia, mantém todos os alunos
      } else {
        filteredStudents = students.where((student) {
          // Filtra alunos com base no nome
          return student['nome']
              .toLowerCase()
              .contains(searchQuery.toLowerCase());
        }).toList();
      }
      pageNumber = 0; // Reinicia a página na busca
    });
  }

  @override
  Widget build(BuildContext context) {
    final paginatedStudents = filteredStudents
        .skip(pageNumber * itemsPerPage)
        .take(itemsPerPage)
        .toList();

    return Scaffold(
      appBar: AppBar(title: Text('Alunos')),
      body:
          isLoading // Se estiver carregando, mostra o CircularProgressIndicator
              ? Center(child: CircularProgressIndicator())
              : Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: 'Buscar Aluno',
                          border: OutlineInputBorder(),
                        ),
                        onChanged: filterStudents, // Chamado ao digitar
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: paginatedStudents.length +
                            1, // Adicionando 1 para o botão de navegação
                        itemBuilder: (context, index) {
                          if (index == paginatedStudents.length) {
                            // Botões de navegação
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 20.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  ElevatedButton(
                                    onPressed: pageNumber > 0
                                        ? () {
                                            setState(() {
                                              pageNumber--;
                                            });
                                          }
                                        : null,
                                    child: Text("Página Anterior"),
                                  ),
                                  ElevatedButton(
                                    onPressed:
                                        ((pageNumber + 1) * itemsPerPage) <
                                                filteredStudents.length
                                            ? () {
                                                setState(() {
                                                  pageNumber++;
                                                });
                                              }
                                            : null,
                                    child: Text("Próxima Página"),
                                  ),
                                ],
                              ),
                            );
                          } else {
                            final student = paginatedStudents[index];
                            String nome = student['nome'] ?? 'Desconhecido';
                            String turma = student['turma'] ?? 'Sem turma';

                            Color backgroundColor = (index % 2 == 0)
                                ? Colors.grey[300]!
                                : Colors.white;

                            return Container(
                              color: backgroundColor,
                              child: ListTile(
                                title: Text(nome),
                                subtitle: Text('Turma: $turma'),
                                trailing: ElevatedButton(
                                  onPressed: () {
                                    // Lógica para editar responsável
                                    // Você pode implementar aqui a ação que deseja
                                    print('Editando responsável de $nome');
                                  },
                                  child: Text(
                                      'Editar responsável'), // Botão à direita
                                ),
                              ),
                            );
                          }
                        },
                      ),
                    ),
                  ],
                ),
    );
  }
}
