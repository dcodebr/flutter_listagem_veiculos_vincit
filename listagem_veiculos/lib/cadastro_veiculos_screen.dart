import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:listagem_veiculos/veiculo.dart';
import 'package:listagem_veiculos/veiculo_repository.dart';

class CadastroVeiculoScreen extends StatelessWidget {
  CadastroVeiculoScreen({super.key});

  var veiculoRepository = VeiculoRepository();
  var fabricanteController = TextEditingController();
  var modeloController = TextEditingController();
  var anoFabricacaoController = TextEditingController();
  var corController = TextEditingController();
  var placaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        title: Center(
            child: Text(
          "Cadastro de Veículos",
          style: TextStyle(fontSize: 30),
        )),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: fabricanteController,
                style: TextStyle(fontSize: 30),
                decoration: InputDecoration(label: Text("Fabricante")),
              ),
              TextField(
                controller: modeloController,
                style: TextStyle(fontSize: 30),
                decoration: InputDecoration(label: Text("Modelo")),
              ),
              TextField(
                style: TextStyle(fontSize: 30),
                controller: anoFabricacaoController,
                decoration: InputDecoration(label: Text("Ano de Fabricação")),
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              ),
              TextField(
                controller: corController,
                style: TextStyle(fontSize: 30),
                decoration: InputDecoration(label: Text("Cor")),
              ),
              TextField(
                controller: placaController,
                style: TextStyle(fontSize: 30),
                decoration: InputDecoration(label: Text("Placa")),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                width: double.infinity,
                child: FloatingActionButton(
                  heroTag: "cadastro.salvar",
                  onPressed: () {
                    var fabricante = fabricanteController.text;
                    var modelo = modeloController.text;
                    var anoFabricacao = anoFabricacaoController.text;
                    var cor = corController.text;
                    var placa = placaController.text;

                    var veiculo = Veiculo(
                        fabricante: fabricante,
                        modelo: modelo,
                        anoFabricacao: anoFabricacao,
                        cor: cor,
                        placa: placa);

                    veiculoRepository.inserir(veiculo).then((value) {
                      Navigator.pop(context, veiculo);
                    });
                  },
                  child: Text(
                    "Salvar",
                    style: TextStyle(fontSize: 30),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                width: double.infinity,
                child: FloatingActionButton(
                  heroTag: "cadastro.cancelar",
                  onPressed: () => Navigator.pop(context),
                  child: Text(
                    "Cancelar",
                    style: TextStyle(fontSize: 30),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
