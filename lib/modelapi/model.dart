// To parse this JSON data, do
//
//     final pixabay = pixabayFromJson(jsonString);

import 'dart:convert';

List<Pixabay> pixabayFromJson(String str) => List<Pixabay>.from(json.decode(str).map((x) => Pixabay.fromJson(x)));

String pixabayToJson(List<Pixabay> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Pixabay {
    int albumId;
    int id;
    String title;
    String url;
    String thumbnailUrl;

    Pixabay({
        required this.albumId,
        required this.id,
        required this.title,
        required this.url,
        required this.thumbnailUrl,
    });

    factory Pixabay.fromJson(Map<String, dynamic> json) => Pixabay(
        albumId: json["albumId"],
        id: json["id"],
        title: json["title"],
        url: json["url"],
        thumbnailUrl: json["thumbnailUrl"],
    );

    Map<String, dynamic> toJson() => {
        "albumId": albumId,
        "id": id,
        "title": title,
        "url": url,
        "thumbnailUrl": thumbnailUrl,
    };
}
