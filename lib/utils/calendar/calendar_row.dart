import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'date_service.dart';

class CalendarRow extends StatefulWidget {
  final String title;
  final List<DateTime> availabilities;
  final bool Function(DateTime availability) isPicked;
  final void Function(DateTime availability) onPressed;

  const CalendarRow({
    Key? key,
    required this.title,
    required this.availabilities,
    required this.isPicked,
    required this.onPressed,
  }) : super(key: key);

  @override
  _CalendarRowState createState() => _CalendarRowState();
}

class _CalendarRowState extends State<CalendarRow> {
  bool _isExpanded = false;
  Color purp1 = Color(0xFF5E5B74);
  Color purp2 = Color(0xFF272243);
  Color gold1 = Color(0xFFD5C6AC);
  Color gold2 = Color(0xFFBAAB90);
  Color gold3 = Color(0xFF97876A);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      // margin: EdgeInsets.only(bottom: 10),
      onPressed: () {
        setState(() {
          _isExpanded = !_isExpanded;
        });
      },
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                offset: Offset(0.0, 2.0),
                blurRadius: 1.0,
                spreadRadius: -1.0,
                color:gold1),
          ],
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Text(
                    widget.title,
                    style: TextStyle(
                      color: gold1,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ),
                Icon(
                  _isExpanded
                      ? CupertinoIcons.chevron_up
                      : CupertinoIcons.chevron_down,
                  size: 16,
                )
              ],
            ),
            _isExpanded
                ? Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      children: widget.availabilities.map((availability) {
                        bool isPicked = widget.isPicked(availability);

                        return TextButton(
                          onPressed: () {
                            widget.onPressed(availability);
                          },
                          child: Container(
                            width: 100,
                            height: 30,
                            decoration: BoxDecoration(
                              color: isPicked
                                  ? gold1.withOpacity(0.85)
                                  : gold3.withOpacity(0.85),
                              border: Border.all(
                                color: isPicked
                                    ? gold1
                                    : gold3
                                        .withOpacity(0.85),
                              ),
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            padding: EdgeInsets.symmetric(vertical: 5),
                            child: Center(
                              child: Text(
                                DateService.toHourMinutes(availability),
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: isPicked
                                        ? Colors.white
                                        : gold2),
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ))
                : SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
