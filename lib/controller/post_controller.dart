
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:fetch_to_api/model/post_model.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';


class PostController extends GetxController{
  var isLoading = true.obs;
  var postList = <Post>[].obs;
  @override
  void onInit() {
    fetchPosts();
    super.onInit();
  }
  void fetchPosts() async{
    try{
      isLoading(true);
      var response = await http.get(Uri.parse('https://makeup-api.herokuapp.com/api/v1/products.json?brand=marienatie'));
      if (response.statusCode == 200){
        var jsonData = jsonDecode(response.body);
        postList.value = List<Post>.from(jsonData.map((post) => Post.fromJson(post)));
      }else{
        Get.snackbar('Error', 'Failed to fetch data');
      }
    }catch(e){
      Get.snackbar('Error', e.toString());
    }finally{
      isLoading(false);
    }
  }
}