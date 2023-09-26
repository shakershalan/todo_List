import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:untitled2/my_theme.dart';
import 'package:provider/provider.dart';
import 'package:untitled2/providers/app_config_provider.dart';

class TaskWidgetItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    return Container(
      margin: EdgeInsets.all(15),
      child: Slidable(
          startActionPane: ActionPane(
            extentRatio: .2,
            motion: const ScrollMotion(),
            children: [
              SlidableAction(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    bottomLeft: Radius.circular(20)),
                onPressed: (context) {},
                backgroundColor: MyTheme.redColor,
                foregroundColor: MyTheme.whiteColor,
                icon: Icons.delete,
                label: 'Delete',
              ),
            ],
          ),
          child: Container(
            padding: EdgeInsets.all(4),
            decoration: provider.isDark()
                ? BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: MyTheme.blockDark)
                : BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: MyTheme.whiteColor),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: MyTheme.primaryLight),
                  height: 80,
                  width: 4,
                ),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Task title",
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall
                            ?.copyWith(color: MyTheme.primaryLight),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Desc",
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    )
                  ],
                )),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 7, horizontal: 20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: MyTheme.primaryLight),
                  child: Icon(Icons.check, color: MyTheme.whiteColor),
                ),
              ],
            ),
          )),
    );
  }
}
