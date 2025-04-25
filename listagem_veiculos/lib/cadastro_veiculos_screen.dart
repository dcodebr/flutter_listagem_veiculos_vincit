import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CadastroVeiculoScreen extends StatelessWidget {
  const CadastroVeiculoScreen({super.key});

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
                style: TextStyle(fontSize: 30),
                decoration: InputDecoration(label: Text("Fabricante")),
              ),
              TextField(
                style: TextStyle(fontSize: 30),
                decoration: InputDecoration(label: Text("Modelo")),
              ),
              TextField(
                style: TextStyle(fontSize: 30),
                decoration: InputDecoration(label: Text("Ano de Fabricação")),
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              ),
              TextField(
                style: TextStyle(fontSize: 30),
                decoration: InputDecoration(label: Text("Cor")),
              ),
              TextField(
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
                  onPressed: () {},
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
                  onPressed: () {},
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
