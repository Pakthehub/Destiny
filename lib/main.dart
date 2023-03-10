import 'story_brain.dart';
import 'package:flutter/material.dart';

void main() => runApp(Destiny());

class Destiny extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: StoryPage(),
    );
  }
}

class StoryPage extends StatefulWidget {
  _StoryPageState createState() => _StoryPageState();
}

StoryBrain brain = StoryBrain();



class _StoryPageState extends State<StoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/background.png'), fit: BoxFit.cover),
        ),
        padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 15.0),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                flex: 12,
                child: Center(
                  child: Text(
                    brain.getStory(),
                    style: TextStyle(
                      fontSize: 18.0,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: FlatButton(
                  onPressed: () {
                    setState(() {
                      brain.nextStory(1);
                    });

                    //Choice 1 made by user.

                  },
                  color: Colors.red,
                  child: Text(
                    brain.getChoice1(),
                    style: TextStyle(
                      fontSize: 18.0,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
                Expanded(
                  flex: 2,
                  child: Visibility(
                    visible: brain.buttonShouldBeVisible(),
                    child: FlatButton(
                      onPressed: () {
                        setState(() {
                          brain.nextStory(2);
                        });
                        //Choice 2 made by user.
                      },
                      color: Colors.blue,
                      child: Text(
                        brain.getChoice2(),
                        style: TextStyle(
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                  ),
                ),

            ],
          ),
        ),
      ),
    );
  }
}

