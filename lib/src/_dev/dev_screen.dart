import 'package:flutter/material.dart';

import 'package:mavental/src/_dev/view/dev_button_screen.dart';
import 'package:mavental/src/_dev/view/dev_card_screen.dart';
import 'package:mavental/src/_dev/view/dev_common_screen.dart';
import 'package:mavental/src/_dev/view/dev_device_screen.dart';
import 'package:mavental/src/_dev/view/dev_dialog_screen.dart';
import 'package:mavental/src/_dev/widget/dev_navigation_title.dart';

class DevScreen extends StatelessWidget {
  const DevScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dev Only')),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 16),
        children: [
          DevNavigationTitle('Device Info', (_) => const DevDeviceScreen()),
          DevNavigationTitle('Button', (_) => const DevButtonScreen()),
          DevNavigationTitle('Dialog', (_) => const DevDialogScreen()),
          DevNavigationTitle('Card', (_) => const DevCardScreen()),
          DevNavigationTitle('Common Screen', (_) => const DevCommonScreen()),
        ],
      ),
    );
  }
}
