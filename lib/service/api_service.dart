import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:trabalho_2bi/config.dart';

import '../models/anime.dart';

class ApiService {
  Future<List<Anime>> fetchAnimes() async {
    final response = await http.get(Uri.parse(linkAPI));

    if (response.statusCode == 200) {
      final decoded = json.decode(response.body);

      if (decoded['data'] is List) {
        final List<dynamic> results = decoded['data'];
        return results.map((json) => Anime.fromJson(json)).toList();
      } else {
        throw Exception('Formato de dados inesperado: ${decoded.runtimeType}');
      }
    } else {
      throw Exception('Falha ao carregar animes (HTTP ${response.statusCode})');
    }
  }
}
