import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icbc/widgets/normal_appbar.dart';
import 'package:intl/intl.dart';

import 'logic.dart';

class QueryDetailInfoPage extends StatelessWidget {
  const QueryDetailInfoPage({super.key});

  QueryDetailInfoLogic get logic => Get.find<QueryDetailInfoLogic>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:
            NormalAppbar(title: "明细详情", actions: [Image.asset("assets/images/base_im_icon_download.webp", width: 45)]),
        body: SingleChildScrollView(
            child: Column(children: [
          Container(
              margin: const EdgeInsets.only(top: 10),
              color: Colors.white,
              child: Column(children: [
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
                      style: const TextStyle(color: Color(0xff666666), fontSize: 14, fontWeight: FontWeight.w500)),
                ]),
                const SizedBox(height: 28),
                const Divider(height: 0, indent: 15, endIndent: 15, color: Color(0xffeeeeee)),
                const SizedBox(height: 8),
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
                  const Text("交易卡号", style: TextStyle(color: Color(0xff666666), fontSize: 14)),
                  const Spacer(),
                  Text("${logic.bean!.mineCardNumber}", style: const TextStyle(color: Color(0xff333333), fontSize: 14)),
                  const SizedBox(width: 15)
                ]),
                const SizedBox(height: 12),
                Row(children: [
                  const SizedBox(width: 15),
                  const Text("业务摘要", style: TextStyle(color: Color(0xff666666), fontSize: 14)),
                  const Spacer(),
                  Text("${logic.bean!.summary}", style: const TextStyle(color: Color(0xff333333), fontSize: 14)),
                  const SizedBox(width: 15)
                ]),
                const SizedBox(height: 12),
                ...null != logic.bean!.info && "" != logic.bean!.info
                    ? [
                        Row(children: [
                          const SizedBox(width: 15),
                          const Text("交易详情", style: TextStyle(color: Color(0xff666666), fontSize: 14)),
                          const Spacer(),
                          Text("${logic.bean!.info}", style: const TextStyle(color: Color(0xff333333), fontSize: 14)),
                          const SizedBox(width: 15)
                        ]),
                        const SizedBox(height: 12),
                      ]
                    : [],
                Row(children: [
                  const SizedBox(width: 15),
                  const Text("交易国家或地区简称", style: TextStyle(color: Color(0xff666666), fontSize: 14)),
                  const Spacer(),
                  Text("${logic.bean!.country}", style: const TextStyle(color: Color(0xff333333), fontSize: 14)),
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
                const SizedBox(height: 12),
                ...logic.bean!.postscript != null && logic.bean!.postscript != ""
                    ? [
                        Row(children: [
                          const SizedBox(width: 15),
                          const Text("附言", style: TextStyle(color: Color(0xff666666), fontSize: 14)),
                          const Spacer(),
                          Text("${logic.bean!.postscript}",
                              style: const TextStyle(color: Color(0xff333333), fontSize: 14)),
                          const SizedBox(width: 15)
                        ]),
                        const SizedBox(height: 12),
                      ]
                    : [],
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
                  Text("${logic.bean!.currency}", style: const TextStyle(color: Color(0xff333333), fontSize: 14)),
                  const SizedBox(width: 15)
                ]),
                const SizedBox(height: 12),
                Row(children: [
                  const SizedBox(width: 15),
                  const Text("交易卡余额", style: TextStyle(color: Color(0xff666666), fontSize: 14)),
                  const Spacer(),
                  Text(NumberFormat("#,##0.00", "en_US").format(logic.bean!.balance),
                      style: const TextStyle(color: Color(0xff333333), fontSize: 14)),
                  const SizedBox(width: 15)
                ]),

                /// 对方账户信息 todo 有时候会没有
                Column(children: [
                  const SizedBox(height: 6),
                  const Divider(height: 0, indent: 15, endIndent: 15, color: Color(0xffeeeeee)),
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
                const Divider(height: 0, indent: 15, endIndent: 15, color: Color(0xffeeeeee)),
                const SizedBox(height: 5),
                Row(children: [
                  const SizedBox(width: 15),
                  const Text("查询完整交易卡号或账户", style: TextStyle(color: Color(0xff666666), fontSize: 14)),
                  const Spacer(),
                  CupertinoSwitch(value: false, onChanged: (value) {}),
                  const SizedBox(width: 10)
                ]),
                const SizedBox(height: 5)
              ])),
          Visibility(
              visible: logic.bean!.isOrder,
              child: Container(
                  alignment: Alignment.center,
                  height: 60,
                  child: const Text("对该笔订单有疑问？立即咨询",
                      style: TextStyle(color: Colors.blue, fontSize: 16, fontWeight: FontWeight.w500))))
        ])));
  }
}
