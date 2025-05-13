import 'dart:math';

import 'package:flutter/material.dart';
import 'package:gloryai/const/design_const.dart';
import 'package:gloryai/generic_widgets/image/gloryai_asset_image.dart';
import 'package:gloryai/generic_widgets/screen_widgets/screen_padding.dart';
import 'package:gloryai/models/bible_books_model.dart';
import 'package:gloryai/routing/app_navigator.dart';
import 'package:gloryai/routing/app_route_names.dart';
import 'package:gloryai/services/app_images.dart';
import 'package:gloryai/services/helper_widgets/add_height.dart';
import 'package:gloryai/utils/screen_helper.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class GloryInsightsScreen extends StatefulWidget {
  const GloryInsightsScreen({super.key});

  @override
  State<GloryInsightsScreen> createState() => _GloryInsightsScreenState();
}

class _GloryInsightsScreenState extends State<GloryInsightsScreen> {
  final DateTime _currentDate = DateTime.now();
  DateTime _displayedMonth = DateTime.now();
  int? _selectedDay;

  @override
  void initState() {
    super.initState();
    _generateData();
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
            padding: EdgeInsets.all(1.0),
            margin: const EdgeInsets.all(1),
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
                  fontSize: 12,
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


  late List<ChartData> _chartData;
  final Random _random = Random();
  final List<String> _months = ['September', 'October', 'November'];

   void _generateData() {
    _chartData = List.generate(30, (index) {
      final date = DateTime(2023, 9, 1).add(Duration(days: index));
      final monthIndex = date.month - 9; // Get index for our months list
      final monthName = _months[monthIndex];
      return ChartData(
        date,
        _random.nextDouble() * 100,
        monthName,
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    final height = ScreenHelper.getScreenCompleteHeight(context);
    final width = ScreenHelper.getScreenWidth(context);
    final screenWidth = MediaQuery.of(context).size.width;
    final isSmallScreen =
        screenWidth < 600; // Example breakpoint for small screens

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: DesignConstants.kBackgroundStartColor,
        ),
        child: SafeArea(
          child: ScreenPadding(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                            child: Icon(
                              Icons.menu,
                              color: Colors.white,
                              size: 30,
                            ),
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
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Glory Insight of Your Progress',
                          style: Theme.of(
                            context,
                          ).textTheme.bodyMedium!.copyWith(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: DesignConstants.kTextPurpleColor,
                          ),
                        ),
                        SizedBox(height: 4),
                        Container(
                          width: double.maxFinite,
                          padding: const EdgeInsets.only(
                            top: 2.5,
                            left: 2.5,
                            right: 2.5,
                            bottom: 10.0,
                          ),
                          decoration: BoxDecoration(
                            color: DesignConstants.kTextLightColor,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Container(
                            width: double.maxFinite,
                            padding: const EdgeInsets.symmetric(
                              vertical: 12.0,
                              horizontal: 18.0,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment:
                                  CrossAxisAlignment
                                      .start, // Align text to the start
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    GloryAiAssetImage(
                                      imagePath: AppImages.smileIcon,
                                    ),
                                    const SizedBox(width: 10),
                                    Expanded(
                                      child: Text(
                                        'You are a devoted student of the Holy Scriptures, and the measure of your devotion is moderate advanced.',
                                        style: Theme.of(
                                          context,
                                        ).textTheme.bodyMedium!.copyWith(
                                          fontSize:
                                              isSmallScreen
                                                  ? 14
                                                  : 16, // Adjust font size
                                          fontWeight: FontWeight.w500,
                                          color:
                                              DesignConstants.kTextPurpleColor,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        AddHeight(0.012),
                        Container(
                          width: double.maxFinite,
                          padding: EdgeInsets.only(
                            top: 2.5,
                            left: 2.5,
                            right: 2.5,
                            bottom: 10.0,
                          ),
                          decoration: BoxDecoration(
                            color: DesignConstants.kTextLightColor,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Container(
                            width: double.maxFinite,
                            padding: EdgeInsets.symmetric(
                              vertical: 12.0,
                              horizontal: 18.0,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Column(
                              mainAxisSize:
                                  MainAxisSize
                                      .min, // Make sure this is still here
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Flexible(
                                  // Changed from Expanded to Flexible
                                  fit: FlexFit.loose, // Added FlexFit.loose
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      GloryAiAssetImage(
                                        imagePath: AppImages.smileIconWithStar,
                                      ),
                                      SizedBox(width: 10),
                                      Expanded(
                                        // Keep Expanded for the text column to take remaining width
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'How to Advance in Journeyer?',
                                              style: Theme.of(
                                                context,
                                              ).textTheme.bodyMedium!.copyWith(
                                                fontSize:
                                                    isSmallScreen ? 16 : 18,
                                                fontWeight: FontWeight.bold,
                                                color:
                                                    DesignConstants
                                                        .kTextPurpleColor,
                                              ),
                                            ),
                                            SizedBox(height: 3),
                                            Text(
                                              'Advancing in Glory can mean achieving greater spiritual depth, closeness to God, or better understanding of faith.',
                                              style: Theme.of(
                                                context,
                                              ).textTheme.bodyMedium!.copyWith(
                                                fontSize:
                                                    isSmallScreen ? 14 : 16,
                                                fontWeight: FontWeight.w500,
                                                color:
                                                    DesignConstants
                                                        .kTextPurpleColor,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 8),
                                Container(
                                  width: double.maxFinite,
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 16.0,
                                    vertical: 8.0,
                                  ),
                                  decoration: BoxDecoration(
                                    color: DesignConstants.kLightColor,
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(width: 5),
                                      Expanded(
                                        child: Text(
                                          'Here are some steps that can help on this journey:',
                                          style: Theme.of(
                                            context,
                                          ).textTheme.bodyMedium!.copyWith(
                                            fontSize: isSmallScreen ? 14 : 16,
                                            fontWeight: FontWeight.bold,
                                            color:
                                                DesignConstants
                                                    .kTextPurpleColor,
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 10),
                                      Icon(
                                        Icons.arrow_forward_ios_rounded,
                                        color: DesignConstants.kTextLightColor,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        AddHeight(0.015),
                        Container(
                          width: double.maxFinite,
                          padding: EdgeInsets.symmetric(
                            horizontal: 16.0,
                            vertical: 8.0,
                          ),
                          decoration: BoxDecoration(
                            color: DesignConstants.kLightDarkColor,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(width: 5),
                              Expanded(
                                child: Text(
                                  'Your mental state at the given level',
                                  style: Theme.of(
                                    context,
                                  ).textTheme.bodyMedium!.copyWith(
                                    fontSize: isSmallScreen ? 14 : 16,
                                    fontWeight: FontWeight.bold,
                                    color: DesignConstants.kTextPurpleColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        AddHeight(0.015),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: List.generate(mentalStates.length, (i) {
                              final mentalState = mentalStates[i];
                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 5,
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    GloryAiAssetImage(
                                      imagePath: mentalState.imgUrl,
                                    ),
                                    SizedBox(height: 8),
                                    Text(
                                      mentalState.name,
                                      style: Theme.of(
                                        context,
                                      ).textTheme.bodyMedium!.copyWith(
                                        fontSize: isSmallScreen ? 14 : 16,
                                        fontWeight: FontWeight.w500,
                                        color: DesignConstants.kTextPurpleColor,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }),
                          ),
                        ),
                        AddHeight(0.015),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            _buildArrowButton(
                              context,
                              icon: AppImages.leftArrowIcon,
                              isLeft: true,
                              onPressed: () {},
                            ),
                            SizedBox(width: 18),
                            Expanded(
                              child: Divider(
                                height: 1,
                                color: DesignConstants.kTextLightColor,
                              ),
                            ),
                            SizedBox(width: 18),
                            _buildArrowButton(
                              context,
                              icon: AppImages.rightArrowIcon,
                              isLeft: false,
                              onPressed: () {},
                            ),
                          ],
                        ),
                        AddHeight(0.005),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Your level depend on your activities',
                              style: Theme.of(
                                context,
                              ).textTheme.bodyMedium!.copyWith(
                                fontSize: isSmallScreen ? 16 : 18,
                                fontWeight: FontWeight.bold,
                                color: DesignConstants.kTextLightColor,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                          ],
                        ),
                        AddHeight(0.015),
                        Row(
                          children: [
                            Expanded(child: SizedBox()),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'Advancing in Glory.ai is a personal and individual journey,and everyone has their own way of navigating it.',
                                    style: Theme.of(
                                      context,
                                    ).textTheme.bodyMedium!.copyWith(
                                      fontSize: isSmallScreen ? 14 : 16,
                                      fontWeight: FontWeight.w600,
                                      color: DesignConstants.kTextPurpleColor,
                                    ),
                                  ),
                                  AddHeight(0.01),
                                  Text(
                                    'The important thing is to be persistent, open, and sincere in your search.',
                                    style: Theme.of(
                                      context,
                                    ).textTheme.bodyMedium!.copyWith(
                                      fontSize: isSmallScreen ? 14 : 16,
                                      fontWeight: FontWeight.w600,
                                      color: DesignConstants.kTextPurpleColor,
                                    ),
                                  ),
                                  AddHeight(0.01),
                                  Text(
                                    'If you have specific questions about any of these steps, feel free to ask Glory.ai',
                                    style: Theme.of(
                                      context,
                                    ).textTheme.bodyMedium!.copyWith(
                                      fontSize: isSmallScreen ? 12 : 14,
                                      fontWeight: FontWeight.w600,
                                      color: DesignConstants.kTextGreenColor,
                                      decoration: TextDecoration.underline,

                                      decorationColor:
                                          DesignConstants.kTextGreenColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),

                        // Your level depend on your activities
                        AddHeight(0.015),

                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                height: height * 0.2,
                                width: double.maxFinite,
                                padding: const EdgeInsets.only(
                                  top: 2.5,
                                  left: 2.5,
                                  right: 2.5,
                                  bottom: 10.0,
                                ),
                                decoration: BoxDecoration(
                                  color: DesignConstants.kTextLightColor,
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Container(
                                  width: double.maxFinite,
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 12.0,
                                    horizontal: 18.0,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 8,
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
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
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 2,
                                          ),
                                          child: Column(
                                            children: _buildWeekRows(),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 12.0),
                        
                        
                            Expanded(
                              child: Container(
                                width: double.maxFinite,
                                padding: const EdgeInsets.only(
                                  top: 2.5,
                                  left: 2.5,
                                  right: 2.5,
                                  bottom: 10.0,
                                ),
                                decoration: BoxDecoration(
                                  color: DesignConstants.kTextLightColor,
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Container(
                                  width: double.maxFinite,
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 12.0,
                                    horizontal: 18.0,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment
                                            .start, // Align text to the start
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Apprentice:',
                                            style: Theme.of(
                                              context,
                                            ).textTheme.bodyMedium!.copyWith(
                                              fontSize:
                                                  isSmallScreen
                                                      ? 16
                                                      : 18, // Adjust font size
                                              fontWeight: FontWeight.w600,
                                              color:
                                                  DesignConstants
                                                      .kTextPurpleColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 10.0),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            height: 30,
                                            width: 30,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                width: 1.2,
                                                color: DesignConstants.kShilo,
                                              ),
                                            ),
                                          ),
                                          Container(
                                            height: 30,
                                            width: 30,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                width: 1.2,
                                                color: DesignConstants.kShilo,
                                              ),
                                            ),
                                          ),
                                          Container(
                                            height: 30,
                                            width: 30,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                width: 1.2,
                                                color: DesignConstants.kShilo,
                                              ),
                                            ),
                                          ),
                                          Container(
                                            height: 30,
                                            width: 30,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                width: 1.2,
                                                color: DesignConstants.kShilo,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 15),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          GloryAiAssetImage(
                                            imagePath: AppImages.smileIcon,
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 5),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            'devoted',
                                            style: Theme.of(
                                              context,
                                            ).textTheme.bodyMedium!.copyWith(
                                              fontSize:
                                                  isSmallScreen
                                                      ? 14
                                                      : 16, // Adjust font size
                                              fontWeight: FontWeight.w600,
                                              color:
                                                  DesignConstants
                                                      .kTextPurpleColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                        
                        
                          ],
                        ),
    
    
    
            //             AddHeight(0.015),
            //             Container(
            //               height: height*0.3,
            //               width: double.maxFinite,
            //               child: Column(
            //                 mainAxisAlignment: MainAxisAlignment.start,
            //                 crossAxisAlignment: CrossAxisAlignment.start,
            //                 children: [
            //                     Expanded(
            //   child: Container(
            //     padding: EdgeInsets.all(12.0),
            //     decoration: BoxDecoration(
            //       color: DesignConstants.kGraphBackgroundColor,
            //       borderRadius: BorderRadius.circular(12),
            //       boxShadow: [
            //         BoxShadow(
            //           color: Colors.grey.withOpacity(0.2),
            //           spreadRadius: 2,
            //           blurRadius: 8,
            //           offset: const Offset(0, 4),
            //         ),
            //       ],
            //     ),
            //     child: Column(
            //       children: [
            //        Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //   children: _months.map((month) {
            //     return Text(month);
            //   }).toList(),
            // ),
            //         SfCartesianChart(
            //           // Remove all borders and backgrounds
            //           plotAreaBorderWidth: 0,
            //           margin: EdgeInsets.zero,
                      
            //           // X Axis - completely hidden
            //           primaryXAxis: DateTimeAxis(
            //             isVisible: false,  // Hide entire x-axis
            //             majorGridLines: const MajorGridLines(width: 0),
            //           ),
                      
            //           // Y Axis - completely hidden
            //           primaryYAxis: NumericAxis(
            //             isVisible: false,  // Hide entire y-axis
            //             majorGridLines: const MajorGridLines(width: 0),
            //           ),
                      
            //           // Series configuration
            //           series: <CartesianSeries<ChartData, DateTime>>[
            //             LineSeries<ChartData, DateTime>(
            //               dataSource: _chartData,
            //               xValueMapper: (ChartData data, _) => data.date,
            //               yValueMapper: (ChartData data, _) => data.value,
            //               color: Colors.blue,
            //               width: 7,
            //               // Remove all markers
            //               markerSettings: const MarkerSettings(isVisible: false),
            //             ),
            //           ],
                      
            //           // Disable tooltip
            //           tooltipBehavior: TooltipBehavior(enable: false),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
          
            //                 ],
            //               ),
            //             ),
    

                        AddHeight(0.15)
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildArrowButton(
    BuildContext context, {
    required String icon,
    required bool isLeft,
    required VoidCallback onPressed,
  }) {
    return Container(
      height: 45,
      width: 45,
      decoration: BoxDecoration(
        color: DesignConstants.kPrimaryLightColor,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(12.0),
          onTap: onPressed,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GloryAiAssetImage(imagePath: icon),
          ),
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

class ChartData {
  final DateTime date;
  final double value;
  final String month;

  ChartData(this.date, this.value, this.month);
}
