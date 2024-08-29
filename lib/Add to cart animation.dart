import 'package:flutter/material.dart';

class AddToCart extends StatefulWidget {
  const AddToCart({super.key});

  @override
  State<AddToCart> createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
  bool isExpended = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        centerTitle: true,
        title: const Text("Shopping Cart Botton Animatio "),
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            setState(() {
              isExpended = !isExpended;
            });
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 800),
            height: 70,
            width: isExpended ? 220 : 90,
            decoration: BoxDecoration(
                color: isExpended ? Colors.green : Colors.black54,
                borderRadius: BorderRadius.circular(isExpended ? 50 : 10)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (isExpended) SizedBox(width: 35),
                Icon(
                  isExpended ? Icons.check : Icons.shopping_cart,
                  size: 30,
                  color: Colors.white,
                ),
                if (isExpended)
                  Expanded(
                    child: Text(
                      "Add to Cart",
                      maxLines: 1,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.white),
                    ),
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
