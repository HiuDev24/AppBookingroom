// Import các thư viện và package cần thiết
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart'; // Import thư viện url_launcher
import 'package:app1/inforks/ggmap.dart';
import 'package:app1/inforks/inforks.dart';


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Đặt phòng',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: StartPage(),
    );
  }
}

class StartPage extends StatefulWidget {
  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  DateTime? startDate;
  DateTime? endDate;
  int numberOfAdults = 1;
  int numberOfChildren = 0;
  bool showAllHotels = false;
  

  List<Hotel> hotelList = [
    Hotel(
      name: 'Khách sạn Hồ Chí Minh',
      image: 'assets/ks.jpg',
      price: 100,
      rating: 4.5,
    ),
    Hotel(
      name: 'Khách sạn PPanda',
      image: 'assets/ks1.jpg',
      price: 150,
      rating: 4.0,
    ),
    Hotel(
      name: 'Khách sạn Của tôi',
      image: 'assets/ks2.jpg',
      price: 200,
      rating: 4.8,
    ),
    Hotel(
      name: 'Khách sạn Luxury Đà Nẵng',
      image: 'assets/ks3.jpg',
      price: 200,
      rating: 4.8,
    ),
    // Add more hotels as needed
  ];

  List<String> images = [
    'assets/ks9.jpg',
    'assets/ks10.jpg',
    'assets/ks11.jpg',
    'assets/ks7.jpg',
    'assets/ks8.jpg',
  ];
  List<String> newimages = [
      'assets/c6.jpg',
      'assets/c3.jpg',
      'assets/c4.jpg',
      'assets/c5.jpg',
      'assets/c7.jpg',
    ];

  
  @override
 Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(title: Text(
    'Tất Cả Phòng',
    style: TextStyle(
      fontSize: 25,
      color: Color.fromARGB(255, 0, 0, 0),
    ),
  ),
  centerTitle: true, // Đặt tiêu đề ở giữa theo chiều ngang của app bar
),
    body: SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          
              SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey[200],
                  border: Border.all(
                    color: Colors.grey,
                    width: 1,
                  ),
                ),
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Icon(Icons.search, color: Color.fromARGB(255, 28, 152, 152)),
                    SizedBox(width: 15),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: '                             Khách sạn gần tôi',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  _selectDateRange(context);
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey[200],
                    border: Border.all(
                      color: Colors.grey,
                      width: 1,
                    ),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.calendar_today, color: Color.fromARGB(255, 28, 152, 152)),
                      Text(
                        startDate != null && endDate != null
                            ? 'Từ: ${DateFormat('dd/MM/yyyy').format(startDate!)} - Đến: ${DateFormat('dd/MM/yyyy').format(endDate!)}'
                            : 'Chọn khoảng thời gian',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  _showPeopleDialog(context);
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey[200],
                    border: Border.all(
                      color: Colors.grey,
                      width: 1,
                    ),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.people, color: Color.fromARGB(255, 28, 152, 152)), // Màu xanh lá
                      Text(
                        'Người lớn: $numberOfAdults, Trẻ em: $numberOfChildren',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10),
              GestureDetector(
  onTap: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => FilterPage()),
    );
  },
  child: Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
   Expanded(
  child: Container(
    width: 100, // Thay đổi giá trị này để điều chỉnh chiều ngang của Container
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(140), // Thay đổi giá trị này để làm cho góc tròn hơn
      color: Colors.grey[200],
      border: Border.all(
        color: Colors.grey,
        width: 1,
      ),
    ),
    padding: EdgeInsets.all(3), // Tăng giá trị padding để làm cho phần code tròn hơn
    child: CircleAvatar(
      radius:20,
       // Điều chỉnh kích thước của CircleAvatar
      backgroundColor: Colors.transparent,
      child: Icon(Icons.map, color: Color.fromARGB(255, 28, 152, 152)), // Màu xanh lá
    ),
  ),
),

              
      SizedBox(width: 5),
      ElevatedButton(
        onPressed: () {
          // Điều hướng đến trang InforKS khi nhấn nút Tìm kiếm
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => inforks()),
          );
        },
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 115, vertical: 15),
          backgroundColor: Color.fromARGB(255, 28, 152, 152),
        ),
        child: Text(
          'Tìm kiếm',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    ],
  ),
), // Thêm dấu ngoặc đóng cho GestureDetector và Row
SizedBox(height: 20),
Container(
  height: 2,
  decoration: BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      colors: [Color.fromARGB(255, 28, 152, 152).withOpacity(0.8), Colors.transparent, Colors.transparent, Color.fromARGB(255, 28, 152, 152).withOpacity(0.8)],
      stops: [0, 0.5, 0.5, 1],
    ),
  ),
),
SizedBox(height: 20),
 // Khoảng cách giữa đường line mờ và các button
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildButton('Biển', Icons.beach_access,Color.fromARGB(255, 28, 152, 152)),
                    _buildButton('Núi', Icons.eco, Color.fromARGB(255, 28, 152, 152)),
                    _buildButton('Rừng', Icons.local_florist, Color.fromARGB(255, 28, 152, 152)),
                    _buildButton('Thành Phố', Icons.location_city, Color.fromARGB(255, 28, 152, 152)),
                    _buildButton('Sa mạc', Icons.landscape, Color.fromARGB(255, 28, 152, 152)),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
                height: 2,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [Color.fromARGB(255, 28, 152, 152).withOpacity(0.8), Colors.transparent, Colors.transparent, Color.fromARGB(255, 28, 152, 152).withOpacity(0.8)],
                    stops: [0, 0.5, 0.5, 1],
                  ),
                ),
              ),
              SizedBox(height: 20), 
              Padding(
                padding: const EdgeInsets.only(left:  15.0), // Đặt khoảng cách bên trái
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center, // Đảm bảo các phần tử nằm căn giữa theo chiều dọc
                  children: [
                    Expanded(
                      flex: 8, // Sử dụng flex để điều chỉnh tỷ lệ chiều rộng giữa các phần tử
                      child: Text(
                        'Khách sạn nổi bật',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            showAllHotels = !showAllHotels;
                          });
                        },
                        child: Text(
                          showAllHotels ? 'Ẩn' : 'Tất Cả',
                          style: TextStyle(
                            color: Color.fromARGB(255, 28, 152, 152),
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              if (!showAllHotels) ...{
                // Hiển thị chỉ một khách sạn
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10), // Độ cong của viền
                      side: BorderSide(
                        color: Colors.grey, // Màu sắc của viền
                        width: 1, // Độ dày của viền
                      ),
                    ),
                    child: Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 120, // Kích thước hình ảnh
                                height: 140, // Kích thước hình ảnh
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.0),
                                  image: DecorationImage(
                                    image: AssetImage(hotelList.first.image),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              SizedBox(width: 10), // Khoảng cách giữa hình ảnh và nội dung
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      hotelList.first.name,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Icon(Icons.star, color: Color.fromARGB(255, 213, 173, 14)),
                                        Icon(Icons.star, color: const Color.fromARGB(255, 213, 173, 14)),
                                        Icon(Icons.star, color: const Color.fromARGB(255, 213, 173, 14)),
                                        Icon(Icons.star, color: const Color.fromARGB(255, 213, 173, 14)),
                                        Icon(Icons.star_half, color: Colors.yellow),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Icon(Icons.location_on, color: Colors.grey),
                                        SizedBox(width: 5), // Khoảng cách giữa icon và text
                                        Text(
                                          'Khoảng cách: 5km', // Thay đổi thông tin về khoảng cách tại đây
                                          style: TextStyle(
                                            color: Colors.black87,
                                            fontSize: 12,
                                          ),
                                        ),
                                        
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              '\đ800.000', // Giá tiền (thay đổi thành dữ liệu thực)
                              style: TextStyle(
                                color: Colors.red, // Màu đỏ
                                fontSize: 19,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 25,
                          right: 0,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              '1 đêm', // Chữ "1 đêm"
                              style: TextStyle(
                                color: Colors.black, // Màu đen
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 20,
                          left: 0,
                          child: Container(
                            width: 80,
                            height: 30,
                            color: Colors.red,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.star_border,
                                  color: Colors.white,
                                  size: 15,
                                ),
                                SizedBox(width: 4),
                                Text(
                                  'HOT',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              } else ...{
                // Hiển thị tất cả các khách sạn
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: hotelList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(9.0),
                      child: Card(
                        child: Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 120, // Kích thước hình ảnh
                                    height: 130, // Kích thước hình ảnh
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8.0),
                                      image: DecorationImage(
                                        image: AssetImage(hotelList[index].image),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 10), // Khoảng cách giữa hình ảnh và nội dung
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          hotelList[index].name,
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18,
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Icon(Icons.star, color: Color.fromARGB(255, 213, 173, 14)),
                                            Icon(Icons.star, color: const Color.fromARGB(255, 213, 173, 14)),
                                            Icon(Icons.star, color: const Color.fromARGB(255, 213, 173, 14)),
                                            Icon(Icons.star, color: const Color.fromARGB(255, 213, 173, 14)),
                                            Icon(Icons.star_half, color: Colors.yellow),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Icon(Icons.location_on, color: Colors.blue),
                                            SizedBox(width: 5), // Khoảng cách giữa icon và text
                                            Text(
                                              'Khoảng cách: 5km', // Thay đổi thông tin về khoảng cách tại đây
                                              style: TextStyle(
                                                color: Colors.black87,
                                                fontSize: 14,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  '\đ1.000.000', // Giá tiền (thay đổi thành dữ liệu thực)
                                  style: TextStyle(
                                    color: Colors.red, // Màu đỏ
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                          bottom: 25,
                          right: 0,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              '1 đêm', // Chữ "1 đêm"
                              style: TextStyle(
                                color: Colors.black, // Màu đen
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              },
              SizedBox(height: 10),
              Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: 80, // Đặt kích thước của ảnh tùy thuộc vào nhu cầu của bạn
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/ks5.jpg'), // Đường dẫn đến ảnh của bạn
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  
                  SizedBox(height: 20),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(
                        images.length,
                        (index) => Container(
                          margin: EdgeInsets.only(right: 10),
                          width: 140,
                          height: 200,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: AssetImage(images[index]),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ), 
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
              Row(
                children: [
                  Container(
                    width: 25,
                    height: 25,
                    child: Image.asset('assets/1f447.png'), // Thay 'your_icon.png' bằng đường dẫn của biểu tượng của bạn
                  ),
                  SizedBox(width: 5),
                  Text(
                    'Lý do đặt phòng với Babylon', // Thêm text ở đây
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
               SizedBox(height: 1), 
              Padding(
                padding: const EdgeInsets.only(left:  15.0), // Đặt khoảng cách bên trái
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center, // Đảm bảo các phần tử nằm căn giữa theo chiều dọc
                  children: [
                    Expanded(
                      flex: 8, // Sử dụng flex để điều chỉnh tỷ lệ chiều rộng giữa các phần tử
                      child: Text(
                        'Các tính năng nổi bật hỗ trợ tốt nhất cho bạn',
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ]
                ),
              ), 
              SizedBox(height: 5),
              SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(
                        images.length,
                        (index) => Container(
                          margin: EdgeInsets.only(right: 10),
                          width: 120,
                          height: 120,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: AssetImage(newimages[index]),
                            ),
                          ),
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
    );
  }




  Widget _buildButton(String title, IconData iconData, Color color) {
    return GestureDetector(
      onTap: () {
        // Add your logic for button here
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.grey[200],
          border: Border.all(
            color: Colors.grey,
            width: 1,
          ),
        ),
        child: Row(
          children: [
            Icon(iconData, color: color), // Sử dụng màu cho icon ở đây
            SizedBox(width: 5),
            Text(title),
          ],
        ),
      ),
    );
  }

  Future<void> _selectDateRange(BuildContext context) async {
    final DateTimeRange? picked = await showDateRangePicker(
      context: context,
      initialDateRange: DateTimeRange(
        start: startDate ?? DateTime.now(),
        end: endDate ?? DateTime.now().add(Duration(days: 1)),
      ),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() {
        startDate = picked.start;
        endDate = picked.end;
      });
    }
  }

  Future<void> _showPeopleDialog(BuildContext context) async {
    int selectedRooms = 1; // Số lượng phòng được chọn
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Chọn số lượng phòng và người'),
          content: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Phòng:'),
                    Row(
                      children: [
                        IconButton(
                          icon: Icon(Icons.remove),
                          onPressed: () {
                            setState(() {
                              if (selectedRooms > 1) {
                                selectedRooms--;
                              }
                            });
                          },
                        ),
                        Text('$selectedRooms'),
                        IconButton(
                          icon: Icon(Icons.add),
                          onPressed: () {
                            setState(() {
                              selectedRooms++;
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Người lớn:'),
                    Row(
                      children: [
                        IconButton(
                          icon: Icon(Icons.remove),
                          onPressed: () {
                            setState(() {
                              if (numberOfAdults > 1) {
                                numberOfAdults--;
                              }
                            });
                          },
                        ),
                        Text('$numberOfAdults'),
                        IconButton(
                          icon: Icon(Icons.add),
                          onPressed: () {
                            setState(() {
                              numberOfAdults++;
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Trẻ em:'),
                    Row(
                      children: [
                        IconButton(
                          icon: Icon(Icons.remove),
                          onPressed: () {
                            setState(() {
                              if (numberOfChildren > 0) {
                                numberOfChildren--;
                              }
                            });
                          },
                        ),
                        Text('$numberOfChildren'),
                        IconButton(
                          icon: Icon(Icons.add),
                          onPressed: () {
                            setState(() {
                              numberOfChildren++;
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
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

  // Hàm mở trang Google Maps
  Future<void> _launchMaps() async {
    const googleMapsUrl = 'https://www.google.com/maps'; // Đường dẫn trang Google Maps
    if (await canLaunch(googleMapsUrl)) {
      await launch(googleMapsUrl);
    } else {
      throw 'Could not launch $googleMapsUrl';
    }
  }
}


class Hotel {
  final String name;
  final String image;
  final double price;
  final double rating;

  Hotel({
    required this.name,
    required this.image,
    required this.price,
    required this.rating,
  });
}
