import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icbc/global/tools.dart';
import 'package:icbc/main.dart';
import 'package:icbc/router/router.dart';
import 'package:icbc/widgets/icon_text.dart';
import 'package:icbc/widgets/normal_appbar.dart';

import 'logic.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> with TickerProviderStateMixin {
  AccountLogic get logic => Get.find<AccountLogic>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
          appBar: NormalAppbar(
              title: logic.showDetail.value ? "账户详情" : "我的账户",
              actions: logic.showDetail.value
                  ? null
                  : [
                      Center(
                          child: TextButton(
                              child: const Text("更多", style: TextStyle(color: Color(0xff5F7484))), onPressed: () {}))
                    ]),
          body: SingleChildScrollView(
              child: Column(children: [
            SizedBox(
                height: 150,
                child: Stack(clipBehavior: Clip.none, children: [
                  GestureDetector(
                      onTap: () {
                        logic.showDetail.toggle();
                      },
                      child: Container(
                          margin: const EdgeInsets.only(left: 15, top: 20, right: 15),
                          decoration:
                              BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.white, boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(.1), // 阴影颜色
                                offset: const Offset(0, 0),
                                blurRadius: 3,
                                spreadRadius: 1)
                          ]),
                          child: Stack(clipBehavior: Clip.none, children: [
                            Positioned(
                                top: 15,
                                left: 15,
                                right: 0,
                                bottom: 0,
                                child: Column(children: [
                                  Row(children: [
                                    Image.asset("assets/images/detail/grayweight_card.webp", width: 60, height: 40),
                                    const SizedBox(width: 5),
                                    Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                                      Text("${Get.find<GlobalController>().address} 借记卡(I类)",
                                          style: const TextStyle(color: Color(0xff222222), fontSize: 14)),
                                      Row(children: [
                                        const Text("6217****0554", style: TextStyle(color: Colors.black, fontSize: 15)),
                                        logic.showDetail.value
                                            ? Row(mainAxisSize: MainAxisSize.min, children: [
                                                Container(
                                                    alignment: Alignment.center,
                                                    padding: const EdgeInsets.symmetric(horizontal: 5),
                                                    decoration: BoxDecoration(
                                                        color: const Color(0xffF5F6FF),
                                                        borderRadius: BorderRadius.circular(4)),
                                                    child: const Text("查看",
                                                        style: TextStyle(
                                                            color: Color(0xff52668C),
                                                            fontSize: 12,
                                                            fontWeight: FontWeight.w500)))
                                              ])
                                            : const SizedBox()
                                      ])
                                    ])
                                  ]),
                                  Expanded(
                                      child: Stack(children: [
                                    logic.showDetail.value
                                        ? const Positioned(
                                            left: 0,
                                            right: 0,
                                            bottom: 0,
                                            child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                mainAxisAlignment: MainAxisAlignment.end,
                                                children: [
                                                  Divider(height: 0, color: Color(0xfff9f9f9), endIndent: 15),
                                                  SizedBox(height: 5),
                                                  Text("柜面注册",
                                                      style: TextStyle(fontSize: 11, color: Color(0xff666666))),
                                                  SizedBox(height: 5),
                                                ]))
                                        : Padding(
                                            padding: const EdgeInsets.only(top: 20),
                                            child: Row(children: [
                                              const Text("人民币余额",
                                                  style: TextStyle(fontSize: 11, color: Color(0xff666666))),
                                              GestureDetector(
                                                  onTap: () {},
                                                  child: Container(
                                                      width: 25,
                                                      height: 40,
                                                      alignment: Alignment.center,
                                                      child: Image.asset("assets/images/szrmb_refresh_disable.png",
                                                          width: 15))),
                                              const Spacer(),
                                              Obx(() {
                                                return Text("${Get.find<GlobalController>().balanceStr}",
                                                    style: const TextStyle(color: Colors.black, fontSize: 15));
                                              }),
                                              const SizedBox(width: 15)
                                            ]))
                                  ]))
                                ])),
                            Positioned(
                                top: -1,
                                right: -2,
                                child: Container(
                                    padding: const EdgeInsets.only(right: 10, top: 2, left: 10, bottom: 2),
                                    decoration: const BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage("assets/images/detail/myaccount_default_bg.png"),
                                            fit: BoxFit.fitWidth)),
                                    child: Row(mainAxisSize: MainAxisSize.min, children: [
                                      Image.asset("assets/images/detail/star.png", width: 12),
                                      const SizedBox(width: 2),
                                      const Text("默认账户", style: TextStyle(color: Colors.white, fontSize: 11))
                                    ])))
                          ]))),
                  Positioned(
                      left: 0,
                      right: 0,
                      bottom: -15,
                      child: logic.showDetail.value
                          ? const SizedBox()
                          : Container(
                              height: 30,
                              decoration: BoxDecoration(color: Theme.of(context).scaffoldBackgroundColor, boxShadow: [
                                BoxShadow(
                                    color: Colors.black.withOpacity(.1),
                                    offset: const Offset(0, -2),
                                    blurRadius: 1,
                                    spreadRadius: 1)
                              ])))
                ])),
            logic.showDetail.value ? buildDetailView() : buildInfoView()
          ])));
    });
  }

  Widget buildInfoView() {
    return Column(key: const ValueKey("false"), children: [
      Container(
          margin: const EdgeInsets.only(left: 15, right: 15),
          padding: const EdgeInsets.only(left: 15, right: 15),
          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8)),
          child: ValueBuilder<bool?>(
              initialValue: false,
              builder: (bool? value, Function(bool? newValue) updater) => Column(children: [
                    GestureDetector(
                        onTap: () => updater(!value),
                        child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            child: Row(children: [
                              Image.asset("assets/images/detail/icon_境外账户.png", width: 30),
                              const Text("境外账户",
                                  style: TextStyle(color: Colors.black, fontSize: 17, fontWeight: FontWeight.w500)),
                              const Spacer(),
                              Image.asset(
                                  value! ? "assets/images/rdproduct_up_9.webp" : "assets/images/rdproduct_down_9.webp",
                                  width: 25)
                            ]))),
                    Divider(height: 0, color: !value ? Colors.transparent : const Color(0xffeeeeee)),
                    Visibility(
                        visible: value,
                        child: Container(
                            height: 50,
                            margin: const EdgeInsets.symmetric(vertical: 20),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(3),
                                border: Border.all(width: 1, color: const Color(0xffF0100E)),
                                color: const Color(0xffFEF4F4)),
                            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                              Image.asset("assets/images/detail/myaccount_add_card_icon.webp", width: 17),
                              const SizedBox(width: 5),
                              const Text("添加本人境外工行账户",
                                  style: TextStyle(color: Color(0xffF0100E), fontWeight: FontWeight.w500, fontSize: 18))
                            ])))
                  ]))),
      Container(
          margin: const EdgeInsets.only(left: 15, right: 15, top: 15),
          padding: const EdgeInsets.only(left: 15, right: 15),
          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8)),
          child: ValueBuilder<bool?>(
              initialValue: false,
              builder: (bool? value, Function(bool? newValue) updater) => Column(children: [
                    GestureDetector(
                        onTap: () => updater(!value),
                        child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            child: Row(children: [
                              Image.asset("assets/images/detail/icon_待添加卡.png", width: 30),
                              const Text("待添加卡",
                                  style: TextStyle(color: Colors.black, fontSize: 17, fontWeight: FontWeight.w500)),
                              const Spacer(),
                              Image.asset(
                                  value! ? "assets/images/rdproduct_up_9.webp" : "assets/images/rdproduct_down_9.webp",
                                  width: 25)
                            ]))),
                    Divider(height: 0, color: !value ? Colors.transparent : const Color(0xffeeeeee)),
                    Visibility(
                        visible: value,
                        child: Container(
                            height: 50,
                            margin: const EdgeInsets.symmetric(vertical: 20),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(3),
                                border: Border.all(width: 1, color: const Color(0xffF0100E)),
                                color: const Color(0xffFEF4F4)),
                            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                              Image.asset("assets/images/detail/myaccount_add_card_icon.webp", width: 17),
                              const SizedBox(width: 5),
                              const Text("添加本人其他银行卡",
                                  style: TextStyle(color: Color(0xffF0100E), fontWeight: FontWeight.w500, fontSize: 18))
                            ]))),
                    Visibility(
                        visible: value,
                        child: Container(
                            margin: const EdgeInsets.only(bottom: 20),
                            child: const Text("添加家庭账户", style: TextStyle(fontSize: 16, color: Colors.blue))))
                  ]))),
      Container(
          margin: const EdgeInsets.only(left: 15, right: 15, top: 15),
          padding: const EdgeInsets.only(left: 15, right: 15),
          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8)),
          child: ValueBuilder<bool?>(
              initialValue: false,
              builder: (bool? value, Function(bool? newValue) updater) => Column(children: [
                    GestureDetector(
                        onTap: () => updater(!value),
                        child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            child: Row(children: [
                              Container(
                                  width: 30,
                                  height: 30,
                                  alignment: Alignment.center,
                                  child: Image.asset("assets/images/detail/myaccount_digitalcard_icon.png", width: 25)),
                              const Text("数字人民币",
                                  style: TextStyle(color: Colors.black, fontSize: 17, fontWeight: FontWeight.w500)),
                              const Spacer(),
                              Image.asset(
                                  value! ? "assets/images/rdproduct_up_9.webp" : "assets/images/rdproduct_down_9.webp",
                                  width: 25)
                            ]))),
                    Divider(height: 0, color: !value ? Colors.transparent : const Color(0xffeeeeee)),
                    Visibility(
                        visible: value,
                        child: Container(
                            height: 50,
                            margin: const EdgeInsets.symmetric(vertical: 20),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(3),
                                border: Border.all(width: 1, color: const Color(0xffF0100E)),
                                color: const Color(0xffFEF4F4)),
                            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                              Image.asset("assets/images/detail/myaccount_add_card_icon.webp", width: 17),
                              const SizedBox(width: 5),
                              const Text("添加本人数字人民市钱包",
                                  style: TextStyle(color: Color(0xffF0100E), fontWeight: FontWeight.w500, fontSize: 18))
                            ])))
                  ]))),
      Container(
          margin: const EdgeInsets.only(left: 15, right: 15, top: 15),
          padding: const EdgeInsets.only(left: 15, right: 15),
          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8)),
          child: GestureDetector(
              onTap: () {},
              child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  child: Row(children: [
                    Container(
                        width: 30,
                        height: 30,
                        alignment: Alignment.center,
                        child: Image.asset("assets/images/detail/myaccount_licaicardcell_cellleftimg.webp", width: 25)),
                    const Text("投资理财账户",
                        style: TextStyle(color: Colors.black, fontSize: 17, fontWeight: FontWeight.w500)),
                    const Spacer(),
                    Image.asset("assets/images/arrow_right.png", width: 16)
                  ])))),
      Container(
          margin: const EdgeInsets.only(left: 15, right: 15),
          child: GestureDetector(
              onTap: () {},
              child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: const Row(children: [
                    Text("账户服务", style: TextStyle(color: Colors.black, fontSize: 17, fontWeight: FontWeight.w500)),
                    Spacer(),
                    Text("更多", style: TextStyle(color: Color(0xff999999), fontSize: 14))
                  ])))),
      Row(children: [
        const SizedBox(width: 15),
        Expanded(
            child: Container(
                height: 65,
                padding: const EdgeInsets.only(left: 15, right: 15),
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8)),
                child: Row(children: [
                  Image.asset("assets/images/detail/icon_账户解控.png", width: 30),
                  const SizedBox(width: 4),
                  const Expanded(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                        Text("账户解控", style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.w500)),
                        Text("一键查询 便捷解控", style: TextStyle(color: Colors.black, fontSize: 12))
                      ]))
                ]))),
        const SizedBox(width: 10),
        Expanded(
            child: Container(
                height: 65,
                padding: const EdgeInsets.only(left: 15, right: 15),
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8)),
                child: Row(children: [
                  Image.asset("assets/images/detail/icon_明细打印.png", width: 30),
                  const SizedBox(width: 4),
                  const Expanded(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                        Text("明细打印", style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.w500)),
                        Text("发送至邮箱自助打印", style: TextStyle(color: Colors.black, fontSize: 12))
                      ]))
                ]))),
        const SizedBox(width: 15)
      ]),
      const SizedBox(height: 10),
      Row(children: [
        const SizedBox(width: 15),
        Expanded(
            child: Container(
                height: 65,
                padding: const EdgeInsets.only(left: 15, right: 15),
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8)),
                child: Row(children: [
                  Image.asset("assets/images/detail/icon_资信证明.png", width: 30),
                  const SizedBox(width: 4),
                  const Expanded(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                        Text("资信证明", style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.w500)),
                        Text("开立和查询进度", style: TextStyle(color: Colors.black, fontSize: 12))
                      ]))
                ]))),
        const SizedBox(width: 10),
        Expanded(
            child: Container(
                height: 65,
                padding: const EdgeInsets.only(left: 15, right: 15),
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(8)),
                child: Row(children: [
                  Image.asset("assets/images/detail/icon_工银信使.png", width: 30),
                  const SizedBox(width: 4),
                  const Expanded(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                        Text("工银信使", style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.w500)),
                        Text("动账信息及时通知", style: TextStyle(color: Colors.black, fontSize: 12))
                      ]))
                ]))),
        const SizedBox(width: 15)
      ]),
      Container(
          margin: const EdgeInsets.only(top: 10),
          height: 150,
          width: double.infinity,
          alignment: Alignment.center,
          child: Image.asset("assets/images/detail/myaccount_deposit_icon.png", width: .4.sw, fit: BoxFit.fitWidth))
    ]);
  }

  Widget buildDetailView() {
    return Column(key: const ValueKey("true"), children: [
      Container(
          margin: const EdgeInsets.only(top: 10),
          color: Colors.white,
          height: 50,
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(children: [
            const Text("人民币余额", style: TextStyle(fontSize: 14, color: Colors.black, fontWeight: FontWeight.w500)),
            const Spacer(),
            Obx(() {
              return Text("${Get.find<GlobalController>().balanceStr}",
                  style: const TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.w500));
            })
          ])),
      Container(
          margin: const EdgeInsets.only(top: 10),
          color: Colors.white,
          padding: const EdgeInsets.only(left: 15, right: 15, top: 20, bottom: 20),
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            Row(children: [
              IconTextView(
                  text: "查询明细",
                  imagePath: "assets/images/detail/icon_detail_查询明细.png",
                  size: const Size(40, 40),
                  fontSize: 12,
                  maxLines: 1,
                  onTap: () {
                    Get.toNamed(AppRouter.minePages.queryDetailsRoute.name);
                  }),
              const IconTextView(
                  text: "复制卡号",
                  imagePath: "assets/images/detail/icon_detail_复制卡号.png",
                  size: Size(40, 40),
                  fontSize: 12,
                  maxLines: 1),
              const IconTextView(
                  text: "账户挂失",
                  imagePath: "assets/images/detail/icon_detail_账户挂失.png",
                  size: Size(40, 40),
                  fontSize: 12,
                  maxLines: 1),
              const IconTextView(
                  text: "开户网点",
                  imagePath: "assets/images/detail/icon_detail_开户网点.png",
                  size: Size(40, 40),
                  fontSize: 12,
                  maxLines: 1),
            ]),
            const SizedBox(height: 5),
            const Row(children: [
              IconTextView(
                  text: "密码管理",
                  imagePath: "assets/images/detail/icon_detail_密码管理.png",
                  size: Size(40, 40),
                  fontSize: 12,
                  maxLines: 1),
              IconTextView(
                  text: "工银信使",
                  imagePath: "assets/images/detail/icon_detail_工银信使.png",
                  size: Size(40, 40),
                  fontSize: 12,
                  maxLines: 1),
              IconTextView(
                  text: "投资理财",
                  imagePath: "assets/images/detail/icon_detail_投资理财.png",
                  size: Size(40, 40),
                  fontSize: 12,
                  maxLines: 1),
              IconTextView(
                  text: "转账汇款",
                  imagePath: "assets/images/detail/icon_detail_转账汇款.png",
                  size: Size(40, 40),
                  fontSize: 12,
                  maxLines: 1),
            ])
          ])),
      Container(
          margin: const EdgeInsets.only(top: 10),
          padding: const EdgeInsets.only(left: 15, right: 15),
          color: Colors.white,
          child: Column(children: [
            SizedBox(
                height: 60,
                child: Row(children: [
                  const Text("基本账户", style: TextStyle(fontSize: 14, color: Colors.black, fontWeight: FontWeight.w500)),
                  const Spacer(),
                  const Text("3400****3455", style: TextStyle(fontSize: 14, color: Color(0xff666666))),
                  Image.asset("assets/images/icbc_arrow_right.webp", width: 20)
                ])),
            const Divider(height: 0, color: Color(0xffeeeeee)),
            const SizedBox(
                height: 60,
                child: Row(children: [
                  Text("启用日期", style: TextStyle(fontSize: 14, color: Colors.black, fontWeight: FontWeight.w500)),
                  Spacer(),
                  Text("2021年05月21日", style: TextStyle(fontSize: 14, color: Color(0xff666666)))
                ])),
            const Divider(height: 0, color: Color(0xffeeeeee)),
            SizedBox(
                height: 60,
                child: Row(children: [
                  const Text("到期日期", style: TextStyle(fontSize: 14, color: Colors.black, fontWeight: FontWeight.w500)),
                  const SizedBox(width: 3),
                  Image.asset("assets/images/tip_image_blue.png", width: 15),
                  const Spacer(),
                  const Text("2031年04月", style: TextStyle(fontSize: 14, color: Color(0xff666666)))
                ])),
            const Divider(height: 0, color: Color(0xffeeeeee)),
            SizedBox(
                height: 60,
                child: Row(children: [
                  const Text("设置别名", style: TextStyle(fontSize: 14, color: Colors.black, fontWeight: FontWeight.w500)),
                  const Spacer(),
                  const Text("此卡别名", style: TextStyle(fontSize: 14, color: Color(0xffaaaaaa))),
                  Image.asset("assets/images/icbc_arrow_right.webp", width: 20)
                ])),
            const Divider(height: 0, color: Color(0xffeeeeee)),
            SizedBox(
                height: 60,
                child: Row(children: [
                  const Text("账户互转", style: TextStyle(fontSize: 14, color: Colors.black, fontWeight: FontWeight.w500)),
                  const Spacer(),
                  Image.asset("assets/images/icbc_arrow_right.webp", width: 20)
                ])),
            const Divider(height: 0, color: Color(0xffeeeeee)),
            SizedBox(
                height: 60,
                child: Row(children: [
                  const Text("当面收款", style: TextStyle(fontSize: 14, color: Colors.black, fontWeight: FontWeight.w500)),
                  const Spacer(),
                  Image.asset("assets/images/icbc_arrow_right.webp", width: 20)
                ])),
            const Divider(height: 0, color: Color(0xffeeeeee)),
            SizedBox(
                height: 60,
                child: Row(children: [
                  const Text("绑手机号", style: TextStyle(fontSize: 14, color: Colors.black, fontWeight: FontWeight.w500)),
                  const Spacer(),
                  Image.asset("assets/images/icbc_arrow_right.webp", width: 20)
                ]))
          ])),
      Container(
          margin: const EdgeInsets.only(top: 10),
          color: Colors.white,
          height: 50,
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(children: [
            const Text("其他", style: TextStyle(fontSize: 14, color: Colors.black, fontWeight: FontWeight.w500)),
            const Spacer(),
            Image.asset("assets/images/icbc_arrow_right.webp", width: 20)
          ])),
      Container(
          margin: const EdgeInsets.only(top: 10),
          color: Colors.white,
          height: 50,
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(children: [
            const Text("删除账户", style: TextStyle(fontSize: 14, color: Colors.black, fontWeight: FontWeight.w500)),
            const Spacer(),
            Image.asset("assets/images/icbc_arrow_right.webp", width: 20)
          ])),
      Container(
          margin: const EdgeInsets.only(top: 10),
          height: 150,
          color: Colors.white,
          width: double.infinity,
          alignment: Alignment.center,
          child: Image.asset("assets/images/detail/myaccount_deposit_icon.png", width: .4.sw, fit: BoxFit.fitWidth))
    ]);
  }
}
