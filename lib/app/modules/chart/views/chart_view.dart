import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:test_market_websocket/app/config/themes/app_colors.dart';
import 'package:test_market_websocket/app/shared/utils/my_helper.dart';

import '../controllers/chart_controller.dart';

class ChartView extends GetView<ChartController> {
  const ChartView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chart Market'),
        centerTitle: true,
      ),
      body: Obx(
        () => ListView(
          shrinkWrap: true,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    const Text("BTC/USD", style: TextStyle(fontSize: 14)),
                    Text(
                      controller.listDataBtc.isNotEmpty
                          ? " \$ ${MyHelpers.convertFormatNumber(double.parse(controller.listDataBtc.last.p!))}"
                          : "",
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ).marginOnly(left: 10),
                  ],
                ),
                controller.listDataBtc.isNotEmpty
                    ? Container(
                        margin: const EdgeInsets.only(left: 10),
                        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 1),
                        decoration: BoxDecoration(
                          color: controller.listDataBtc.last.dd != null
                              ? controller.listDataBtc.last.dd!.startsWith("-")
                                  ? AppColors.error_40.withOpacity(0.5)
                                  : AppColors.success_20.withOpacity(0.8)
                              : AppColors.white,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: controller.listDataBtc.last.dd != null
                            ? Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    controller.listDataBtc.last.dd != null
                                        ? controller.listDataBtc.last.dd!.startsWith("-")
                                            ? Icons.keyboard_double_arrow_down
                                            : Icons.keyboard_double_arrow_up
                                        : Icons.arrow_drop_down,
                                    color: controller.listDataBtc.last.dd != null
                                        ? controller.listDataBtc.last.dd!.startsWith("-")
                                            ? Colors.red
                                            : Colors.green
                                        : AppColors.white,
                                    size: 16,
                                  ),
                                  Text(
                                    '${double.parse(controller.listDataBtc.last.dc ?? "0").toStringAsFixed(2)}%',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: controller.listDataBtc.last.dc!.startsWith("-")
                                          ? Colors.red
                                          : AppColors.success_50,
                                    ),
                                  )
                                ],
                              )
                            : const SizedBox(),
                      )
                    : const SizedBox(),
              ],
            ).marginOnly(top: 20, left: 20, right: 20),
            Container(
              height: Get.height * 0.30,
              width: Get.width * 0.95,
              margin: const EdgeInsets.only(top: 10),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: AspectRatio(
                aspectRatio: 2,
                child: LineChart(
                  LineChartData(
                    lineBarsData: [
                      LineChartBarData(
                        spots: controller.listDataBtc
                            .map((e) => FlSpot(controller.listDataBtc.indexOf(e).toDouble(), double.parse(e.p!)))
                            .toList(),
                        isCurved: false,
                        dotData: const FlDotData(
                          show: false,
                        ),
                      ),
                    ],
                    borderData: FlBorderData(
                        border: Border(
                            bottom: BorderSide(color: AppColors.white), left: BorderSide(color: AppColors.white))),
                    gridData: const FlGridData(show: true, drawVerticalLine: false),
                    titlesData: FlTitlesData(
                      bottomTitles: AxisTitles(
                          sideTitles: SideTitles(
                              showTitles: true,
                              getTitlesWidget: (value, meta) {
                                return controller.bottomTitles(value.toInt(), controller.listDataBtc);
                              })),
                      leftTitles: AxisTitles(
                          sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 65,
                        getTitlesWidget: (value, meta) {
                          return Text(
                            '\$ ${MyHelpers.convertFormatNumber(value)}',
                            style: TextStyle(color: AppColors.white, fontSize: 10),
                          );
                        },
                      )),
                      topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                      rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    ),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    const Text("ETH/USD", style: TextStyle(fontSize: 14)),
                    Text(
                      controller.listDataEth.isNotEmpty
                          ? " \$ ${MyHelpers.convertFormatNumber(double.parse(controller.listDataEth.last.p!))}"
                          : "",
                      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ).marginOnly(left: 10),
                  ],
                ),
                controller.listDataEth.isNotEmpty
                    ? Container(
                        margin: const EdgeInsets.only(left: 10),
                        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 1),
                        decoration: BoxDecoration(
                          color: controller.listDataEth.last.dd != null
                              ? controller.listDataEth.last.dd!.startsWith("-")
                                  ? AppColors.error_40.withOpacity(0.5)
                                  : AppColors.success_20.withOpacity(0.8)
                              : AppColors.white,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: controller.listDataEth.last.dd != null
                            ? Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    controller.listDataEth.last.dd != null
                                        ? controller.listDataEth.last.dd!.startsWith("-")
                                            ? Icons.keyboard_double_arrow_down
                                            : Icons.keyboard_double_arrow_up
                                        : Icons.arrow_drop_down,
                                    color: controller.listDataEth.last.dd != null
                                        ? controller.listDataEth.last.dd!.startsWith("-")
                                            ? Colors.red
                                            : Colors.green
                                        : AppColors.white,
                                    size: 16,
                                  ),
                                  Text(
                                    '${double.parse(controller.listDataEth.last.dc ?? "0").toStringAsFixed(2)}%',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: controller.listDataEth.last.dc!.startsWith("-")
                                          ? AppColors.error_30
                                          : AppColors.success_50,
                                    ),
                                  ),
                                ],
                              )
                            : const SizedBox(),
                      )
                    : const SizedBox(),
              ],
            ).marginOnly(top: 20, left: 20, right: 20),
            Container(
              height: Get.height * 0.30,
              width: Get.width * 0.95,
              margin: const EdgeInsets.only(top: 10),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: AspectRatio(
                aspectRatio: 2,
                child: LineChart(
                  LineChartData(
                    lineBarsData: [
                      LineChartBarData(
                        spots: controller.listDataEth
                            .map((e) => FlSpot(controller.listDataEth.indexOf(e).toDouble(), double.parse(e.p!)))
                            .toList(),
                        isCurved: false,
                        dotData: const FlDotData(
                          show: false,
                        ),
                      ),
                    ],
                    borderData: FlBorderData(
                        border: Border(
                            bottom: BorderSide(color: AppColors.white), left: BorderSide(color: AppColors.white))),
                    gridData: const FlGridData(show: true, drawVerticalLine: false),
                    titlesData: FlTitlesData(
                      bottomTitles: AxisTitles(
                          sideTitles: SideTitles(
                              showTitles: true,
                              getTitlesWidget: (value, meta) {
                                return controller.bottomTitles(value.toInt(), controller.listDataEth);
                              })),
                      leftTitles: AxisTitles(
                          sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 55,
                        getTitlesWidget: (value, meta) {
                          return Text(
                            '\$ ${MyHelpers.convertFormatNumber(value)}',
                            style: TextStyle(color: AppColors.white, fontSize: 10),
                          );
                        },
                      )),
                      topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                      rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
