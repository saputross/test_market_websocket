import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:test_market_websocket/app/config/themes/app_colors.dart';
import 'package:test_market_websocket/app/shared/widgets/items/item_menu_navbar.dart';

import '../controllers/main_controller.dart';

class MainView extends GetView<MainController> {
  const MainView({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Obx(
        () => Scaffold(
          resizeToAvoidBottomInset: false,
          body: PopScope(
            canPop: false,
            onPopInvoked: (didPop) {
              if (didPop) {
                return;
              }
              controller.onWillPop();
            },
            child: PageStorage(
              bucket: PageStorageBucket(),
              child: controller.tabPage.value,
            ),
          ),
          bottomNavigationBar: Container(
            padding: const EdgeInsets.only(top: 1.5),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppColors.primary,
                  AppColors.primaryVariant,
                ], //gradient set
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: const [0.2, 0.7],
                tileMode: TileMode.clamp,
              ),
            ),
            child: BottomAppBar(
              elevation: 4,
              shadowColor: AppColors.white,
              shape: const CircularNotchedRectangle(),
              color: AppColors.background,
              notchMargin: 6,
              child: Wrap(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: ItemMenuNavbar(
                          icon: "assets/icons/signal_up",
                          selected: controller.currentTab.value == 0,
                          onPressed: () {
                            FocusScope.of(context).requestFocus(FocusNode());
                            controller.onChangeTab(tab: 0);
                          },
                          text: 'Chart',
                        ),
                      ),
                      Expanded(
                        child: Stack(
                          children: [
                            ItemMenuNavbar(
                              icon: "assets/icons/history",
                              selected: controller.currentTab.value == 1,
                              onPressed: () {
                                FocusScope.of(context).requestFocus(FocusNode());
                                controller.onChangeTab(tab: 1);
                              },
                              text: 'Watchlist',
                            )
                          ],
                        ),
                      ),
                    ],
                  ).paddingOnly(top: 8, bottom: 4),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
