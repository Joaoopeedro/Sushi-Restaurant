import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sushishop/components/button.dart';
import 'package:sushishop/models/food.dart';
import 'package:sushishop/theme/colors.dart';

import '../components/food_tile.dart';
import 'food_details_page.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {

  //food menu
  List foodMenu = [
    // salmon sushi
    Food(name: "Salmon Sushi", price: "21.00", imagePath: "assets/salmon_sushi.png", rating: "4.9"),
    // tuna
    Food(name: "Tuna", price: "23.00", imagePath: "assets/tuna.png", rating: "4.3"),
  ];

  //navigate to food item details page
  void naviagateToFoodDetails(int index){
    Navigator.push(context,MaterialPageRoute(builder: (BuildContext context)=> FoodDetails(food: foodMenu[index],)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Icon(
          Icons.menu,
          color: Colors.grey[900],
        ),
        title: Text("Tokyo",style: TextStyle(color: Colors.grey[900]),),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //promo banner
          Container(
            decoration: BoxDecoration(
                color: primaryColor,
              borderRadius: BorderRadius.circular(20),
            ),
            margin: const EdgeInsets.symmetric(horizontal: 25),
            padding: const EdgeInsets.symmetric(horizontal: 40,vertical: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    //promo message
                    Text("Get 32% Promo",style: GoogleFonts.dmSerifDisplay(
                      fontSize: 20,
                      color: Colors.white
                    ),),
                    const SizedBox(height: 20,),
                    MyButton(text: "Redeem", onTap: (){})
                  ],
                ),
                Image.asset("assets/many_sushi.png",height: 100,)
              ],
            ),
          ),
          
          const SizedBox(height: 25,),
          
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(color: Colors.white)
                ),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.white)
                ),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.white)
                ),
                hintText: "Search here.."
              ),
            ),
          ),

          const SizedBox(height: 25,),

          //menu list
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Text("Food Menu", style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.grey[800]
            ),),
          ),

          const SizedBox(height: 10,),

          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: foodMenu.length,
                itemBuilder: (context, index){
              return FoodTile(
                food: foodMenu[index],
                onTap: ()=> naviagateToFoodDetails(index),
              );
            }),
          ),

          const SizedBox(height: 25,),


          //popular food

          Container(
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(20)
            ),
            margin: const EdgeInsets.only(left: 25,right: 25,bottom: 25),
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.asset(
                      "assets/salmon_eggs.png",
                      height: 60,
                    ),
                    const SizedBox(width: 20,),
                    //name and price
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //name
                        Text(
                          "Salmon Eggd",
                          style: GoogleFonts.dmSerifDisplay(fontSize: 18),
                        ),

                        const SizedBox(height: 10,),
                        Text(
                          "\$21.00",
                          style: TextStyle(color: Colors.grey[700]),
                        ),
                      ],
                    ),
                    //heart

                  ],
                ),
                const Icon(
                  Icons.favorite_outline,
                  color: Colors.grey,
                  size: 28,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
