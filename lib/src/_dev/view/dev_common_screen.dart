import 'package:flutter/material.dart';
import 'package:mavental/src/features/common/view/not_found_view.dart';
import 'package:mavental/src/features/common/view/webview/web_view.dart';
import 'package:mavental/widgets/button/button.dart';

import 'package:mavental/gen/assets.gen.dart';
import 'package:mavental/widgets/state/state_empty_widget.dart';
import 'package:mavental/widgets/state/state_error_widget.dart';
import 'package:mavental/widgets/state/state_loading_widget.dart';
import 'package:mavental/src/dialogs/toast_wrapper.dart';
import 'package:mavental/src/localization/localization_utils.dart';
import 'package:mavental/src/_dev/widget/dev_button_title.dart';
import 'package:mavental/src/_dev/widget/dev_navigation_title.dart';
import 'package:mavental/src/_dev/widget/dev_screen_layout.dart';

class DevCommonScreen extends StatelessWidget {
  const DevCommonScreen({super.key});

  Widget viewOf(Widget child) {
    return Scaffold(
      appBar: AppBar(),
      body: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    return DevScreenLayout(
      'Card',
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      children: [
        DevNavigationTitle(
          'Error',
          (_) => viewOf(XStateErrorWidget(
            onTap: () => XToast.show(S.of(context).common_tap_to_refresh),
          )),
        ),
        DevNavigationTitle(
          'Loading',
          (_) => viewOf(const XStateLoadingWidget()),
        ),
        DevNavigationTitle(
          'Empty List',
          (_) => viewOf(
            const XStateEmptyWidget(
              body: "Keep browsing for more products",
            ),
          ),
        ),
        DevNavigationTitle(
          'Empty Notification',
          (_) => viewOf(
            XStateEmptyWidget(
              iconSvg: Assets.svgs.stateEmptyNotification,
              title: 'No notifications yet',
              body:
                  "You're all caught up!\n Check back later for new notifications",
              bottom: Center(
                child: XButton(
                  title: 'Back to home',
                  onPressed: () {},
                ),
              ),
            ),
          ),
        ),
        DevButtonTitle(
          'Webview',
          onTap: () {
            WebviewPage.show(context, 'https://github.com');
          },
        ),
        DevNavigationTitle('NotFound', (_) => const NotFoundView()),
      ],
    );
  }
}
