import 'package:app1/Login_Register/Login.dart';
import 'package:app1/pages/Menu/Book_room.Dart';
import 'package:app1/pages/Menu/Helpcenter.dart';
import 'package:app1/pages/Menu/Information.dart';
import 'package:app1/pages/Menu/Setting.dart';
import 'package:app1/pages/Menu/est.dart';
import 'package:app1/pages/Menu/prefservice.Dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/widgets.dart';

class CollapsibleBox extends StatefulWidget {
  final String title;
  final Widget child;

  CollapsibleBox({required this.title, required this.child});

  @override
  _CollapsibleBoxState createState() => _CollapsibleBoxState();
}

class _CollapsibleBoxState extends State<CollapsibleBox> {
  bool _isExpanded = false;
  late Timer _timer;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 5), (timer) {
      setState(() {
        _currentIndex = (_currentIndex + 1) % 4;
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              _isExpanded = !_isExpanded;
            });
          },
          child: Container(
            color: Colors.grey[200],
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Icon(
                  _isExpanded
                      ? Icons.keyboard_arrow_up
                      : Icons.keyboard_arrow_down,
                  size: 30,
                ),
              ],
            ),
          ),
        ),
        if (_isExpanded) widget.child,
      ],
    );
  }
}

class RoomImageAndInfo extends StatelessWidget {
  final String image;
  final String roomName;
  final String address;
  final String price;
  final String rating;

