import 'package:flutter/material.dart';
class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {

  String output = "0";
  String history='';
  String _output = "";
  double num1 = 0;
  double num2 = 0;
  String operand = "";

  buttonPressed(String buttonText) {
    if (buttonText == "C") {
      _output = "";
      history='';
      num1 = 0;
      num2 = 0;
      operand = "";
    }
    else if (buttonText == "+" || buttonText == "-" || buttonText == "/" || buttonText == "*" || buttonText=='%') {
      num1 = double.parse(output);
      operand = buttonText;
      _output = "";
    }
    else if (buttonText == ".") {
      if (_output.contains(".")) {
        print("Already conatains a decimals");
        return;
      }
      else {
        _output = _output + buttonText;
      }
    }
    else if (buttonText == "=") {
      num2 = double.parse(output);

      if (operand == "+") {
        _output = (num1 + num2).toString();
        history=num1.toString() + operand.toString() + num2.toString();
      }
      if (operand == "-") {
        _output = (num1 - num2).toString();
        history=num1.toString() + operand.toString() + num2.toString();
      }
      if (operand == "*") {
        _output = (num1 * num2).toString();
        history=num1.toString() + operand.toString() + num2.toString();
      }
      if (operand == "/") {
        _output = (num1 / num2).toString();
        history=num1.toString() + operand.toString() + num2.toString();
      }
      if (operand == "%") {
        _output = (num1 % num2).toString();
        history=num1.toString() + operand.toString() + num2.toString();
      }
      num1 = 0;
      num2 = 0;
      operand = "";
    }
    else {
      _output = _output + buttonText;
    }
    print(_output);

    setState(() {
      output = _output;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.brown[800],
        title: Text('Calculator'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height*0.2,
            decoration: BoxDecoration(color: Colors.white),
            alignment: Alignment.bottomRight,
            padding: EdgeInsets.only(right: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(history,
                  style: TextStyle(color: Colors.black,fontSize: 23,fontWeight: FontWeight.bold),),
                SizedBox(height: 15,),
                Text(output,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 34
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildCircleAvatar("C",Colors.grey),
                buildCircleAvatar('<-',Colors.grey),
                buildCircleAvatar('%',Colors.grey),
                buildCircleAvatar('/',Colors.orange),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildCircleAvatar("7",Colors.white),
                buildCircleAvatar('8',Colors.white),
                buildCircleAvatar('9',Colors.white),
                buildCircleAvatar('*',Colors.orange),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildCircleAvatar("4",Colors.white),
                buildCircleAvatar('5',Colors.white),
                buildCircleAvatar('6',Colors.white),
                buildCircleAvatar('-',Colors.orange),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildCircleAvatar("1",Colors.white),
                buildCircleAvatar('2',Colors.white),
                buildCircleAvatar('3',Colors.white),
                buildCircleAvatar('+',Colors.orange),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buildContainer('0',Colors.white),
                  buildContainer('.',Colors.white),
                  buildContainer('=',Colors.orange),
                ] ),
          ),

        ],
      ),
    );
  }

  Container buildContainer(String value,Color clr) {
    return Container(
      height: 70,
      width: 120,
      child: FloatingActionButton.extended(
        onPressed: () {
          buttonPressed(value);
          // Add your onPressed code here!
        },
        label: Text(value,style: TextStyle(color: Colors.black,
            fontSize: 30,
            fontWeight: FontWeight.bold),),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(35)),
        backgroundColor: clr,
      ),
    );
  }

  CircleAvatar buildCircleAvatar(String value,Color clr) {
    return CircleAvatar(
      backgroundColor: clr,
      radius: 40,
      child: TextButton(
          child: Text(value,style: TextStyle(color: Colors.black,
              fontSize: 30,
              fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),

          onPressed: (){
            buttonPressed(value);
          }
      ),
    );

  }
}