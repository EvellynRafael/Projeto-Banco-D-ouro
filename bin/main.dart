import 'package:dart_assincronismo/screens/account_screen.dart';

void main() {
  AccountScreen accountScreen = AccountScreen();
  accountScreen.initializeStream();
  accountScreen.runChatBot();
}

/* requestData() async {
  String url = 'https://gist.githubusercontent.com/EvellynRafael/4cd6fd2869a2c5d13060a3264e4ae820/raw/3bb43e59fce3d3f2e74abd161a042c96d7c2cf47/accounts.json';
  Future<Response> futureResponse = get(Uri.parse(url)); //informando que isso vai ser assíncrono
  // 'Future<Response>' indica que a operação assíncrona retornará um objeto do tipo 'Future' que eventualmente conterá um objeto do tipo 'Response'.
  // print(futureResponse);
  futureResponse.then(
    (Response response) {
      streamController.add("${DateTime.now()} | Requisição de leitura (usando then)."); //Adicionando uma informação na stream
      /*print(response.body);
      List<dynamic> listAccounts = json.decode(response.body);  
      Map<String, dynamic> mapName = listAccounts.firstWhere( //Map do tipo string e valores do tipo dynamic
        (element) => element['name'] == "Carla" //Onde esse primeiro elemento na sua chave name vai ser igual a "Carla"
      ); 
      print(mapName['balance'])  = 1000 */; //Aqui eu estou mudando o valor do balance da Carla para 1000
    }
  );
} */

// A interrogação (?) depois do tipo 'String' indica que a variável pode ser nula.


