import 'package:listagem_veiculos/veiculo.dart';
import 'package:mysql_client/mysql_client.dart';

class VeiculoRepository {
  Future<MySQLConnection> conectarComBancoDeDados() async {
    var conn = await MySQLConnection.createConnection(
      host: "mysql.database.azure.com",
      port: 3306,
      userName: "user",
      password: "password",
      databaseName: "gestao_veiculos",
    );

    return conn;
  }

  Future<Veiculo> inserir(Veiculo veiculo) async {
    var conn = await conectarComBancoDeDados();
    await conn.connect();

    String comando = "INSERT INTO veiculos";
    comando += "(fabricante, modelo, cor, ano_fabricacao, placa)";
    comando += " VALUES (:fabricante, :modelo, :cor, :ano_fabricacao, :placa )";

    var result = await conn.execute(comando, {
      "fabricante": veiculo.fabricante,
      "modelo": veiculo.modelo,
      "ano_fabricacao": veiculo.anoFabricacao,
      "placa": veiculo.placa,
      "cor": veiculo.cor,
    });

    veiculo.id = result.lastInsertID;
    conn.close();

    return veiculo;
  }

  Future<List<Veiculo>> listar() async {
    List<Veiculo> contatos = [];

    var conn = await conectarComBancoDeDados();
    await conn.connect();

    String comando = "SELECT * FROM veiculos";
    var result = await conn.execute(comando);

    result.rows.forEach((row) {
      Veiculo contato = Veiculo(
          fabricante: row.colByName("fabricante"),
          modelo: row.colByName("modelo"),
          anoFabricacao: row.colByName("ano_fabricacao"),
          cor: row.colByName("cor"),
          placa: row.colByName("placa"));

      contato.id = BigInt.parse(row.colByName("id")!);

      contatos.add(contato);
    });

    conn.close();
    return contatos;
  }

  Future<void> excluir(BigInt? id) async {
    var conn = await conectarComBancoDeDados();
    await conn.connect();

    String command = "DELETE FROM veiculos WHERE id =:id";
    await conn.execute(command, {"id": id});

    conn.close();
  }
}
