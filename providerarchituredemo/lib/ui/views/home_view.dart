import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providerarchituredemo/core/enums/viewstate.dart';
import 'package:providerarchituredemo/core/models/post.dart';
import 'package:providerarchituredemo/core/models/user.dart';
import 'package:providerarchituredemo/core/viewmodels/home_model.dart';
import 'package:providerarchituredemo/ui/shared/app_colors.dart';
import 'package:providerarchituredemo/ui/shared/text_styles.dart';
import 'package:providerarchituredemo/ui/shared/ui_helpers.dart';
import 'package:providerarchituredemo/ui/views/base_view.dart';
import 'package:providerarchituredemo/ui/widgets/postlist_item.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<HomeModel>(
      onModelReady: (model) => model.getPosts(Provider.of<User>(context).id),
      builder: (context, model, child) => Scaffold(
        backgroundColor: backgroundColor,
        body: model.state == ViewState.Busy
            ? CircularProgressIndicator()
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  UIHelper.verticalSpaceLarge(),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Text(
                      'Welcome ${Provider.of<User>(context).name}',
                      style: headerStyle,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child:
                        Text('Here are all your posts', style: subHeaderStyle),
                  ),
                  UIHelper.verticalSpaceSmall(),
                  Expanded(child: getPostsUI(model.posts))
                ],
              ),
      ),
    );
  }

  Widget getPostsUI(List<Post> posts) => ListView.builder(
      itemCount: posts.length,
      itemBuilder: (context, index) => PostListItem(
            post: posts[index],
            onTap: () {
              Navigator.of(context).pushNamed('post', arguments: posts[index]);
            },
          ));
}
