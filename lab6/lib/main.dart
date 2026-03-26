import 'package:flutter/material.dart';

/// Lab 6: Building a Responsive Movie Genre Browsing Screen
/// Student: Nguyễn Hoàng Việt - HE181929
/// Description: A responsive movie browsing app that adapts to different screen sizes.

void main() {
  runApp(const ResponsiveMovieApp());
}

class ResponsiveMovieApp extends StatelessWidget {
  const ResponsiveMovieApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie Browser - Nguyễn Hoàng Việt',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // Đổi sang tông màu xanh chủ đạo
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          primary: Colors.blue[800],
        ),
        useMaterial3: true,
      ),
      home: const GenreScreen(),
    );
  }
}

// --- Models ---
class Movie {
  final String title;
  final int year;
  final List<String> genres;
  final String posterUrl;
  final double rating;

  Movie({
    required this.title,
    required this.year,
    required this.genres,
    required this.posterUrl,
    required this.rating,
  });
}

final List<Movie> allMovies = [
  Movie(title: 'Inception', year: 2010, genres: ['Action', 'Sci-Fi'], rating: 8.8, posterUrl: 'https://picsum.photos/seed/inception/200/300'),
  Movie(title: 'The Dark Knight', year: 2008, genres: ['Action', 'Drama'], rating: 9.0, posterUrl: 'https://picsum.photos/seed/darkknight/200/300'),
  Movie(title: 'Pulp Fiction', year: 1994, genres: ['Crime', 'Drama'], rating: 8.9, posterUrl: 'https://picsum.photos/seed/pulp/200/300'),
  Movie(title: 'The Matrix', year: 1999, genres: ['Action', 'Sci-Fi'], rating: 8.7, posterUrl: 'https://picsum.photos/seed/matrix/200/300'),
  Movie(title: 'Interstellar', year: 2014, genres: ['Sci-Fi', 'Drama'], rating: 8.6, posterUrl: 'https://picsum.photos/seed/interstellar/200/300'),
  Movie(title: 'The Godfather', year: 1972, genres: ['Crime', 'Drama'], rating: 9.2, posterUrl: 'https://picsum.photos/seed/godfather/200/300'),
];

// --- Screens ---
class GenreScreen extends StatefulWidget {
  const GenreScreen({super.key});

  @override
  State<GenreScreen> createState() => _GenreScreenState();
}

class _GenreScreenState extends State<GenreScreen> {
  String searchQuery = '';
  Set<String> selectedGenres = {};
  String selectedSort = 'A-Z';

  final List<String> availableGenres = ['Action', 'Drama', 'Sci-Fi', 'Crime', 'Comedy'];

  @override
  Widget build(BuildContext context) {
    // Logic: Filtering and Sorting
    List<Movie> visibleMovies = allMovies.where((movie) {
      final matchesSearch = movie.title.toLowerCase().contains(searchQuery.toLowerCase());
      final matchesGenre = selectedGenres.isEmpty ||
          movie.genres.any((g) => selectedGenres.contains(g));
      return matchesSearch && matchesGenre;
    }).toList();

    if (selectedSort == 'A-Z') {
      visibleMovies.sort((a, b) => a.title.compareTo(b.title));
    } else if (selectedSort == 'Z-A') {
      visibleMovies.sort((a, b) => b.title.compareTo(a.title));
    } else if (selectedSort == 'Year') {
      visibleMovies.sort((a, b) => b.year.compareTo(a.year));
    } else if (selectedSort == 'Rating') {
      visibleMovies.sort((a, b) => b.rating.compareTo(a.rating));
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Find a Movie', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.blue[700],
        centerTitle: true,
        elevation: 4,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Search Bar
              TextField(
                decoration: InputDecoration(
                  hintText: 'Search movies...',
                  prefixIcon: const Icon(Icons.search, color: Colors.blue),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(color: Colors.blue),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: Colors.blue.shade200),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(color: Colors.blue, width: 2),
                  ),
                  filled: true,
                  fillColor: Colors.blue.shade50,
                ),
                onChanged: (value) => setState(() => searchQuery = value),
              ),
              const SizedBox(height: 20),
              
              // Genre Section
              Row(
                children: [
                  const Text('Genres', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.blue)),
                  if (selectedGenres.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Badge(
                        label: Text('${selectedGenres.length}'),
                        backgroundColor: Colors.blue[800],
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 10),
              Wrap(
                spacing: 8.0,
                runSpacing: 4.0,
                children: availableGenres.map((genre) {
                  final isSelected = selectedGenres.contains(genre);
                  return FilterChip(
                    label: Text(genre),
                    selected: isSelected,
                    selectedColor: Colors.blue[100],
                    checkmarkColor: Colors.blue[800],
                    labelStyle: TextStyle(
                      color: isSelected ? Colors.blue[800] : Colors.black87,
                      fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                    ),
                    onSelected: (selected) {
                      setState(() {
                        selected ? selectedGenres.add(genre) : selectedGenres.remove(genre);
                      });
                    },
                  );
                }).toList(),
              ),
              const SizedBox(height: 20),
              
              // Sort Bar
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Results: ${visibleMovies.length}', 
                    style: TextStyle(color: Colors.blue[900], fontWeight: FontWeight.w500),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      color: Colors.blue.shade50,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: DropdownButton<String>(
                      value: selectedSort,
                      underline: Container(),
                      icon: const Icon(Icons.sort, color: Colors.blue),
                      items: ['A-Z', 'Z-A', 'Year', 'Rating'].map((s) {
                        return DropdownMenuItem(value: s, child: Text(s, style: const TextStyle(color: Colors.blue)));
                      }).toList(),
                      onChanged: (val) => setState(() => selectedSort = val!),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              
              // Responsive Movie List
              Expanded(
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    if (constraints.maxWidth < 800) {
                      // Mobile Layout
                      return ListView.builder(
                        itemCount: visibleMovies.length,
                        itemBuilder: (context, index) => MovieCard(movie: visibleMovies[index]),
                      );
                    } else {
                      // Tablet Layout
                      return GridView.builder(
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 2.8,
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 16,
                        ),
                        itemCount: visibleMovies.length,
                        itemBuilder: (context, index) => MovieCard(movie: visibleMovies[index]),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// --- Widgets ---
class MovieCard extends StatelessWidget {
  final Movie movie;

  const MovieCard({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shadowColor: Colors.blue.withOpacity(0.2),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
        side: BorderSide(color: Colors.blue.shade50),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                movie.posterUrl,
                width: 75,
                height: 105,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => 
                  Container(
                    width: 75, 
                    height: 105, 
                    color: Colors.blue.shade100, 
                    child: const Icon(Icons.movie, color: Colors.blue),
                  ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    movie.title, 
                    style: TextStyle(
                      fontSize: 18, 
                      fontWeight: FontWeight.bold, 
                      color: Colors.blue[900],
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${movie.year} • ${movie.genres.join(", ")}', 
                    style: TextStyle(color: Colors.blue[700], fontSize: 13),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.amber.shade50,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.star, color: Colors.amber, size: 18),
                        const SizedBox(width: 4),
                        Text(
                          '${movie.rating}', 
                          style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.orange),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
