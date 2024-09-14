import 'package:todo_app/core/base/base.dart';

abstract class SignUpConnector extends BaseConnector{
  Future<void> goToSignIn();
}