import 'package:http/http.dart' as http;

abstract class AbstractApi {
  final String urlLocalhost = 'http://localhost:3000';
  String _recurso;

  AbstractApi(this._recurso);

  Future<String> getAll() async {
    var response = await http.get(Uri.parse("$urlLocalhost/$_recurso"));
    return response.body;
  }


  Future<String> getById(String id) async {
    var response = await http.get(Uri.parse("$urlLocalhost/$_recurso/$id"));
    return response.body;
  }

  Future<String> post(String body) async {
    var response = await http.post(
      Uri.parse("$urlLocalhost/$_recurso"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: body,
    );
    return response.body;
  }

  Future<String> put(String id, String body) async {
    var response = await http.put(
      Uri.parse("$urlLocalhost/$_recurso/$id"),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: body,
    );
    return response.body;
  }


  Future<String> delete(String id) async {
    var response = await http.delete(Uri.parse("$urlLocalhost/$_recurso/$id"));
    return response.body;
  }


}