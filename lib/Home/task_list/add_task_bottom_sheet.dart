import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled2/my_theme.dart';
import 'package:untitled2/providers/app_config_provider.dart';

class AddTaskBottomSheet extends StatefulWidget {
  @override
  State<AddTaskBottomSheet> createState() => _AddTaskBottomSheetState();
}

class _AddTaskBottomSheetState extends State<AddTaskBottomSheet> {
  DateTime selectedTime = DateTime.now();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Container(
      color:
          provider.isDark() ? MyTheme.backgroundDark : MyTheme.backgroundLight,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Add New task',
                style: provider.isDark()
                    ? Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(color: MyTheme.whiteColor)
                    : Theme.of(context).textTheme.titleSmall),
          ),
          Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    validator: (value) => value == null || value.isEmpty
                        ? "plies enter the title"
                        : null,
                    decoration: InputDecoration(
                        labelText: "Enter title task",
                        labelStyle: Theme.of(context)
                            .textTheme
                            .titleSmall!
                            .copyWith(
                                color: provider.isDark()
                                    ? MyTheme.greyColor
                                    : MyTheme.greyColor)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    validator: (value) => value == null || value.isEmpty
                        ? "plies enter the description"
                        : null,
                    decoration: InputDecoration(
                        labelText: "Enter description task",
                        labelStyle: Theme.of(context)
                            .textTheme
                            .titleSmall!
                            .copyWith(
                                color: provider.isDark()
                                    ? MyTheme.greyColor
                                    : MyTheme.greyColor)),
                    maxLines: 3,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Select Time",
                    style: provider.isDark()
                        ? Theme.of(context)
                            .textTheme
                            .titleSmall!
                            .copyWith(color: MyTheme.whiteColor)
                        : Theme.of(context).textTheme.titleSmall,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      showCalender();
                    },
                    child: Text(
                        "${selectedTime.day}/${selectedTime.month}/${selectedTime.year}",
                        style: provider.isDark()
                            ? Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(color: MyTheme.whiteColor)
                            : Theme.of(context).textTheme.titleSmall,
                        textAlign: TextAlign.center),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                      onPressed: () {
                        addTask();
                      },
                      child: Text("Add")),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  void showCalender() async {
    var chosenDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now().subtract(Duration(days: 2000)),
        lastDate: DateTime.now().add(Duration(days: 3000)));

    if (chosenDate != null) {
      selectedTime = chosenDate;
      setState(() {});
    }
  }

  void addTask() {
    if (formKey.currentState?.validate() == true) {}
  }
}
