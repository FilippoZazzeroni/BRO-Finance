import 'package:brofinance/modules/common/styles/colors/website_colors.dart';
import 'package:brofinance/modules/common/views/shapes/rectangle_with_gradient.dart';
import 'package:brofinance/modules/common/views/shapes/shape_size.dart';
import 'package:brofinance/modules/common/views/topBar/top_bar_logged.dart';
import 'package:brofinance/modules/profile/user/left_page_content.dart';
import 'package:brofinance/modules/profile/user/right_page_content.dart';
import 'package:flutter/material.dart';

class UserView extends StatelessWidget {
  //MARK: init

  const UserView({Key? key}) : super(key: key);

  //MARK: methods

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RectangleWithGradient(
        size: ShapeSize.fullScreen(context),
        gradient: SColors.getGradient(SColors.blueDark, SColors.primaryColor,
            begin: Alignment.topLeft, end: Alignment.bottomRight),
        child: Column(
          children: [
            TopBarLogged(),
            Expanded(
              child: GridView(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                children: const [
                  LeftSidePage(),
                  RightPageContent(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
