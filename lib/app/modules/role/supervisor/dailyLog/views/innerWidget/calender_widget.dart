import 'package:aim_construction_app/utils/app_colors.dart';
import 'package:aim_construction_app/utils/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';


class CalendarWithDropdown extends StatefulWidget {
  @override
  _CalendarWithDropdownState createState() => _CalendarWithDropdownState();
}

class _CalendarWithDropdownState extends State<CalendarWithDropdown> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  CalendarFormat _calendarFormat = CalendarFormat.week;

  List<String> _months = [
    'January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'
  ];

  String _selectedMonth = DateFormat('MMMM yyyy').format(DateTime.now());

  final Map<DateTime, List<String>> appointmentDate = {
    DateTime.utc(2025, 2, 16): ['Meeting with team', 'Doctor appointment'],
    DateTime.utc(2025, 2, 18): ['Project deadline'],
    DateTime.utc(2025, 2, 20): ['Lunch with client', 'Gym session'],
    DateTime.utc(2025, 2, 22): ['Webinar'],
  };

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DropdownButton<String>(
                value: _selectedMonth,
                onChanged: (String? newValue) {
                  if (newValue != null) {
                    setState(() {
                      int monthIndex = _months.indexOf(newValue.split(' ')[0]) + 1;
                      int year = int.parse(newValue.split(' ')[1]);
                      _selectedMonth = newValue;
                      _focusedDay = DateTime(year, monthIndex);
                      _selectedDay = DateTime(year, monthIndex, _selectedDay?.day ?? 1);
                    });
                  }
                },
                items: _months.map<DropdownMenuItem<String>>((String month) {
                  return DropdownMenuItem<String>(
                    value: "$month ${_focusedDay.year}",
                    child: Text("$month ${_focusedDay.year}", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                  );
                }).toList(),
              ),
              IconButton(
                icon: SvgPicture.asset(AppIcons.calender),
                onPressed: () {
                  setState(() {
                    _calendarFormat = _calendarFormat == CalendarFormat.week
                        ? CalendarFormat.month
                        : CalendarFormat.week;
                  });
                },
              ),
            ],
          ),
        ),
        TableCalendar(
          firstDay: DateTime.utc(2020, 10, 16),
          lastDay: DateTime.utc(2030, 3, 14),
          focusedDay: _focusedDay,
          calendarFormat: _calendarFormat,
          startingDayOfWeek: StartingDayOfWeek.monday,
          selectedDayPredicate: (day) {
            return isSameDay(_selectedDay, day);
          },
          onPageChanged: (focusedDay) {
            setState(() {
              _focusedDay = focusedDay;
              _selectedMonth = "${_months[focusedDay.month - 1]} ${focusedDay.year}";
              _selectedDay = DateTime(focusedDay.year, focusedDay.month, _selectedDay?.day ?? 1);
            });
          },
          onDaySelected: (selectedDay, focusedDay) {
            setState(() {
              _selectedDay = selectedDay;
              _focusedDay = focusedDay;
            });
          },
          headerVisible: false,
          daysOfWeekStyle: DaysOfWeekStyle(
            weekdayStyle: TextStyle(color: AppColors.color323B4A),
            weekendStyle: TextStyle(color: AppColors.primaryColor),
          ),
          calendarStyle: CalendarStyle(
            todayDecoration: BoxDecoration(
              color: AppColors.primaryColor,
              shape: BoxShape.rectangle,
            ),
            selectedDecoration: BoxDecoration(
              color: AppColors.primary,
              shape: BoxShape.rectangle,
            ),
          ),
          calendarBuilders: CalendarBuilders(
            defaultBuilder: (context, day, focusedDay) {
              bool hasAppointments = _checkForAppointments(day);
              return Container(
                margin: const EdgeInsets.only(bottom: 5),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 4.0.h),
                          child: Text(
                            '${day.day}',
                            style: TextStyle(
                              color: isSameDay(day, _selectedDay) ? Colors.white : Colors.black,
                              fontWeight: isSameDay(day, _selectedDay) ? FontWeight.bold : FontWeight.normal,
                            ),
                          ),
                        ),
                      ],
                    ),
                    if (hasAppointments)
                      Container(
                        height: 8.h,
                        width: 8.w,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.amber,
                        ),
                      ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  bool _checkForAppointments(DateTime day) {
    return appointmentDate.containsKey(day);
  }
}