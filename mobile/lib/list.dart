import 'package:flutter/material.dart';
import 'banco.dart';
import 'dart:convert'; 
import 'form.dart';
class ListScreen extends StatefulWidget {
  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  final BankApi _api = BankApi();
  List<dynamic> _clientes = [];

  @override
  void initState() {
    super.initState();
    _fetchClientes();
  }

  void _fetchClientes() async {
    String response = await _api.getAll();
    setState(() {
      _clientes = jsonDecode(response);
    });
  }

  void _deleteCliente(String id) async {
    await _api.delete(id);
    _fetchClientes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Lista de Clientes')),
      body: ListView.builder(
        itemCount: _clientes.length,
        itemBuilder: (context, index) {
          var cliente = _clientes[index];
          return ListTile(
            title: Text(cliente['name']),
            subtitle: Text('Saldo: ${cliente['balance']}'),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () => _deleteCliente(cliente['id']),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => FormScreen()),
          ).then((_) => _fetchClientes());
        },
        child: Icon(Icons.add),
      ),
    );
  }
}