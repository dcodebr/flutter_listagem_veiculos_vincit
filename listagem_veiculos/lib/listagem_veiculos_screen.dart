import 'package:flutter/material.dart';
import 'package:listagem_veiculos/cadastro_veiculos_screen.dart';
import 'package:listagem_veiculos/veiculo.dart';

class ListagemVeiculosScreen extends StatefulWidget {
  const ListagemVeiculosScreen({super.key});

  @override
  State<ListagemVeiculosScreen> createState() => _ListagemVeiculosScreenState();
}

class _ListagemVeiculosScreenState extends State<ListagemVeiculosScreen> {
  final List<Veiculo> veiculos = [
    Veiculo(
        fabricante: "Volks",
        modelo: "Gol",
        anoFabricacao: "2022",
        cor: "Branca",
        placa: "ABC-1234"),
    Veiculo(
        fabricante: "GM",
        modelo: "Gol",
        anoFabricacao: "2022",
        cor: "Branca",
        placa: "ABC-1234"),
    Veiculo(
        fabricante: "Ford",
        modelo: "Gol",
        anoFabricacao: "2022",
        cor: "Branca",
        placa: "ABC-1234"),
    Veiculo(
        fabricante: "Fiat",
        modelo: "Gol",
        anoFabricacao: "2022",
        cor: "Branca",
        placa: "ABC-1234"),
    Veiculo(
        fabricante: "Suzuki",
        modelo: "Gol",
        anoFabricacao: "2022",
        cor: "Branca",
        placa: "ABC-1234"),
  ];

  @override
  Widget build(BuildContext context) {
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
        floatingActionButton: FloatingActionButton(
          heroTag: "listagem.add",
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => CadastroVeiculoScreen()));
          },
          child: const Icon(Icons.add),
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
                    setState(() {
                      veiculos.remove(veiculo);
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
