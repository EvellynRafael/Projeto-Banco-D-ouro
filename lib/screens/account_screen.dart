import 'dart:io';
import 'package:dart_assincronismo/models/account.dart';
import 'package:dart_assincronismo/services/account_service.dart';

class AccountScreen {
  final AccountService _accountService = AccountService();

  void initializeStream() {
    _accountService.streamInfos.listen(
      (event) {
        print(event);
      },
    );
  }
  void runChatBot() async {
    print("Good morning! I'm Lewis, assistant at the Gold Bank!");
    print("It's great to have you here with us.\n");

    bool isRunning = true;
    while (isRunning) {
      print("How can I help you? (enter the desired number)");
      print("1 - View accounts.");
      print("2 - Add new account.");
      print("3 - Exit.\n");

      String? input = stdin.readLineSync();

      if (input != null) {
        switch (input) {
          case "1":
          {
            await _getAllAccounts();
            break;
          }
          case "2":
          {
            await _addExampleAccount();
            break;
          }
          case "3":
          {
            isRunning = false;
            print("See you soon.");
            break;
          }
          default:{
            print("I couldn't understand. Try again.");
          }
        }
      }
    }
  }

  _getAllAccounts() async {
    List<Account> listAccounts = await _accountService.getAll();
      print(listAccounts);
  }

  _addExampleAccount() async {
    Account example = Account(
      id: "ID5555", 
      name: "John", 
      lastName:"Doe", 
      balance: 1000);
      
    await _accountService.addAccount(example);
  }
}