import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sushishop/components/button.dart';
import 'package:sushishop/theme/colors.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const SizedBox(height: 25,),

            Text("SUSHI MAN",style: GoogleFonts.dmSerifDisplay(
              fontSize: 28,
              color: Colors.white
            ),),
            
            const SizedBox(height: 25,),
            Padding(
              padding: EdgeInsets.all(50),
              child: Image.asset("assets/salmon_eggs.png"),
            ),

            const SizedBox(height: 20,),

            Text(
              "THE TASTE OF JAPONESE FOOD",
              style: GoogleFonts.dmSerifDisplay(
                fontSize: 42,
                color: Colors.white
              ),
            ),

            const SizedBox(height: 10,),
            Text(
              "Fell the tate of the most popular Japanese food from anywhere and anytime",
              style: TextStyle(
                color: Colors.grey[300],
                height: 2
              ),
            ),

            const SizedBox(height: 10,),

            //get started button
            MyButton(text: "Get Started",onTap: (){
              Navigator.pushNamed(context, "/menupage");
            },),
            
            
          ],
        ),
      ),
    );
  }
}
