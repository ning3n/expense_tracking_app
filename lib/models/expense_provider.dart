import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';
import '../models/models.dart';
import 'dart:convert'; 

class ExpenseProvider with ChangeNotifier{
  // class ExpenseProvider with ChangeNotifier: A class to manage the list of expenses.
  // List<Expense> _expenses: A private list to store expenses.
  // List<Expense> get expenses: A getter to access the list of expenses.
  final LocalStorage storage;
  List<Expense> _expenses = [];

  List<Expense> get expenses => _expenses;

  ExpenseProvider(this.storage){
    _loadExpensesFromStorage();
  }

  void _loadExpensesFromStorage() async {
    final ready = await storage.ready;
    if (!ready) return;
    var storedExpenses = storage.getItem('expenses');
    if (storedExpenses != null) {
      _expenses = List<Expense>.from(
        (storedExpenses as List).map((item) => Expense.fromJson(item)),
      );
      notifyListeners();
    }
  }

  void _saveExpensesToStorage(){
    storage.setItem('expenses', jsonEncode(_expenses.map((e) => e.toJson()).toList()));
  }

  void addExpense(Expense expense){
    _expenses.add(expense);
    _saveExpensesToStorage();
    notifyListeners();
  }

  void addOrUpdateExpense(Expense expense){
    int index = _expenses.indexWhere((e) => e.id == expense.id);
    if (index != -1){
      _expenses[index] = expense;
    } else {
      _expenses.add(expense);
    }
    _saveExpensesToStorage();
    notifyListeners();
  }

  void removeExpense(String id) {
    _expenses.removeWhere((expense) => expense.id == id);
    _saveExpensesToStorage();
    notifyListeners();
  }
}

extension on LocalStorage {
  get ready => null;
}