import 'dart:async';
import 'package:dart_assincronismo/api_key.dart'; // Importando a chave de API do GitHub
import 'package:dart_assincronismo/models/account.dart';
import 'package:http/http.dart'; // Pacote que contém a classe Response
import 'dart:convert';

class AccountService {
    final StreamController<String> _streamController = StreamController<String>(); //Quem controla a stream está criada
    Stream<String> get streamInfos => _streamController.stream;
    String url = 'https://api.github.com/gists/4cd6fd2869a2c5d13060a3264e4ae820'; //Agora usando a mesma url para os dois métodos nesse código.

    Future<List<Account>> getAll() async { //Função assíncrona -> getAll pq ele pega todos os elementos que estão no servidor // URL DE NAVEGADOR(NÃO É O PADRÃO MAS É BOM APRENDER): String url = 'https://gist.githubusercontent.com/EvellynRafael/4cd6fd2869a2c5d13060a3264e4ae820/raw/3bb43e59fce3d3f2e74abd161a042c96d7c2cf47/accounts.json';
    
    Response response = await get(Uri.parse(url)); 
      _streamController.add("${DateTime.now()} | Reading request.");
    Map<String, dynamic> mapResponse = json.decode(response.body);
    List<dynamic> listDynamic = json.decode(mapResponse['files']['accounts.json']['content']);
    List<Account> listAccounts = [];

    for (dynamic dyn in listDynamic){
      Map<String, dynamic> mapAccount = dyn as Map<String, dynamic>;
      Account account = Account.fromMap(mapAccount);
      listAccounts.add(account);
    }

    return listAccounts;
}

    addAccount(Account account) async { 
      List<Account> listAccounts = await getAll(); 
      listAccounts.add(account);

      List<Map<String, dynamic>> listContent = [];
      
      for(Account account in listAccounts){
        listContent.add(account.toMap());
      }

      String content = json.encode(listContent); //Transformando um objeto em uma string formatada como json

      /* String content = json.encode(listAccounts); //transformando um objeto em uma string formatada como json */

      Response response = await post( //Olhando na documentação
        Uri.parse(url), 
        headers: {
          "Authorization": "Bearer $githubApiKey"
          }, 
        body: json.encode({
          "description": "accounts.json",
          "public" : true,
          "files": {
            "accounts.json": {
              "content": content,
          }
        }
      }),
    );

      if(response.statusCode.toString()[0] == "2"){
        _streamController.add("${DateTime.now()} | Successful add request (${account.name}).");
      } else {
        _streamController.add("${DateTime.now()} | Request failed (${account.name}).");
      }
      /* print(response.statusCode); -> statuscode é do http e diz se algo deu errado ou não no código. */
  }
}