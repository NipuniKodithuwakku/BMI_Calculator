import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new HomeState();
  }
}

class HomeState extends State<Home> {
  final TextEditingController _ageController = new TextEditingController();
  final TextEditingController _heightController = new TextEditingController();
  final TextEditingController _weightController = new TextEditingController();
  double result = 0.0;
  String status="";
  void _calculateBMI() {
    setState(() {
      double height = double.parse(_heightController.text);
      double weight = double.parse(_weightController.text);

      if (height.toString().isNotEmpty && height>0 && weight.toString().isNotEmpty && weight>0) {
        result = (weight) / ((height) * (height));
        result=double.parse(result.toStringAsFixed(1));
        if(double.parse(result.toStringAsFixed(1))<18.5){
          status="UnderWeight";
        }else if(result>=18.5 && result<=24.9){
          status="Normal";
        }else if(result>=25.0 && result<=29.9){
          status="OverWeight";
        }else if(result>=30.0){
          status="obese";
        }
      } else {
        print("Invalid input");
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("BMI"),
        backgroundColor: Colors.pink,
        centerTitle: true,
      ),
      backgroundColor: Colors.grey.shade100,
      body: new Container(
        alignment: Alignment.center,
        child: new ListView(
          children: <Widget>[
            new Image.asset(
              "images/bmilogo.png",
              height: 200.0,
              width: 200.0,
            ),
            new Container(
              height: 200.0,
              width: 400.0,
              color: Colors.white70,
              child: new Column(
                children: <Widget>[
                  new TextField(
                    controller: _ageController,
                    decoration: new InputDecoration(
                        hintText: "in years",
                        labelText: "Age",
                        icon: new Icon(Icons.person_outline)),
                  ),
                  new TextField(
                    controller: _heightController,
                    decoration: new InputDecoration(
                        hintText: "in meters",
                        labelText: "Height in meters",
                        icon: new Icon(Icons.table_chart)),
                  ),
                  new TextField(
                    controller: _weightController,
                    decoration: new InputDecoration(
                        hintText: "in kilograms",
                        labelText: "Weight in kG",
                        icon: new Icon(Icons.line_weight)),
                  )
                ],
              ),
            ),
            new Padding(padding: new EdgeInsets.all(5.5)),
            new Container(
              alignment: Alignment.center,
              child: new RaisedButton(
                  onPressed: _calculateBMI,
                  color: Colors.pinkAccent,
                  child: new Text(
                    "Calculate",
                    style: new TextStyle(
                        color: Colors.white,
                        fontSize: 19.9,
                        fontWeight: FontWeight.w600),
                  )),
            ),
            new Padding(padding: new EdgeInsets.all(5.5)),
            new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Text(
                  "Your BMI:$result",
                  style: new TextStyle(
                      color: Colors.black,
                      fontSize: 19.9,
                      fontWeight: FontWeight.w600),
                ),

                new Text(
                  " $status",
                  style: new TextStyle(
                      color: Colors.blueAccent,
                      fontSize: 19.9,
                      fontWeight: FontWeight.w600),
                ),
              ],
            )
          ],
        ),
      ),
    );
    
  }
}
