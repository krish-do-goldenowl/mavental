import 'package:mavental/src/network/model/user/user.dart';
import 'package:mavental/src/network/model/common/result.dart';

abstract class UserRepository {
  Future<MResult<MUser>> getUser(String id);
  Future<MResult<MUser>> getOrAddUser(MUser user);
  Future<MResult<List<MUser>>> getUsers();
}
