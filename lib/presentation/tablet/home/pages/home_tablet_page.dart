import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_fic23pos_responsive/core/assets/assets.gen.dart';
import 'package:flutter_fic23pos_responsive/core/components/buttons.dart';
import 'package:flutter_fic23pos_responsive/core/components/menu_button.dart';
import 'package:flutter_fic23pos_responsive/core/components/spaces.dart';
import 'package:flutter_fic23pos_responsive/core/constants/colors.dart';
import 'package:flutter_fic23pos_responsive/core/extensions/build_context_ext.dart';
import 'package:flutter_fic23pos_responsive/core/extensions/int_ext.dart';
import 'package:flutter_fic23pos_responsive/data/data_dummy.dart';
import 'package:flutter_fic23pos_responsive/presentation/home/widgets/product_card.dart';
import 'package:flutter_fic23pos_responsive/presentation/order/widgets/payment_cash_dialog.dart';
import 'package:flutter_fic23pos_responsive/presentation/tablet/home/pages/dashboard_tablet_page.dart';
import 'package:flutter_fic23pos_responsive/presentation/tablet/home/widgets/home_title.dart';

import '../widgets/order_menu.dart';

class HomeTabletPage extends StatefulWidget {
  const HomeTabletPage({super.key});

  @override
  State<HomeTabletPage> createState() => _HomeTabletPageState();
}

class _HomeTabletPageState extends State<HomeTabletPage> {
  final searchController = TextEditingController();
  final tableNumberController = TextEditingController();
  final orderNameController = TextEditingController();
  final indexValuePayment = ValueNotifier(0);
  bool isOpenBill = false;
  int indexValue = 0;
  int finalTotalPrice = 0;

  @override
  void initState() {
    super.initState();
  }

