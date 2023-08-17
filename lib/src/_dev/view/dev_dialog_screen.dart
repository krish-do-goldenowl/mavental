import 'package:flutter/material.dart';
import 'package:mavental/src/_dev/widget/dev_button_title.dart';
import 'package:mavental/src/_dev/widget/dev_screen_layout.dart';
import 'package:mavental/src/dialogs/alert_wrapper.dart';
import 'package:mavental/src/dialogs/toast_wrapper.dart';

class DevDialogScreen extends StatelessWidget {
  const DevDialogScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DevScreenLayout(
      'Dialog',
      children: [
        DevButtonTitle('1. Show Dialog', onTap: () {
          XAlert.show(title: 'Dialog Title', body: 'Dialog content');
        }),
        DevButtonTitle('2. Show full screen loading', onTap: () async {
          XToast.showLoading();
          await Future.delayed(const Duration(seconds: 1));
          XToast.hideLoading();
        }),
      ],
    );
  }
}
