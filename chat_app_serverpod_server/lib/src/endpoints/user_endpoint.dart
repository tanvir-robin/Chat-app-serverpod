import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_server/module.dart' as auth;

class UserEndpoint extends Endpoint {
  Future<List<auth.UserInfo>> getAllUsers(Session session) async {
    // Query the UserInfo table to get all users
    var users = await auth.UserInfo.db.find(session);
    return users;
  }
}
