import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:page_transition/page_transition.dart';
import 'package:store_api_flutter_course/consts/global_colors.dart';
import 'package:store_api_flutter_course/screens/categories_screen.dart';
import 'package:store_api_flutter_course/screens/feeds_screen.dart';
import 'package:store_api_flutter_course/screens/users_screen.dart';
import 'package:store_api_flutter_course/services/api_handler.dart';

import '../models/products_model.dart';
import '../widgets/appbar_icons.dart';
import '../widgets/feeds_grid.dart';
import '../widgets/feeds_widget.dart';
import '../widgets/sale_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late TextEditingController _textEditingController;
  @override
  void initState() {
    _textEditingController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },

      // Header Zone

      child: Scaffold(
          appBar: AppBar(
            title: const Text(
              'KHANOM BANHD',
              style: TextStyle(
                fontFamily: 'Rsu',
                fontSize: 32,
              ),
            ),
            leading: AppBarIcons(
              function: () {
                Navigator.push(
                  context,
                  PageTransition(
                    type: PageTransitionType.fade,
                    child: const CategoriesScreen(),
                  ),
                );
              },
              icon: IconlyBold.category,
            ),
            actions: [
              AppBarIcons(
                function: () {
                  Navigator.push(
                    context,
                    PageTransition(
                      type: PageTransitionType.fade,
                      child: const UsersScreen(),
                    ),
                  );
                },
                icon: IconlyBold.user3,
              ),
            ],
          ),

          // Search bar

          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 18,
                ),
                TextField(
                  style: const TextStyle(
                    fontFamily: 'Rsu',
                    fontSize: 19,
                  ),
                  controller: _textEditingController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      hintText: "ค้นหาขนมที่คุณต้องการ",
                      filled: true,
                      fillColor: const Color.fromARGB(240, 234, 215, 193),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(
                          color: Colors.white,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: const BorderSide(
                          width: 3,
                          color: Color(0xFF2a9d8f),
                        ),
                      ),
                      suffixIcon: Icon(
                        IconlyLight.search,
                        color: lightIconsColor,
                      )),
                ),
                const SizedBox(
                  height: 18,
                ),

                // Banner promotion

                Expanded(
                  child: SingleChildScrollView(
                    child: Column(children: [
                      SizedBox(
                        height: size.height * 0.25,
                        child: Swiper(
                          itemCount: 6,
                          itemBuilder: (ctx, index) {
                            return const SaleWidget();
                          },
                          autoplay: true,
                          pagination: const SwiperPagination(
                              alignment: Alignment.bottomCenter,
                              builder: DotSwiperPaginationBuilder(
                                  color: Color(0xFF2a9d8f),
                                  activeColor: Color(0xFFE76F51))),
                        ),
                      ),

                      // Next contents

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            const Text(
                              "ขนมทั้งหมดภายในร้าน",
                              style: TextStyle(
                                color: Color(0xFF2a9d8f),
                                fontFamily: 'Rsu',
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                              ),
                            ),
                            const Spacer(),
                            AppBarIcons(
                                function: () {
                                  Navigator.push(
                                      context,
                                      PageTransition(
                                          type: PageTransitionType.fade,
                                          child: const FeedsScreen()));
                                },
                                icon: IconlyBold.arrowRight2),
                          ],
                        ),
                      ),

                      // Show some products

                      FutureBuilder<List<ProductsModel>>(
                          future: APIHandler.getAllProducts(limit: "3"),
                          builder: ((context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            } else if (snapshot.hasError) {
                              Center(
                                child:
                                    Text("An error occured ${snapshot.error}"),
                              );
                            } else if (snapshot.data == null) {
                              const Center(
                                child: Text("No products has been added yet"),
                              );
                            }
                            return FeedsGridWidget(
                                productsList: snapshot.data!);
                          }))
                    ]),
                  ),
                )
              ],
            ),
          )),
    );
  }
}
