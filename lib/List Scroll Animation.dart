import 'package:flutter/material.dart';

import 'Model/scrol_list_model.dart';

class ListScrollAnimation extends StatefulWidget {
  const ListScrollAnimation({super.key});

  @override
  State<ListScrollAnimation> createState() => _ListScrollAnimationState();
}

class _ListScrollAnimationState extends State<ListScrollAnimation> {
  ScrollController scrollController = ScrollController();
  bool closeContainer = false;
  List<Widget> myItems = [];
  double myTopContainer = 0;

  @override
  void initState() {
    super.initState();
    myBodyItem();
    scrollController.addListener(() {
      double data = scrollController.offset / 120;
      setState(() {
        myTopContainer = data;
        closeContainer = scrollController.offset > 50;
      });
    });
  }

  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SizedBox(
          height: size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              AnimatedOpacity(
                opacity: closeContainer ? 0 : 1,
                duration: Duration(microseconds: 500),
                child: AnimatedContainer(
                  duration: Duration(microseconds: 500),
                  width: size.width,
                  alignment: Alignment.topCenter,
                  height: closeContainer ? 0 : size.height * 0.31,
                  child: ListView(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 25),
                        child: Row(
                          children: [
                            Text(
                              "Descover",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.black45),
                            ),
                            Spacer(),
                            Text(
                              "View all",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  color: Colors.black26),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 15,
                              color: Colors.black26,
                            )
                          ],
                        ),
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: Row(
                            children: [
                              DiscoverItems(
                                size,
                                Colors.orange,
                                "Most favorite",
                                "20 items",
                              ),
                              DiscoverItems(
                                size,
                                Colors.blue,
                                "Newest",
                                "23 items",
                              ),
                              DiscoverItems(
                                size,
                                Colors.green,
                                "Super Savings",
                                "10 items",
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 23),
                child: Text(
                  "My Coupons",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.black45),
                ),
              ),
              Expanded(
                  child: ListView.builder(
                controller: scrollController,
                itemCount: myItems.length,
                itemBuilder: (context, index) {
                  double opacity = 1.0;
                  if (myTopContainer > 0.5) {
                    opacity = index + 0.5 - myTopContainer;
                  }
                  if (opacity < 0) {
                    opacity = 0;
                  } else if (opacity > 1) {
                    opacity = 1;
                  }
                  return Opacity(
                    opacity: opacity,
                    child: Transform(
                      transform: Matrix4.identity()..scale(opacity, opacity),
                      alignment: Alignment.topCenter,
                      child: Align(
                        heightFactor: 0.7,
                        child: myItems[index],
                      ),
                    ),
                  );
                },
              ))
            ],
          ),
        ),
      ),
    );
  }

  void myBodyItem() {
    List<Widget> listitems = [];
    for (ScrollItems item in dataItems) {
      listitems.add(
        Container(
          height: 160,
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          decoration: BoxDecoration(
              color: Color(item.color),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 5,
                )
              ],
              borderRadius: BorderRadius.circular(20)),
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                item.name,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
              ),
              Image.asset(
                item.image,
                fit: BoxFit.cover,
              )
            ],
          ),
        ),
      );
    }
    setState(() {
      myItems = listitems;
    });
  }

  //Items Discover Container
  Container DiscoverItems(Size size, Color color, name, items) {
    return Container(
      height: size.height * 0.23,
      width: 170,
      margin: EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: EdgeInsets.all(12),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      height: 1.2,
                      color: Colors.white),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(items, style: TextStyle(fontSize: 16, color: Colors.white))
              ],
            ),
            Positioned(
              bottom: 10,
              right: 10,
              child: Icon(
                Icons.favorite_border,
                color: Colors.white54,
                size: 40,
              ),
            )
          ],
        ),
      ),
    );
  }
}
