import 'dart:convert';

class Account {
  final String id;
  final String name;
  final String lastName;
  final double balance;

  Account({
    required this.id, 
    required this.name, 
    required this.lastName,  
    required this.balance,
    });

  factory Account.fromMap(Map<String, dynamic> map) {
    return Account(
      id: map['id'] as String,
      name: map['name'] as String,
      lastName: map['lastName'] as String,
      balance: (map['balance'] is int) 
          ? (map['balance'] as int).toDouble() 
          : map['balance'] as double,
    ); //Verificando se é int (por causa do erro) -> Se for, convete pra double. Senão, faça diretamente como double
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'lastName': lastName,
      'balance': balance,
    };
  }

  String toJson() => json.encode(toMap());

  factory Account.fromJson(String source) => Account.fromMap(json.decode(source));

  copyWith({
    String? id,
    String? name,
    String? lastName,
    double? balance,
  }) {
    return Account(
      id: id ?? this.id,
      name: name ?? this.name,
      lastName: lastName ?? this.lastName,
      balance: balance ?? this.balance,
    );
  }


  @override
  String toString() {
    return 'Account(id: $id, name: $name, lastName: $lastName, balance: $balance)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Account &&
      other.id == id &&
      other.name == name &&
      other.lastName == lastName &&
      other.balance == balance;
  }

  @override 
  int get hashCode {
    return id.hashCode ^ name.hashCode ^ lastName.hashCode ^ balance.hashCode;
  }
}