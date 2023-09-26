import 'package:flutter/material.dart';
import 'package:untitled2/Home/settings/settings.dart';
import 'package:untitled2/Home/task_list/add_task_bottom_sheet.dart';
import 'package:untitled2/Home/task_list/task_list.dart';
import 'package:provider/provider.dart';
import 'package:untitled2/my_theme.dart';
import 'package:untitled2/providers/app_config_provider.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "home_screen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var selectIndex = 0;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "TODo List",
          style: provider.isDark()
              ? Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: MyTheme.blackColor)
              : Theme.of(context).textTheme.titleLarge,
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 8,
        child: BottomNavigationBar(
          currentIndex: selectIndex,
          onTap: (index) {
            selectIndex = index;
            setState(() {});
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.list),
              label: "List",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: "Settings",
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          taskAddBottomSheet();
        },
        child: Icon(
          Icons.add,
          size: 30,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: taps[selectIndex],
    );
  }

  List<Widget> taps = [TaskList(), Settings()];

  void taskAddBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) => AddTaskBottomSheet(),
    );
  }
}
