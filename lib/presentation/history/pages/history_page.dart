import 'package:flutter/material.dart';
import 'package:flutter_fic23pos_responsive/core/extensions/build_context_ext.dart';
import 'package:flutter_fic23pos_responsive/data/data_dummy.dart';

import '../../../core/components/spaces.dart';

import '../../home/pages/dashboard_page.dart';

import '../widgets/history_transaction_card.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const paddingHorizontal = EdgeInsets.symmetric(horizontal: 16.0);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () {
            context.push(const DashboardPage());
          },
        ),
        title: const Text('History',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            )),
        elevation: 0,
        centerTitle: true,
      ),
      body: ListView.separated(
        padding: const EdgeInsets.symmetric(vertical: 30.0),
        itemCount: dummyOrders.length,
        separatorBuilder: (context, index) => const SpaceHeight(8.0),
        itemBuilder: (context, index) => HistoryTransactionCard(
          padding: paddingHorizontal,
          data: dummyOrders[index],
        ),
      ),
    );
  }
}
