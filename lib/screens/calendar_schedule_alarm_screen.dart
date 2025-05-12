import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gloryai/const/design_const.dart';
import 'package:gloryai/generic_widgets/image/gloryai_asset_image.dart';
import 'package:gloryai/generic_widgets/screen_widgets/screen_padding.dart';
import 'package:gloryai/models/appNotification_model.dart';
import 'package:gloryai/providers/notification_provider.dart';
import 'package:gloryai/routing/app_navigator.dart';
import 'package:gloryai/services/app_images.dart';
import 'package:gloryai/services/helper_widgets/add_height.dart';
import 'package:gloryai/utils/screen_helper.dart';
import 'package:intl/intl.dart';

class CalendarScheduleAlarmScreen extends StatefulWidget {
  final DateTime? selectedDate;
  const CalendarScheduleAlarmScreen({super.key, this.selectedDate});

  @override
  State<CalendarScheduleAlarmScreen> createState() =>
      _CalendarScheduleAlarmScreenState();
}

class _CalendarScheduleAlarmScreenState
    extends State<CalendarScheduleAlarmScreen> {
  final NotificationProvider _notificationProvider = Get.put(
    NotificationProvider(),
  );
  DateTime _selectedDate = DateTime.now();
  TimeOfDay _selectedTime = TimeOfDay.now();
  int _selectedMinute = 0;
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _bodyController = TextEditingController();
  final ScrollController _minuteScrollController = ScrollController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _selectedDate = widget.selectedDate ?? DateTime.now();
    _selectedMinute = _selectedTime.minute;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollToMinute();
      _notificationProvider.fetchScheduledNotifications();
    });
  }

  void _scrollToMinute() {
    final itemHeight = 40.0;
    final offset = _selectedMinute * itemHeight;
    _minuteScrollController.animateTo(
      offset,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.dark().copyWith(
            colorScheme: ColorScheme.dark(
              primary: DesignConstants.kTextPurpleColor,
              surface: DesignConstants.kHomeBoxDark,
              onSurface: Colors.white,
            ),
            dialogBackgroundColor: DesignConstants.kHomeBoxDark,
          ),
          child: child!,
        );
      },
    );
    if (picked != null && picked != _selectedTime) {
      setState(() {
        _selectedTime = picked;
        _selectedMinute = picked.minute;
        _scrollToMinute();
      });
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.dark().copyWith(
            colorScheme: ColorScheme.dark(
              primary: DesignConstants.kTextPurpleColor,
              surface: DesignConstants.kHomeBoxDark,
              onSurface: Colors.white,
            ),
            dialogBackgroundColor: DesignConstants.kHomeBoxDark,
          ),
          child: child!,
        );
      },
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
      _notificationProvider.fetchScheduledNotifications();
    }
  }

  Future<void> _scheduleNotification() async {
    if (_formKey.currentState!.validate()) {
      final scheduledDateTime = DateTime(
        _selectedDate.year,
        _selectedDate.month,
        _selectedDate.day,
        _selectedTime.hour,
        _selectedMinute,
      );

      await _notificationProvider.scheduleNotification(
        title: _titleController.text,
        body: _bodyController.text,
        scheduledTime: scheduledDateTime,
        prayerType: 'general',
      );

      // Clear the form and close dialog
      _titleController.clear();
      _bodyController.clear();
      Navigator.pop(context);

      // Refresh the notifications list
      _notificationProvider.fetchScheduledNotifications();
    }
  }

  Widget _buildTimeSlot(TimeOfDay time, List<AppNotification> notifications) {
    final width = ScreenHelper.getScreenWidth(context);
    final matchingNotifications =
        notifications.where((n) {
          final notificationTime = n.scheduledTime;
          return notificationTime.hour == time.hour;
        }).toList();

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: width * 0.12,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "${time.hourOfPeriod} ${time.period == DayPeriod.am ? 'am' : 'pm'}",
                    style: const TextStyle(
                      color: DesignConstants.kTextPurpleColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Divider(
                color: DesignConstants.kTextPurpleColor.withOpacity(0.5),
              ),
            ),
          ],
        ),
        if (matchingNotifications.isNotEmpty)
          ...matchingNotifications.map(
            (notification) => _buildNotificationCard(notification),
          ),
        if (matchingNotifications.isEmpty) _buildAddNotificationButton(time),
      ],
    );
  }

  Widget _buildNotificationCard(AppNotification notification) {
    final width = ScreenHelper.getScreenWidth(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(width: width * 0.12),
        Expanded(
          child: Container(
            // height: 100,
            margin: const EdgeInsets.only(bottom: 10),
            padding: const EdgeInsets.all(12.0),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.0),
              color: DesignConstants.kTextLightCalendarPageColor,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            notification.title,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          GestureDetector(
                            onTap: () async {
                              await _notificationProvider.cancelNotification(
                                notification.id,
                              );
                              _notificationProvider
                                  .fetchScheduledNotifications();
                            },
                            child: GloryAiAssetImage(
                              imagePath: AppImages.menuIconGlory,
                            ),
                          ),
                          // IconButton(
                          //   icon: const Icon(Icons.delete, color: Colors.red),
                          //   onPressed: () async {
                          //   },
                          // ),
                        ],
                      ),
                      const SizedBox(height: 5),
                      Text(
                        notification.body,
                        style: const TextStyle(
                          color: DesignConstants.kTextPurpleColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        DateFormat('h:mm a').format(notification.scheduledTime),
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildAddNotificationButton(TimeOfDay time) {
    final width = ScreenHelper.getScreenWidth(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(width: width * 0.12),
        Expanded(
          child: GestureDetector(
            onTap: () {
              setState(() {
                _selectedTime = time;
                _selectedMinute = 0;
                _showAddNotificationDialog();
              });
            },
            child: Container(
              height: 60,
              margin: const EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0),
                border: Border.all(
                  color: DesignConstants.kTextPurpleColor,
                  width: 1.5,
                ),
              ),
              child: const Center(
                child: Icon(
                  Icons.add,
                  color: DesignConstants.kTextPurpleColor,
                  size: 30,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _showAddNotificationDialog() {
    final double width = ScreenHelper.getScreenWidth(context);

    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            title: Text(
              'Schedule Notification',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: DesignConstants.kTextPurpleColor,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            content: SizedBox(
              width: width * 0.8,
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Title Input Field
                    TextFormField(
                      controller: _titleController,
                      style: const TextStyle(color: DesignConstants.kTextPurpleColor),
                      decoration: InputDecoration(
                        labelText: 'Title',
                        labelStyle: Theme.of(context).textTheme.bodyMedium!
                            .copyWith(color: DesignConstants.kTextPurpleColor),
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: DesignConstants.kTextPurpleColor,
                          ),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: DesignConstants.kTextPurpleColor,
                          ),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a title';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 15),

                    // Description Input Field
                    TextFormField(
                      controller: _bodyController,
                      style: const TextStyle(color: DesignConstants.kTextPurpleColor),
                      decoration: InputDecoration(
                        labelText: 'Description',
                        labelStyle: Theme.of(context).textTheme.bodyMedium!
                            .copyWith(color: DesignConstants.kTextPurpleColor),
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: DesignConstants.kTextPurpleColor,
                          ),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: DesignConstants.kTextPurpleColor,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    // Date and Time Selection Row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: () => _selectDate(context),
                          child: Text(
                            DateFormat('MMM d, y').format(_selectedDate),
                            style: Theme.of(
                              context,
                            ).textTheme.bodyMedium!.copyWith(
                              color: DesignConstants.kTextPurpleColor,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () => _selectTime(context),
                          child: Text(
                            _selectedTime.format(context),
                            style: Theme.of(
                              context,
                            ).textTheme.bodyMedium!.copyWith(
                              color: DesignConstants.kTextPurpleColor,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 10),

                    // Minutes Adjustment Section
                    Text(
                      'Adjust minutes:',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: DesignConstants.kTextPurpleColor,
                        fontSize: 14,
                      ),
                    ),

                    const SizedBox(height: 10),

                    SizedBox(
                      height: 60,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          ListWheelScrollView(
                            controller: _minuteScrollController,
                            itemExtent: 40,
                            perspective: 0.01,
                            diameterRatio: 1.5,
                            onSelectedItemChanged: (index) {
                              setState(() {
                                _selectedMinute = index;
                              });
                            },
                            children: List.generate(60, (index) {
                              final bool isSelected = _selectedMinute == index;
                              return Center(
                                child: Text(
                                  index.toString().padLeft(2, '0'),
                                  style: Theme.of(
                                    context,
                                  ).textTheme.bodyMedium!.copyWith(
                                    color: DesignConstants.kTextPurpleColor,
                                    fontSize: isSelected ? 24 : 18,
                                    fontWeight:
                                        isSelected
                                            ? FontWeight.bold
                                            : FontWeight.normal,
                                  ),
                                ),
                              );
                            }),
                          ),
                          IgnorePointer(
                            child: Center(
                              child: Container(
                                height: 40,
                                decoration: BoxDecoration(
                                  border: Border(
                                    top: BorderSide(
                                      color: DesignConstants.kTextPurpleColor
                                          .withOpacity(0.5),
                                      width: 1,
                                    ),
                                    bottom: BorderSide(
                                      color: DesignConstants.kTextPurpleColor
                                          .withOpacity(0.5),
                                      width: 1,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            actions: [
              // Cancel Button
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text(
                  'Cancel',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: DesignConstants.kTextPurpleColor,
                  ),
                ),
              ),

              // Schedule Button
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: DesignConstants.kTextPurpleColor,
                ),
                onPressed: _scheduleNotification,
                child: Text(
                  'Schedule',
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium!.copyWith(color: Colors.white),
                ),
              ),
            ],
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
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
                
              
                          IconButton(
                            padding: EdgeInsets.zero,
                            onPressed: (){
                            AppNavigation.goBack();
                          }, icon: Icon(
                            Icons.arrow_back_ios_new_outlined,
                            color: Colors.white,
                            size: 30,
                          ),),
                        
                      
                    
             
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Schedule",
                      style: const TextStyle(
                        color: DesignConstants.kTextLightColor,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.add_alarm,
                        color: DesignConstants.kTextLightColor,
                      ),
                      onPressed: _showAddNotificationDialog,
                    ),
                  ],
                ),
                AddHeight(0.01),
                GestureDetector(
                  onTap: () => _selectDate(context),
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text:
                              '${DateFormat('EEEE').format(_selectedDate).toUpperCase()} ',
                          style: Theme.of(
                            context,
                          ).textTheme.labelMedium!.copyWith(
                            color: DesignConstants.kTextGreenColor.withOpacity(
                              0.8,
                            ),
                            fontWeight: FontWeight.w400,
                            fontSize: 28,
                          ),
                        ),
                        TextSpan(
                          text: DateFormat('MMMM d').format(_selectedDate),
                          style: Theme.of(
                            context,
                          ).textTheme.labelMedium!.copyWith(
                            color: DesignConstants.kTextPurpleColor,
                            fontWeight: FontWeight.w700,
                            fontSize: 28,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                AddHeight(0.01),
                Expanded(
                  child: Obx(() {
                    if (_notificationProvider.isLoading) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    final notificationsForDate = _notificationProvider
                        .getNotificationsForDate(_selectedDate);

                    // Generate time slots for the day (from 6am to 10pm)
                    final timeSlots = List.generate(
                      23,
                      (index) => TimeOfDay(hour: 1 + index, minute: 0),
                    );

                    return RefreshIndicator(
                      onRefresh:
                          () =>
                              _notificationProvider
                                  .fetchScheduledNotifications(),
                      child: ListView.builder(
                        padding: EdgeInsets.zero,
                        itemCount: timeSlots.length,
                        itemBuilder: (context, index) {
                          if (index + 1 == timeSlots.length) {
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _buildTimeSlot(
                                  timeSlots[index],
                                  notificationsForDate,
                                ),
                                AddHeight(0.0),
                              ],
                            );
                          }
                          return _buildTimeSlot(
                            timeSlots[index],
                            notificationsForDate,
                          );
                        },
                      ),
                    );
                  }),
                ),
                AddHeight(0.05),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
