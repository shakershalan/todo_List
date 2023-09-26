import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled2/my_theme.dart';

import '../../providers/app_config_provider.dart';

class ThemeBottomSheet extends StatefulWidget {
  @override
  State<ThemeBottomSheet> createState() => _ThemeBottomSheetState();
}

class _ThemeBottomSheetState extends State<ThemeBottomSheet> {
  var providerOut;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<AppConfigProvider>(context);
    providerOut = provider;
    return Container(
      color:
          provider.isDark() ? MyTheme.backgroundDark : MyTheme.backgroundLight,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
              onTap: () {
                provider.changeMode(ThemeMode.light);
              },
              child: provider.appMode == ThemeMode.light
                  ? getSelected("Light")
                  : getUnSelected("Light")),
          InkWell(
              onTap: () {
                provider.changeMode(ThemeMode.dark);
              },
              child: provider.appMode == ThemeMode.dark
                  ? getSelected("Dark")
                  : getUnSelected("Dark"))
        ],
      ),
    );
  }

  Widget getSelected(String text) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: Theme.of(context)
                .textTheme
                .titleSmall!
                .copyWith(color: MyTheme.primaryLight),
          ),
          Icon(Icons.check, color: providerOut)
        ],
      ),
    );
  }

  Widget getUnSelected(String text) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        text,
        style: Theme.of(context).textTheme.titleSmall,
      ),
    );
  }
}