  void onCategoryTap(int index) {
    searchController.clear();
    indexValue = index;

    // context.read<ProductBloc>().add(ProductEvent.fetchByCategory(categoryId));
    setState(() {});
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    searchController.dispose();
    tableNumberController.dispose();
    orderNameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'confirmation_screen',
      child: Scaffold(
        body: Row(
          children: [
            Expanded(
              flex: 3,
              child: Align(
                alignment: AlignmentDirectional.topStart,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        HomeTitle(
                          controller: searchController,
                          onChanged: (value) {},
                        ),
                        const SizedBox(height: 24),
                        SizedBox(
                          width: context.deviceWidth,
                          height: 84,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,

                            itemCount: categories.length + 1,
                            // shrinkWrap: true,
                            itemBuilder: (BuildContext context, int index) {
                              if (index == 0) {
                                return Padding(
                                  padding: const EdgeInsets.only(right: 8.0),
                                  child: SizedBox(
                                    width: 120,
                                    height: 84,
                                    child: MenuButton(
                                      size: 30,
                                      iconPath: Assets.icons.allCategories.path,
                                      label: 'All',
                                      isImage: false,
                                      isActive: indexValue == index,
                                      onPressed: () => onCategoryTap(index),
                                    ),
                                  ),
                                );
                              } else {
                                final category = categories[index - 1];
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8.0,
                                  ),
                                  child: SizedBox(
                                    width: 120,
                                    height: 84,
                                    child: MenuButton(
                                      iconPath: Assets.icons.allCategories.path,
                                      label: category.name,
                                      isActive: indexValue == index,
                                      isImage: false,
                                      onPressed: () {},
                                      size: 30,
                                    ),
                                  ),
                                );
                              }
                            },
                          ),
                        ),
                        const SpaceHeight(35.0),
                        GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: dummyProducts.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                childAspectRatio: 0.8,
                                crossAxisCount: 3,
                                crossAxisSpacing: 16.0,
                                mainAxisSpacing: 16.0,
                              ),
                          itemBuilder: (context, index) =>
                              ProductCard(data: dummyProducts[index]),
                        ),
                        const SpaceHeight(30.0),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            // Right
            Expanded(
              flex: 2,
              child: Align(
                alignment: Alignment.topCenter,
                child: Stack(
                  children: [
                    SingleChildScrollView(
                      padding: const EdgeInsets.all(24.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Row(
                            children: [
                              Text(
                                'Orders #',
                                style: TextStyle(
                                  color: AppColors.primary,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          const SpaceHeight(8.0),
                          Row(
                            children: [
                              isOpenBill
                                  ? Button.outlined(
                                      width: 120.0,
                                      height: 40,
                                      onPressed: () {
                                        setState(() {
                                          isOpenBill = false;
                                        });
                                      },
                                      label: 'Dine In',
                                    )
                                  : Button.filled(
                                      width: 120.0,
                                      height: 40,
                                      onPressed: () {
                                        setState(() {
                                          isOpenBill = false;
                                        });
                                      },
                                      label: 'Dine In',
                                    ),
                              const SpaceWidth(8.0),
                              isOpenBill
                                  ? Button.filled(
                                      width: 120.0,
                                      height: 40,
                                      onPressed: () {
                                        setState(() {
                                          isOpenBill = true;
                                        });
                                      },
                                      label: 'Open Bill',
                                    )
                                  : Button.outlined(
                                      width: 120.0,
                                      height: 40,
                                      onPressed: () {
                                        setState(() {
                                          isOpenBill = true;
                                        });
                                      },
                                      label: 'Open Bill',
                                    ),
                            ],
                          ),
                          const SpaceHeight(16.0),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Item',
                                style: TextStyle(
                                  color: AppColors.primary,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(width: 130),
                              SizedBox(
                                width: 50.0,
                                child: Text(
                                  'Qty',
                                  style: TextStyle(
                                    color: AppColors.primary,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              SizedBox(
                                child: Text(
                                  'Price',
                                  style: TextStyle(
                                    color: AppColors.primary,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SpaceHeight(8),
                          const Divider(),
                          const SpaceHeight(8),
                          SizedBox(
                            width: context.deviceWidth,
                            height: context.deviceHeight * 0.45,
                            child: ListView.separated(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) =>
                                  OrderMenu(data: dummyOrderItems[index]),
                              separatorBuilder: (context, index) =>
                                  const SpaceHeight(1.0),
                              itemCount: dummyOrderItems.length,
                            ),
                          ),
                          const SpaceHeight(8.0),
                          const Divider(),
                          const SpaceHeight(8.0),
                          if (isOpenBill) ...[
                            TextFormField(
                              decoration: const InputDecoration(
                                hintText: 'Table Number',
                              ),
                              //number
                              keyboardType: TextInputType.number,
                              controller: tableNumberController,
                            ),
                            TextFormField(
                              decoration: const InputDecoration(
                                hintText: 'Order Name',
                              ),
                              controller: orderNameController,
                              textCapitalization: TextCapitalization.words,
                            ),
                          ],
                          if (!isOpenBill) ...[
                            ValueListenableBuilder(
                              valueListenable: indexValuePayment,
                              builder: (context, value, _) => Row(
                                children: [
                                  Flexible(
                                    child: MenuButton(
                                      iconPath: Assets.icons.cash.path,
                                      label: 'CASH',
                                      isActive: value == 1,
                                      onPressed: () {
                                        log("Payment Cash");
                                        indexValuePayment.value = 1;
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
                                        indexValuePayment.value = 2;
                                        log("Payment QRIS");
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
                                        indexValuePayment.value = 3;
                                        log("Payment TRANSFER");
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                          const SpaceHeight(8.0),
                          const Divider(),
                          const SpaceHeight(8.0),
                          Column(
                            children: [
                              const SpaceHeight(12.0),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'Total',
                                    style: TextStyle(
                                      color: AppColors.primary,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    1000000.currencyFormatRp,
                                    style: const TextStyle(
                                      color: AppColors.primary,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SpaceHeight(100.0),
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: isOpenBill
                          ? Padding(
                              padding: const EdgeInsets.all(16),
                              child: Button.filled(
                                onPressed: () async {
                                  //open bill success snack bar
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text('Save Draft Order Success'),
                                      backgroundColor: AppColors.primary,
                                    ),
                                  );

                                  context.pushReplacement(
                                    const DashboardTabletPage(),
                                  );
                                },
                                label: 'Save & Print',
                                fontSize: 14,
                                height: 52,
                                width: context.deviceWidth,
                              ),
                            )
                          : ColoredBox(
                              color: AppColors.white,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 24.0,
                                  vertical: 16.0,
                                ),
                                child: Button.filled(
                                  onPressed: () {
                                    if (indexValuePayment.value == 0) {
                                    } else if (indexValuePayment.value == 1) {
                                      showDialog(
                                        context: context,
                                        builder: (context) => PaymentCashDialog(
                                          price: finalTotalPrice,
                                          isTablet: true,
                                        ),
                                      );
                                    } else if (indexValuePayment.value == 2) {
                                      // showDialog(
                                      //   context: context,
                                      //   barrierDismissible: false,
                                      //   builder: (context) => PaymentQrisDialog(
                                      //     price: finalTotalPrice,
                                      //     isTablet: true,
                                      //   ),
                                      // );
                                    }
                                  },
                                  label: 'Payment',
                                ),
                              ),
                            ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
