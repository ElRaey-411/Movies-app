import 'detailed_movie.dart';

class Data {
  Data({
     required this.movie,});

 factory Data.fromJson(dynamic json) {
    return Data(
      movie: DetailedMovie.fromJson(json['movie']),
    );}
 final DetailedMovie movie;


}