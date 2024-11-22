import 'package:news_app/model/news_head_line_model.dart';

class NewsModel {
  NewsHeadLineModel? newsHeadLineModel;
  String? status;
  int? totalResults;
  List<Articles>? articles;

  NewsModel(
      {this.status, this.totalResults, this.articles, this.newsHeadLineModel});

  NewsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    totalResults = json['totalResults'];
    if (json['articles'] != null) {
      articles = <Articles>[];
      json['articles'].forEach((v) {
        articles!.add(Articles.fromJson(v));
      });
    }
//add newsheadlinemodel
    newsHeadLineModel = json['newsHeadLineModel'] != null
        ? NewsHeadLineModel.fromJson(json['newsHeadLineModel'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['totalResults'] = totalResults;

    if (articles != null) {
      data['articles'] = articles!.map((v) => v.toJson()).toList();
    }

    //add newsheadlinemodel
    if (newsHeadLineModel != null) {
      data['newsHeadLineModel'] = newsHeadLineModel!.toJson();
    }

    return data;
  }
}

class Articles {
  Source? source;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;

  Articles(
      {this.source,
      this.author,
      this.title,
      this.description,
      this.url,
      this.urlToImage,
      this.publishedAt,
      this.content});

  Articles.fromJson(Map<String, dynamic> json) {
    source = json['source'] != null ? Source.fromJson(json['source']) : null;
    author = json['author'];
    title = json['title'];
    description = json['description'];
    url = json['url'];
    urlToImage = json['urlToImage']?? "https://t4.ftcdn.net/jpg/04/73/25/49/240_F_473254957_bxG9yf4ly7OBO5I0O5KABlN930GwaMQz.jpg";
    publishedAt = json['publishedAt'];
    content = json['content'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (source != null) {
      data['source'] = source!.toJson();
    }
    data['author'] = author;
    data['title'] = title;
    data['description'] = description;
    data['url'] = url;
    data['urlToImage'] = urlToImage;
    data['publishedAt'] = publishedAt;
    data['content'] = content;
    return data;
  }
}

class Source {
  String? id;
  String? name;

  Source({this.id, this.name});

  Source.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}
