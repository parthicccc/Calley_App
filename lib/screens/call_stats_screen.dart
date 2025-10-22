import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '../services/api_service.dart';
import '../widgets/app_drawer.dart';

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
      final listData = await ApiService.getList(widget.userId);
      listId = listData['_id'];

      final stats = await ApiService.getListStats(listId);
      setState(() {
        pending = stats['pending'] ?? 0;
        called = stats['called'] ?? 0;
        rescheduled = stats['rescheduled'] ?? 0;
        _isLoading = false;
      });
    } catch (e) {
      setState(() => _isLoading = false);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error loading data: $e'), backgroundColor: Colors.red),
      );
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
                  const Text('Test List', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  Text('${pending + called + rescheduled} CALLS', style: const TextStyle(fontSize: 16, color: Colors.grey)),
                  const SizedBox(height: 40),
                  SizedBox(
                    height: 250,
                    child: PieChart(
                      PieChartData(
                        sections: [
                          PieChartSectionData(
                            value: called.toDouble(),
                            title: '$called\nCalled',
                            color: const Color(0xFF2196F3),
                            radius: 100,
                            titleStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
                          ),
                          PieChartSectionData(
                            value: pending.toDouble(),
                            title: '$pending\nPending',
                            color: const Color(0xFFFFA726),
                            radius: 100,
                            titleStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
                          ),
                          PieChartSectionData(
                            value: rescheduled.toDouble(),
                            title: '$rescheduled\nRescheduled',
                            color: const Color(0xFF9C27B0),
                            radius: 100,
                            titleStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
                          ),
                        ],
                        sectionsSpace: 2,
                        centerSpaceRadius: 0,
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  _buildStatCard('Pending', pending, const Color(0xFFFFF3E0), const Color(0xFFFFA726)),
                  const SizedBox(height: 12),
                  _buildStatCard('Called', called, const Color(0xFFE3F2FD), const Color(0xFF2196F3)),
                  const SizedBox(height: 12),
                  _buildStatCard('Rescheduled', rescheduled, const Color(0xFFF3E5F5), const Color(0xFF9C27B0)),
                ],
              ),
            ),
    );
  }

  Widget _buildStatCard(String label, int value, Color bgColor, Color borderColor) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: borderColor, width: 2),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
          Text('$value Calls', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: borderColor)),
        ],
      ),
    );
  }
}
