import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/models.dart';
import '../models/expense_provider.dart';



class AddExpenseScreen extends StatefulWidget {
  const AddExpenseScreen({super.key});

  @override
  State<AddExpenseScreen> createState() => _AddExpenseScreenState();
}

class _AddExpenseScreenState extends State<AddExpenseScreen> {

  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _categoryIdController = TextEditingController();
  final TextEditingController _payeeController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _tagController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Expense'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _amountController,
              decoration: InputDecoration(labelText: 'Amount'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _categoryIdController,
              decoration: InputDecoration(labelText: 'Category ID'),
            ),
            TextField(
              controller: _payeeController,
              decoration: InputDecoration(labelText: 'Payee'),
            ),
            TextField(
              controller: _noteController,
              decoration: InputDecoration(labelText: 'Note'),
            ),
            TextField(
              controller: _dateController,
              decoration: InputDecoration(labelText: 'Date'),
              keyboardType: TextInputType.datetime,
            ),
            TextField(
              controller: _tagController,
              decoration: InputDecoration(labelText: 'Tag'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _saveExpense(context), 
              child: Text('Save Expense'),
            ),
          ],
        ),
      ),
    );
  }

  void _saveExpense(BuildContext context){
    final expense = Expense(
      id: DateTime.now().millisecondsSinceEpoch.toString(), 
      amount: double.parse(_amountController.text), 
      categoryId: _categoryIdController.text, 
      payee: _payeeController.text, 
      note: _noteController.text, 
      date: DateTime.parse(_dateController.text), 
      tag: _tagController.text
    );
    Provider.of<ExpenseProvider>(context, listen: false).addExpense(expense);
    Navigator.pop(context);
  }

  @override
  void dispose(){
    _amountController.dispose();
    _categoryIdController.dispose();
    _payeeController.dispose();
    _noteController.dispose();
    _dateController.dispose();
    _tagController.dispose();
    super.dispose();
  }
}

