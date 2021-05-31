import 'package:animations/animations.dart';
import 'package:fitness_ui/model/meal.dart';
import 'package:fitness_ui/ui/meal_details.dart';
import 'package:fitness_ui/ui/workout_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//Imported vector math to access radians
import 'package:vector_math/vector_math_64.dart' as math;

// imported the intl package to access the date and time
import 'package:intl/intl.dart';

class profileScreen extends StatelessWidget {
  const profileScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // creating a final variable height to access the height of the device screen ===
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    // creating a final variable today to access the date and time  of the device ===

    final today = DateTime.now();

    return Scaffold(
      backgroundColor: const Color(0xFFE9E9E9),
      // ==  A stack was used in order for us to access the positioned widget the seperate the top and
      // bottom designs.

      //Bottom Navigation Design Start ===//
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
        child: BottomNavigationBar(
          iconSize: 40,
          selectedIconTheme: IconThemeData(color: const Color(0xFF200078)),
          unselectedIconTheme: IconThemeData(
            color: Colors.black12,
          ),
          items: [
            BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Icon(
                    Icons.home,
                  ),
                ),
                title: Text(
                  'Home',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                )),
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Icon(
                  Icons.search,
                ),
              ),
              title: Text(
                'Search',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Icon(
                    Icons.person,
                  ),
                ),
                title: Text(
                  'Profile',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                )),
          ],
        ),
      ),
      //Bottom Navigation Design END ===//

      // First Container Design Start ====
      body: Stack(
        children: [
          Positioned(
            top: 0,
            height: height * 0.35,
            left: 0,
            right: 0,
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(
                bottom: const Radius.circular(40),
              ),
              child: Container(
                color: Colors.white,
                padding:
                    EdgeInsets.only(top: 40, left: 30, right: 17, bottom: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      title: Text(
                        // Creating a date format
                        '${DateFormat('EEEE').format(today)}, ${DateFormat('d MMM').format(today)}',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                        ),
                      ),
                      subtitle: Text(
                        'Welcome Destiny',
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 19,
                          color: Colors.black,
                        ),
                      ),
                      trailing: ClipOval(
                        child: Image.asset('images/food1.jpg'),
                      ),
                    ),

                    //======== Radial Progress Start===
                    //===A Radial method ws created below.  this is to create the Radial progress bar=====
                    SizedBox(
                      height: 7,
                    ),
                    Row(
                      children: <Widget>[
                        _RadialProgress(
                          width: width * 0.4,
                          height:width * 0.4,
                          progress: 0.7,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            NutritionProgress(
                              ingredient: 'Protein',
                              progress: 0.3,
                              progressColor: Colors.green,
                              leftAmount:71 ,
                              width: width * 0.28,
                            ),
                            SizedBox(height: 10,),
                            NutritionProgress(
                              ingredient: 'Carbs',
                              progress: 0.2,
                              progressColor: Colors.red,
                              leftAmount:151 ,
                              width: width * 0.28,
                            ),
                            SizedBox(height: 10,),
                            NutritionProgress(
                              ingredient: 'Fat',
                              progress: 0.1,
                              progressColor: Colors.yellow,
                              leftAmount:60 ,
                              width: width * 0.28,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),

          // First Container Design End ====

          // ===================Creating the Meals for the Day block  Start ===============
          Positioned(
            top: height * 0.38,
            left: 0,
            right: 0,
            child: Container(
              height: height * 0.55,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding:
                        const EdgeInsets.only(bottom: 8, right: 16, left: 33),
                    child: Text(
                      'MEALS FOR THE DAY.',
                      style: TextStyle(
                        fontSize: 14,
                        wordSpacing: 5,
                        color: Colors.blueGrey,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),

                  //== Controls the Scrolling of the Meal Card Start===
                  Expanded(
                    child: Container(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: <Widget>[
                            SizedBox(
                              width: 34,
                            ),
                            for (int i = 0; i < meals.length; i++)
                              MealCard(
                                meal: meals[i],
                              ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  //== Controls the Scrolling if the Meak Card End===
                  SizedBox(
                    height: 19,
                  ),

                  //=========Exercise Block Design Start==========//
                  Expanded(
                    // open container was created for the implementation of the animation
                    child: OpenContainer(
                      closedElevation: 0,
                      transitionType:ContainerTransitionType.fadeThrough ,
                      transitionDuration: const Duration(milliseconds: 1000),
                      closedColor:const Color(0xFFE9E9E9),
                      openBuilder: (context, _){
                        return WorkoutScreen();
                      },
                      closedBuilder: ( context, VoidCallback openContainer){
                        return GestureDetector(
                          onTap: openContainer,
                          child: Container(
                            margin: EdgeInsets.only(right: 31, bottom: 13, left: 31),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(30)),
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  const Color(0xFF20008B),
                                  const Color(0xFF200087),
                                ],
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(top: 17, left: 16),
                                  child: Text('Your Next WorkOut',
                                      style: TextStyle(
                                        fontSize: 17,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w800,
                                      )),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 10, left: 16),
                                  child: Text('Upper Body',
                                      style: TextStyle(
                                        fontSize: 19,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w800,
                                      )),
                                ),
                                Expanded(
                                  child: Row(
                                    children: <Widget>[
                                      SizedBox(
                                        width: 19,
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          color: const Color(0xFF5b4d9d),
                                          borderRadius:
                                          BorderRadius.all(Radius.circular(30)),
                                        ),
                                        child: Image.asset('images/fit2.png'),
                                        width: 60,
                                        height: 60,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          color: const Color(0xFF5b4d9d),
                                          borderRadius:
                                          BorderRadius.all(Radius.circular(30)),
                                        ),
                                        child: Image.asset('images/fit1.png'),
                                        width: 60,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          color: const Color(0xFF5b4d9d),
                                          borderRadius:
                                          BorderRadius.all(Radius.circular(30)),
                                        ),
                                        child: Image.asset('images/fit2.png'),
                                        width: 60,
                                        height: 60,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      // First Container Design End ====
    );
  }
}

//Creating A diet progress class for the Diet progress bar
class NutritionProgress extends StatelessWidget {
  final String ingredient;
  final int leftAmount;
  final double progress;
  final Color progressColor;
 final  width;
  const NutritionProgress(
      {Key key,
      this.ingredient,
      this.leftAmount,
      this.progress,
      this.progressColor, this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          ingredient.toUpperCase(),
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children:<Widget> [
            Stack(
              children:[ Container(
                height: 10,
                width: width,
                decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                ),
              ),


                Container(
                  height: 10,
                  width: width * progress,
                  decoration: BoxDecoration(
                    color: progressColor,
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                  ),
                ),
             ],
            ),
            SizedBox(width: 10,),
            Text('${leftAmount}g left'),
          ],
        ),
      ],
    );
  }
}

//==========Class created for the Creation of the Radial Progress Bar Start
class _RadialProgress extends StatelessWidget {
  final double height, width, progress;

  const _RadialProgress({Key key, this.width, this.height, this.progress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _RadialPainter(progress: 0.7),
      child: Container(
        height: height,
        width: width,
        child: Center(
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(children: [
              TextSpan(
                text: '1345',
                style: TextStyle(
                  fontSize: 27,
                  fontWeight: FontWeight.w800,
                  color: const Color(0xff200087),
                ),
              ),
              TextSpan(text: '\n'),
              TextSpan(
                  text: 'Kcal left',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xff200087),
                  )),
            ]),
          ),
        ),
      ),
    );
  }
}

// Creating a custom paint for the ProgressBar Start
class _RadialPainter extends CustomPainter {
  final double progress;

  _RadialPainter({this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..strokeWidth = 10
      ..color = Color(0xff200087)
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    Offset center = Offset(size.width / 2, size.height / 2);
    double relativeProgress = 360 * progress;
    // canvas.drawCircle(center, size.width / 2, paint);
    canvas.drawArc(Rect.fromCircle(center: center, radius: size.width / 2),
        math.radians(-90), math.radians(-relativeProgress), false, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
// Class created for the Creation of the Radial Progress Bar End========

// Meal Card created for the Meal Slider.
//==========Meal Card Build Start========
class MealCard extends StatelessWidget {
  final Meal meal;

  const MealCard({Key key, @required this.meal}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        right: 19,
        bottom: 10,
      ),
        child: Material(
          borderRadius: BorderRadius.all(Radius.circular(39)),
          elevation: 4,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[

              // created for the animation
              Flexible(
                fit: FlexFit.tight,
                child: OpenContainer(
                  closedShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20))
                  ),
                  transitionDuration: const Duration(milliseconds: 1000),
                  openBuilder: (context, _){
                    return MealDetailScreen(meal: meal,
                    );
                  },
                  closedBuilder: (context, openContainer){
                    return GestureDetector(
                      onTap: openContainer,
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        child:Image.asset(
                          meal.image_path,
                          width: 150,
                          fit: BoxFit.fill,
                        ),
                      ),
                    );
                  },

              ),
              ),
              Flexible(
                  fit: FlexFit.tight,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          meal.mealTime,
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                              color: Colors.blueGrey),
                        ),
                        Text(
                          meal.name,
                          style: TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 20,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          '${meal.kiloCaloriesBurnt} kcal',
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 13,
                              color: Colors.blueGrey),
                        ),
                        Row(
                          children: <Widget>[
                            Icon(
                              Icons.access_time,
                              color: Colors.black12,
                              size: 13,
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Text('${meal.timeTaken} min'),
                          ],
                        ),
                        SizedBox(
                          height: 16,
                        )
                      ],
                    ),
                  ))
            ],
          ),
        ),
      );
  }
}
//==========Meal Card Build End========
// Creating Meals for the day block End.  Value were taken from the meal class in the meal.dart file
