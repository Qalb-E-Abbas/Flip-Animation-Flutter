import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),
  ));
}
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin{


  AnimationController animationController;
  Animation animation, delayed, soMuchDelayed;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(duration: Duration(seconds: 3), vsync: this);
    animation = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
      parent: animationController,
      curve: Curves.fastOutSlowIn
    ));


    delayed = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
        parent: animationController,
        curve: Interval(0.5, 1.0, curve:Curves.fastOutSlowIn)
    ));

    soMuchDelayed = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
        parent: animationController,
        curve: Interval(0.8, 1.0, curve:Curves.fastOutSlowIn)
    ));


    animationController.forward();

  }


  @override
  Widget build(BuildContext context) {

    final width = MediaQuery.of(context).size.width;
    return AnimatedBuilder(animation: animationController, builder: (BuildContext context, Widget child){
      return Scaffold(
        backgroundColor: Colors.grey,
        appBar: new AppBar(title: Text('Curved Animation'), backgroundColor: Colors.grey, elevation: 0.0,),
        body: Align(
          alignment: Alignment.center,
          child: Column(
            children: [
              Transform(
                transform: Matrix4.translationValues(animation.value*width, 0.0, 0.0),
                child: Center(child: Container(
                  padding: EdgeInsets.all(20),
                  height: 90,
                  width: 250,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.blueAccent[700]
                  ),
                  child: Text('Hello, I am curved animation', style: TextStyle(
                      color: Colors.white,
                      fontSize: 20, wordSpacing: 3, fontWeight: FontWeight.bold
                  ),),
                ),),
              ),

              Transform(
                transform: Matrix4.translationValues(delayed.value*width, 0.0, 0.0),
                child: Center(child: Container(
                  padding: EdgeInsets.all(20),
                  height: 90,
                  width: 250,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.blueAccent[700]
                  ),
                  child: Text('Hello, I am delayed curved animation', style: TextStyle(
                      color: Colors.white,
                      fontSize: 20, wordSpacing: 3, fontWeight: FontWeight.bold
                  ),),
                ),),
              ),

              Transform(
                transform: Matrix4.translationValues(soMuchDelayed.value*width, 0.0, 0.0),
                child: Center(child: Container(
                  padding: EdgeInsets.all(20),
                  height: 90,
                  width: 250,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: Colors.blueAccent[700]
                  ),
                  child: Text('Hello, I am more delayed curved animation', style: TextStyle(
                      color: Colors.white,
                      fontSize: 20, wordSpacing: 3, fontWeight: FontWeight.bold
                  ),),
                ),),
              ),

            ],
          )


        ),
      );
    });
  }
}


