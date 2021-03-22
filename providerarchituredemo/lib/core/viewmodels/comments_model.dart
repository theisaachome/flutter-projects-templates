import 'package:providerarchituredemo/core/enums/viewstate.dart';
import 'package:providerarchituredemo/core/models/comment.dart';
import 'package:providerarchituredemo/core/services/api.dart';
import 'package:providerarchituredemo/core/viewmodels/based_model.dart';
import 'package:providerarchituredemo/locator.dart';

class CommentsModel extends BaseModel {
  Api _api = locator<Api>();

  List<Comment> comments;

  Future fetchComments(int postId) async {
    setState(ViewState.Busy);
    comments = await _api.getCommentsForPost(postId);
    setState(ViewState.Idle);
  }
}
