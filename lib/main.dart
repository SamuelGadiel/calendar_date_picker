import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.green)),
      supportedLocales: [const Locale('pt', 'BR')],
      localizationsDelegates: GlobalMaterialLocalizations.delegates,
      home: App(),
    ),
  );
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  DateTime selectedDate = DateTime.now();
  DateTime month = DateTime.now();

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calendar Date Picker"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Mês atual: ${DateFormat.MMMM('pt_BR').format(month).toUpperCase()}",
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(height: 20),
          CalendarDatePicker(
            firstDate: DateTime(2019),
            lastDate: DateTime(2030, 12, 12),
            initialDate: selectedDate,
            currentDate: DateTime.now(),
            // selectableDayPredicate: (day) {
            //   if (day.day > 10) {
            //     return true;
            //   }

            //   return false;
            // },
            initialCalendarMode: DatePickerMode.day,
            onDisplayedMonthChanged: (value) {
              setState(() {
                month = value;
              });
            },
            onDateChanged: (date) {
              setState(() {
                selectedDate = date;
              });
            },
          ),
          Text(
            "Data selecionada: ${DateFormat('dd/MM/yyyy', 'pt_BR').format(selectedDate)}",
            style: TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }
}
