import 'package:flutter/material.dart';
import 'package:flutter_fic23pos_responsive/core/constants/colors.dart';
import 'package:flutter_fic23pos_responsive/data/data_dummy.dart';

import '../../../core/assets/assets.gen.dart';
import '../../../core/components/menu_button.dart';
import '../../../core/components/search_input.dart';
import '../../../core/components/spaces.dart';
import '../widgets/product_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final searchController = TextEditingController();
  final indexValue = ValueNotifier(0);
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  void onCategoryTap(int index) {
    searchController.clear();
    currentIndex = index;
    // String category = 'all';
    // switch (index) {
    //   case 0:
    //     category = 'all';
    //     break;
    //   case 1:
    //     category = 'drink';
    //     break;
    //   case 2:
    //     category = 'food';
    //     break;
    //   case 3:
    //     category = 'snack';
    //     break;
    // }
    // context.read<ProductBloc>().add(ProductEvent.fetchByCategory(category));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.primary,
        title: const Text(
          'Menu Cafe',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          SearchInput(
            controller: searchController,
            onChanged: (value) {},
          ),
          const SpaceHeight(16.0),
          SizedBox(
            height: 90,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                SizedBox(
                  height: 80,
                  width: 90,
                  child: MenuButton(
                      iconPath: Assets.icons.allCategories.path,
                      label: 'All',
                      isActive: currentIndex == 0,
                      onPressed: () {
                        onCategoryTap(0);
                      }),
                ),
                const SpaceWidth(10.0),
                ...categories
                    .map(
                      (e) => SizedBox(
                        height: 80,
                        width: 90,
                        child: MenuButton(
                          iconPath: Assets.icons.allCategories.path,
                          label: e.name,
                          isActive: currentIndex == 1,
                          onPressed: () {},
                        ),
                      ),
                    )
                    .toList(),
              ],
            ),
          ),
          const SpaceHeight(16.0),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: dummyProducts.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 0.75,
              crossAxisCount: 2,
              crossAxisSpacing: 16.0,
              mainAxisSpacing: 16.0,
            ),
            itemBuilder: (context, index) => ProductCard(
              data: dummyProducts[index],
            ),
          ),
        ],
      ),
    );
  }
}
