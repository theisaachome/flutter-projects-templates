import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import 'package:providerarchituredemo/core/models/post.dart';
import 'package:providerarchituredemo/core/models/user.dart';
import 'package:providerarchituredemo/ui/shared/app_colors.dart';
import 'package:providerarchituredemo/ui/shared/text_styles.dart';
import 'package:providerarchituredemo/ui/shared/ui_helpers.dart';
import 'package:providerarchituredemo/ui/widgets/comments.dart';

class PostView extends StatelessWidget {
  final Post post;
  PostView({this.post});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            UIHelper.verticalSpaceLarge(),
            Text(
              post.title,
              style: headerStyle,
            ),
            Text(
              "by ${Provider.of<User>(context).name}",
              style: TextStyle(fontSize: 9.0),
            ),
            UIHelper.verticalSpaceMedium(),
            Text(post.body),
            Comments(
              postId: post.id,
            )
          ],
        ),
      ),
    );
  }
}
