class Anime {
  final int id;
  final String title;
  final String imageUrl;
  final int? year;
  final String sinopse;

  Anime({
    required this.id,
    required this.title,
    required this.imageUrl,
    this.year,
    required this.sinopse,
  });

  factory Anime.fromJson(Map<String, dynamic> json) {
    return Anime(
      id: json['mal_id'],
      title: json['title'] ?? 'Sem título',
      imageUrl: json['images']?['jpg']?['image_url'] ?? '',
      year: json['year'],
      sinopse: json['synopsis'] ?? 'Sinopse não disponível',
    );
  }
}
