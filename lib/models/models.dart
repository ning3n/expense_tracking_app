import 'package:flutter/foundation.dart';

class Expense{
  final String id;
  final double amount;
  final String categoryId;
  final String payee;
  final String note;
  final DateTime date;
  final String tag;

  Expense({
    required this.id,
    required this.amount,
    required this.categoryId,
    required this.payee,
    required this.note,
    required this.date,
    required this.tag
  });

  // Added FROM JSON METHOD to EXPENSE
  // factory Expense.fromJson: A factory constructor for creating an Expense instance from a map.
  factory Expense.fromJson(Map<String, dynamic> json){
    return Expense(
      id: json['id'], 
      amount: json['amount'], 
      categoryId: json['categoryId'], 
      payee: json['payee'], 
      note: json['note'], 
      date: DateTime.parse(json['date']), 
      tag: json['tag'],
    );
  }

  // Added TO JSON METHOD to EXPENSE
  //Map<String, dynamic> toJson(): Method to convert an Expense instance to a map.
  Map<String, dynamic> toJson(){
    return {
      'id': id,
      'amount': amount,
      'categoryId': categoryId,
      'payee': payee,
      'note': note,
      'date': date.toIso8601String(),
      'tag': tag,
    };
  }
}

class Category{
  final String id;
  final String name;
  
  Category({
    required this.id,
    required this.name,
  });

  //Added FROM JSON METHOD
  factory Category.fromJson(Map<String,dynamic> json){
    return Category(
      id: json['id'], 
      name: json['name'],
    );
  }

  //Added TO JSON METHOD
  Map<String, dynamic> toJson(){
    return {
      'id': id,
      'name': name,
    };
  }
}

class Tag{
  final String id;
  final String name;

  Tag({
    required this.id,
    required this.name,
  });

  //Added FROM JSON METHOD
  factory Tag.fromJson(Map<String, dynamic> json){
    return Tag(
      id: json['id'],
      name: json['name'],
    );
  }
  //Added TO JSON METHOD
  Map<String, dynamic> toJson(){
    return {
      'id': id,
      'name': name,
    };
  }
}