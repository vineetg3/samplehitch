import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:samplehitch/constants/theme_constants.dart';
import 'package:flat_icons_flutter/flat_icons_flutter.dart';
import 'package:flutter_fluid_slider/flutter_fluid_slider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NetworkPage extends StatefulWidget {
  static final String id = 'networkpage';

  @override
  _NetworkPageState createState() => _NetworkPageState();
}

class _NetworkPageState extends State<NetworkPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: Hero(
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
      backgroundColor: Colors.black,
      body: ListView(
        children: <Widget>[
          PersonCard(
            image: 'assets/propic4.jpg',
            color: kMaroon,
            toptext: 'Ice & Fire.',
            toptextColor: Colors.white,
            bottomtext: 'Alex(Student at MIT)',
            bottomtextColor: Colors.white,
          ),
          PersonCard(
            image: 'assets/propic3.jpg',
            color: Colors.white,
            toptext: 'Calm & Fun.',
            toptextColor: Colors.black,
            bottomtext: 'Alexis(Student at MIT)',
            bottomtextColor: Colors.black,
          ),
          PersonCard(
            image: 'assets/propic5.jpg',
            color: kYellow,
            toptext: 'Funky &Dope.',
            toptextColor: kDarkPurple,
            bottomtext: 'Jinas(Student at MIT)',
            bottomtextColor: kDarkPurple,
          ),
        ],
      ),
    );
  }
}

class PersonCard extends StatefulWidget {
  final String image;
  final Color color;
  final String toptext;
  final String bottomtext;
  final Color toptextColor;
  final Color bottomtextColor;

  PersonCard(
      {this.image,
      this.color,
      this.bottomtext,
      this.bottomtextColor,
      this.toptext,
      this.toptextColor});

  @override
  _PersonCardState createState() => _PersonCardState();
}

class _PersonCardState extends State<PersonCard> {
  var _alignment = Alignment.center;
  var _visible = false;
  double _value = 0.0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Stack(
        children: <Widget>[
          Positioned(
            child: AnimatedContainer(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(width: 10.0, color: kMaroon),
                ),
                color: kLightPurple,
              ),
              height: 500.0,
              duration: Duration(milliseconds: 400),
              alignment: _alignment,
              child: Container(
                height: 400.0,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 5,
                      child: Container(
                        foregroundDecoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(widget.image),
                              fit: BoxFit.fill),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: Container(
                        color: widget.color,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Flexible(
                                child: Text(
                                  widget.toptext,
                                  style: TextStyle(
                                    fontFamily: 'Spartan-ExtraBold',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 50.0,
                                    color: widget.toptextColor,
                                  ),
                                ),
                              ),
                              SizedBox(height: 10.0),
                              Flexible(
                                child: Text(
                                  widget.bottomtext,
                                  style: TextStyle(
                                    fontFamily: 'Sanchez',
                                    fontSize: 20.0,
                                    color: widget.bottomtextColor,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                              SizedBox(height: 10.0),
                              Flexible(
                                child: Text(
                                  'Awesome% :' + _value.round().toString(),
                                  style: TextStyle(
                                    fontFamily: 'Sanchez',
                                    fontSize: 20.0,
                                    color: widget.bottomtextColor,
                                  ),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            left: (MediaQuery.of(context).size.width) / 3.6,
            bottom: 20.0,
            child: AnimatedOpacity(
              opacity: _visible ? 1.0 : 0.0,
              duration: Duration(milliseconds: 400),
              child: FluidSlider(
                sliderColor: Color(0xff14141b),
                value: _value,
                onChanged: (double newValue) {
                  setState(() {
                    _value = newValue;
                  });
                },
                min: 0.0,
                max: 100.0,
                end: Icon(
                  FontAwesomeIcons.solidHeart,
                  color: Color(0xff663399),
                ),
              ),
            ),
          ),
        ],
      ),
      onTap: () {
        setState(() {
          _alignment = _alignment == Alignment.center
              ? Alignment.topCenter
              : Alignment.center;
          _visible = _visible == true ? false : true;
        });
      },
    );
  }
}

//Container(
//foregroundDecoration: BoxDecoration(
//image: DecorationImage(
//image: AssetImage(widget.image), fit: BoxFit.fill),
//),
//),

//AppBar(
//iconTheme: IconThemeData(
//color: Colors.black,
//),
//backgroundColor: Color(0xffF8F8F8),
//title: Image.asset(
//'assets/logo.jpg',
//fit: BoxFit.cover,
//),
//centerTitle: true,
//),
