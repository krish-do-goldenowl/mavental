import 'package:mavental/src/network/data/sign/sign_repository_impl.dart';
import 'package:mavental/src/network/blob/data/upload_repository_impl.dart';
import 'package:mavental/src/network/data/user/user_repository_impl.dart';

class DomainManager {
  factory DomainManager() {
    _internal ??= DomainManager._();
    return _internal!;
  }
  DomainManager._();
  static DomainManager? _internal;

  final user = UserRepositoryImpl();
  final upload = UploadRepositoryImpl();
  final sign = SignRepositoryImpl();
}
