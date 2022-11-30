import 'package:flutter/material.dart';

void main() {
  runApp(const MyWidget());
}

class MyWidget extends StatelessWidget {
  // my calculator
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String value = '';
  String result = '';
  @override
  void get_v_result() {
    int n = 0;
    if (value[0] != '-') {
      for (int i = 0; i < value.length; i++) {
        if (value[i] == '+' || value[i] == '-' || value[i] == 'x' || value[i] == '/') {
          n += int.parse(value.substring(0, i));
          break;
        }
      }
      for (int i = 0; i < value.length; i++) {
        if (value[i] == '+') {
          for (int j = i + 1; j < value.length; j++) {
            if (value[j] == '+' || value[j] == '-') {
              n += int.parse(value.substring(i + 1, j));
              break;
            } else if (j == value.length - 1) {
              n += int.parse(value.substring(i + 1, j + 1));
              break;
            }
          }
        } else if (value[i] == '-') {
          for (int j = i + 1; j < value.length; j++) {
            if (value[j] == '+' || value[j] == '-') {
              n -= int.parse(value.substring(i + 1, j));
              break;
            } else if (j == value.length - 1) {
              n -= int.parse(value.substring(i + 1, j + 1));
              break;
            }
          }
        }
      }
    } else {
      for (int i = 0; i < value.length; i++) {
        if (value[i] == '+') {
          for (int j = i + 1; j < value.length; j++) {
            if (value[j] == '+' || value[j] == '-') {
              n += int.parse(value.substring(i + 1, j));
              break;
            } else if (j == value.length - 1) {
              n += int.parse(value.substring(i + 1, j + 1));
              break;
            }
          }
        } else if (value[i] == '-') {
          for (int j = i + 1; j < value.length; j++) {
            if (value[j] == '+' || value[j] == '-') {
              n -= int.parse(value.substring(i + 1, j));
              break;
            } else if (j == value.length - 1) {
              n -= int.parse(value.substring(i + 1, j + 1));
              break;
            }
          }
        }
      }
    }
    result = '= ${n.toString()}';
    //return n;
  }

  @override
  // void initState() {
  //   int result = get_v_result();
  //   super.initState();
  // }

