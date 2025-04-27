import 'dart:developer';

import 'package:get/get.dart';
import 'package:techblog/components/api_constant.dart';
import 'package:techblog/models/podcast_model.dart';
import 'package:techblog/models/poster_model.dart';
import 'package:techblog/models/tags_model.dart';
import 'package:techblog/services/dio_service.dart';

class HomeScreenController {
  late RxList<PosterModel> poster;
  RxList<PodcastModel> podcastList = RxList();
  RxList<PosterModel> posterList = RxList();
  RxList<TagsModel> tagList = RxList();
  getHomeItems() async {
    var response = await DioService().getData(ApiConstant.getHomeItems);

    log(response.data["poster"]["title"]);
  }
}
