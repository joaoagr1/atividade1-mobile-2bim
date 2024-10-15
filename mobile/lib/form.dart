import 'package:flutter/material.dart';
import 'banco.dart';

class FormScreen extends StatefulWidget {
  @override
  _FormScreenState createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final _nameController = TextEditingController();
  final _balanceController = TextEditingController();
  final BankApi _api = BankApi();

  void _submitForm() async {
    String name = _nameController.text;
    String balance = _balanceController.text;

    if (name.isNotEmpty && balance.isNotEmpty) {
      String body = '{"name": "$name", "balance": $balance}';
      await _api.post(body);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cadastro de Cliente')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Nome'),
            ),
            TextField(
              controller: _balanceController,
              decoration: InputDecoration(labelText: 'Saldo'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _submitForm,
              child: Text('Cadastrar'),
            ),
          ],
        ),
      ),
    );
  }
}