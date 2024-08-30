import 'package:flutter/material.dart';
import 'package:flutter_animations/Screens/FABcircularAnimation.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';

class SwiperAnimation extends StatefulWidget {
  const SwiperAnimation({super.key});

  @override
  State<SwiperAnimation> createState() => _SwiperAnimationState();
}

class _SwiperAnimationState extends State<SwiperAnimation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => FABcircularAnimation()));
        },
        child: Icon(Icons.arrow_forward_ios),
      ),
      backgroundColor: Colors.brown[100],
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 40),
            height: MediaQuery.of(context).size.height / 2.2,
            decoration: BoxDecoration(
                color: Colors.white70,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                )),
            child: Swiper(
              layout: SwiperLayout.STACK,
              itemCount: 6,
              itemHeight: 260,
              itemWidth: MediaQuery.of(context).size.width - 30,
              duration: 800,
              loop: true,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                return Container(
                  width: 400,
                  height: 400,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        "images/img$index.png",
                      ),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                );
              },
            ),
          ),
          const SizedBox(
            height: 70,
          ),
          const Text(
            "Swiper Animation",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.blue,
              fontSize: 30,
            ),
          )
        ],
      ),
    );
  }
}
