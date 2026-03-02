import '../models/movie.dart';
import '../repository/movie_repository.dart';

// Service xử lý business logic liên quan đến phim
class MovieService {
  // Lấy toàn bộ danh sách phim
  List<Movie> getAllMovies() {
    return movieList;
  }

  // Tìm kiếm phim theo tên (không phân biệt hoa thường)
  List<Movie> searchMovies(String query) {
    if (query.isEmpty) return movieList;
    final lowerQuery = query.toLowerCase();
    return movieList
        .where((m) => m.title.toLowerCase().contains(lowerQuery))
        .toList();
  }

  // Lấy phim theo id
  Movie? getMovieById(String id) {
    try {
      return movieList.firstWhere((m) => m.id == id);
    } catch (_) {
      return null;
    }
  }
}
