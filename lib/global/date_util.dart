import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateUtil {
  static List<String> weekDays = ['周一', '周二', '周三', '周四', '周五', '周六', '周日'];

  static String getWeekDay(String date) {
    return weekDays[DateTime.parse(date).weekday - 1];
  }

  static Color getWeekDayColor(String date) {
    return DateTime.parse(date).weekday <= 5 ? const Color(0xff656E8A) : const Color(0xff3268E1);
  }

  static String getDateTimeFromMs(int ms, String f) {
    return DateFormat(f).format(DateTime.fromMillisecondsSinceEpoch(ms));
  }

  static String getDateTimeFromDateTime(DateTime dateTime, String f) {
    return DateFormat(f).format(dateTime);
  }

  static String getTimeFromDateTime(DateTime dateTime, String f) {
    return DateFormat(f).format(dateTime);
  }

  static String getTimeFromString(String time, String f) {
    return DateFormat(f).format(DateTime.parse(time));
  }

  /// 计算给定日期前N个月的同一天的日期
  static DateTime calculateOffsetDate(int monthsOffset, {DateTime? date}) {
    date ??= DateTime.now();

    int year = date.year;
    int month = date.month - monthsOffset;

    while (month <= 0) {
      month += 12;
      year -= 1;
    }

    int day = date.day;
    int daysInTargetMonth = DateTime(year, month + 1, 0).day;
    if (day > daysInTargetMonth) {
      day = daysInTargetMonth;
    }

    return DateTime(year, month, day);
  }

  /// 计算某天前一年的同一天日期
  static DateTime calculateSameDayPreviousYear({DateTime? date}) {
    date ??= DateTime.now();

    // 获取当前日期的年、月、日
    int year = date.year;
    int month = date.month;
    int day = date.day;

    // 计算前一年的年、月
    int previousYear = year - 1;

    // 检查是否是闰年的 2 月 29 日
    if (month == 2 && day == 29) {
      // 如果前一年是平年，返回 2 月 28 日
      bool isLeapYear = (previousYear % 4 == 0 && previousYear % 100 != 0) || (previousYear % 400 == 0);
      return DateTime(previousYear, 2, isLeapYear ? 29 : 28);
    }

    // 默认返回前一年的同一天
    return DateTime(previousYear, month, day);
  }

  static bool isSameDay(DateTime date1, DateTime date2) {
    return date1.year == date2.year && date1.month == date2.month && date1.day == date2.day;
  }

  static int getFirstDayOfCurrentMonth(DateTime date) {
    return DateTime(date.year, date.month, 1).millisecondsSinceEpoch;
  }

  static int getLastDayOfCurrentMonth(DateTime date) {
    return DateTime(date.year, date.month + 1, 0, 23, 59, 59).millisecondsSinceEpoch;
  }
}
