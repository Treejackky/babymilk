import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarEntry {
  String milkAmount;
  String fridgeType;

  CalendarEntry({required this.milkAmount, required this.fridgeType});
}

class Calendar extends StatefulWidget {
  const Calendar({Key? key}) : super(key: key);

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  late final ValueNotifier<DateTime> _selectedDay;
  late CalendarFormat _calendarFormat;
  late DateTime _focusedDay;
  bool _showForm = false;
  Map<DateTime, CalendarEntry> _calendarData = {};
  TextEditingController _milkAmountController = TextEditingController();
  TextEditingController _fridgeTypeController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _selectedDay = ValueNotifier(DateTime.now());
    _calendarFormat = CalendarFormat.month;
    _focusedDay = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ปฏิทิน'),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
          setState(() {
            _showForm = false;
          });
        },
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TableCalendar(
                firstDay: DateTime.utc(2010, 10, 16),
                lastDay: DateTime.utc(2030, 3, 14),
                focusedDay: _focusedDay,
                calendarFormat: _calendarFormat,
                selectedDayPredicate: (day) {
                  return isSameDay(_selectedDay.value, day);
                },
                onDaySelected: (selectedDay, focusedDay) {
                  _loadDataForSelectedDay(selectedDay);
                  setState(() {
                    _selectedDay.value = selectedDay;
                    _focusedDay = focusedDay;
                    _showForm = true;
                  });
                },
                onPageChanged: (focusedDay) {
                  setState(() {
                    _focusedDay = focusedDay;
                  });
                },
                headerStyle: HeaderStyle(
                  formatButtonTextStyle:
                      TextStyle().copyWith(color: Colors.white),
                  formatButtonDecoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                ),
                calendarStyle: CalendarStyle(
                  selectedDecoration: BoxDecoration(
                    color: Colors.blue,
                    shape: BoxShape.circle,
                  ),
                  todayDecoration: BoxDecoration(
                    color: Colors.blue,
                    shape: BoxShape.circle,
                  ),
                  markerDecoration: BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                  outsideDaysVisible: false,
                ),
              ),
              if (_showForm) _buildForm(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildForm() {
    return Column(
      children: [
        TextField(
          controller: _milkAmountController,
          decoration: InputDecoration(
            labelText: 'จำนวนนม',
          ),
        ),
        SizedBox(height: 10),
        TextField(
          controller: _fridgeTypeController,
          decoration: InputDecoration(
            labelText: 'ประเภทตู้เย็น',
          ),
        ),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: _saveFormData,
          child: Text('Submit'),
        ),
      ],
    );
  }

  void _loadDataForSelectedDay(DateTime day) {
    CalendarEntry? entry = _calendarData[day];
    if (entry != null) {
      _milkAmountController.text = entry.milkAmount;
      _fridgeTypeController.text = entry.fridgeType;
    } else {
      _milkAmountController.clear();
      _fridgeTypeController.clear();
    }
  }

  void _saveFormData() {
    String milkAmount = _milkAmountController.text;
    String fridgeType = _fridgeTypeController.text;
    DateTime selectedDate = _selectedDay.value;

    if (milkAmount.isNotEmpty && fridgeType.isNotEmpty) {
      _calendarData[selectedDate] = CalendarEntry(
        milkAmount: milkAmount,
        fridgeType: fridgeType,
      );
      setState(() {
        _showForm = false;
      });
    }
  }

  @override
  void dispose() {
    _selectedDay.dispose();
    _milkAmountController.dispose();
    _fridgeTypeController.dispose();
    super.dispose();
  }
}
