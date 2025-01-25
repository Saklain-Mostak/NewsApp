class NewsApi {
  static const String apiKey = "**************";

// https:***************=bitcoin&apiKey=

  static const String endpointworld = "world&apiKey=$apiKey";
  static String baseurl = "https://newsapi.org/v2/everything?q=$endpointworld";

  //https://newsapi.org/v2/everything?q=bitcoin&apiKey=e1742ffd1ddc40baba9f25b606b9301e

  static const String headlinebaseurl =
      "https://newsapi.org/v2/top-headlines?country=us&apiKey=$apiKey";
}
