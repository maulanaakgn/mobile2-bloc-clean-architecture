import 'package:flutter/material.dart';
import 'package:flutter_bloc_tugas2/features/fruit/presentation/shared/themes.dart';
import 'package:intl/intl.dart';

class DateTimePickerPage extends StatefulWidget {
  const DateTimePickerPage({Key? key}) : super(key: key);

  @override
  State<DateTimePickerPage> createState() => _DateTimePickerPageState();
}

class _DateTimePickerPageState extends State<DateTimePickerPage> {
  final DateFormat _dateFormat = DateFormat('dd-MM-yyyy');
  DateTime _selectedDate = DateTime.now();
  TimeOfDay _selectedTime = TimeOfDay.now();

  _showTime(context) async {
    final timePick = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
      builder: (BuildContext context, Widget? child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
          child: child!,
        );
      },
    );

    if (timePick != null) {
      setState(() {
        _selectedTime = timePick;
      });
    }
  }

  _showDate(context) async {
    final datePick = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: _selectedDate.subtract(const Duration(days: 30)),
      lastDate: DateTime(_selectedDate.year + 1),
    );

    if (datePick != null) {
      setState(() {
        _selectedDate = datePick;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(defaultMargin),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _timeContainer(context),
          const SizedBox(
            height: 20,
          ),
          _dateContainer(context),
        ],
      ),
    );
  }

  Container _timeContainer(BuildContext context) {
    return Container(
          height: MediaQuery.of(context).size.height * 1 / 4,
          width: double.infinity,
          decoration: BoxDecoration(
            color: kWhiteGreyColor,
            borderRadius: BorderRadius.circular(defaultRadius),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _time(context),
              _buttonShowTime(context),
            ],
          ),
        );
  }

  RichText _time(BuildContext context) {
    return RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Selected Time: \n',
                      style: kBlackTextStyle.copyWith(
                        fontSize: 20,
                      ),
                    ),
                    TextSpan(
                      text: _selectedTime.format(context),
                      style: kBlackTextStyle.copyWith(
                        fontSize: 40,
                        fontWeight: bold,
                      ),
                    ),
                  ],
                ),
              );
  }

  ElevatedButton _buttonShowTime(BuildContext context) {
    return ElevatedButton(
                onPressed: () => _showTime(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: kBlackColor,
                ),
                child: Text(
                  'Pick Time',
                  style: kWhiteTextStyle,
                ),
              );
  }

  Container _dateContainer(BuildContext context) {
    return Container(
          height: MediaQuery.of(context).size.height * 1 / 4,
          width: double.infinity,
          decoration: BoxDecoration(
            color: kWhiteGreyColor,
            borderRadius: BorderRadius.circular(defaultRadius),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _date(),
              _buttonShowDate(context),
            ],
          ),
        );
  }

  RichText _date() {
    return RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Selected Date: \n',
                      style: kBlackTextStyle.copyWith(
                        fontSize: 20,
                      ),
                    ),
                    TextSpan(
                      text: _dateFormat.format(_selectedDate),
                      style: kBlackTextStyle.copyWith(
                        fontSize: 40,
                        fontWeight: bold,
                      ),
                    ),
                  ],
                ),
              );
  }

  ElevatedButton _buttonShowDate(BuildContext context) {
    return ElevatedButton(
                onPressed: () => _showDate(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: kBlackColor,
                ),
                child: Text(
                  'Pick Date',
                  style: kWhiteTextStyle,
                ),
              );
  }
}
