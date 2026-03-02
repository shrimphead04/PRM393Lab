import '../models/movie.dart';
import '../models/trailer.dart';

// Mock data - 2 phim mẫu theo yêu cầu
final List<Movie> movieList = [
  Movie(
    id: '1',
    title: 'Dune: Part Two',
    posterUrl:
        'https://image.tmdb.org/t/p/w500/1pdfLvkbY9ohJlCjQH2CZjjYVvJ.jpg',
    overview:
        'Paul Atreides unites with Chani and the Fremen while seeking revenge against the conspirators who destroyed his family.',
    genres: ['Sci-Fi', 'Adventure', 'Drama'],
    rating: 8.6,
    trailers: [
      Trailer(
        id: 't1',
        title: 'Official Trailer #1',
        thumbnailUrl:
            'https://image.tmdb.org/t/p/w500/1pdfLvkbY9ohJlCjQH2CZjjYVvJ.jpg',
        duration: '2:30',
      ),
      Trailer(
        id: 't2',
        title: 'IMAX Sneak Peek',
        thumbnailUrl:
            'https://image.tmdb.org/t/p/w500/1pdfLvkbY9ohJlCjQH2CZjjYVvJ.jpg',
        duration: '1:45',
      ),
    ],
  ),
  Movie(
    id: '2',
    title: 'Deadpool & Wolverine',
    posterUrl:
        'https://image.tmdb.org/t/p/w500/iBMbfsMayHXVMqcAFAl57mZgUCa.jpg',
    overview:
        'Deadpool is offered a place in the Marvel Cinematic Universe by the Time Variance Authority, but instead recruits a reluctant Wolverine to help save his universe.',
    genres: ['Action', 'Comedy'],
    rating: 8.3,
    trailers: [
      Trailer(
        id: 't3',
        title: 'Official Trailer #1',
        thumbnailUrl:
            'https://image.tmdb.org/t/p/w500/iBMbfsMayHXVMqcAFAl57mZgUCa.jpg',
        duration: '2:18',
      ),
      Trailer(
        id: 't4',
        title: 'IMAX Sneak Peek',
        thumbnailUrl:
            'https://image.tmdb.org/t/p/w500/iBMbfsMayHXVMqcAFAl57mZgUCa.jpg',
        duration: '1:30',
      ),
    ],
  ),
];
