import 'package:fitness_ui/model/UpperBodyWorkout.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class WorkoutScreen extends StatelessWidget {
  const WorkoutScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final today = DateTime.now();

    return Scaffold(
      backgroundColor: const Color(0xFF200087),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 16,),
                child: IconButton(
                    icon: Icon(
                      Icons.close,
                      color: Colors.white,
                      size: 40,
                    ),
                    onPressed: () {Navigator.of(context).pop();
                    }
                    ),
              ),

              SizedBox( height: 20,),
              ListTile(
               title: Text('${DateFormat('EEEE').format(today)}, ${DateFormat('d MMM').format(today)}',
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    color: Colors.white,
                  ),
               ),

                subtitle:Text('Upper Body',
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 26,
                    color: Colors.white,
                  ),
                ) ,

                trailing: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:<Widget> [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children:<Widget> [
                        Icon(Icons.access_time, color: Colors.white,
                        ),
                        SizedBox(width: 13,),
                        Text('60 Mins', style: TextStyle(
                          color: Colors.white70,
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),),


                      ],
                    ),
                    SizedBox(height: 5,),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children:<Widget> [
                        Icon(Icons.speed_outlined, color: Colors.white,
                        ),
                        SizedBox(width: 13,),
                        Text('Easy', style: TextStyle(
                          color: Colors.white70,
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),),


                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height:20,),
              for(int i = 0; i <upperBody.length; i++)
                Column(
                  children: [
                    for (int j = 0; j<upperBody[i].length; j++)
                      ListTile(
                        leading:Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            color: const Color(0xFF5b4d9d),
                          ),

                          padding: const EdgeInsets.all(5),
                          child: Image.asset(
                         upperBody[i][j].imagePath,
                            width: 45,
                            height:45 ,
                            color: Colors.white,
                        ),
                        ),
                        title: Text(upperBody[i][j].name, style: TextStyle(
                          color: Colors.white,fontSize:22,
                          fontWeight: FontWeight.w600,
                        ),
                        ),
                        subtitle:
                        Text(upperBody[i][j].instruction, style: TextStyle(
                            color: Colors.white,fontSize: 11,fontWeight: FontWeight.w300,
                        ),
                        ),
                      ),
                      SizedBox(height:20,),
                  ],

                ),

            ],
          ),
        ),
      ),
    );
  }
}
