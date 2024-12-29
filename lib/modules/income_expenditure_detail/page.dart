import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:icbc/widgets/icon_text.dart';
import 'package:icbc/widgets/normal_appbar.dart';
import 'package:intl/intl.dart';

import 'logic.dart';

class IncomeExpenditureDetailPage extends StatelessWidget {
  const IncomeExpenditureDetailPage({super.key});

  IncomeExpenditureDetailLogic get logic => Get.find<IncomeExpenditureDetailLogic>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: NormalAppbar(title: "收支详情", actions: [
          Image.asset("assets/images/base_im_icon_service.png", width: 25),
          const SizedBox(width: 5),
          Image.asset("assets/images/base_im_icon_download.webp", width: 45)
        ]),
        body: SingleChildScrollView(
            child: Column(children: [
          Container(
              color: Colors.white,
              child: ValueBuilder<bool?>(
                  initialValue: false,
                  builder: (bool? value, Function(bool? newValue) updater) => Column(children: [
                        const SizedBox(height: 30, width: double.infinity),
                        Text(
                            "${logic.bean!.type == "income" ? "+" : "-"}${NumberFormat("#,##0.00", "en_US").format(logic.bean!.money)}",
                            style: TextStyle(
                                color: logic.bean!.type == "income" ? const Color(0xffC84C41) : const Color(0xff3A837A),
                                fontSize: 32,
                                fontWeight: FontWeight.w500)),
                        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                          const Text("余额：",
                              style: TextStyle(color: Color(0xff666666), fontSize: 12, fontWeight: FontWeight.w500)),
                          Text(NumberFormat("#,##0.00", "en_US").format(logic.bean!.balance),
                              style:
                                  const TextStyle(color: Color(0xff666666), fontSize: 14, fontWeight: FontWeight.w500)),
                        ]),
                        const SizedBox(height: 8),
                        Row(children: [
                          const SizedBox(width: 15),
                          const Text("交易卡号", style: TextStyle(color: Color(0xff666666), fontSize: 14)),
                          const Spacer(),
                          Text("${logic.bean!.mineCardNumber}",
                              style: const TextStyle(color: Color(0xff333333), fontSize: 14)),
                          const SizedBox(width: 15)
                        ]),
                        const SizedBox(height: 12),
                        Row(children: [
                          const SizedBox(width: 15),
                          const Text("交易账户", style: TextStyle(color: Color(0xff666666), fontSize: 14)),
                          const Spacer(),
                          Text("${logic.bean!.account}",
                              style: const TextStyle(color: Color(0xff333333), fontSize: 14)),
                          const SizedBox(width: 15)
                        ]),
                        const SizedBox(height: 12),
                        Row(children: [
                          const SizedBox(width: 15),
                          const Text("交易户名", style: TextStyle(color: Color(0xff666666), fontSize: 14)),
                          const Spacer(),
                          Text("${logic.bean!.mineName}",
                              style: const TextStyle(color: Color(0xff333333), fontSize: 14)),
                          const SizedBox(width: 15)
                        ]),
                        const SizedBox(height: 12),
                        Row(children: [
                          const SizedBox(width: 15),
                          const Text("交易时间", style: TextStyle(color: Color(0xff666666), fontSize: 14)),
                          const Spacer(),
                          Text("${logic.bean!.time}", style: const TextStyle(color: Color(0xff333333), fontSize: 14)),
                          const SizedBox(width: 15)
                        ]),
                        const SizedBox(height: 12),
                        Row(children: [
                          const SizedBox(width: 15),
                          const Text("业务摘要", style: TextStyle(color: Color(0xff666666), fontSize: 14)),
                          const Spacer(),
                          Text("${logic.bean!.summary}", style: const TextStyle(color: Colors.blue, fontSize: 14)),
                          const SizedBox(width: 15)
                        ]),
                        const SizedBox(height: 12),
                        Row(children: [
                          const SizedBox(width: 15),
                          const Text("交易场所", style: TextStyle(color: Color(0xff666666), fontSize: 14)),
                          const Spacer(),
                          Text("${logic.bean!.place}", style: const TextStyle(color: Color(0xff333333), fontSize: 14)),
                          const SizedBox(width: 15)
                        ]),
                        const SizedBox(height: 12),
                        const Row(children: [
                          SizedBox(width: 15),
                          Text("交易金额", style: TextStyle(color: Color(0xff666666), fontSize: 14)),
                          Spacer(),
                          Text("29.13", style: TextStyle(color: Color(0xff333333), fontSize: 14)),
                          SizedBox(width: 15)
                        ]),

                        /// 收起后隐藏
                        Visibility(
                            visible: value!,
                            child: Column(children: [
                              const SizedBox(height: 12),
                              Row(children: [
                                const SizedBox(width: 15),
                                const Text("交易国家或地区简称", style: TextStyle(color: Color(0xff666666), fontSize: 14)),
                                const Spacer(),
                                Text("${logic.bean!.country}",
                                    style: const TextStyle(color: Color(0xff333333), fontSize: 14)),
                                const SizedBox(width: 15)
                              ]),
                              const SizedBox(height: 12),
                              const Row(children: [
                                SizedBox(width: 15),
                                Text("记账金额", style: TextStyle(color: Color(0xff666666), fontSize: 14)),
                                Spacer(),
                                Text("29.13", style: TextStyle(color: Color(0xff333333), fontSize: 14)),
                                SizedBox(width: 15)
                              ]),
                              const SizedBox(height: 12),
                              Row(children: [
                                const SizedBox(width: 15),
                                const Text("记账币种", style: TextStyle(color: Color(0xff666666), fontSize: 14)),
                                const Spacer(),
                                Text("${logic.bean!.currency}",
                                    style: const TextStyle(color: Color(0xff333333), fontSize: 14)),
                                const SizedBox(width: 15)
                              ]),

                              /// 对方账户信息 todo 有时候会没有
                              Column(children: [
                                const SizedBox(height: 6),
                                const Divider(height: 0, indent: 15, endIndent: 15, color: Color(0xffcccccc)),
                                const SizedBox(height: 6),
                                Row(children: [
                                  const SizedBox(width: 15),
                                  const Text("对方账户", style: TextStyle(color: Color(0xff666666), fontSize: 14)),
                                  const Spacer(),
                                  Text("${logic.bean!.counterpartAccount}",
                                      style: const TextStyle(color: Color(0xff333333), fontSize: 14)),
                                  const SizedBox(width: 15)
                                ]),
                                const SizedBox(height: 12),
                                Row(children: [
                                  const SizedBox(width: 15),
                                  const Text("对方户名", style: TextStyle(color: Color(0xff666666), fontSize: 14)),
                                  const Spacer(),
                                  Text("${logic.bean!.counterpartName}",
                                      style: const TextStyle(color: Color(0xff333333), fontSize: 14)),
                                  const SizedBox(width: 15)
                                ]),
                                const SizedBox(height: 12),
                                Row(children: [
                                  const SizedBox(width: 15),
                                  const Text("对方账户行别", style: TextStyle(color: Color(0xff666666), fontSize: 14)),
                                  const Spacer(),
                                  Text("${logic.bean!.counterpartBankName}",
                                      style: const TextStyle(color: Color(0xff333333), fontSize: 14)),
                                  const SizedBox(width: 15)
                                ])
                              ]),
                              const SizedBox(height: 6),
                              const Divider(height: 0, indent: 15, endIndent: 15, color: Color(0xffcccccc)),
                              const SizedBox(height: 2),
                              Row(children: [
                                const SizedBox(width: 15),
                                const Text("查询完整交易卡号或账户", style: TextStyle(color: Color(0xff666666), fontSize: 14)),
                                const Spacer(),
                                Transform.scale(scale: .8, child: CupertinoSwitch(value: false, onChanged: (value) {})),
                                const SizedBox(width: 10)
                              ])
                            ])),
                        SizedBox(height: !value ? 6 : 2),
                        const Divider(height: 0, indent: 15, endIndent: 15, color: Color(0xffeeeeee)),
                        GestureDetector(
                            onTap: () => updater(!value),
                            child: Container(
                                height: 50,
                                alignment: Alignment.center,
                                child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                                  Text(!value ? "查看全部" : "收起",
                                      style: const TextStyle(color: Color(0xff666666), fontSize: 14)),
                                  Icon(!value ? Icons.arrow_drop_down : Icons.arrow_drop_up,
                                      color: const Color(0xff999999))
                                ])))
                      ]))),
          Container(
              margin: const EdgeInsets.only(top: 10),
              padding: const EdgeInsets.only(top: 15, bottom: 15, left: 15, right: 10),
              color: Colors.white,
              child: Column(children: [
                Row(children: [
                  const Text("详情设置", style: TextStyle(fontSize: 15, color: Colors.black)),
                  const SizedBox(width: 5),
                  Image.asset("assets/images/tip_image_blue.png", width: 15)
                ]),
                const SizedBox(height: 15),
                Row(children: [
                  const Text("分类", style: TextStyle(fontSize: 13, color: Color(0xff999999))),
                  const Spacer(),
                  Image.asset("assets/images/detail/icon_type_转账.png", width: 25),
                  const SizedBox(width: 5),
                  Text("${logic.bean!.subTypeText}", style: const TextStyle(fontSize: 14, color: Color(0xff333333))),
                  Image.asset("assets/images/arrow_right.png", width: 10),
                  const SizedBox(width: 5)
                ]),
                const SizedBox(height: 15),
                const Divider(height: 0, color: Color(0xffeeeeee), endIndent: 5),
                const SizedBox(height: 15),
                Row(children: [
                  const Text("订单咨询", style: TextStyle(fontSize: 13, color: Color(0xff999999))),
                  const Spacer(),
                  Image.asset("assets/images/arrow_right.png", width: 10),
                  const SizedBox(width: 5)
                ]),
                const SizedBox(height: 15),
                const Divider(height: 0, color: Color(0xffeeeeee), endIndent: 5),
                const SizedBox(height: 8),
                Row(children: [
                  const Text("不计入收支", style: TextStyle(color: Color(0xff999999), fontSize: 14)),
                  const Spacer(),
                  Transform.scale(
                      scale: .8, child: CupertinoSwitch(value: logic.bean!.includedIncomeExpenditure, onChanged: null)),
                ]),
                const SizedBox(height: 8),
                const Divider(height: 0, color: Color(0xffeeeeee), endIndent: 5),
                const SizedBox(height: 15),
                Row(children: [
                  const Text("备注", style: TextStyle(fontSize: 13, color: Color(0xff999999))),
                  const SizedBox(width: 5),
                  GetBuilder<IncomeExpenditureDetailLogic>(
                      init: logic,
                      builder: (logic) {
                        return RichText(
                            text: TextSpan(children: [
                          TextSpan(
                              text: "${logic.textEditingController.text.length}",
                              style: const TextStyle(fontSize: 14, color: Color(0xff999999))),
                          const TextSpan(text: "/50", style: TextStyle(fontSize: 9, color: Color(0xffbbbbbb)))
                        ]));
                      })
                ]),
                const SizedBox(height: 10),
                Row(children: [
                  Expanded(
                      child: TextField(
                          controller: logic.textEditingController,
                          minLines: 1,
                          maxLines: 5,
                          inputFormatters: [LengthLimitingTextInputFormatter(50)],
                          style: const TextStyle(
                              color: Color(0xff333333), fontSize: 13, fontWeight: FontWeight.w500, height: 1.3),
                          decoration: const InputDecoration(
                              contentPadding: EdgeInsets.zero,
                              border: InputBorder.none,
                              hintText: "点击写备注",
                              hintStyle: TextStyle(color: Color(0xff999999), fontSize: 13)))),
                  Image.asset("assets/images/detail/icon_add_picture.png", width: 30),
                  const SizedBox(width: 5)
                ])
              ])),
          Container(
              margin: const EdgeInsets.only(top: 10),
              padding: const EdgeInsets.only(top: 15, bottom: 15, left: 15, right: 15),
              color: Colors.white,
              child: const Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text("为您推荐", style: TextStyle(fontSize: 15, color: Colors.black)),
                SizedBox(height: 10),
                Row(children: [
                  IconTextView(
                      text: "余额变动提醒",
                      imagePath: "assets/images/detail/icon_余额变动提醒_detail.png",
                      maxLines: 1,
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                      textColor: Color(0xff666666)),
                  IconTextView(
                      text: "打印明细",
                      imagePath: "assets/images/detail/icon_打印明细_detail.png",
                      maxLines: 1,
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                      textColor: Color(0xff666666)),
                  IconTextView(
                      text: "投资理财",
                      imagePath: "assets/images/detail/icon_投资理财_detail.png",
                      maxLines: 1,
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                      textColor: Color(0xff666666)),
                  IconTextView(
                      text: "存款",
                      imagePath: "assets/images/detail/icon_存款_detail.png",
                      maxLines: 1,
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                      textColor: Color(0xff666666)),
                ]),
                SizedBox(height: 15),
                Row(children: [
                  IconTextView(
                      text: "转账汇款",
                      imagePath: "assets/images/detail/icon_转账汇款_detail.png",
                      maxLines: 1,
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                      textColor: Color(0xff666666)),
                  Expanded(child: SizedBox()),
                  Expanded(child: SizedBox()),
                  Expanded(child: SizedBox())
                ]),
                SizedBox(height: 30)
              ]))
        ])));
  }
}
