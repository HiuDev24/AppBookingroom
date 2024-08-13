import 'dart:async';
import 'package:app1/Login_Register/Login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(ForgotPasswordPage());
}

class ForgotPasswordPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ForgotPasswordScreen(),
      routes: {
        '/Login': (context) => LoginPage(),
      },
    );
  }
}
class ForgotPasswordScreen extends StatefulWidget {
  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  bool _timerActive = true;
  TextEditingController _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 1.0),
              child: Text(
                'Quên mật khẩu?',
                style: TextStyle(
                  fontSize: 25,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
              ),
            ),
          ],
        ),
             leading: IconButton(
                icon: Icon(Icons.arrow_back_ios_new),
                onPressed: () {
                   Navigator.pushReplacementNamed(context, '/Login');
                  },
                ),

      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Enter your SĐT to receive an SĐT to reset your password',
              style: TextStyle(
                fontSize: 13,
                color: Colors.grey[400], // Màu chữ mờ
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 15),
            // Khung bao bọc cho Phone number, timer, text gửi lại, ô nhập mã OTP, và button yêu cầu gửi lại
            Container(
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                children: [
                  // Phone number field
                  TextFormField(
                    controller: _phoneController,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly, LengthLimitingTextInputFormatter(10)],
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      labelText: 'Phone number (SDT)',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),

                  // Text "GỬI LẠI" and countdown timer
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'GỬI LẠI ',
                        style: TextStyle(
                          fontSize: 18,
                          color: _timerActive ? Colors.grey : Colors.green,
                        ),
                      ),
                      CountdownTimer(
                        onTimerFinished: () {
                          setState(() {
                            _timerActive = false;
                          });
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 25),

                  // OTP code entry
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      // OTP code input boxes
                      for (int i = 0; i < 5; i++)
                        SizedBox(
                          width: 60,
                          height: 60,
                          child: TextField(
                            maxLength: 1,
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              counterText: "", // Hide character count
                            ),
                          ),
                        ),
                    ],
                  ),

                  SizedBox(height: 30),

                  // Button to request OTP code
                  Container(
                    width: 250,
                    height: 45,
                    child: ElevatedButton(
                      onPressed: _timerActive ? _startTimer : () {},
                      child: Text('Yêu cầu mã OTP', style: TextStyle(fontSize: 18)),
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: const Color.fromARGB(255, 28, 152, 152),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        elevation: 5,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _startTimer() {
    setState(() {
      _timerActive = true;
    });
  }
}

// Widget for countdown timer
class CountdownTimer extends StatefulWidget {
  final Function? onTimerFinished;

  CountdownTimer({this.onTimerFinished});

  @override
  _CountdownTimerState createState() => _CountdownTimerState();
}

class _CountdownTimerState extends State<CountdownTimer> {
  int _start = 60; // Initial timer value in seconds
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
            if (widget.onTimerFinished != null) widget.onTimerFinished!();
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      '$_start s', // Display remaining seconds
      style: TextStyle(
        fontSize: 18,
        color: Colors.red, // Customize color as needed
      ),
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
