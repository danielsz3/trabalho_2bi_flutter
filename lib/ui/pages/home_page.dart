import 'package:flutter/material.dart';
import 'package:trabalho_2bi/ui/pages/anime_details_page.dart';
import 'package:trabalho_2bi/ui/widgets/app_bar.dart';
import 'package:trabalho_2bi/ui/widgets/footer.dart';

import '../../models/anime.dart';
import '../../service/api_service.dart';
import '../widgets/card.dart';
import '../widgets/loading.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ApiService _apiService = ApiService();
  List<Anime> _animes = [];
  List<Anime> _filteredAnimes = [];
  bool _isLoading = true;
  String _searchText = '';

  @override
  void initState() {
    super.initState();
    _fetchAnimes();
  }

  void _fetchAnimes() async {
    try {
      final animes = await _apiService.fetchAnimes();
      setState(() {
        _animes = animes;
        _filteredAnimes = animes;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      print("Erro ao buscar animes: $e");
    }
  }

  void _filterAnimes(String query) {
    final normalizedQuery = query.toLowerCase();

    setState(() {
      _searchText = query;
      _filteredAnimes =
          _animes.where((anime) {
            return anime.title.toLowerCase().contains(normalizedQuery);
          }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar().criar(context, 'Animes'),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Buscar animes...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onChanged: _filterAnimes,
            ),
          ),
          Expanded(
            child:
                _isLoading
                    ? const Loading(message: '')
                    : _filteredAnimes.isEmpty
                    ? const Center(child: Text('Nenhum anime encontrado.'))
                    : ListView.builder(
                      itemCount: _filteredAnimes.length,
                      itemBuilder: (context, index) {
                        return AnimeCard(
                          anime: _filteredAnimes[index],
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder:
                                    (context) => AnimeDetalhes(
                                      anime: _filteredAnimes[index],
                                    ),
                              ),
                            );
                          },
                        );
                      },
                    ),
          ),
          // Use o novo CustomFooter
          const Footer(),
        ],
      ),
    );
  }
}
