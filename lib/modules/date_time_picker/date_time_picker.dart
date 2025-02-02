import 'package:flutter/cupertino.dart';

void showCupertinoDateTimePicker({required BuildContext context,CupertinoDatePickerMode? mode,required Function(DateTime) onDateTimeChanged}) {
  showCupertinoModalPopup<void>(
    context: context,
    builder: (BuildContext context) => Container(
      height: 216,
      padding: const EdgeInsets.only(top: 6.0),
      // The Bottom margin is provided to align the popup above the system
      // navigation bar.
      margin: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      // Provide a background color for the popup.
      color: CupertinoColors.systemBackground.resolveFrom(context),
      // Use a SafeArea widget to avoid system overlaps.
      child: SafeArea(
        top: false,
        child: CupertinoDatePicker(
            use24hFormat: true,
            showDayOfWeek: true,
            mode: mode ?? CupertinoDatePickerMode.dateAndTime,
            minimumDate: DateTime.now(),
            dateOrder: DatePickerDateOrder.ymd,
            onDateTimeChanged: onDateTimeChanged),
      ),
    ),
  );
}
