import 'package:flutter/material.dart';
import 'package:providerarchituredemo/core/enums/viewstate.dart';
import 'package:providerarchituredemo/core/models/comment.dart';
import 'package:providerarchituredemo/core/viewmodels/comments_model.dart';
import 'package:providerarchituredemo/ui/shared/app_colors.dart';
import 'package:providerarchituredemo/ui/shared/ui_helpers.dart';
import 'package:providerarchituredemo/ui/views/base_view.dart';

class Comments extends StatelessWidget {
  final int postId;
  Comments({this.postId});

  @override
  Widget build(BuildContext context) {
    return BaseView<CommentsModel>(
        onModelReady: (model) => model.fetchComments(postId),
        builder: (context, model, child) => model.state == ViewState.Busy
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Expanded(
                child: ListView(
                children: model.comments
                    .map((comment) => CommentItem(
                          comment: comment,
                        ))
                    .toList(),
              )));
  }
}

class CommentItem extends StatelessWidget {
  final Comment comment;

  const CommentItem({Key key, this.comment}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.symmetric(vertical: 10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: commentColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            comment.name,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          UIHelper.verticalSpaceSmall(),
          Text(comment.body),
        ],
      ),
    );
  }
}
