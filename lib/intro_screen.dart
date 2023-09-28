import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:tic_tac_toe/utils/styles.dart';

import 'home_page.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                    padding: const EdgeInsets.only(top: 100),

                    child: Text('TIC TAC TOE',style: TextStyles.myNewfontWhite.copyWith(fontSize: 25),)),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  child: AvatarGlow(
                      endRadius: 140,
                      glowColor: Colors.white,
                      repeat: true,
                      repeatPauseDuration: Duration(seconds: 1),
                      startDelay: Duration(seconds: 1),

                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                                style: BorderStyle.none
                            ),
                            shape: BoxShape.circle
                        ),
                        child: CircleAvatar(
                          backgroundColor: Colors.grey[900],
                          radius: 100.0,
                          child: Image.asset('assets/images/ttt.png',fit: BoxFit.scaleDown,),

                        ),
                      )

                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context) => const MyHomePage(),)),
                  child: Container(
                    margin: const EdgeInsets.only(left: 40,right: 40,bottom: 60,top: 60),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white
                    ),
                    child: Center(
                      child: Text("Play Game",style: TextStyles.myNewfont,),
                    ),
                  ),
                ),
              )


            ],
          ),
        ),
      ),

    );
  }
}