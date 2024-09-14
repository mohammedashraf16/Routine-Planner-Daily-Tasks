import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/features/auth/presentation/views/sign_in/sign_in_view.dart';
import 'package:todo_app/features/auth/presentation/views/widgets/alert_dialog_sign_in.dart';
import 'package:todo_app/features/home/presentation/views/home_screen.dart';

import '../../features/home/domain/providers/app_config_provider.dart';

abstract class BaseConnector {
  showErrorDialog(String errorMessage);

  showLoading();

  hideLoading();
}

class BaseViewModel<C extends BaseConnector> extends ChangeNotifier {
  C? connector;
}

abstract class BaseView<S extends StatefulWidget, VM extends BaseViewModel>
    extends State<S> implements BaseConnector {
  late VM vmObject;

  initMyViewModel();

  @override
  void initState() {
    super.initState();
    vmObject = initMyViewModel();
  }

  Future<void> goToHome() async {
    Navigator.pushNamedAndRemoveUntil(
      context,
      HomeScreen.routeName,
      (route) => false,
    );
  }
  Future<void> goToSignIn() async {
    Navigator.pushNamedAndRemoveUntil(
      context,
      SignInView.routeName,
      (route) => false,
    );
  }

  @override
  void hideLoading() {
    Navigator.pop(context);
  }

  @override
  void showErrorDialog(String errorMessage) {
    AppConfigProvider provider = Provider.of<AppConfigProvider>(context);
    showDialog(
        context: context,
        builder: (context) => AlertDialogSignIn(
              provider: provider,
              message: errorMessage,
            ));
  }

  @override
  void showLoading() {
    const Center(
      child: CircularProgressIndicator(),
    );
  }
}
