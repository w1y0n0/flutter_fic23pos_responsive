import 'package:flutter/material.dart';
import 'package:flutter_fic23pos_responsive/core/extensions/build_context_ext.dart';
import 'package:flutter_fic23pos_responsive/core/extensions/date_time_ext.dart';
import 'package:flutter_fic23pos_responsive/core/extensions/int_ext.dart';
import 'package:flutter_fic23pos_responsive/presentation/order/widgets/label_value_widget.dart';

import '../../../core/assets/assets.gen.dart';
import '../../../core/components/buttons.dart';
import '../../../core/components/spaces.dart';

class PaymentSuccessDialog extends StatelessWidget {
  final bool isTablet;
  const PaymentSuccessDialog({super.key, this.isTablet = false});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      scrollable: true,
      title: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Center(child: Assets.icons.done.svg()),
          const SpaceHeight(24.0),
          const Text(
            'Payment has been successfully',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ],
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const LabelValue(
            label: 'Payment Method',
            value: 'Cash',
          ),
          const Divider(height: 16.0),
          const LabelValue(label: 'Total Quantity', value: '10'),
          const Divider(height: 16.0),
          LabelValue(
            label: 'Total Bill',
            value: 1000000.currencyFormatRp,
          ),
          const Divider(height: 16.0),
          const LabelValue(
            label: 'Cashier Name',
            value: 'John Doe',
          ),
          const Divider(height: 16.0),
          LabelValue(
            label: 'Transaction Date',
            value: DateTime.now().toFormattedTime(),
          ),
          const SpaceHeight(20.0),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                child: Button.filled(
                  onPressed: () {
                    // isTablet
                    //     ? context.pushReplacement(const DashboardTabletPage())
                    //     : context.pushReplacement(const DashboardPage());
                  },
                  label: 'Done',
                  fontSize: 12,
                ),
              ),
              const SpaceWidth(12.0),
              Flexible(
                child: Button.outlined(
                  onPressed: () async {},
                  label: 'Print',
                  icon: Assets.icons.print.svg(),
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
