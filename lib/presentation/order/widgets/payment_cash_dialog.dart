
import 'package:flutter/material.dart';
import 'package:flutter_fic23pos_responsive/core/extensions/build_context_ext.dart';
import 'package:flutter_fic23pos_responsive/core/extensions/int_ext.dart';
import 'package:flutter_fic23pos_responsive/core/extensions/string_ext.dart';
import 'package:flutter_fic23pos_responsive/presentation/order/widgets/payment_success_dialog.dart';

import '../../../core/components/buttons.dart';
import '../../../core/components/custom_text_field.dart';
import '../../../core/components/spaces.dart';
import '../../../core/constants/colors.dart';

class PaymentCashDialog extends StatefulWidget {
  final bool isTablet;
  final int price;
  const PaymentCashDialog(
      {super.key, required this.price, this.isTablet = false});

  @override
  State<PaymentCashDialog> createState() => _PaymentCashDialogState();
}

class _PaymentCashDialogState extends State<PaymentCashDialog> {
  TextEditingController?
      priceController; // = TextEditingController(text: widget.price.currencyFormatRp);

  @override
  void initState() {
    priceController =
        TextEditingController(text: widget.price.currencyFormatRp);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      scrollable: true,
      title: Stack(
        children: [
          IconButton(
            onPressed: () => context.pop(),
            icon: const Icon(Icons.highlight_off),
            color: AppColors.primary,
          ),
          const Center(
            child: Padding(
              padding: EdgeInsets.only(top: 12.0),
              child: Text(
                'Payment - Cash',
                style: TextStyle(
                  color: AppColors.primary,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ],
      ),
      content: SizedBox(
        width: context.deviceWidth * 0.5,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SpaceHeight(16.0),
            CustomTextField(
              controller: priceController!,
              label: '',
              showLabel: false,
              keyboardType: TextInputType.number,
              onChanged: (value) {
                final int priceValue = value.toIntegerFromText;
                priceController!.text = priceValue.currencyFormatRp;
                priceController!.selection = TextSelection.fromPosition(
                    TextPosition(offset: priceController!.text.length));
              },
            ),
            const SpaceHeight(16.0),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     Button.filled(
            //       onPressed: () {},
            //       label: 'Uang Pas',
            //       disabled: true,
            //       textColor: AppColors.primary,
            //       fontSize: 13.0,
            //       width: 112.0,
            //       height: 50.0,
            //     ),
            //     const SpaceWidth(4.0),
            //     Flexible(
            //       child: Button.filled(
            //         onPressed: () {},
            //         label: widget.price.currencyFormatRp,
            //         disabled: true,
            //         textColor: AppColors.primary,
            //         fontSize: 13.0,
            //         height: 50.0,
            //       ),
            //     ),
            //   ],
            // ),
            const SpaceHeight(30.0),
            Button.filled(
              onPressed: () {
                //check if price is empty
                if (priceController!.text.isEmpty) {
                  //show dialog error
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text('Error'),
                          content: const Text('Please input the price'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text('OK'),
                            ),
                          ],
                        );
                      });
                  return;
                }

                //if price less than total price
                if (priceController!.text.toIntegerFromText < 100000) {
                  //show dialog error
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text('Error'),
                          content: const Text(
                              'The nominal is less than the total price'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text('OK'),
                            ),
                          ],
                        );
                      });
                  return;
                }
                showDialog(
                    context: context,
                    builder: (context) => PaymentSuccessDialog(
                          isTablet: widget.isTablet,
                        ));
              },
              label: 'Pay',
            ),
          ],
        ),
      ),
    );
  }
}
