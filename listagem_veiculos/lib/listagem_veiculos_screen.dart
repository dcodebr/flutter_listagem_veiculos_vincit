import 'package:flutter/material.dart';
import 'package:listagem_veiculos/cadastro_veiculos_screen.dart';
import 'package:listagem_veiculos/veiculo.dart';
import 'package:listagem_veiculos/veiculo_repository.dart';

class ListagemVeiculosScreen extends StatefulWidget {
  const ListagemVeiculosScreen({super.key});

  @override
  State<ListagemVeiculosScreen> createState() => _ListagemVeiculosScreenState();
}

class _ListagemVeiculosScreenState extends State<ListagemVeiculosScreen> {
  final VeiculoRepository veiculoRepository = VeiculoRepository();
  List<Veiculo> veiculos = [];

  void listarVeiculos() {
    veiculoRepository.listar().then((value) {
      setState(() => veiculos = value);
    });
  }

  @override
  Widget build(BuildContext context) {
    listarVeiculos();

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Center(
            child: Text(
              "Listagem de veículos",
              style: TextStyle(color: Colors.white, fontSize: 30),
            ),
          ),
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              heroTag: "listagem.add",
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CadastroVeiculoScreen()));

                listarVeiculos();
              },
              child: const Icon(Icons.add),
            ),
            SizedBox(height: 20),
            FloatingActionButton(
              heroTag: "listagem.refresh",
              onPressed: () => listarVeiculos(),
              child: const Icon(Icons.refresh),
            ),
          ],
        ),
        body: ListView.builder(
            itemCount: veiculos.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: criarLinha(index),
              );
            }));
  }

  Widget criarLinha(int index) {
    Veiculo veiculo = veiculos.elementAt(index);

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        decoration:
            BoxDecoration(border: Border.all(color: Colors.black, width: 2)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            children: [
              Expanded(
                flex: 10,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Fabricante: ${veiculo.fabricante}",
                      style: TextStyle(fontSize: 25),
                    ),
                    Text("Modelo: ${veiculo.modelo}",
                        style: TextStyle(fontSize: 25)),
                    Text("Ano Fabricação: ${veiculo.anoFabricacao}",
                        style: TextStyle(fontSize: 25)),
                    Text("Cor: ${veiculo.cor}", style: TextStyle(fontSize: 25)),
                    Text("Placa: ${veiculo.placa}",
                        style: TextStyle(fontSize: 25))
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: FloatingActionButton(
                  heroTag: "excluir.${index}",
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            content: Text(
                              "Tem certeza que deseja excluir?",
                              style: TextStyle(fontSize: 50),
                            ),
                            actions: [
                              TextButton(
                                child: Text("Não"),
                                onPressed: () => Navigator.of(context).pop(),
                              ),
                              ElevatedButton(
                                child: Text("Sim"),
                                onPressed: () {
                                  veiculoRepository
                                      .excluir(veiculo.id)
                                      .then((value) {
                                    listarVeiculos();

                                    Navigator.of(context).pop();
                                  });
                                },
                              )
                            ],
                          );
                        });
                  },
                  child: Icon(Icons.delete),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
