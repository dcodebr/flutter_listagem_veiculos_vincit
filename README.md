# Listagem de Veículos em Flutter

App de cadastro e listagem de veículos desenvolvido com Flutter e Dart em conjunto com os alunos dos cursos de tecnologia da [Faculdade VINCIT](https://www.faculdadevincit.edu.br/).

O app possui duas telas, uma para cadastro e outra para listagem, sendo esta a home do app. Atavés de um FloatActionButton no scafold, a tela de cadastro é acionada. 

O projeto ainda está em desenvolvimento, sendo desenvolvido durante as aulas de Programação para Dispositivos Móveis. Você poderá acessar a aula clicando na imagem a seguir:

[![Programação para Dispositivos Móveis - ao vivo - 15/04/2025 - Alex Rocha](https://img.youtube.com/vi/AUnZct2TOss/0.jpg)](https://www.youtube.com/watch?app=desktop&v=AUnZct2TOss)

## Plataformas utilizadas

Tradicionalmente, você poderá utilizar o ambiente de programação em Flutter, podendo ser instalado em Linux, Windows e macOS, ou então acessando a plataforma do [Firebase Studio](https://idx.google.com/).

### Instalação do ambiente local de desenvolvimento:

Para prosseguir com o ambiente local de desenvolvimento, você deve instalar os seguintes componentes:

- [SDK do Flutter](https://docs.flutter.dev/get-started/install)
- [Visual Studio Code](https://code.visualstudio.com/download)
- [Flutter Extension](https://marketplace.visualstudio.com/items/?itemName=Dart-Code.flutter)
-  [Dart Extension](https://marketplace.visualstudio.com/items/?itemName=Dart-Code.dart-code)
  
Também produzi um vídeo com as orientações a respeito da instalação do ambiente Flutter no microsoft Windows. Você poderá acessá-lo a qualquer momento clicando na imagem a seguir:

[![Instalação e Configuração do Flutter](https://img.youtube.com/vi/42jiTBFmeIA/0.jpg)](https://www.youtube.com/watch?app=desktop&v=42jiTBFmeIA)

### Utilização do Firebase Studio

O ambiente de programação do Firebase Studio permite o desenvolvimento de aplicativos online sem a necessidade de nenhum componente ser instalado. Na data em que esse material foi produzido, o Firebase Studio estava em desenvolvimento, e não possuía nenhum custo para ser utilizado. A única limitação é que somente poderia haver 5 projetos por conta.

Para a acessar o Firebase Studio, você deve clicar [neste link](https://idx.google.com/).

Em seguida, para desenvolver o aplicativo, você deve clicar em "New Workspace" e selecionar a opção "Mobile", presente no menu lateral esquerdo. Em seguida, você deve clicar em Flutter.

![Firebase Studio create empty Worrkspace](img/firebsase_studio_workspace.png)

Por fim, ao clicar no botão, um novo projeto será configurado e você será redirecionado ao ambiente de programação com o VS Code Online:

![](img/firebsase_studio_calculadora_app.png)

## Trechos Importantes

O app possui duas telas, sendo [listagem_veiculos_screen.dart](/listagem_veiculos/lib/listagem_veiculos_screen.dart), sendo a home do app, e [cadastro_veiculos_screen.dart](/listagem_veiculos/lib/cadastro_veiculos_screen.dart), acessada clicando no FloatActionButton do scafold da listagem_veiculos_screen.dart.

***veiculo.dart*
```dart
class Veiculo {
  String? fabricante;
  String? modelo;
  String? anoFabricacao;
  String? cor;
  String? placa;

  Veiculo({
    required this.fabricante,
    required this.modelo,
    required this.anoFabricacao,
    required this.cor,
    required this.placa,
  });
}
```

**listagem_veiculos_screen.dart**

```dart
//Scaffold
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
```
---
Desenvolvido por Alex Rocha


