import 'package:flutter/material.dart';

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
