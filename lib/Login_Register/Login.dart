import 'package:app1/Login_Register/ForgotPassword.dart';
import 'package:app1/pages/sales_home_page.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() {
  runApp(LoginPage());
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool isEmailLogin = true;
  bool _isObscure = true; // Biến để điều khiển việc ẩn/hiện mật khẩu

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

 Future<void> _login() async {
  // Kiểm tra xem form đã được điền đầy đủ thông tin chưa
  if (_formKey.currentState!.validate()) {
    final String apiUrl = 'https://reqres.in/api/login';
//https://reqres.in/api/login
//eve.holt@reqres.in//cityslicka
    // Gửi yêu cầu đăng nhập đến API
//https://dummyjson.com/auth/login
    final http.Response response = await http.post(
      Uri.parse(apiUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'username': emailController.text,
        'password': passwordController.text,
      }),
    );

    // Xử lý phản hồi từ API
    if (response.statusCode == 200) {
      // Đăng nhập thành công
      // Navigating to the home page
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => SalesHomePage(),
        ),
      );
    } else {
      // Đăng nhập không thành công
      // Lấy thông tin từ phản hồi
      final responseData = jsonDecode(response.body);
      final errorMessage = responseData['error'];

      // Kiểm tra nếu là lỗi về mật khẩu hoặc email
      if (errorMessage == 'user not found' || errorMessage == 'password incorrect') {
        // Hiển thị thông báo lỗi cho người dùng
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Đăng nhập thất bại'),
              content: Text('Email hoặc mật khẩu không chính xác. Vui lòng thử lại.'),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('OK'),
                ),
              ],
            );
          },
        );
      }
    }
  } else {
    // Hiển thị thông báo yêu cầu nhập thông tin
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Thông báo'),
          content: Text('Vui lòng điền đầy đủ thông tin trước khi đăng nhập.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Đăng Nhập',
            style: TextStyle(
              fontSize: 25,
              color: Color.fromARGB(255, 0, 0, 0),
            ),
          ),
          automaticallyImplyLeading: false,
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey), // Tạo viền xung quanh
                borderRadius: BorderRadius.circular(10.0), // Bo tròn các góc
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(height: 20),
                    Column(
                      children: [
                        Image.asset(
                          'assets/logo1.jpg',
                          height: 160,
                        ),
                        SizedBox(height: 30),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment
                                .center, // Căn giữa các phần tử
                            children: [
                              ToggleButtons(
                                children: [
                                  Text('Email', style: TextStyle(fontSize: 15)),
                                  Text('Di động',
                                      style: TextStyle(fontSize: 15)),
                                ],
                                isSelected: [isEmailLogin, !isEmailLogin],
                                onPressed: (int index) {
                                  setState(() {
                                    isEmailLogin = index == 0;
                                  });
                                },
                                borderRadius: BorderRadius.circular(15),
                                selectedColor: Colors.white,
                                fillColor: Color.fromARGB(255, 28, 152, 152),
                                borderColor: const Color.fromARGB(0, 0, 0, 0),
                                borderWidth: 0,
                                renderBorder: false,
                                constraints: BoxConstraints.expand(width: 170),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10),
                        SizedBox(
                          child: TextFormField(
                            controller: emailController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return isEmailLogin
                                    ? 'Please enter your email'
                                    : 'Please enter your phone number';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              labelText:
                                  isEmailLogin ? 'Email' : 'Số điện thoại',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        SizedBox(
                          // Điều chỉnh chiều cao của TextFormField
                          child: TextFormField(
                            controller: passwordController,
                            obscureText:
                                _isObscure, // Biến để điều khiển việc ẩn/hiện mật khẩu
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your password';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              labelText: 'Mật khẩu',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    _isObscure = !_isObscure;
                                  });
                                },
                                icon: Icon(_isObscure
                                    ? Icons.visibility
                                    : Icons.visibility_off),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 25),
                        Container(
                          width: 350,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: _login,
                            child: Text('ĐĂNG NHẬP',
                                style: TextStyle(fontSize: 20)),
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.white,
                              backgroundColor:
                                  const Color.fromARGB(255, 28, 152, 152),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              elevation: 5,
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ForgotPasswordPage()),
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Text(
                              'Quên mật khẩu?',
                              style: TextStyle(
                                color: const Color.fromARGB(255, 50, 81, 184),
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            children: [
                              Expanded(
                                child: Container(
                                  color: const Color.fromARGB(255, 19, 19, 19),
                                  height: 1,
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                child: Text(
                                  'Hoặc đăng nhập bằng',
                                  style: TextStyle(
                                    color:
                                        const Color.fromARGB(255, 19, 19, 19),
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  color: const Color.fromARGB(255, 19, 19, 19),
                                  height: 1,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: SizedBox(
                                width: 200,
                                child: ElevatedButton.icon(
                                  onPressed: () {},
                                  icon: Icon(Icons.facebook),
                                  label: Text('Facebook'),
                                  style: ElevatedButton.styleFrom(
                                    foregroundColor:
                                        Color.fromARGB(255, 50, 81, 184),
                                    backgroundColor:
                                        Color.fromARGB(255, 255, 255, 255),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      side: BorderSide(color: Colors.blue),
                                    ),
                                    elevation: 20,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 20),
                            Expanded(
                              child: SizedBox(
                                width: 200,
                                child: ElevatedButton.icon(
                                  onPressed: () {},
                                  icon: Icon(Icons.email),
                                  label: Text('Email'),
                                  style: ElevatedButton.styleFrom(
                                    foregroundColor:
                                        Color.fromARGB(255, 50, 81, 184),
                                    backgroundColor:
                                        Color.fromARGB(255, 255, 255, 255),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      side: BorderSide(color: Colors.blue),
                                    ),
                                    elevation: 20,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 30),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Center(
                            child: RichText(
                              textAlign: TextAlign.center, // Căn giữa văn bản
                              text: TextSpan(
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                ),
                                children: [
                                  TextSpan(
                                    text:
                                        'Khi tôi đăng nhập, tôi đồng ý với các ',
                                  ),
                                  TextSpan(
                                    text: 'Điều khoản sử dụng',
                                    style: TextStyle(
                                      color: Colors.blue,
                                      decoration: TextDecoration.underline,
                                    ),
                                    recognizer:
                                        null, // Thêm recognizer nếu cần xử lý sự kiện
                                  ),
                                  TextSpan(
                                    text: ' và ',
                                  ),
                                  TextSpan(
                                    text: 'Chính sách bảo mật',
                                    style: TextStyle(
                                      color: Colors.blue,
                                      decoration: TextDecoration.underline,
                                    ),
                                    recognizer: null,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 30),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
