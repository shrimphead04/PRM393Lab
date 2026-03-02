// Model đại diện cho một trailer phim
class Trailer {
  final String id;
  final String title;
  final String duration;
  final String thumbnailUrl;

  const Trailer({
    required this.id,
    required this.title,
    required this.duration,
    required this.thumbnailUrl,
  });
}
