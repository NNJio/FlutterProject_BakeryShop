import 'package:flutter/material.dart';

class SaleWidget extends StatelessWidget {
  const SaleWidget({Key? key}) : super(key: key);

  //Edit in sale banner

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height * 0.2,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        gradient: const LinearGradient(
            colors: [
              Color(0xFF2a9d8f),
              Color(0xFFe76f51),
            ],
            begin: FractionalOffset(0.0, 0.0),
            end: FractionalOffset(1.0, 1.0),
            stops: [0.0, 1.0],
            tileMode: TileMode.clamp),
      ),
      child: Row(
        children: [
          // about detail sale box is text and price tag

          Flexible(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(14.0),
              child: Container(
                height: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xFFe9c46a),
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: const [
                      Text(
                        "เงื่อนไขโปรโมชั่นเป็นไปตามที่กำหนด",
                        style: TextStyle(
                          color: Color(0xFF2a9d8f),
                          fontFamily: 'Rsu',
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(
                        height: 18,
                      ),
                      Flexible(
                        child: SizedBox(
                          width: double.infinity,
                          child: FittedBox(
                            fit: BoxFit.fill,
                            child: Text(
                              "Promotion\nNow!!",
                              style: TextStyle(
                                color: Color(0xFFe76f51),
                                fontFamily: 'Rsu',
                                fontSize: 3,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),

          // sale content

          Flexible(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.all(14.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(18),
                child: Container(
                  color: Colors.white,
                  child: Image.asset(
                    "assets/images/events/event1.png",
                    width: MediaQuery.of(context).size.width * 1,
                    // fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
