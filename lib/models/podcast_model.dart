import 'dart:core';

import 'package:techblog/components/api_constant.dart';

class PodcastModel {
  String? id;
  String? title;
  String? poster;
  String? publisher;
  String? view;
  String? createAt;
  PodcastModel({
    required this.id,
    required this.title,
    required this.poster,
    required this.publisher,
    required this.view,
    required this.createAt,
  });

  PodcastModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    title = json["title"];
    poster =ApiConstant.hostDlUrl+ json["poster"];
    publisher = json["publisher"];
    view = json["view"];
    createAt = json["createAt"];
  }
}
