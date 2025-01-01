import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icbc/main.dart';

class FilterBottomView extends StatelessWidget implements PreferredSizeWidget {
  final VoidCallback? onSelectUser;
  final String? userName;
  final VoidCallback? onSelectAccount;
  final String? account;
  final VoidCallback? onSelectTime;
  final String? time;
  final VoidCallback? onFilter;
  final int filterNumber;
  final int index;

  const FilterBottomView(
      {super.key,
      this.onSelectUser,
      this.userName,
      this.onSelectAccount,
      this.account,
      this.onSelectTime,
      this.time,
      this.onFilter,
      this.filterNumber = 0,
      this.index = 0});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 45,
        color: Colors.white,
        child: Row(children: [
          const SizedBox(width: 15),
          GestureDetector(
              onTap: onSelectUser?.call,
              child: Row(mainAxisSize: MainAxisSize.min, children: [
                Text(userName ?? Get.find<GlobalController>().starName,
                    style: const TextStyle(color: Colors.black, fontSize: 12)),
                Image.asset("assets/images/detail/pull_down_arrows.png", width: 15)
              ])),
          const SizedBox(width: 5),
          GestureDetector(
              onTap: onSelectAccount?.call,
              child: Row(children: [
                Text(account ?? "全部账户",
                    style: TextStyle(color: account != null || index == 1 ? Colors.red : Colors.black, fontSize: 12)),
                Image.asset(
                    account != null || index == 1
                        ? "assets/images/detail/pull_down_red_arrows.webp"
                        : "assets/images/detail/pull_down_arrows.png",
                    width: 15)
              ])),
          const SizedBox(width: 5),
          GestureDetector(
              onTap: onFilter?.call,
              child: Row(children: [
                Text("筛选",
                    style: TextStyle(color: filterNumber > 0 || index == 2 ? Colors.red : Colors.black, fontSize: 12)),
                filterNumber == 0
                    ? const SizedBox()
                    : Image.asset("assets/images/detail/数字-$filterNumber.png", width: 13),
                Image.asset(
                    filterNumber > 0 || index == 2
                        ? "assets/images/detail/pull_down_red_arrows.webp"
                        : "assets/images/detail/pull_down_arrows.png",
                    width: 15)
              ])),
          const SizedBox(width: 5),
          GestureDetector(
              onTap: onSelectTime?.call,
              child: Row(children: [
                Text(time ?? "选择时间",
                    maxLines: 2,
                    style: TextStyle(
                        color: time != null && time != "" || index == 3 ? Colors.red : Colors.black,
                        fontSize: 12,
                        height: 1)),
                Image.asset(
                    time != null || index == 3
                        ? "assets/images/detail/pull_down_red_arrows.webp"
                        : "assets/images/detail/pull_down_arrows.png",
                    width: 15)
              ]))
        ]));
  }

  @override
  Size get preferredSize => const Size.fromHeight(45);
}
