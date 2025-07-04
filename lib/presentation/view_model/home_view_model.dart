import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:hrisapp/presentation/widgets/attendance_calendar.dart';
import 'package:hrisapp/presentation/widgets/custom_end_drawer.dart';
import 'package:hrisapp/presentation/widgets/experience_card.dart';
import 'package:hrisapp/presentation/widgets/leaves_card.dart';
import 'package:hrisapp/presentation/widgets/miscellaneous_info_card.dart';
import 'package:hrisapp/presentation/widgets/monthly_status_card.dart';
import 'package:hrisapp/presentation/widgets/mvp_stats_card.dart';
import 'package:hrisapp/presentation/widgets/perks_card.dart';
//import 'package:hrisapp/presentation/widgets/user_account_info.dart';
//import 'package:hrisapp/presentation/widgets/user_profile_card.dart';
//import 'package:hrisapp/presentation/widgets/work_buttons.dart';
import 'package:intl/intl.dart';

class HomeViewModel with ChangeNotifier {
  DateTime _selectedDate = DateTime.now();

  DateTime get selectedDate => _selectedDate;

  List<String> get months => List.generate(
      12, (index) => DateFormat('MMMM').format(DateTime(0, index + 1)));

  List<int> get years =>
      List.generate(10, (index) => DateTime.now().year - 5 + index);

  void updateSelectedDate({String? month, int? year}) {
    final newMonth =
        month != null ? months.indexOf(month) + 1 : _selectedDate.month;
    final newYear = year ?? _selectedDate.year;
    _selectedDate = DateTime(newYear, newMonth);
    notifyListeners();
  }

  List<AttendanceDay> get attendanceDaysForSelectedMonth {
    final daysInMonth =
        DateTime(_selectedDate.year, _selectedDate.month + 1, 0).day;
    final firstDayOfMonth =
        DateTime(_selectedDate.year, _selectedDate.month, 1);
    final List<AttendanceDay> days = [];

    // This is sample data. In a real app, this would come from an API call
    // based on the _selectedDate.
    final sampleData = {
      23: AttendanceDay(
          dayName: 'Monday',
          dayDate: 23,
          timeIn: '10:20 AM',
          timeOut: '6:54 PM',
          status: 'Approved',
          isLate: true),
      24: AttendanceDay(
          dayName: 'Tuesday',
          dayDate: 24,
          timeIn: '10:43 AM',
          timeOut: '6:20 PM',
          status: 'Approved',
          isLate: true),
      25: AttendanceDay(
          dayName: 'Wednesday',
          dayDate: 25,
          timeIn: '9:15 AM',
          timeOut: '5:45 PM',
          status: 'Approved'),
      26: AttendanceDay(
          dayName: 'Thursday',
          dayDate: 26,
          timeIn: '11:32 AM',
          timeOut: '8:55 PM',
          status: 'Approved',
          isLate: true),
      27: AttendanceDay(
          dayName: 'Friday',
          dayDate: 27,
          timeIn: '9:14 AM',
          timeOut: '4:40 PM',
          status: 'Approved',
          isLate: true),
    };

    for (int i = 1; i <= daysInMonth; i++) {
      final date = DateTime(_selectedDate.year, _selectedDate.month, i);
      final dayName = DateFormat('EEEE').format(date);
      final isWeekend =
          date.weekday == DateTime.saturday || date.weekday == DateTime.sunday;

      if (sampleData.containsKey(i)) {
        days.add(sampleData[i]!);
      } else {
        days.add(AttendanceDay(
          dayName: dayName,
          dayDate: i,
          isWeekend: isWeekend,
        ));
      }
    }
    return days;
  }

  // Data for all the widgets on the home screen

  final List<DrawerMenuItemData> menuItems = [
    DrawerMenuItemData(
        icon: Icons.dashboard_outlined, title: 'Dashboard', onTap: () {}),
    DrawerMenuItemData(
        icon: Icons.event_note_outlined, title: 'Attendance', onTap: () {}),
    DrawerMenuItemData(
        icon: Icons.calendar_today_outlined, title: 'Leave', onTap: () {}),
    DrawerMenuItemData(
        icon: Icons.airplanemode_active_outlined,
        title: 'Travel',
        onTap: () {}),
    DrawerMenuItemData(
        icon: Icons.account_tree_outlined, title: 'HCD Portal', onTap: () {}),
    DrawerMenuItemData(
        icon: Icons.access_time_outlined, title: 'Late Sitting', onTap: () {}),
    DrawerMenuItemData(
        icon: Icons.analytics_outlined, title: 'Reports', onTap: () {}),
    DrawerMenuItemData(
        icon: Icons.description_outlined, title: 'CFS', onTap: () {}),
    DrawerMenuItemData(icon: Icons.school_outlined, title: 'TNA', onTap: () {}),

    // ... other menu items
  ];

  final experienceData = ExperienceData(
    title: 'Experience',
    details: [
      {'Total Experience': '0 Year, 0 Month'},
      {'NETSOL Experience': '0 Year, 0 Month'},
      // ... other experience details
    ],
  );

  final List<LeaveItemData> leavesData = [
    LeaveItemData(color: Colors.orange, title: 'Annual', value: '0/0'),
    // ... other leave items
  ];

  final mvpStatsData = [
    MvpStat(
        title: 'Most Valuable Person - Ascent', color: Colors.yellow, value: 0),
    MvpStat(title: '............', color: Colors.brown, value: 1),
    // ... other mvp stats
  ];

  final perksData = [
    Perk(
        icon: Icons.attach_money,
        title: 'No profit required on my PF Contributions',
        hasCheckbox: true),
    Perk(
        icon: Icons.attach_money,
        title: 'Provident Fund Ba...',
        subtitle: 'Provident Fund Lo...'),
    Perk(icon: Icons.add_circle_outline, title: 'OPD Reimbursement Balance'),
  ];

  final miscellaneousInfoData = [
    MiscInfoItem(label: 'Extension', value: ''),
    MiscInfoItem(label: 'Desk Number', value: ''),
    MiscInfoItem(label: 'NCF', value: '0', type: MiscInfoType.dropdown),
    MiscInfoItem(label: 'Passport Expiry', value: '', type: MiscInfoType.date),
  ];

  MonthlyStatusData get monthlyStatusData {
    return MonthlyStatusData(
      title: 'Monthly Status',
      maxY: 10,
      legends: [
        {'Absents': Colors.pink},
        {'Leaves': Colors.blue},
      ],
      barGroups: [
        _makeGroupData(0, 0, 0),
        _makeGroupData(1, 0, 0),
        _makeGroupData(2, 0, 0),
        _makeGroupData(3, 0, 0),
        _makeGroupData(4, 3, 0),
        _makeGroupData(5, 5, 0),
      ],
    );
  }

  BarChartGroupData _makeGroupData(int x, double y1, double y2) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(toY: y1, color: Colors.pink, width: 7),
        BarChartRodData(toY: y2, color: Colors.blue, width: 7),
      ],
    );
  }
}
