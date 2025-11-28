class MovieModel{
  String pic;
  String rate;
  MovieModel({required this.pic, required this.rate});

 static List<MovieModel> movieData = [
    MovieModel(pic: 'assets/images/1917_movie.png', rate: '8.9'),
    MovieModel(pic: 'assets/images/1917_movie.png', rate: '8.9'),
    MovieModel(pic: 'assets/images/1917_movie.png', rate: '8.9'),
    MovieModel(pic: 'assets/images/1917_movie.png', rate: '8.9'),
    MovieModel(pic: 'assets/images/1917_movie.png', rate: '8.9'),

  ];
}