  void change_value(String v) {
    setState(() {
      if (v != '=') {
        if (v == 'clear') {
          value = '';
          result = '';
        } else if (value.endsWith('+') || value.endsWith('-') || value.endsWith('x') || value.endsWith('/')) {
          if (v == '+' || v == '-' || v == 'x' || v == '/') {
            value = value.replaceRange(value.length - 1, value.length, v);
          } else {
            value += v;
          }
        } else {
          value += v;
          print(value);
        }
      } else {
        //value += v;
        // get_v_result();
        // print(get_v_result());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.vertical_distribute_rounded),
        title: const Text('SABAH'),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(120, 200, 50, 0),
        child: Column(
          children: [
            Row(children: [
              Column(
                children: [
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        // side: BorderSide(color: Colors.yellow, width: 5),
                        textStyle: const TextStyle(color: Colors.white, fontSize: 25, fontStyle: FontStyle.normal),
                        shape: const BeveledRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                      ),
                      onPressed: () {
                        change_value('1');
                      },
                      child: const Text('1')),
                  const SizedBox(
                    height: 20,
                    width: 20,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        // side: BorderSide(color: Colors.yellow, width: 5),
                        textStyle: const TextStyle(color: Colors.white, fontSize: 25, fontStyle: FontStyle.normal),
                        shape: const BeveledRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                      ),
                      onPressed: () {
                        change_value('4');
                      },
                      child: const Text('4')),
                  const SizedBox(
                    height: 20,
                    width: 20,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        // side: BorderSide(color: Colors.yellow, width: 5),
                        textStyle: const TextStyle(color: Colors.white, fontSize: 25, fontStyle: FontStyle.normal),
                        shape: const BeveledRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                      ),
                      onPressed: () {
                        change_value('7');
                      },
                      child: const Text('7')),
                  const SizedBox(
                    height: 20,
                    width: 20,
                  ),
                  ElevatedButton(
                      key: const Key('1'),
                      onPressed: () {
                        change_value('=');
                        get_v_result();
                      },
                      child: const Text('=')),
                ],
              ),
              const SizedBox(
                height: 20,
                width: 20,
              ),
              Column(
                children: [
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        // side: BorderSide(color: Colors.yellow, width: 5),
                        textStyle: const TextStyle(color: Colors.white, fontSize: 25, fontStyle: FontStyle.normal),
                        shape: const BeveledRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                      ),
                      onPressed: () {
                        change_value('2');
                      },
                      child: const Text('2')),
                  const SizedBox(
                    height: 20,
                    width: 20,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        // side: BorderSide(color: Colors.yellow, width: 5),
                        textStyle: const TextStyle(color: Colors.white, fontSize: 25, fontStyle: FontStyle.normal),
                        shape: const BeveledRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                      ),
                      onPressed: () {
                        change_value('5');
                      },
                      child: const Text('5')),
                  const SizedBox(
                    height: 20,
                    width: 20,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        // side: BorderSide(color: Colors.yellow, width: 5),
                        textStyle: const TextStyle(color: Colors.white, fontSize: 25, fontStyle: FontStyle.normal),
                        shape: const BeveledRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                      ),
                      onPressed: () {
                        change_value('8');
                      },
                      child: const Text('8')),
                  const SizedBox(
                    height: 20,
                    width: 20,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        // side: BorderSide(color: Colors.yellow, width: 5),
                        textStyle: const TextStyle(color: Colors.white, fontSize: 25, fontStyle: FontStyle.normal),
                        shape: const BeveledRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                      ),
                      onPressed: () {
                        change_value('0');
                      },
                      child: const Text('0')),
                ],
              ),
              const SizedBox(
                height: 20,
                width: 20,
              ),
              Column(
                children: [
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        // side: BorderSide(color: Colors.yellow, width: 5),
                        textStyle: const TextStyle(color: Colors.white, fontSize: 25, fontStyle: FontStyle.normal),
                        shape: const BeveledRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                      ),
                      onPressed: () {
                        change_value('3');
                      },
                      child: const Text('3')),
                  const SizedBox(
                    height: 20,
                    width: 20,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        // side: BorderSide(color: Colors.yellow, width: 5),
                        textStyle: const TextStyle(color: Colors.white, fontSize: 25, fontStyle: FontStyle.normal),
                        shape: const BeveledRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                      ),
                      onPressed: () {
                        change_value('6');
                      },
                      child: const Text('6')),
                  const SizedBox(
                    height: 20,
                    width: 20,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        // side: BorderSide(color: Colors.yellow, width: 5),
                        textStyle: const TextStyle(color: Colors.white, fontSize: 25, fontStyle: FontStyle.normal),
                        shape: const BeveledRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                      ),
                      onPressed: () {
                        change_value('9');
                      },
                      child: const Text('9')),
                  const SizedBox(
                    height: 20,
                    width: 20,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        change_value('clear');
                      },
                      child: const Text('clear')),
                ],
              ),
              const SizedBox(
                height: 20,
                width: 20,
              ),
              Column(
                children: [
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        // side: BorderSide(color: Colors.yellow, width: 5),
                        textStyle: const TextStyle(color: Colors.white, fontSize: 25, fontStyle: FontStyle.normal),
                        shape: const BeveledRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                      ),
                      onPressed: () {
                        change_value('+');
                      },
                      child: const Text('+')),
                  const SizedBox(
                    height: 20,
                    width: 20,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        // side: BorderSide(color: Colors.yellow, width: 5),
                        textStyle: const TextStyle(color: Colors.white, fontSize: 25, fontStyle: FontStyle.normal),
                        shape: const BeveledRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                      ),
                      onPressed: () {
                        change_value('-');
                      },
                      child: const Text('-')),
                  const SizedBox(
                    height: 20,
                    width: 20,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        // side: BorderSide(color: Colors.yellow, width: 5),
                        textStyle: const TextStyle(color: Colors.white, fontSize: 25, fontStyle: FontStyle.normal),
                        shape: const BeveledRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                      ),
                      onPressed: () {
                        change_value('x');
                      },
                      child: const Text('x')),
                  const SizedBox(
                    height: 20,
                    width: 20,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        change_value('/');
                      },
                      child: const Text('/')),
                ],
              ),
              const SizedBox(
                height: 20,
                width: 20,
              ),
            ]),
            const SizedBox(height: 70),
            Text(style: const TextStyle(color: Colors.grey, fontSize: 30), value),
            Text(style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 30), result)
          ],
        ),
      ),
    );
  }
}
