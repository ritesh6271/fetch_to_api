
import 'package:fetch_to_api/controller/post_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PostScreen extends StatelessWidget{
  final PostController postController= Get.put(PostController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Posts'),
      ),
      body: Obx((){
        if(postController.isLoading.value) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }else{
          return ListView.builder(
            itemCount: postController.postList.length,
            itemBuilder: (context, index){
              return ListTile(
                title: Text(postController.postList[index].name as String),
              );
            },
          );
        }
      }),
    );
  }
}