import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled2/Home/task_list/task_widget.dart';
import 'package:untitled2/providers/app_config_provider.dart';

import '../../my_theme.dart';

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Column(
      children: [
        CalendarTimeline(
          initialDate: DateTime.now(),
          firstDate: DateTime.now().subtract(Duration(days: 2000)),
          lastDate: DateTime.now().add(Duration(days: 3000)),
          onDateSelected: (date) => print(date),
          leftMargin: 20,
          monthColor:
              provider.isDark() ? MyTheme.whiteColor : MyTheme.blackColor,
          dayColor: provider.isDark() ? MyTheme.whiteColor : MyTheme.blackColor,
          activeDayColor: MyTheme.whiteColor,
          activeBackgroundDayColor: MyTheme.primaryLight,
          dotsColor: MyTheme.whiteColor,
          selectableDayPredicate: (date) => true,
          locale: 'en_ISO',
        ),
        Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) => TaskWidgetItem(),
            itemCount: 20,
          ),
        )
      ],
    );
  }
}
