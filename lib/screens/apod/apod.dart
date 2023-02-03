import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:wonderspace/common/screens/my_scaffold.dart';

class ApodScreen extends StatelessWidget {
  const ApodScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    print(title);
    return MyScaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.maxFinite,
        child: PhotoView(
          backgroundDecoration: BoxDecoration(color: Colors.transparent),
          imageProvider: NetworkImage(
            'https://images.unsplash.com/photo-1502318217862-aa4e294ba657?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=415&q=800',
            scale: double.maxFinite,
          ),
        ),
      ),
    );
  }
}
