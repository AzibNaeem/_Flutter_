import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:hris_project/presentation/view_model/home_view_model.dart';
import 'package:hris_project/presentation/widgets/attendance_calendar.dart';
import 'package:intl/intl.dart';


class DateFilter extends StatelessWidget {
  final String selectedMonth;
  final int selectedYear;
  final List<String> months;
  final List<int> years;
  final ValueChanged<String?> onMonthChanged;
  final ValueChanged<int?> onYearChanged;

  const DateFilter({
    super.key,
    required this.selectedMonth,
    required this.selectedYear,
    required this.months,
    required this.years,
    required this.onMonthChanged,
    required this.onYearChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Row(
        children: [
          _buildDropdown(selectedMonth, months, onMonthChanged),
          const SizedBox(width: 24),
          _buildDropdown(selectedYear, years, onYearChanged),
        ],
      ),
    );
  }

  Widget _buildDropdown<T>(
    T value,
    List<T> items,
    ValueChanged<T?> onChanged,
  ) {
    return DropdownButton<T>(
      value: value,
      onChanged: onChanged,
      underline: Container(), // Removes the underline
      icon: const Icon(Icons.arrow_drop_down),
      items: items.map<DropdownMenuItem<T>>((T item) {
        return DropdownMenuItem<T>(
          value: item,
          child: Text(item.toString()),
        );
      }).toList(),
    );
  }
}

class AttendanceSection extends StatelessWidget {
  const AttendanceSection({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<HomeViewModel>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        DateFilter(
          selectedMonth: DateFormat('MMMM').format(viewModel.selectedDate),
          selectedYear: viewModel.selectedDate.year,
          months: viewModel.months,
          years: viewModel.years,
          onMonthChanged: (month) => viewModel.updateSelectedDate(month: month),
          onYearChanged: (year) => viewModel.updateSelectedDate(year: year),
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 200,
          child: AttendanceCalendar(
            attendanceDays: viewModel.attendanceDaysForSelectedMonth,
          ),
        ),
      ],
    );
  }
}
