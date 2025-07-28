import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../data/models/late_sitting_model.dart';
import '../../theme/app_theme.dart';
import '../../../domain/providers/user_provider.dart';
import '../../view_model/late_sitting_view_model/late_sitting_vm.dart';

class LateSittingScreen extends StatefulWidget {
  const LateSittingScreen({super.key});
  @override
  State<LateSittingScreen> createState() => _LateSittingScreenState();
}

class _LateSittingScreenState extends State<LateSittingScreen> {
  final _reason = TextEditingController();
  bool _dinner = false;
  bool _van = false;
  bool _showPrevious = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final u = Provider.of<UserProvider>(context, listen: false).user;
      if (u != null) {
        context.read<LateSittingViewModel>().fetch(u.employeeId);
      }
    });
  }

  void _submitRequest() async {
    if (_reason.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: AppColors.primary,
          content: const Text(
            "⚠️ Reason is required!",
            style: TextStyle(color: AppColors.white),
          ),
        ),
      );
      return;
    }

    final u = Provider.of<UserProvider>(context, listen: false).user;
    if (u != null) {
      final req = LateSittingRequest(
        reason: _reason.text,
        dinner: _dinner,
        wantsVan: _van,
        timestamp: DateTime.now(),
      );
      await context.read<LateSittingViewModel>().submit(u.employeeId, req);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: AppColors.primary,
            content: const Text(
              "✅ Request successfully submitted",
              style: TextStyle(color: AppColors.white),
            ),
          ),
        );

        setState(() {
          _reason.clear();
          _dinner = false;
          _van = false;
        });
      }
    }
  }

  Widget _buildForm() {
    return Card(
      color: AppColors.white,
      elevation: 4,
      margin: const EdgeInsets.all(8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(children: [
          TextField(
            controller: _reason,
            maxLines: 3,
            decoration: InputDecoration(
              labelText: 'Reason',
              labelStyle: TextStyle(color: AppColors.black, fontWeight: FontWeight.bold),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: AppColors.primary),
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: AppColors.primary.withOpacity(0.5)),
              ),
            ),
            style: TextStyle(color: AppColors.black),
          ),
          CheckboxListTile(
            tileColor: AppColors.white,
            checkColor: AppColors.primary,
            activeColor: AppColors.white,
            title: Text('Would you like to have dinner?', style: TextStyle(color: AppColors.black)),
            value: _dinner,
            onChanged: (v) => setState(() => _dinner = v ?? false),
          ),
          CheckboxListTile(
            tileColor: AppColors.white,
            checkColor: AppColors.primary,
            activeColor: AppColors.white,
            title: Text('Van service (For females only)', style: TextStyle(color: AppColors.black)),
            value: _van,
            onChanged: (v) => setState(() => _van = v ?? false),
          ),
          ElevatedButton(
            onPressed: _submitRequest,
            style: ElevatedButton.styleFrom(backgroundColor: AppColors.background),
            child: const Text('Submit', style: TextStyle(color: AppColors.white)),
          ),
        ]),
      ),
    );
  }

  Widget _buildHistory(List<LateSittingRequest> list) {
    return Column(
      children: list.map((r) {
        final formattedDate =
            '${r.timestamp.year}-${r.timestamp.month.toString().padLeft(2, '0')}-${r.timestamp.day.toString().padLeft(2, '0')}';
        final formattedTime =
            '${r.timestamp.hour.toString().padLeft(2, '0')}:${r.timestamp.minute.toString().padLeft(2, '0')}';

        return Card(
          color: AppColors.white,
          elevation: 3,
          margin: const EdgeInsets.symmetric(vertical: 6),
          child: ListTile(
            title: Text(r.reason, style: TextStyle(color: AppColors.black)),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Date: $formattedDate', style: TextStyle(color: AppColors.black)),
                Text('Time: $formattedTime', style: TextStyle(color: AppColors.black)),
                Text('Dinner: ${r.dinner ? "Yes" : "No"}', style: TextStyle(color: AppColors.black)),
                Text('Van: ${r.wantsVan ? "Yes" : "No"}', style: TextStyle(color: AppColors.black)),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<LateSittingViewModel>();
    final u = Provider.of<UserProvider>(context).user;

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        title: Text('Late Sitting', style: TextStyle(color: AppColors.white)),
      ),
      body: LayoutBuilder(
        builder: (_, cons) => SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              _buildForm(),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Show previous requests', style: TextStyle(color: AppColors.primary)),
                  Checkbox(
                    value: _showPrevious,
                    onChanged: (v) {
                      setState(() => _showPrevious = v ?? false);
                      if (v == true && u != null) {
                        vm.fetch(u.employeeId);
                      }
                    },
                    activeColor: AppColors.white,
                    checkColor: AppColors.primary,
                  ),
                ],
              ),
              if (_showPrevious)
                vm.isLoading
                    ? const CircularProgressIndicator()
                    : vm.error != null
                    ? Text('Error: ${vm.error}', style: TextStyle(color: AppColors.primary))
                    : _buildHistory(vm.requests),
            ],
          ),
        ),
      ),
    );
  }
}
