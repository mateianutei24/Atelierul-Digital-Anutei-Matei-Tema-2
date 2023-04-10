import 'package:flutter/material.dart';
import 'package:tema2/showDialogFunction.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String? _textFieldError;
  final TextEditingController _controller = TextEditingController();

  int? _numberChoice;

  String? _response;

  bool _checkCube(int number) {
    if (number == 0) return true;
    int i = 1;
    while (i * i * i < number) {
      i++;
    }
    if (i * i * i == number) return true;
    return false;
  }

  bool _checkSquare(int number) {
    if (number == 0) return true;
    int i = 1;
    while (i * i < number) {
      i++;
    }
    if (i * i == number) return true;
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Check your number'),
      ),
      body: Column(
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(
              'Please input a number to see if it is a perfect square or a perfect cube',
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              onChanged: (String value) {
                setState(() {
                  if (int.tryParse(value) != null) {
                    _textFieldError = null;
                    _numberChoice = int.parse(value);
                  } else {
                    _textFieldError = 'Number introduced not valid';
                    _numberChoice = null;
                  }
                });
              },
              decoration: InputDecoration(
                hintText: 'Introduce the number here',
                errorText: _textFieldError,
              ),
            ),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                  ),
                  onPressed: () {
                    setState(() {
                      if (_numberChoice != null) {
                        _controller.clear();
                        final bool isPerfectSquare =
                        _checkSquare(_numberChoice!);
                        final bool isPerfectCube = _checkCube(_numberChoice!);
                        if (isPerfectSquare == true && isPerfectCube == true) {
                          _response =
                              'Your number is a perfect square and a perfect cube';
                        } else if (isPerfectSquare == true) {
                          _response = 'Your number is a perfect square';
                        } else if (isPerfectCube == true) {
                          _response = 'Your number is a perfect cube';
                        } else {
                          _response =
                              'Your number is not a perfect square, nor a perfect cube';
                        }
                        showDialogDart(context, _response!);
                        _response = null;
                        _numberChoice = null;
                      } else {
                        _textFieldError = 'You have to introduce a number!';
                      }
                    });
                  },
                  child: const Icon(Icons.check),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
