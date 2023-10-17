import 'package:flutter/material.dart';

import '../models/pic_list_model.dart';

class CustomAppBar extends StatelessWidget {
  final ListPicResponse pic;

  const CustomAppBar({super.key, required this.pic});
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
        leading: Hero(
          tag: pic.id!*2,
          child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back)),
        ),
        expandedHeight: 400,
        floating: false,
        pinned: true,
        flexibleSpace: GestureDetector(
          child: FlexibleSpaceBar(
              centerTitle: true,
              titlePadding: const EdgeInsets.all(0),
              title: Container(
                width: double.infinity,
                padding: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
                alignment: Alignment.bottomCenter,
                color: Colors.black12,
              ),
              background: Hero(
                tag: pic.id!*14,
                child: FadeInImage(
                  placeholder: const AssetImage('assets/images/loading.gif'),
                  image: pic.downloadUrl != null
                      ? NetworkImage(pic.downloadUrl!)
                      : const AssetImage('assets/images/404.png')
                          as ImageProvider<Object>,
                  imageErrorBuilder: (context, error, stackTrace) {
                    return Image.asset('assets/images/404.png');
                  },
                  fit: BoxFit.cover,
                ),
              )),
        ));
  }
}
