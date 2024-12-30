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
        color: Colors.white,
        child: Row(children: [
          GestureDetector(
              onTap: onSelectUser?.call,
              child: Row(mainAxisSize: MainAxisSize.min, children: [
                Text(userName ?? Get.find<GlobalController>().starName,
                    style: const TextStyle(color: Colors.black, fontSize: 13)),
                const Icon(Icons.arrow_drop_up)
              ])),
          GestureDetector(
              onTap: onSelectAccount?.call,
              child: Row(children: [
                Text(account ?? "全部账户",
                    style: TextStyle(color: account != null || index == 1 ? Colors.red : Colors.black, fontSize: 13)),
                Icon(Icons.arrow_drop_up, color: account != null || index == 1 ? Colors.red : Colors.black)
              ])),
          GestureDetector(
              onTap: onFilter?.call,
              child: Row(children: [
                Text("筛选",
                    style: TextStyle(color: filterNumber > 0 || index == 2 ? Colors.red : Colors.black, fontSize: 13)),
                filterNumber == 0
                    ? const SizedBox()
                    : Image.asset("assets/images/detail/数字-$filterNumber.png", width: 13),
                Icon(Icons.arrow_drop_up, color: filterNumber > 0 || index == 2 ? Colors.red : Colors.black)
              ])),
          GestureDetector(
              onTap: onSelectTime?.call,
              child: Row(children: [
                Text(time ?? "选择时间",
                    maxLines: 2,
                    style: TextStyle(
                        color: time != null && time != "" || index == 3 ? Colors.red : Colors.black, fontSize: 13)),
                Icon(Icons.arrow_drop_up, color: time != null || index == 3 ? Colors.red : Colors.black)
              ]))
        ]));
  }

  @override
  Size get preferredSize => const Size.fromHeight(50);
}
