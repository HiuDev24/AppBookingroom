import 'package:app1/Login_Register/Login.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(RegisPage());
}

class RegisPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _RegisPageState();
}

class RegistrationInfo {
  final String name;
  final String phoneNumber;
  final String Email;
  final String cmnd;
  final String password;

  RegistrationInfo({
    required this.name,
    required this.phoneNumber,
    required this.Email,
    required this.cmnd,
    required this.password,
  });
}

class _RegisPageState extends State<RegisPage> {
  late TextEditingController _userNameController;
  late TextEditingController _emailController;
  late TextEditingController _phoneNumberController;
  late TextEditingController _cmndController;
  late TextEditingController _passwordController;
  final _formKey = GlobalKey<FormState>(); 
  bool _isObscure = true;
  bool _agreeToTerms = false;

  @override
  void initState() {
    super.initState();
    _userNameController = TextEditingController();
    _emailController = TextEditingController();
    _phoneNumberController = TextEditingController();
    _cmndController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Đăng ký',
            style: TextStyle(
              fontSize: 25,
              color: Color.fromARGB(255, 0, 0, 0),
            ),
          ),
          automaticallyImplyLeading: false,
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.95,
                padding: EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Logo
                      Image.asset(
                        'assets/logo1.jpg',
                        width: 150,
                        height: 150,
                      ),
                      SizedBox(height: 30),

                      // Name field
                      TextFormField(
                        controller: _userNameController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'xin hãy nhập tên của bạn';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          labelText: 'Nhập tên',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 15),
                        ),
                      ),
                      SizedBox(height: 15),
                      TextFormField(
                        controller: _emailController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Vui lòng nhập số điện thoại hoặc email của bạn';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          labelText: 'Nhập số điện thoại hoặc email',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 15),
                        ),
                      ),
                      SizedBox(height: 15),
                      TextFormField(
                        controller: _cmndController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Vui lòng nhập CMND của bạn';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          labelText: 'Nhập CMND',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 15),
                        ),
                      ),
                      SizedBox(height: 15),
                      TextFormField(
                        controller: _passwordController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Vui lòng nhập mật khẩu của bạn';
                          }
                          return null;
                        },
                        obscureText: _isObscure,
                        decoration: InputDecoration(
                          labelText: 'Nhập mật khẩu',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 15),
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                _isObscure = !_isObscure;
                              });
                            },
                            icon: Icon(
                              _isObscure
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 15),
                      TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Vui lòng nhập lại mật khẩu của bạn';
                          }
                          if (value != _passwordController.text) {
                            return 'Mật khẩu không phù hợp';
                          }
                          return null;
                        },
                        obscureText: _isObscure,
                        decoration: InputDecoration(
                          labelText: 'Nhập lại mật khẩu',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 15),
                          suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                _isObscure = !_isObscure;
                              });
                            },
                            icon: Icon(
                              _isObscure
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 5),
                      CheckboxListTile(
                        title: Text(
                          "Tôi đồng ý với tất cả điều khoản",
                          style: TextStyle(fontSize: 12),
                        ),
                        value: _agreeToTerms,
                        onChanged: (newValue) {
                          setState(() {
                            _agreeToTerms = newValue!;
                          });
                        },
                        controlAffinity: ListTileControlAffinity.leading, 
                      ),
                      // Register Button
                      Container(
                        width: 350,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              if (!_agreeToTerms) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text('Vui lòng đồng ý với các điều khoản'),
                                    duration: Duration(seconds: 2),
                                  ),
                                );
                              } else {
                                _savePersonalInfo();
                                _showSuccessDialog(context);
                              }
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                      'Xin vui lòng điền đầy đủ thông tin vào các ô bắt buộc'),
                                  duration: Duration(seconds: 2),
                                ),
                              );
                            }
                          },
                          child:
                              Text('ĐĂNG KÝ', style: TextStyle(fontSize: 20)),
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
                              padding: const EdgeInsets.symmetric(horizontal: 8),
                              child: Text(
                                'Hoặc đăng ký bằng',
                                style: TextStyle(
                                  color: const Color.fromARGB(255, 19, 19, 19),
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
                                  foregroundColor: Color.fromARGB(255, 50, 81, 184),
                                  backgroundColor: Color.fromARGB(255, 255, 255,255),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    side: BorderSide(color: Colors.blue), 
                                  ),
                                  elevation: 20,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 30),
                          Expanded(
                            child: SizedBox(
                              width: 200,
                              child: ElevatedButton.icon(
                                onPressed: () {},
                                icon: Icon(Icons.email),
                                label: Text('Email'),
                                style: ElevatedButton.styleFrom(
                                  foregroundColor: Color.fromARGB(255, 50, 81, 184),
                                  backgroundColor: Color.fromARGB(255, 255, 255, 255),
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

                      // Additional text
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Center(
                          child: RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                              ),
                              children: [
                                TextSpan(
                                  text: 'Khi tôi đăng nhập, tôi đồng ý với các ',
                                ),
                                TextSpan(
                                  text: 'Điều khoản sử dụng',
                                  style: TextStyle(
                                    color: Colors.blue,
                                    decoration: TextDecoration.underline,
                                  ),
                                  recognizer: null,
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
                      SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

                

  void _savePersonalInfo() async {
  try {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('name', _userNameController.text);
    prefs.setString('email', _emailController.text);
    prefs.setString('phoneNumber', _phoneNumberController.text);
    prefs.setString('cmnd', _cmndController.text);
    prefs.setString('password', _passwordController.text);
  } catch (error) {
    print('Error saving data: $error');
  }
}


  Future<void> _showSuccessDialog(BuildContext context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Đăng ký thành công'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text('Thông tin của bạn đã được lưu.'),
              Text('Bạn có thể xem thông tin cá nhân sau khi đăng nhập.'),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: Text('OK'),
            onPressed: () {
              Navigator.of(context).pop();
              // Điều hướng đến trang đăng nhập
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()), // Thay thế LoginPage() bằng tên của trang đăng nhập của bạn
              );
            },
          ),
        ],
      );
    },
  );
}
}