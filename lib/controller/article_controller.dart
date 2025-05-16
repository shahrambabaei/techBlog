import 'dart:developer';
import 'package:get/get.dart';
import 'package:techblog/components/api_constant.dart';
import 'package:techblog/models/article_model.dart';
import 'package:techblog/services/dio_service.dart';

class ArticleController extends GetxController {
  RxList<ArticleModel> articleList = RxList();
  onInit() {
    super.onInit();
    getList();
  }

  getList() async {
    final response = await DioService().getData(ApiConstant.getArticleList);

    if (response.statusCode == 200) {
      for (var element in response.data) {
        articleList.add(ArticleModel.fromJson(element));
      }
    }
    log("$articleList");
  }
}
