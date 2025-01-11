import 'package:flutter/material.dart';

class moviesModel with ChangeNotifier {
  double? score;
  Show? show;

  moviesModel({this.score, this.show});

  moviesModel.fromJson(Map<String, dynamic> json) {
    score = json['score'];
    show = json['show'] != null ? new Show.fromJson(json['show']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['score'] = this.score;
    if (this.show != null) {
      data['show'] = this.show!.toJson();
    }
    return data;
  }
}

class Show {
  String? name;
  Rating? rating;
  Image? image;
  String? summary;

  Show({
    this.name,
    this.rating,
    this.image,
    this.summary,
  });

  Show.fromJson(Map<String, dynamic> json) {
    name = json['name'] ?? "";
    rating =
        json['rating'] != null ? new Rating.fromJson(json['rating']) : null;
    image = json['image'] != null ? new Image.fromJson(json['image']) : null;
    summary = json['summary'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    if (this.rating != null) {
      data['rating'] = this.rating!.toJson();
    }
    if (this.image != null) {
      data['image'] = this.image!.toJson();
    }
    data['summary'] = this.summary;

    return data;
  }
}

class Rating {
  int? average;

  Rating({this.average});

  Rating.fromJson(Map<String, dynamic> json) {
    average = int.parse(json['average']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['average'] = this.average;
    return data;
  }
}

class Image {
  String? medium;
  String? original;

  Image({this.medium, this.original});

  Image.fromJson(Map<String, dynamic> json) {
    medium = json['medium'] ?? "";
    original = json['original'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['medium'] = this.medium;
    data['original'] = this.original;
    return data;
  }
}
