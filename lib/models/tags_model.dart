class TagsModel {
  String? id;
  String? title;
  String? image;
  TagsModel({required this.id, required this.title, required this.image});
  TagsModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    title = json["title"];
    image = json["image"];
  }
}