import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../theme/app_theme.dart';
import '../../view_model/hcd_portal_view_model/hcd_portal_view_model.dart';

class HCDPortalScreen extends StatefulWidget {
  const HCDPortalScreen({super.key});

  @override
  State<HCDPortalScreen> createState() => _HCDPortalScreenState();
}

class _HCDPortalScreenState extends State<HCDPortalScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<HCDViewModel>(context, listen: false).loadWeeklyMenu();
  }

  @override
  Widget build(BuildContext context) {
    final hcdVM = Provider.of<HCDViewModel>(context);

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: const Text('HCD Portal', style: TextStyle(fontWeight: FontWeight.bold),),
        backgroundColor: AppColors.background,
        foregroundColor: AppColors.primary,
        elevation: 0,
      ),
      body: hcdVM.isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: hcdVM.menu.length,
        itemBuilder: (context, index) {
          final item = hcdVM.menu[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            elevation: 4,
            color: AppColors.white,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(item.day,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primary,
                      )),
                  const SizedBox(height: 8),
                  Text("🍛 Option 1: ${item.option1}",
                      style: TextStyle(color: AppColors.primary)),
                  Text("🥗 Option 2: ${item.option2}",
                      style: TextStyle(color: AppColors.primary)),
                  Text("🥘 Option 3: ${item.option3}",
                      style: TextStyle(color: AppColors.primary)),
                  const SizedBox(height: 8),
                  Text("🍽️ Dinner: ${item.dinner}",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: AppColors.primary)),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
