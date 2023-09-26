import 'package:flutter/material.dart';

class AddTaskBottomSheet extends StatefulWidget {
  @override
  State<AddTaskBottomSheet> createState() => _AddTaskBottomSheetState();
}

class _AddTaskBottomSheetState extends State<AddTaskBottomSheet> {
  DateTime selectedTime = DateTime.now();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Add New task',
              style: Theme.of(context).textTheme.titleSmall,
            ),
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
                      hintText: "Enter task title",
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    validator: (value) => value == null || value.isEmpty
                        ? "plies enter the description"
                        : null,
                    decoration: InputDecoration(
                      hintText: "Enter description task",
                    ),
                    maxLines: 3,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Select Time",
                    style: Theme.of(context).textTheme.titleSmall,
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
                        style: Theme.of(context).textTheme.titleSmall,
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
