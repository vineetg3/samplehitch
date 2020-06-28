import 'package:flutter/material.dart';
import 'package:samplehitch/constants/theme_constants.dart';
import 'package:samplehitch/screens/network_page.dart';

class StartPage extends StatefulWidget {
  static final String id = 'Start_page';

  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(height: 20.0),
            Expanded(
              flex: 1,
              child: Center(
                child: Text(
                  'Hello Admin!',
                  style: TextStyle(
                    fontFamily: 'Sanchez',
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Center(
                child: Text(
                  'What would you like to do \n '
                  '                   today?',
                  style: TextStyle(
                    fontFamily: 'Sanchez',
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0,
                    color: Colors.black26,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10.0),
            Expanded(
              flex: 7,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: RoundedGoBox(
                    title: 'Find People!',
                    color: kYellow,
                    onPressed: () {
                      Navigator.pushNamed(context, NetworkPage.id);
                    }),
              ),
            ),
            Expanded(
              flex: 7,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: RoundedGoBox(
                  title: 'Create an Event!',
                  color: kLightPurple,
                  onPressed: () {},
                ),
              ),
            ),
            SizedBox(height: 10.0),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        child: Container(
          height: 50.0,
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
            child: Center(
              child: Hero(
                tag: 'hitchLogo',
                child: Text(
                  "Hitch",
                  style: TextStyle(
                    fontFamily: 'Spartan',
                    fontWeight: FontWeight.bold,
                    fontSize: 30.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class RoundedGoBox extends StatelessWidget {
  final String title;
  final Color color;
  final Function onPressed;

  RoundedGoBox({this.title, this.color, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Text(
              title,
              style: TextStyle(
                fontFamily: 'Spartan',
                fontWeight: FontWeight.bold,
                fontSize: 42.0,
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(height: 30.0),
          MaterialButton(
            onPressed: onPressed,
            color: Colors.black54,
            textColor: Colors.white,
            child: Icon(
              Icons.arrow_forward,
              size: 50,
            ),
            padding: EdgeInsets.all(6),
            shape: CircleBorder(),
          )
        ],
      ),
    );
  }
}
