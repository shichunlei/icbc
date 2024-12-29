import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icbc/main.dart';
import 'package:icbc/widgets/icon_text.dart';
import 'package:icbc/widgets/normal_appbar.dart';
import 'package:intl/intl.dart';

import 'logic.dart';

class AssetsPage extends StatelessWidget {
  const AssetsPage({super.key});

  AssetsLogic get logic => Get.find<AssetsLogic>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const NormalAppbar(title: "我的资产"),
        body: Stack(children: [
          Image.asset("assets/images/detail/my_asset_top_background.png", width: double.infinity, fit: BoxFit.fitWidth),
          SingleChildScrollView(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Column(children: [
                Container(
                    margin: const EdgeInsets.symmetric(horizontal: 15),
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.white),
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child:
                        Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.start, children: [
                      Row(children: [
                        Obx(() {
                          return Text("时间:${DateFormat("yyyy-MM-dd HH:mm:ss").format(logic.time.value)}",
                              style: const TextStyle(color: Color(0xff999999), fontSize: 12));
                        }),
                        const SizedBox(width: 5),
                        GestureDetector(
                            onTap: logic.refreshTime,
                            child: SizedBox(
                                height: 30, child: Image.asset("assets/images/detail/szrmb_refresh.png", width: 16))),
                        const Spacer(),
                        GestureDetector(
                            onTap: logic.showMoney.toggle,
                            child: Obx(() {
                              return SizedBox(
                                  height: 30,
                                  child: Image.asset(
                                      logic.showMoney.value
                                          ? "assets/images/eye_open.png"
                                          : "assets/images/eye_close.png",
                                      width: 18));
                            }))
                      ]),
                      const SizedBox(height: 10),
                      Container(
                          decoration:
                              BoxDecoration(borderRadius: BorderRadius.circular(4), color: const Color(0xfffafafa)),
                          padding: const EdgeInsets.only(right: 8, top: 5, bottom: 5),
                          child: Column(children: [
                            Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                              Row(children: [
                                Container(width: 5, height: 10, color: const Color(0xffD02935)),
                                const SizedBox(width: 10),
                                const Text("总资产(元)",
                                    style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.w500)),
                              ]),
                              const Spacer(),
                              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                                Padding(
                                    padding: const EdgeInsets.only(left: 5),
                                    child: Obx(() {
                                      return Text(
                                          logic.showMoney.value ? "${Get.find<GlobalController>().balanceStr}" : "****",
                                          style: const TextStyle(fontSize: 26, color: Colors.black));
                                    })),
                                Obx(() {
                                  return Visibility(
                                      visible: logic.showMoney.value,
                                      child: Row(mainAxisSize: MainAxisSize.min, children: [
                                        Container(
                                            height: 20,
                                            padding: const EdgeInsets.only(left: 5, right: 5, bottom: 1),
                                            alignment: Alignment.bottomCenter,
                                            decoration: const BoxDecoration(
                                                image: DecorationImage(
                                                    fit: BoxFit.fill,
                                                    image: AssetImage(
                                                        "assets/images/mine/icon_assets_floor__asset_unit.9.png"))),
                                            child: const Text("十万",
                                                style: TextStyle(color: Color(0xffCD0000), fontSize: 10)))
                                      ]));
                                })
                              ])
                            ]),
                            const SizedBox(height: 5),
                            const Divider(height: 0, color: Color(0xffeeeeee)),
                            SizedBox(
                                height: 45,
                                child: Obx(() {
                                  return Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                                    GestureDetector(
                                        onTap: () {
                                          logic.index.value = 0;
                                        },
                                        child: Column(mainAxisSize: MainAxisSize.min, children: [
                                          Text("资产占比",
                                              style: TextStyle(
                                                  color:
                                                      logic.index.value == 0 ? const Color(0xffCD3F3A) : Colors.black,
                                                  fontSize: 13,
                                                  fontWeight:
                                                      logic.index.value == 0 ? FontWeight.w500 : FontWeight.normal)),
                                          Container(
                                              margin: const EdgeInsets.only(top: 5),
                                              width: 20,
                                              height: 3,
                                              color:
                                                  logic.index.value == 0 ? const Color(0xffCD3F3A) : Colors.transparent)
                                        ])),
                                    GestureDetector(
                                        onTap: () {
                                          logic.index.value = 1;
                                        },
                                        child: Column(mainAxisSize: MainAxisSize.min, children: [
                                          Text("资产详情",
                                              style: TextStyle(
                                                  color:
                                                      logic.index.value == 1 ? const Color(0xffCD3F3A) : Colors.black,
                                                  fontSize: 13,
                                                  fontWeight:
                                                      logic.index.value == 1 ? FontWeight.w500 : FontWeight.normal)),
                                          Container(
                                              margin: const EdgeInsets.only(top: 5),
                                              width: 20,
                                              height: 3,
                                              color:
                                                  logic.index.value == 1 ? const Color(0xffCD3F3A) : Colors.transparent)
                                        ]))
                                  ]);
                                })),
                            Obx(() => logic.index.value == 1
                                ? Container(
                                    margin: const EdgeInsets.symmetric(vertical: 10),
                                    padding: const EdgeInsets.only(left: 20, right: 20),
                                    child: Column(mainAxisSize: MainAxisSize.min, children: [
                                      Row(children: [
                                        const Text("存款"),
                                        const Spacer(),
                                        Text(logic.showMoney.value
                                            ? "${Get.find<GlobalController>().balanceStr}"
                                            : "****"),
                                        Image.asset("assets/images/icbc_arrow_right.webp", width: 15)
                                      ]),
                                      Row(children: [
                                        Text(logic.showMoney.value ? "100.00%" : "****",
                                            style: const TextStyle(color: Color(0xffCD0000), fontSize: 12)),
                                        const SizedBox(width: 5),
                                        Expanded(
                                            child: Container(
                                                height: 2,
                                                width: double.infinity,
                                                color: logic.showMoney.value
                                                    ? const Color(0xffCD0000)
                                                    : const Color(0xffdddddd)))
                                      ])
                                    ]))
                                : Container(
                                    padding: const EdgeInsets.symmetric(vertical: 30),
                                    child: Row(children: [
                                      Container(
                                          margin: const EdgeInsets.only(left: 15, right: 30),
                                          decoration: BoxDecoration(
                                              color: const Color(0xffB57357), borderRadius: BorderRadius.circular(300)),
                                          height: 90,
                                          width: 90),
                                      Container(
                                          decoration: BoxDecoration(
                                              color: const Color(0xffB57357), borderRadius: BorderRadius.circular(300)),
                                          height: 5,
                                          width: 5,
                                          margin: const EdgeInsets.only(right: 5)),
                                      const Text("存款", style: TextStyle(color: Color(0xff666666))),
                                      const Spacer(),
                                      const Text("100.00%", style: TextStyle(color: Color(0xff333333))),
                                      const SizedBox(width: 5)
                                    ])))
                          ])),
                      const SizedBox(height: 10),
                      Container(
                          decoration:
                              BoxDecoration(borderRadius: BorderRadius.circular(4), color: const Color(0xfffafafa)),
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
                          child: Row(children: [
                            Image.asset("assets/images/mine/icon_mine_assets_diagnosis.png", width: 25),
                            const SizedBox(width: 3),
                            const Expanded(
                                child:
                                    Text("给资产做个诊断，实现财富增值", style: TextStyle(color: Color(0xff999999), fontSize: 12))),
                            Container(
                                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(width: .5, color: const Color(0xffA60000))),
                                child: const Text("去诊断", style: TextStyle(color: Color(0xffA60000), fontSize: 12)))
                          ])),
                      const SizedBox(height: 10),
                      Container(
                          decoration:
                              BoxDecoration(borderRadius: BorderRadius.circular(4), color: const Color(0xfffafafa)),
                          padding: const EdgeInsets.only(right: 8, top: 5, bottom: 5),
                          child: Row(children: [
                            Container(width: 5, height: 10, color: const Color(0xff1B7D5C)),
                            const SizedBox(width: 10),
                            const Text("总负债(元)",
                                style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.w500)),
                            const Spacer(),
                            const Text("0.00", style: TextStyle(fontSize: 26, color: Colors.black))
                          ]))
                    ])),
                const SizedBox(height: 15),
                Container(
                    margin: const EdgeInsets.symmetric(horizontal: 15),
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.white),
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: const Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("其他", style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.w500)),
                          SizedBox(height: 10),
                          Row(children: [
                            IconTextView(
                                text: "数字人民币", imagePath: "assets/images/icons/icon_数字人民币.png", size: Size(40, 40)),
                            IconTextView(text: "保险", imagePath: "assets/images/icons/icon_保险.png", size: Size(40, 40)),
                            IconTextView(
                                text: "第三方存管", imagePath: "assets/images/icons/icon_第三方存管.png", size: Size(40, 40)),
                            Expanded(child: SizedBox())
                          ])
                        ])),
                const SizedBox(height: 5),
                Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                    alignment: Alignment.centerLeft,
                    child: const Text("说明",
                        style: TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.w500))),
                Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    alignment: Alignment.centerLeft,
                    child: const Text(
                        "1.本页面不展示账户余额为0的产品信息。\n"
                        "2.资产负债数据更新可能存在延时等情况，数据仅供参考，不作为对账凭证。\n"
                        "3.基金资产包含购买在途资金和赎回在途基金，实际到账金额=赎回总额-手续费，数据仅供参考，以公司确认净值为准。\n"
                        "4.您持有的理财产品资产计算规则：理财产品资产=产品份额*产品最新净值，购买期在途资产=购买金额，赎回期在途资产在未确认前，仅使用该产品最新净值展示产品市值，数据仅供参考，最终请以理财公司确认净值为准。\n"
                        "5.您持有的信托产品资产计算规则：信托产品资产=产品份额*产品最新净值，购买期在途资产=购买金额，赎回期在途资产在未确认前，仅使用该产品最新净值展示产品市值，上述数据仅供参考，最终请以信托公司确认数据为准。\n"
                        "6.您持有的实物贵金属、实物贵金属递延、积存贵金属、账户贵金属、账户贵金属指数、账户外汇、账户外汇指数、外汇双向、账户能源、账户农产品、账户基本金属等产品，您的持仓数据可能随市场行情变化产生浮动盈亏。\n"
                        "7.您持有的活期、定期、理财、基金等外币资产将按照当前的外汇银行买入价折算成人民币计算资产负债数据，数据仅供参考。\n"
                        "8.如果您是柜面注册电子银行客户，资产、负债数据为您在工行的全部账户的数据合计；如果您是自助注册电子银行客户，资产、负债数据仅包含您注册电子银行账户的数据合计。\n"
                        "9.若您持有“B股银证转账”、“银期转账”产品，本页面无法向您展现该类别产品的相关信息。\n"
                        "10.\"其他\"栏目资产未纳入总资产数据及饼图资产数据分析，您可以点击对应菜单进行查询。\n"
                        "11.您持有的养老金资产包括企业年金、团养产品、养老衍生产品、以及个人养老金（包含您使用个人养老金购买的基金、理财、保险、存款等产品）。\n"
                        "12.您的信用卡欠款将按照当前的外汇银行卖出价折算成人民币计算资产负债数据，数据仅供参考。信用卡欠款不包含分期未入账本金及其利息。\n",
                        style: TextStyle(color: Color(0xff666666), fontSize: 12)))
              ]))
        ]));
  }
}