  RoomImageAndInfo({
    required this.image,
    required this.roomName,
    required this.address,
    required this.price,
    required this.rating,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey[200],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
              image: DecorationImage(
                image: AssetImage(image),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  roomName,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  'Địa chỉ: $address',
                  style: TextStyle(fontSize: 14),
                ),
                SizedBox(height: 5),
                Text(
                  'Giá: $price',
                  style: TextStyle(fontSize: 14),
                ),
                SizedBox(height: 5),
                Text(
                  'Đánh giá: $rating',
                  style: TextStyle(fontSize: 14),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SalesHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 253, 253, 253),
          title: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Babylon',
                style: TextStyle(
                  fontSize: 27,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 2),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  for (Color color in [
                    Colors.red,
                    Colors.blue,
                    Colors.green,
                    Colors.orange,
                    Colors.purple
                  ])
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 2.0),
                      child: Icon(Icons.circle, size: 10, color: color),
                    ),
                ],
              ),
            ],
          ),
        ),
        drawer: Drawer(
          child: ListView(padding: EdgeInsets.zero, children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 255, 255, 255),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 35,
                    backgroundImage: NetworkImage(
                        'https://www.facebook.com/profile.php?id=100011232069871'), // Load user avatar from URL
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Trung Hiếu',
                    style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.explore),
              title: Text('Khám phá'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ExplorePage()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.room_service),
              title: Text('Dịch vụ & Ưu đãi'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ServiceAndOffersPage()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.book),
              title: Text('Chi tiết phòng đặt'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Thông tin cá nhân'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PersonalInformationPage(),
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.settings), // Added icon for Settings
              title: Text('Cài đặt'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SettingsPage()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.help), // Added icon for Help Center
              title: Text('Help Center'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SupportCenterPage()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Đặt Phòng'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => StartPage()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.logout_outlined),
              title: Text('Đăng xuất'),
              onTap: () {
                // Điều hướng quay trở lại trang đăng nhập khi người dùng nhấp vào nút đăng xuất
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
            ),
          ]),
        ),
        body: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            Container(
              height: 270,
              child: Stack(
                children: [
                  Image.asset(
                    'assets/1.jpg',
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    top: 30,
                    left: 20,
                    right: 20,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Tìm kiếm',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          prefixIcon: Icon(Icons.search),
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: EdgeInsets.symmetric(vertical: 10.0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Transform.translate(
                        offset: Offset(20, -70),
                        child: Container(
                          width: 90,
                          height: 90,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: AssetImage('assets/icons2.jpg'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                          height: 10), // Khoảng cách giữa hình tròn và văn bản
                      Transform.translate(
                        offset: Offset(20, -70),
                        child: Text(
                          'Chuyến bay',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              StartPage(), 
                        ),
                      );
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Transform.translate(
                          offset: Offset(0, -90),
                          child: Container(
                            width: 150,
                            height: 150,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: AssetImage('assets/icons1.png'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Transform.translate(
                          offset: Offset(0, -100),
                          child: Text(
                            'Khách sạn',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Transform.translate(
                        offset: Offset(-20, -70),
                        child: Container(
                          width: 90,
                          height: 90,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: AssetImage('assets/icons.png'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                          height: 10), // Khoảng cách giữa hình tròn và văn bản
                      Transform.translate(
                        offset: Offset(-20, -70),
                        child: Text(
                          'Chuyến tàu',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ), 
                ],
              ),
            ),       
            Transform.translate(
              offset: Offset(0, -20),
              child: Padding(
                padding: EdgeInsets.only(top: 1),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      child: Text(
                        'Khuyến Mãi',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(width: 10),
                          for (int i = 0; i < 5; i++)
                            Padding(
                              padding: const EdgeInsets.only(right: 2.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20.0),
                                child: Image.asset(
                                  [
                                    'assets/occ4.jpg',
                                    'assets/occ2.jpg',
                                    'assets/occ3.jpg',
                                    'assets/occ1.jpg',
                                    'assets/occ1.jpg',
                                  ][i],
                                  width: 300,
                                  height: 190,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: Text(
                'Ưu đãi cho người mới!!',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
              ),
            ),
            SizedBox(height: 1), // Thêm khoảng cách chiều cao
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  SizedBox(width: 17), // Thêm khoảng cách trước Row
                  for (int i = 0; i < 4; i++)
                    Padding(
                      padding: const EdgeInsets.only(right: 15.0),
                      child: Container(
                        width: 200,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Color.fromARGB(255, 28, 152, 152),
                            width: 2,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            i % 2 == 0
                                ? Row(
                                    children: [
                                      Icon(Icons.local_offer), // Icon giảm giá
                                      SizedBox(width: 5),
                                      Text('Giảm giá 10%'), // Văn bản giảm giá
                                    ],
                                  )
                                : Row(
                                    children: [
                                      Icon(Icons.star_border), // Icon ngôi sao
                                      SizedBox(width: 5),
                                      Text(
                                          'Dùng thử VIP Gold'), // Văn bản dùng thử VIP Gold
                                    ],
                                  ),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: Text(
                'Khách sạn nổi bật',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  SizedBox(width: 15),
                  for (int i = 0; i < 4; i++)
                    Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: Color.fromARGB(255, 82, 141, 141),
                              width: 2,
                            ),
                          ),
                          child: RoomImageAndInfo(
                            image: 'assets/G${i + 1}.jpg',
                            roomName: 'Khách sạn ${[
                              'New Word',
                              'Park Hyatt',
                              'Pullman',
                              'Caravelle'
                            ][i]}',
                            address: '${[76, 2, 148, 19][i]} Đường ${[
                              'Lê Lai',
                              'Công Trường Lam sơn',
                              'Trần Hưng Đạo',
                              ' Công Trường Lam Sơn'
                            ][i]}',
                            price: '${[1000, 800, 1200, 1500][i]} vnđ ',
                            rating: '${[4.5, 4.2, 4.8, 4.9][i]}/5',
                          )),
                    ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: Text(
                'Khám phá khách sạn tại điểm đến hàng đầu',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  SizedBox(width: 15),
                  for (int i = 0; i < 4; i++)
                    Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Color.fromARGB(255, 82, 141, 141),
                            width: 2,
                          ),
                        ),
                        child: RoomImageAndInfo(
                          image: 'assets/h${i + 1}.jpg',
                          roomName:
                              'TP ${['Hà Nội', 'Đà Nẵng', 'HCM', 'Đà Lạt'][i]}',
                          address: '${[
                            1.134,
                            700,
                            3.07,
                            300
                          ][i]} km          Nhà hàng | Tham quan',
                          price: '${[1000, 800, 1200, 1500][i]} vnđ',
                          rating: '${[4.5, 4.2, 4.8, 4.9][i]}/5',
                        ),
                      ),
                    ),
                ],
              ),
            ),
            SizedBox(height: 20),
            CollapsibleBox(
              title: "Quản lý gợi ý riêng",
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  "Chúng tôi cung cấp gợi ý riêng dựa trên hoạt động của bạn trên nền tảng.",
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image.asset(
                      'assets/h2.jpg',
                      width: 180,
                      height: 150,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 5.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image.asset(
                      'assets/h1.jpg',
                      width: 180,
                      height: 110,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image.asset(
                      'assets/h3.jpg',
                      width: 180,
                      height: 110,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 5.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image.asset(
                      'assets/h4.jpg',
                      width: 180,
                      height: 150,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image.asset(
                      'assets/hg.jpg',
                      width: 115,
                      height: 150,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image.asset(
                      'assets/pq.jpg',
                      width: 115,
                      height: 100,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 5.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image.asset(
                      'assets/sp.jpg',
                      width: 115,
                      height: 150,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
          ]),
        ));
  }
}
