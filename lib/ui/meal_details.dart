import 'package:fitness_ui/model/meal.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MealDetailScreen extends StatelessWidget {
  final Meal meal;

  const MealDetailScreen({Key key, this.meal}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE9E9E9),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            snap: true,
            floating: true,
            backgroundColor: const Color(0xFF200087),
            expandedHeight: 300,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(40),
              ),
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: ClipRRect(
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(40)),
                  child: Image.asset(meal.image_path, fit: BoxFit.cover)),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                SizedBox(
                  height: 11,
                ),
                ListTile(
                  title: Text(
                    meal.mealTime.toUpperCase(),
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: Colors.black54,
                    ),
                  ),
                  subtitle: Text(
                    meal.name,
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 26,
                      color: Colors.black,
                    ),
                  ),
                  trailing: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                            width: 30,
                          ),
                          Text(
                            '${meal.kiloCaloriesBurnt} Kcal',
                            style: TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Icon(
                            Icons.access_time,
                            color: Colors.black54,
                          ),
                          SizedBox(
                            width: 13,
                          ),
                          Text(
                            '${meal.timeTaken} mins',
                            style: TextStyle(
                              color: Colors.black54,
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 13,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 17),
                  child: Text(
                    'INGREDIENTS',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: Colors.black54,
                    ),
                  ),
                ),
                SizedBox(
                  height: 13,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      for (int i = 0; i < meal.ingredient.length; i++)
                        Padding(
                          padding: const EdgeInsets.only(bottom: 6),
                          child: Text(
                            meal.ingredient[i],
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w500),
                          ),
                        )
                    ],
                  ),
                ),

                SizedBox(
                 height: 19,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 17),
                  child: Text(
                    'PREPARATION',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: Colors.black54,
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16, bottom: 31),
                  child: Text(
                    meal.preparation,
                    style: TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
