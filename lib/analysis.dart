import 'package:flutter/material.dart';

List<Color> color = [Color(0xFF06beb6), Color(0xFF48b1bf)];

class Analysis extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "SIH 2020",
        ),
      ),
      body: Container(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 80, right: 80, bottom: 30),
            child: Image(image: AssetImage('assets/images/barc.png')),
          ),
          Padding(
              padding: EdgeInsets.all(20),
              child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: MediaQuery.of(context).size.height / 5,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xFF48b1bf),
                            blurRadius: 10.0, // soften the shadow
                            spreadRadius: 2.0, //extend the shadow
                            offset: Offset(
                              3.0, // Move to right 10  horizontally
                              3.0, // Move to bottom 10 Vertically
                            ),
                          )
                        ],
                        gradient: LinearGradient(colors: color),
                        borderRadius: BorderRadius.circular(20)),
                    child: Center(
                        child: Text(
                      "Show  Data",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    )),
                  ))),
          SizedBox(height: 10),
          Padding(
              padding: EdgeInsets.all(20),
              child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: MediaQuery.of(context).size.height / 5,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xFF48b1bf),
                            blurRadius: 10.0, // soften the shadow
                            spreadRadius: 2.0, //extend the shadow
                            offset: Offset(
                              3.0, // Move to right 10  horizontally
                              3.0, // Move to bottom 10 Vertically
                            ),
                          )
                        ],
                        gradient: LinearGradient(colors: color),
                        borderRadius: BorderRadius.circular(20)),
                    child: Center(
                        child: Text(
                      "Plot Data",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    )),
                  )))
        ],
      )),
    );
  }
}
