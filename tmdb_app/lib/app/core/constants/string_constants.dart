class EndPoints {
  static const String getSuggestionsURL =
      "https://api.themoviedb.org/3/discover/movie?api_key=${KeyConst.TMDB_API_KEY}";
  static const String getTrendingMoviesURL =
      "https://api.themoviedb.org/3/trending/movie/week?api_key=${KeyConst.TMDB_API_KEY}";
  static const String getPopularMoviesURL =
      "https://api.themoviedb.org/3/movie/popular?api_key=${KeyConst.TMDB_API_KEY}";
  static const String getNowPlayingURL =
      "https://api.themoviedb.org/3//movie/now_playing?api_key=${KeyConst.TMDB_API_KEY}";
}

class RequestHeaderConstants {
  static const String requestHeaderString = 'application/json';
}

class HttpHeaders {
  static const contentTypeHeader = "content-type";
  static const authorizationHeader = "Authorization";
}

class KeyConst {
  static const TMDB_API_KEY = "909594533c98883408adef5d56143539";
}
