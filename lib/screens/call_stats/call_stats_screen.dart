import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'dart:convert';
import '../../core/constants/app_colors.dart';
import '../../core/services/api_service.dart';
import '../../core/utils/snackbar_helper.dart';
import '../../widgets/app_drawer.dart';
import '../../widgets/stat_card.dart';

class CallStatsScreen extends StatefulWidget {
  final String userId;

  const CallStatsScreen({super.key, required this.userId});

  @override
  State<CallStatsScreen> createState() => _CallStatsScreenState();
}

class _CallStatsScreenState extends State<CallStatsScreen> {
  bool _isLoading = true;
  int pending = 0;
  int called = 0;
  int rescheduled = 0;
  String listId = '';

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    try {
      final listResponse = await ApiService.getList(widget.userId);

      if (listResponse.statusCode == 200) {
        final listData = jsonDecode(listResponse.body);
        listId = listData['_id'];

        final statsResponse = await ApiService.getListStats(listId);

        if (statsResponse.statusCode == 200) {
          final stats = jsonDecode(statsResponse.body);
          setState(() {
            pending = stats['pending'] ?? 0;
            called = stats['called'] ?? 0;
            rescheduled = stats['rescheduled'] ?? 0;
            _isLoading = false;
          });
        }
      }
    } catch (e) {
      setState(() => _isLoading = false);
      SnackbarHelper.showError(context, 'Error loading data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Call Statistics')),
      drawer: const AppDrawer(),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  const Text(
                    'Test List',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    '${pending + called + rescheduled} CALLS',
                    style: const TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                  const SizedBox(height: 40),
                  SizedBox(
                    height: 250,
                    child: PieChart(
                      PieChartData(
                        sections: [
                          PieChartSectionData(
                            value: called.toDouble(),
                            title: '$called\nCalled',
                            color: AppColors.blue,
                            radius: 100,
                            titleStyle: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          PieChartSectionData(
                            value: pending.toDouble(),
                            title: '$pending\nPending',
                            color: AppColors.pendingBorder,
                            radius: 100,
                            titleStyle: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          PieChartSectionData(
                            value: rescheduled.toDouble(),
                            title: '$rescheduled\nRescheduled',
                            color: AppColors.rescheduledBorder,
                            radius: 100,
                            titleStyle: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                        sectionsSpace: 2,
                        centerSpaceRadius: 0,
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  StatCard(
                    label: 'Pending',
                    value: pending,
                    bgColor: AppColors.pendingBg,
                    borderColor: AppColors.pendingBorder,
                  ),
                  const SizedBox(height: 12),
                  StatCard(
                    label: 'Called',
                    value: called,
                    bgColor: AppColors.calledBg,
                    borderColor: AppColors.calledBorder,
                  ),
                  const SizedBox(height: 12),
                  StatCard(
                    label: 'Rescheduled',
                    value: rescheduled,
                    bgColor: AppColors.rescheduledBg,
                    borderColor: AppColors.rescheduledBorder,
                  ),
                ],
              ),
            ),
    );
  }
}