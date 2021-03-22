import 'package:providerarchituredemo/core/enums/viewstate.dart';
import 'package:providerarchituredemo/core/models/post.dart';
import 'package:providerarchituredemo/core/services/api.dart';
import 'package:providerarchituredemo/core/viewmodels/based_model.dart';
import 'package:providerarchituredemo/locator.dart';

class HomeModel extends BaseModel {
  Api _api = locator<Api>();

  List<Post> posts;
  Future getPosts(int userId) async {
    setState(ViewState.Busy);
    posts = await _api.getPostsForUser(userId);
    setState(ViewState.Idle);
  }
}
