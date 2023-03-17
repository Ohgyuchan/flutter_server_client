import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl;

  ApiService({required this.baseUrl});

  Future<List<dynamic>> fetchData(String endpoint) async {
    final response = await http.get(Uri.parse(baseUrl + endpoint));

    if (response.statusCode == 200) {
      return json.decode(response.body) as List;
    } else {
      throw Exception('Failed to load data');
    }
  }
}
