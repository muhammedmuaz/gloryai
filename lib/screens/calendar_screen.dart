import 'package:flutter/material.dart';
import 'package:gloryai/const/design_const.dart';
import 'package:gloryai/generic_widgets/image/gloryai_asset_image.dart';
import 'package:gloryai/generic_widgets/screen_widgets/screen_padding.dart';
import 'package:gloryai/routing/app_navigator.dart';
import 'package:gloryai/routing/app_route_names.dart';
import 'package:gloryai/screens/calendar_schedule_alarm_screen.dart';
import 'package:gloryai/services/app_images.dart';
import 'package:gloryai/services/helper_widgets/add_height.dart';
import 'package:gloryai/utils/screen_helper.dart';
import 'package:intl/intl.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  final DateTime _currentDate = DateTime.now();
  DateTime _displayedMonth = DateTime.now();
  int? _selectedDay;

  @override
  void initState() {
    super.initState();
    _selectedDay = _currentDate.day;
  }

  void _previousMonth() {
    setState(() {
      _displayedMonth = DateTime(
        _displayedMonth.year,
        _displayedMonth.month - 1,
      );
      _selectedDay = null;
    });
  }

  void _nextMonth() {
    setState(() {
      _displayedMonth = DateTime(
        _displayedMonth.year,
        _displayedMonth.month + 1,
      );
      _selectedDay = null;
    });
  }

  void _selectDay(int day) {
    setState(() {
      _selectedDay = day;
    });

    // Create the selected date
    final selectedDate = DateTime(
      _displayedMonth.year,
      _displayedMonth.month,
      day,
    );

    // Navigate to the schedule screen with the selected date
    Navigator.push(
      context,
      MaterialPageRoute(
        builder:
            (context) =>
                CalendarScheduleAlarmScreen(selectedDate: selectedDate),
      ),
    );
  }

  List<Widget> _buildWeekRows() {
    List<Widget> rows = [];
    final firstDayOfMonth = DateTime(
      _displayedMonth.year,
      _displayedMonth.month,
      1,
    );
    final lastDayOfMonth = DateTime(
      _displayedMonth.year,
      _displayedMonth.month + 1,
      0,
    );
    final daysInMonth = lastDayOfMonth.day;

    // Calculate offset for first day (0=Sunday, 1=Monday, etc.)
    int startingOffset = firstDayOfMonth.weekday % 7; // Makes Sunday=0

    // Previous month's days

    final previousMonthLastDay =
        DateTime(_displayedMonth.year, _displayedMonth.month, 0).day;

    List<Widget> currentWeekChildren = [];

    // Add previous month's days
    for (int i = 0; i < startingOffset; i++) {
      currentWeekChildren.add(
        _buildDate(
          (previousMonthLastDay - startingOffset + i + 1).toString(),
          isPreviousMonth: true,
        ),
      );
    }

    // Current month's days
    for (int day = 1; day <= daysInMonth; day++) {
      bool isCurrentDay =
          day == _currentDate.day &&
          _displayedMonth.month == _currentDate.month &&
          _displayedMonth.year == _currentDate.year;

      bool isSelected = day == _selectedDay;

      currentWeekChildren.add(
        _buildDate(
          day.toString(),
          isCurrentDay: isCurrentDay,
          isSelected: isSelected,
          onTap: () => _selectDay(day),
        ),
      );

      // Start new row after Saturday (6th day)
      if ((day + startingOffset) % 7 == 0 || day == daysInMonth) {
        // Add next month's days to fill the week
        int daysAdded = day + startingOffset;
        int daysNeeded = 7 - (daysAdded % 7);
        if (daysNeeded < 7) {
          for (int i = 1; i <= daysNeeded; i++) {
            currentWeekChildren.add(
              _buildDate(i.toString(), isNextMonth: true),
            );
          }
        }

        rows.add(Expanded(child: Row(children: currentWeekChildren)));
        currentWeekChildren = [];
      }
    }

    return rows;
  }

  Widget _buildDate(
    String day, {
    bool isCurrentDay = false,
    bool isSelected = false,
    bool isPreviousMonth = false,
    bool isNextMonth = false,
    VoidCallback? onTap,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Center(
          child: Container(
            padding: EdgeInsets.all(5.0),
            margin: const EdgeInsets.all(2),
            decoration:
                isCurrentDay
                    ? const BoxDecoration(
                      color: Color(0xFFE5A29F),
                      shape: BoxShape.circle,
                    )
                    : isSelected
                    ? BoxDecoration(
                      border: Border.all(
                        color: const Color(0xFFE5A29F),
                        width: 1,
                      ),
                      shape: BoxShape.circle,
                    )
                    : null,
            child: Center(
              child: Text(
                day,
                style: TextStyle(
                  color:
                      isPreviousMonth || isNextMonth
                          ? const Color(0xFFE5A29F).withOpacity(0.6)
                          : isCurrentDay
                          ? DesignConstants.kTextPurpleColor
                          : const Color(0xFF3E1C67),
                  fontSize: 16,
                  fontWeight:
                      isCurrentDay ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = ScreenHelper.getScreenCompleteHeight(context);
    final width = ScreenHelper.getScreenWidth(context);
    final monthName =
        _displayedMonth.month == _currentDate.month &&
                _displayedMonth.year == _currentDate.year
            ? _getCurrentMonthName()
            : DateFormat('MMMM').format(_displayedMonth);

    return SafeArea(
      child: ScreenPadding(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: width * 0.35,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 45,
                        width: 45,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.0),
                          color: DesignConstants.kHomeBoxColor2,
                        ),
                        child: Icon(Icons.menu, color: Colors.white, size: 30),
                      ),
                      SizedBox(width: 10.0),

                      GestureDetector(
                        onTap: () {
                          AppNavigation.navigateTo(
                            AppRoutesNames.notificationListScreen,
                          );
                        },
                        child: Container(
                          height: 45,
                          width: 45,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.0),
                            color: DesignConstants.kHomeBoxColor2,
                          ),
                          child: Icon(
                            Icons.notifications,
                            color: DesignConstants.kTextLightColor,
                            size: 30,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: height * 0.1,
                  child: GloryAiAssetImage(
                    imagePath: AppImages.appLogoHomePage,
                  ),
                ),
                Expanded(child: SizedBox()),
                Container(
                  height: 55,
                  width: 55,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    color: DesignConstants.kTextLightColor,
                  ),
                  child: Icon(
                    Icons.tag_faces_outlined,
                    color: Colors.white,
                    size: 32,
                  ),
                ),
              ],
            ),
            AddHeight(0.1),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "$monthName ${_displayedMonth.year.toString()}",
                  style: const TextStyle(
                    color: DesignConstants.kTextPurpleColor,
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: _previousMonth,
                      child: Icon(
                        Icons.arrow_back_ios_new_outlined,
                        color: DesignConstants.kTextLightColor,
                      ),
                    ),
                    SizedBox(width: 8),
                    GestureDetector(
                      onTap: _nextMonth,
                      child: Icon(
                        Icons.arrow_forward_ios_outlined,
                        color: DesignConstants.kTextLightColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            AddHeight(0.02),
            SizedBox(
              height: height * 0.32,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: const [
                        Text(
                          "S",
                          style: TextStyle(
                            color: Color(0xFF3E1C67),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "M",
                          style: TextStyle(
                            color: Color(0xFF3E1C67),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "T",
                          style: TextStyle(
                            color: Color(0xFF3E1C67),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "W",
                          style: TextStyle(
                            color: Color(0xFF3E1C67),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "T",
                          style: TextStyle(
                            color: Color(0xFF3E1C67),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "F",
                          style: TextStyle(
                            color: Color(0xFF3E1C67),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "S",
                          style: TextStyle(
                            color: Color(0xFF3E1C67),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Column(children: _buildWeekRows()),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _getCurrentMonthName() {
    switch (_currentDate.month) {
      case 1:
        return 'January';
      case 2:
        return 'February';
      case 3:
        return 'March';
      case 4:
        return 'April';
      case 5:
        return 'May';
      case 6:
        return 'June';
      case 7:
        return 'July';
      case 8:
        return 'August';
      case 9:
        return 'September';
      case 10:
        return 'October';
      case 11:
        return 'November';
      case 12:
        return 'December';
      default:
        return '';
    }
  }
}
