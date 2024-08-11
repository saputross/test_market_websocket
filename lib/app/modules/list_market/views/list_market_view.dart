import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:test_market_websocket/app/data/response_websocket.dart';
import 'package:test_market_websocket/app/shared/utils/my_helper.dart';

import '../controllers/list_market_controller.dart';

class ListMarketView extends GetView<ListMarketController> {
  const ListMarketView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Watchlist'),
        centerTitle: true,
      ),
      body: Obx(
        () => ListView(
          shrinkWrap: true,
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(child: Text("Symbol")),
                Expanded(child: Text("Last", textAlign: TextAlign.end)),
                Expanded(child: Text("Chg", textAlign: TextAlign.end)),
                Expanded(child: Text("Chg%", textAlign: TextAlign.end)),
              ],
            ).paddingSymmetric(vertical: 8, horizontal: 32),
            const Divider(color: Colors.white).marginSymmetric(horizontal: 16),
            ListView.separated(
              shrinkWrap: true,
              itemCount: controller.listData.length,
              itemBuilder: (context, index) {
                ResponseWebsocket item = controller.listData[index];
                return Container(
                  padding: const EdgeInsets.all(8),
                  margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  decoration: BoxDecoration(
                    color: index % 2 == 0 ? Colors.white.withOpacity(0.2) : Colors.white.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(child: Text(item.s ?? "")),
                      Expanded(
                          child: Text('\$ ${MyHelpers.convertFormatNumber(double.parse((item.p ?? '0').toString()))}',
                              textAlign: TextAlign.end)),
                      Expanded(
                        child: Text(
                          '${MyHelpers.convertFormatNumber(double.parse(item.dd ?? "0"))}',
                          textAlign: TextAlign.end,
                          style: TextStyle(color: item.dd!.startsWith("-") ? Colors.red : Colors.green),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          '${double.parse(item.dc?? "0").toStringAsFixed(2)}%',
                          textAlign: TextAlign.end,
                          style: TextStyle(color: item.dc!.startsWith("-") ? Colors.red : Colors.green),
                        ),
                      ),
                    ],
                  ).paddingSymmetric(vertical: 8, horizontal: 16),
                );
              },
              separatorBuilder: (context, index) {
                return const SizedBox();
              },
            ),
          ],
        ),
      ),
    );
  }
}
