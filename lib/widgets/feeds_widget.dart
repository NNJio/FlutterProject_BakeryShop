import 'package:fancy_shimmer_image/fancy_shimmer_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:store_api_flutter_course/models/products_model.dart';

import '../consts/global_colors.dart';
import '../screens/product_details.dart';

class FeedsWidget extends StatelessWidget {
  const FeedsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productsModelProvider = Provider.of<ProductsModel>(context);

    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Material(
        borderRadius: BorderRadius.circular(8.0),
        color: Theme.of(context).cardColor,
        child: InkWell(
          borderRadius: BorderRadius.circular(8.0),
          onTap: () {
            Navigator.push(
              context,
              PageTransition(
                type: PageTransitionType.fade,
                child: ProductDetails(
                  id: productsModelProvider.id.toString(),
                ),
              ),
            );
          },

          // data

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Product Price

              Padding(
                padding: const EdgeInsets.only(left: 5, right: 5, top: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: RichText(
                        text: TextSpan(
                            text: '\฿ ',
                            style: const TextStyle(color: Color(0xFFe76f51)),
                            children: <TextSpan>[
                              TextSpan(
                                  text: "${productsModelProvider.price}",
                                  style: TextStyle(
                                      color: lightTextColor,
                                      fontWeight: FontWeight.w600)),
                            ]),
                      ),
                    ),
                    const Icon(IconlyBold.heart),
                  ],
                ),
              ),
              const SizedBox(height: 10),

              // Products images

              Padding(
                padding: EdgeInsets.fromLTRB(12, 2, 12, 2),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Container(
                    child: Image.asset(
                      "assets/images/TestProduct.png",
                      height: size.height * 0.2,
                      // width: double.infinity,
                      // errorWidget: const Icon(
                      //   IconlyBold.danger,
                      //   color: Color(0xFFe76f51),
                      //   size: 28,
                      // ),
                      // imageUrl: productsModelProvider.images![0],
                      // boxFit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),

              // Products Name

              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "ชื่อสินค้า",
                  // productsModelProvider.title.toString(),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: TextStyle(
                    color: Color(0xFF2a9d8f),
                    fontFamily: 'Rsu',
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),

              // Products details

              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "อธิบายรายละเอียดสินค้า",
                  // productsModelProvider.title.toString(),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: TextStyle(
                    color: Color(0xFFe76f51),
                    fontFamily: 'Rsu',
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
