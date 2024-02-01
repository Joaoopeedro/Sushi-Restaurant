import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sushishop/components/button.dart';
import 'package:sushishop/theme/colors.dart';

import '../models/food.dart';

class FoodDetails extends StatefulWidget {
  final Food food;
  const FoodDetails({super.key, required this.food});

  @override
  State<FoodDetails> createState() => _FoodDetailsState();
}

class _FoodDetailsState extends State<FoodDetails> {
  //quantity
  int quantityCount = 0;

  // decrement quantity
  void decrementQuantity(){
    setState(() {
      if(quantityCount > 0){
        quantityCount--;
      }
    });
  }

  // increment quantity
  void incrementQuantity(){
    setState(() {
      setState(() {
        quantityCount++;
      });
    });
  }

  // add card
  void addToCard(){

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.grey[900],
      ),
      body: Column(
        children: [
          // listView of food details
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: ListView(
                children: [
                  //image
                  Image.asset(
                    widget.food.imagePath,
                    height: 200,
                  ),

                  const SizedBox(height: 25,),

                  //rating
                  Row(
                    children: [
                      //star Icon
                      Icon(
                        Icons.star,
                        color: Colors.yellow[800],
                      ),

                      const SizedBox(width: 5,),

                      //rating
                      Text(
                        widget.food.rating,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[800]
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 10,),
                  
                  //food name
                  Text(
                    widget.food.name,
                    style: GoogleFonts.dmSerifDisplay(
                      fontSize: 28
                    ),
                  ),
                  
                   const SizedBox(height: 25,),
                  
                  //descrition
                  Text(
                    "Descrition",
                    style: TextStyle(
                      color: Colors.grey[900],
                      fontSize: 18,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  
                  const SizedBox(height: 10,),
                  
                  Text(
                    "Delicate sliced, fresh Atlantic salmon drapes elegantly over a piloow of perfectly seasoned sushi rice. Its vibrant hue and buttery texture promise an exquisite mait-in-your-mouth experience, Paired with a whisper of wasabi and a side of traditional pickled ginger, our salmon sushi is an ode to the purity and simplicity of authentic Japanese flavors. Indulge in the ocean`s bounty with each savory bite.",
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 14,
                      height: 2
                    ),
                  )


                ],
              ),
            ),
          ),

          // price + quantity + add to card button
          Container(
            color: primaryColor,
              padding: const EdgeInsets.all(25),
              child: Column(
                children: [
                  //price + quantity
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //price
                      Text(
                        "\$" + widget.food.price,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold
                        ),
                      ),

                      //quantity
                      Row(
                        children: [
                          //minus button
                          Container(
                            decoration: BoxDecoration(
                                color: secundaryColor,
                              shape: BoxShape.circle
                            ),
                            child: IconButton(
                              icon: const Icon(Icons.remove),
                              color: Colors.white,
                              onPressed: decrementQuantity,
                            ),
                          ),

                          // quantity count
                          SizedBox(
                            width: 40,
                            child: Center(
                              child: Text(
                                quantityCount.toString(),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ),

                          //plus button
                          Container(
                            decoration: BoxDecoration(
                                color: secundaryColor,
                                shape: BoxShape.circle
                            ),
                            child: IconButton(
                              icon: const Icon(Icons.add),
                              color: Colors.white,
                              onPressed: incrementQuantity,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 25,),
                  
                 // add to cart button
                  MyButton(text: "Add To Card", onTap: addToCard)
                ],
              ),
          )
        ],
      ),
    );
  }
}
