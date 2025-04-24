class ArticleModel {
  String? id;
  String? title;
  String? catId;
  String? catName;
  String? author;
  String? view;
  String? status;
  String? createAt;
  ArticleModel(
      {required this.id,
      required this.title,
      required this.catId,
      required this.catName,
      required this.author,
      required this.view,
      required this.status,
      required this.createAt});
  ArticleModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    title = json["title"];
    catId = json["image"];
    catName = json["cat_id"];
    author = json["cat_name"];
    view = json["author"];
    status = json["view"];
    createAt = json["status"];
    createAt = json["created_at"];
  }

  ArticleModel.toJson() {}
}
