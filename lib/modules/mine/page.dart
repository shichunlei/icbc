import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'logic.dart';

class MinePage extends StatefulWidget {
  const MinePage({super.key});

  @override
  createState() => _MinePageState();
}

class _MinePageState extends State<MinePage> with AutomaticKeepAliveClientMixin {
  MineLogic get logic => Get.find<MineLogic>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text('我的'),
        ),
        body: Container());
  }

  @override
  bool get wantKeepAlive => true;
}
