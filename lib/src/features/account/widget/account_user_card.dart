import 'package:flutter/material.dart';
import 'package:mavental/src/network/model/user/user.dart';
import 'package:mavental/src/router/coordinator.dart';
import 'package:mavental/src/theme/colors.dart';
import 'package:mavental/widgets/card/card.dart';
import 'package:mavental/widgets/common/nav_icon.dart';

class AccountUserCard extends StatelessWidget {
  const AccountUserCard({required this.user, Key? key}) : super(key: key);
  final MUser user;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: AppCoordinator.showProfile,
      child: XCard(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 12),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    'Hello' ',',
                    style: TextStyle(color: AppColors.textSecondary),
                  ),
                  Text(
                    user.name ?? '',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const XNavIcon(),
          ],
        ),
      ),
    );
  }
}
