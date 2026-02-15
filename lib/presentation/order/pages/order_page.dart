import 'package:flutter/material.dart';
import 'package:flutter_fic23pos_responsive/core/extensions/build_context_ext.dart';
import 'package:flutter_fic23pos_responsive/data/data_dummy.dart';
import 'package:flutter_fic23pos_responsive/presentation/home/pages/dashboard_page.dart';

import '../../../core/assets/assets.gen.dart';
import '../../../core/components/buttons.dart';
import '../../../core/components/menu_button.dart';
import '../../../core/components/spaces.dart';
import '../widgets/order_card.dart';
import '../widgets/payment_cash_dialog.dart';
import '../widgets/process_button.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  final indexValue = ValueNotifier(0);
  final TextEditingController orderNameController = TextEditingController();
  final TextEditingController tableNumberController = TextEditingController();

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
          onPressed: () {
            context.push(const DashboardPage());
          },
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
        ),
        title: const Text(
          'Order Detail',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        centerTitle: true,
      ),
      body: ListView.separated(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        itemCount: dummyOrderItems.length,
        separatorBuilder: (context, index) => const SpaceHeight(20.0),
        itemBuilder: (context, index) => OrderCard(
          padding: paddingHorizontal,
          data: dummyOrderItems[index],
          onDeleteTap: () {},
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 28),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ValueListenableBuilder(
              valueListenable: indexValue,
              builder: (context, value, _) => Row(
                children: [
                  Flexible(
                    child: MenuButton(
                      iconPath: Assets.icons.cash.path,
                      label: 'CASH',
                      isActive: value == 1,
                      onPressed: () {
                        indexValue.value = 1;
                      },
                    ),
                  ),
                  const SpaceWidth(16.0),
                  Flexible(
                    child: MenuButton(
                      iconPath: Assets.icons.qrCode.path,
                      label: 'QR',
                      isActive: value == 2,
                      onPressed: () {
                        indexValue.value = 2;
                      },
                    ),
                  ),
                  const SpaceWidth(16.0),
                  Flexible(
                    child: MenuButton(
                      iconPath: Assets.icons.debit.path,
                      label: 'TRANSFER',
                      isActive: value == 3,
                      onPressed: () {
                        indexValue.value = 3;
                      },
                    ),
                  ),
                ],
              ),
            ),
            const SpaceHeight(20.0),
            ProcessButton(
              price: 0,
              onPressed: () async {
                if (indexValue.value == 0) {
                } else if (indexValue.value == 1) {
                  showDialog(
                    context: context,
                    builder: (context) => PaymentCashDialog(price: 10000),
                  );
                } else if (indexValue.value == 2) {
                  // showDialog(
                  //   context: context,
                  //   barrierDismissible: false,
                  //   builder: (context) => PaymentQrisDialog(
                  //     price: 10000,
                  //   ),
                  // );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
