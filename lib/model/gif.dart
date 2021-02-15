
class GIF {
  GIF(
      {this.id,
      this.title,
      this.source});

  final String id,
      title,
      source;

  factory GIF.fromJSON(Map<String, dynamic> json) {
    return GIF(
      id: json['id'].toString(),
      title: json['title'].toString(),
      source: json["images"]["fixed_height"]["url"].toString(),
    );
  }
}
