import 'package:flutter/material.dart';
import 'package:flutter_animations/Screens/SwiperAnimation.dart';

import '../Model/ProductsModel.dart';

class MovingObjectAnimation extends StatefulWidget {
  const MovingObjectAnimation({super.key});

  @override
  _MoveObjectAnimationState createState() => _MoveObjectAnimationState();
}

class _MoveObjectAnimationState extends State<MovingObjectAnimation>
    with SingleTickerProviderStateMixin {
  int selectedIndex = 0;
  late AnimationController animationController;
  late Animation<Offset> moveAnimation;
  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    )..repeat(reverse: true);
    moveAnimation = Tween(
      begin: const Offset(0, 0),
      end: const Offset(0, 0.03),
    ).animate(animationController);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => SwiperAnimation()));
        },
        child: Icon(Icons.arrow_forward_ios),
      ),
      backgroundColor: const Color.fromARGB(255, 41, 41, 41),
      body: SafeArea(
        child: Column(
          children: [
            SlideTransition(
              position: moveAnimation,
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 1000),
                child: Image.asset(
                  products[selectedIndex].image,
                  key: ValueKey<int>(selectedIndex),
                ),
              ),
            ),
            const SizedBox(height: 25),
            const Text(
              "MovingObjectAnimation",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 26,
                color: Colors.white,
              ),
            ),
            const Text(
              "Bluethooth Headophones",
              style: TextStyle(
                fontSize: 21,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(products.length, (index) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: products[index].color,
                        border: Border.all(
                          width: 2,
                          color: selectedIndex == index
                              ? Colors.white70
                              : Colors.transparent,
                        ),
                      ),
                      child: Icon(
                        Icons.check,
                        color: selectedIndex == index
                            ? Colors.white
                            : Colors.transparent,
                      ),
                    ),
                  ),
                );
              }),
            ),
            const SizedBox(height: 25),
            const Text(
              "Rs. 1999",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 27,
                color: Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
