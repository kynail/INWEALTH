import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'calendar_row.dart';
import 'date_service.dart';

class Calendar extends StatelessWidget {
  final DateTime? selected;
  final void Function(DateTime dateTime) saveChanges;

  Calendar({
    Key? key,
    required this.selected,
    required this.saveChanges,
  });

  @override
  Widget build(BuildContext context) {
    List<DateTime> dateTimes = [];
    DateTime today = DateTime.now();
    DateTime current = DateTime(today.year, today.month, today.day, 13, 0);

    for (int i = 0; i < 10; i++) {
      for (int y = 0; y < 6; y++) {
        DateTime dateTime = current.add(Duration(days: i, hours: y + i % 3));

        // We keep the events which are not during the week-end
        if (dateTime.weekday <= 5) {
          dateTimes.add(dateTime);
        }
      }
    }

    if (selected != null && !dateTimes.contains(selected)) {
      dateTimes.add(selected!);
    }

    Map<String, List<DateTime>> availabilitiesPerKey =
        dateTimes.fold({}, (map, element) {
      map[DateService.toCompleteDayMonth(element)] = [
        ...(map[DateService.toCompleteDayMonth(element)] ?? []),
        element,
      ];

      return map;
    });

    List<String> keys = availabilitiesPerKey.keys.toList();

    int? index;
    if (selected != null) {
      String selectedKey = DateService.toCompleteDayMonth(selected!);
      index = keys.indexWhere((element) => element == selectedKey);
    }

    ScrollController controller =
        ScrollController(initialScrollOffset: (index ?? 0) * (50 + 10));

    return ListView.builder(
      controller: controller,
      shrinkWrap: true,
      itemCount: keys.length,
      itemBuilder: (context, indexDay) {
        String key = keys[indexDay];
        List<DateTime> availabilities = availabilitiesPerKey[key]!;

        bool Function(DateTime availability) isPicked = (availability) {
          return indexDay == index &&
              availability.hour == selected?.hour &&
              availability.minute == selected?.minute;
        };

        return CalendarRow(
          title: key,
          availabilities: availabilities,
          isPicked: isPicked,
          onPressed: saveChanges,
        );
      },
    );
  }
}
