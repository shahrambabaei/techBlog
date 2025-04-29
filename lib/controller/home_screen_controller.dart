
import 'dart:developer';

import 'package:get/get.dart';
import 'package:techblog/components/api_constant.dart';
import 'package:techblog/models/article_model.dart';
import 'package:techblog/models/podcast_model.dart';
import 'package:techblog/models/poster_model.dart';
import 'package:techblog/models/tags_model.dart';
import 'package:techblog/services/dio_service.dart';

class HomeScreenController extends GetxController {
  late RxList<PosterModel> poster;
  RxList<TagsModel> tagList = RxList();
  RxList<ArticleModel> topVisitedList = RxList();
  RxList<PodcastModel> topPodcastList = RxList();
  @override
  onInit() {
    super.onInit();
    getHomeItems();
  }

  getHomeItems() async {
    var response = await DioService().getData(ApiConstant.getHomeItems);
    log(response.data.toString());
    if (response.statusCode == 200) {
      for (var element in response.data['top_visited']) {
        topVisitedList.add(ArticleModel.fromJson(element));
      }
      for (var element in response.data['top_podcasts']) {
        topPodcastList.add(PodcastModel.fromJson(element));
      }
    }
 
  }
}
