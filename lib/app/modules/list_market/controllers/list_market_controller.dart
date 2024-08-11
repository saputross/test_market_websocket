// ignore_for_file: unnecessary_overrides

import 'dart:convert';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:test_market_websocket/app/data/response_websocket.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class ListMarketController extends GetxController {
  late WebSocketChannel streamConsumer;
  Rx<ResponseWebsocket> data = ResponseWebsocket().obs;
  RxList<ResponseWebsocket> listData = <ResponseWebsocket>[].obs;

  @override
  void onInit() {
    super.onInit();
    init();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  init() async {
    final wsUrl = Uri.parse('wss://ws.eodhistoricaldata.com/ws/crypto?api_token=demo');
    streamConsumer = WebSocketChannel.connect(wsUrl);
    streamConsumer.sink.add('{"action":"subscribe","symbols":"BTC-USD,ETH-USD"}');
    printInfo(info: 'Connected to: ${wsUrl.toString()}');

    await streamConsumer.ready;
    var tempSeconds = "0";
    List tempData = [];
    streamConsumer.stream.listen((event) {
      var snap = ResponseWebsocket.fromJson(jsonDecode(event));
      var time = DateTime.fromMillisecondsSinceEpoch(snap.t ?? 0);
      var seconds = DateFormat("s").format(time);
      if (listData.indexWhere((element) => element.s == snap.s) >= 0) {
        if (tempData.isEmpty) {
          tempData.add("${snap.s}-$seconds");
          var index = listData.indexWhere((element) => element.s == snap.s);
          listData[index] = snap;
          listData.refresh();
        } else {
          if (tempData.indexWhere((element) => element == "${snap.s}-$seconds") >= 0) {
            return;
          }
          if (seconds != tempSeconds) {
            tempData.clear();
            tempSeconds = seconds;
            return;
          }
          tempData.add("${snap.s}-$seconds");
          var index = listData.indexWhere((element) => element.s == snap.s);
          listData[index] = snap;
          listData.refresh();
        }
      } else if (snap.s != null) {
        listData.add(snap);
      }
    });
  }

  void close() {
    streamConsumer.sink.close();
  }
}
