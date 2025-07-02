import 'package:flutter/material.dart';
import 'widgets/statelesswidget_demo.dart';
import 'widgets/statefulwidget_demo.dart';
import 'widgets/inheritedwidget_demo.dart';
import 'widgets/styledwidget_demo.dart';
import 'widgets/cupertino_demo.dart';
import 'widgets/custom_widget.dart';
import 'hris_practice/dashboard_page.dart';
import 'hris_practice/leave_form/view/leave_form_page.dart';
class PracticeHome extends StatelessWidget {
  const PracticeHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter Widget Playground')),
      body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            WidgetNavButton(
              title: 'Stateless Widget',
              destination: const BannerCardDemo(),
            ),
            WidgetNavButton(
              title: 'Stateful Widget',
              destination: const LikeVehicleCard(),
            ),
            WidgetNavButton(
              title: 'Inherited Widget',
              destination: const InheritedDemo(),
            ),

            WidgetNavButton(
              title: 'Styled Widget',
              destination: const StyledWidgetDemo(),
            ),
            WidgetNavButton(
                title: 'Cupertino Widget',
                destination: CupertinoDemo(),
            ),
            WidgetNavButton(
              title: 'Custom Widget',
              destination: CustomCardDemo(),
            ),
            WidgetNavButton(title: 'Dashboard practice',
                destination: HRISDashboardPage()
            ),
            WidgetNavButton(
              title: 'Leave Form (BLoC Practice)',
              destination: const LeaveFormPage(),
            ),

          ],
        ),
      ),
      ),
    );
  }
}

class WidgetNavButton extends StatelessWidget {
  final String title;
  final Widget destination;

  const WidgetNavButton({
    super.key,
    required this.title,
    required this.destination,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(minimumSize: const Size.fromHeight(50)),
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => destination),
        ),
        child: Text(title),
      ),
    );
  }
}
