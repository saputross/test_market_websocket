// ignore_for_file: unnecessary_overrides

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:test_market_websocket/app/data/response_websocket.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class ChartController extends GetxController {
  late WebSocketChannel streamConsumer;
  Rx<ResponseWebsocket> data = ResponseWebsocket().obs;
  RxList<ResponseWebsocket> listDataBtc = <ResponseWebsocket>[].obs;
  RxList<ResponseWebsocket> listDataEth = <ResponseWebsocket>[].obs;

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
    streamConsumer.sink.close();
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
      if (listDataBtc.indexWhere((element) => element.s == snap.s) >= 0 ||
          listDataEth.indexWhere((element) => element.s == snap.s) >= 0) {
        if (tempData.isEmpty) {
          tempData.add("${snap.s}-$seconds");
          addData(snap);
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
          addData(snap);
        }
      } else if (snap.s != null) {
        addData(snap);
      }
    });
  }

  void close() {
    streamConsumer.sink.close();
  }

  addData(ResponseWebsocket snap) {
    if (snap.s == 'ETH-USD') {
      if (listDataEth.length < 80) {
        listDataEth.add(snap);
        listDataEth.refresh();
      } else {
        listDataEth.removeAt(0);
        listDataEth.add(snap);
        listDataEth.refresh();
      }
    } else {
      if (listDataBtc.length < 80) {
        listDataBtc.add(snap);
        listDataBtc.refresh();
      } else {
        listDataBtc.removeAt(0);
        listDataBtc.add(snap);
        listDataBtc.refresh();
      }
    }
  }

  formatX(int miliseconds) {
    var time = DateTime.fromMillisecondsSinceEpoch(miliseconds);
    return DateFormat("H:m:s").format(time);
  }

  bottomTitles(int value, List<ResponseWebsocket> listData) {
    if (listData.isEmpty ){
      return const Text('');
    }
    if (value % 20 != 0) {
      return const Text('');
    }
    var time = DateTime.fromMillisecondsSinceEpoch(listData[value.toInt()].t ?? 0);
    return  Text(DateFormat("H:m:s").format(time)).marginOnly(left: 5, top: 5);
  }
}
