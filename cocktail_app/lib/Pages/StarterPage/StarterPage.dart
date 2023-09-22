// ignore_for_file: file_names, depend_on_referenced_packages

import 'package:cocktail_app/Pages/NavigationPage/NavigationPage.dart';
import 'package:cocktail_app/animations/Animation.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class StarterPage extends StatefulWidget{
  const StarterPage({super.key});

  @override
  StarterPageState createState() => StarterPageState();
}

class StarterPageState extends State<StarterPage> with TickerProviderStateMixin{
  late AnimationController animationController;
  late Animation<double> animation;
  bool textVisible = true;
  @override
  void initState(){
    animationController = AnimationController(
        vsync: this,
        duration: const Duration(microseconds: 100)
    );
    animation = Tween<double>(
        begin: 1.0,
        end: 25.0
    ).animate(animationController);
    super.initState();
  }
  @override
  void dispose(){
    animationController.dispose();
    super.dispose();
  }
  void onTap(){
    setState(() {
      textVisible = false;
    });
    animationController.forward().then((f) =>
        Navigator.of(context).push(PageTransition(child: const NavigationPage(), type: PageTransitionType.fade
        )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/martini_drink.jpg'),
                fit: BoxFit.cover
            )
        ),
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withOpacity(.9),
                    Colors.black.withOpacity(.8),
                    Colors.black.withOpacity(.2),
                  ]
              )
          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                const FadeAnimation(.5,Text('Welcome to Cocktails!',style: TextStyle(color: Colors.white, fontSize: 50, fontWeight: FontWeight.bold),)),
                const SizedBox(height: 15,),
                const FadeAnimation(1, Text('Discover Cocktail Types', style: TextStyle(color: Colors.white,height: 1.4, fontSize: 18),)),
                const SizedBox(height: 77,),
                FadeAnimation(1.2,
                  ScaleTransition(
                      scale: animation,
                      child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              gradient: const LinearGradient(
                                  colors: [Colors.yellow,
                                    Colors.orange])
                          ),
                          child: AnimatedOpacity(
                            opacity: textVisible ? 1.0:0.0,
                            duration: const Duration(milliseconds: 50),
                            child: MaterialButton(
                              onPressed: () => onTap(),
                              minWidth: double.infinity,
                              child: const Text("Start", style: TextStyle(color: Colors.white),),
                            ),
                          )
                      )),
                ),

                const SizedBox(height: 30,),
                FadeAnimation(1.4,
                    AnimatedOpacity(
                      opacity: textVisible ? 1.0:0.0,
                      duration: const Duration(milliseconds: 50),
                      child: const Align(
                        child: Text("Now Deliver", style: TextStyle(color: Colors.white70, fontSize: 15),),
                      ),
                    )),
                const SizedBox(height: 30,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}