import 'package:eotteom/tabs/closet/mycloset.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import "package:flutter/material.dart";
import "package:provider/provider.dart";


class MonthRangePick extends StatefulWidget {
  const MonthRangePick({super.key});

  @override
  State<MonthRangePick> createState() => _MonthRangePickState();
}

class _MonthRangePickState extends State<MonthRangePick> {
  
  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: !(context.watch<FilterState>().datecheck),
      child: Container(
        child: SfDateRangePicker(
          headerStyle: DateRangePickerHeaderStyle(
            textAlign: TextAlign.center,
            textStyle: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black
            )
          ),
          onSelectionChanged: _onSelectionChanged,
          selectionMode: DateRangePickerSelectionMode.multiRange,
          view: DateRangePickerView.year,
          showNavigationArrow: true,
          allowViewNavigation: false,
          startRangeSelectionColor: Colors.black,
          endRangeSelectionColor: Colors.black,
          rangeSelectionColor: Colors.grey,
          todayHighlightColor: Colors.black,
          selectionColor: Colors.black,
          yearCellStyle: DateRangePickerYearCellStyle(
            textStyle: TextStyle(color: Colors.black),
            todayTextStyle: TextStyle(color: Colors.black),
          ),
        ),
    ),
    );    
  }
  void _onSelectionChanged(DateRangePickerSelectionChangedArgs dateRangePickerSelectionChangedArgs) {
    // print(dateRangePickerSelectionChangedArgs.value);
    context.read<FilterState>().selectDate(dateRangePickerSelectionChangedArgs.value);
  }

  
}

// https://help.syncfusion.com/flutter/daterangepicker/callbacks 조작법 참고

