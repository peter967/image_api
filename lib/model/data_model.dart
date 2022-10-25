// ignore_for_file: public_member_api_docs, sort_constructors_first

class DataModel {
  String? author;
  String? downloadUrl;

  DataModel({this.author, this.downloadUrl});
  factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(
      author: json['author'],
      downloadUrl: json['download_url'],
    );
  }
}
