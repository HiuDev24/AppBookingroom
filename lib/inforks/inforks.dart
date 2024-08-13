import 'dart:async';
import 'package:app1/inforks/ggmap.dart';
import 'package:app1/inforks/infor_chitiet.dart';
import 'package:app1/inforks/infor_ct1.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(inforks());
}

final List<String> imageList = [
  'assets/R10.jpg',
  'assets/R11.jpg',
  'assets/R12.jpg',
  'assets/R4.jpg',
  'assets/PH1.jpg',
];
final List<String> imageeList = [
  'assets/R5.jpg',
  'assets/R6.jpg',
  'assets/R7.jpg',
  'assets/R8.jpg',
  'assets/R9.jpg',
];

class inforks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(children: [
          // Background image container
          Positioned(
            top: 32,
            left: 0,
            right: 0,
            child: Container(
              height: 120,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/backg.jpeg'),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20.0),
                  bottomRight: Radius.circular(20.0),
                ),
              ),
            ),
          ),
          // Filter options container
          Positioned(
            top: 125,
            left: 20,
            right: 20,
            child: FilterOptionsContainer(),
          ),
          // Promotion container
          Positioned(
            top: 190,
            left: 20,
            right: 20,
            child: PromotionContainer(),
          ),
          // List of hotels
          Positioned(
            top: 280,
            left: 0,
            right: 0,
            bottom: 0,
            child: HotelList(
              onHotel1Pressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HotelInfoPage1()),
                );
              },
              onHotel2Pressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HotelInfoPage()),
                );
              },
            ),
          ),
        ]),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            // Điều hướng đến trang FilterPage khi nút được nhấn
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      FilterPage()), // Điều hướng đến FilterPage
            );
          },
          label: Text('Bản đồ',
              style: TextStyle(color: Colors.black)), // Đặt màu chữ là màu đen
          icon: Icon(Icons.map),
          backgroundColor:
              Color.fromARGB(255, 161, 223, 231), // Màu nền cho nút
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
                1000), // Điều chỉnh giá trị để bo tròn theo nhu cầu
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}

class HotelList extends StatelessWidget {
  final VoidCallback onHotel1Pressed;
  final VoidCallback onHotel2Pressed; // Thêm vào constructor

  const HotelList({
    Key? key,
    required this.onHotel1Pressed,
    required this.onHotel2Pressed, // Thêm vào constructor
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        HotelCard(
          imageList: imageList,
          name: 'The Lumiere',
          location: 'Quận 1-Cách trung tâm 4km',
          review: '350 nhận xét',
          comment: 'Dễ dàng di chuyển',
          discount: 'Đã áp dụng Ưu đãi Giảm giá - 36.161 đ',
          price: '700.000 đ',
          originalPrice: '1.000.000 đ',
          onPressed: onHotel1Pressed,
          onOtherPagePressed: onHotel2Pressed, // Truyền vào HotelCard
        ),
        HotelCard(
          imageList: imageList,
          name: 'The Babylon',
          location: 'Tân Bình - Cách trung tâm 4.8km',
          review: '30 nhận xét',
          comment: 'Dễ dàng di chuyển',
          discount: 'Đã áp dụng Ưu đãi Giảm giá - 96.161 đ',
          price: '850.000 đ',
          originalPrice: '1.470.000 đ',
          onPressed: onHotel2Pressed, // Truyền hàm callback của card 2
          onOtherPagePressed: onHotel1Pressed, // Truyền hàm callback của card 1
        ),
        HotelCard(
          imageList: imageeList,
          name: 'The Lhouse',
          location: 'Quận 10 - Cách trung tâm 6.2km',
          review: '50 nhận xét',
          comment: 'Dễ dàng di chuyển',
          discount: 'Đã áp dụng Ưu đãi Giảm giá - 66.111 đ',
          price: '926.000 đ',
          originalPrice: '1.020.260 đ',
          onPressed: onHotel1Pressed,
          onOtherPagePressed: onHotel2Pressed,
        ),
        HotelCard(
          imageList: imageeList,
          name: 'Khách sạn Blue Airport',
          location: 'Quận 10-Cách trung tâm 6km',
          review: '50 nhận xét',
          comment: 'Dễ dàng di chuyển',
          discount: 'Đã áp dụng Ưu đãi Giảm giá - 66.111 đ',
          price: '926.000 đ',
          originalPrice: '1.020.260 đ',
          onPressed: onHotel1Pressed,
          onOtherPagePressed: onHotel2Pressed,
        ),
        // Add more HotelCard widgets here for additional hotels
      ],
    );
  }
}

class FilterOptionsContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: 210,
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 9,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          FilterOption(
              title: '      Bộ lọc ',
              icon: Icons.keyboard_arrow_down,
              onTap: () {}),
          FilterDivider(),
          FilterOption(
              title: '  Giá ', icon: Icons.keyboard_arrow_down, onTap: () {}),
          FilterDivider(),
          FilterOption(
              title: 'Sắp xếp ', icon: Icons.keyboard_arrow_down, onTap: () {}),
        ],
      ),
    );
  }
}

class FilterOption extends StatelessWidget {
  final String title;
  final IconData icon;
  final Function onTap;

  const FilterOption({
    Key? key,
    required this.title,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 16),
          ),
          Icon(icon),
        ],
      ),
    );
  }
}

class FilterDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: 1,
      color: Colors.grey,
    );
  }
}

class PromotionContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: 220,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 151, 220, 252),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.discount,
              color: Color.fromARGB(255, 40, 114, 194),
              size: 40,
            ),
            SizedBox(width: 10),
            Text(
              'Có được các ưu đãi dành riêng và           \nđặt phòng nhiều hơn để tích điểm',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 53, 52, 52),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ImageListContainer extends StatelessWidget {
  final List<String> imageList;

  const ImageListContainer({
    Key? key,
    required this.imageList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200, // Add height
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15.0),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey,
              width: 1,
            ),
          ),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                for (String imagePath in imageList)
                  Container(
                    width: 350,
                    height: double.infinity,
                    margin: EdgeInsets.only(right: 1),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(imagePath),
                        fit: BoxFit.fill, // Use BoxFit.fill
                      ),
                    ),
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PriceContainer extends StatelessWidget {
  final String price;
  final String originalPrice;

  const PriceContainer({
    Key? key,
    required this.price,
    required this.originalPrice,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(255, 74, 73, 73).withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 10),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12.0),
        child: Container(
          height: 93,
          width: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 45,
                color: Color.fromARGB(255, 223, 15, 0),
                child: Center(
                  child: CountdownTimer(),
                ),
              ),
              Container(
                height: 47,
                color: const Color.fromARGB(255, 255, 255, 255),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    RichText(
                      text: TextSpan(
                        text: ' ' '$originalPrice ' ' ',
                        style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0).withOpacity(0.9),
                          fontSize: 12,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                    ),
                    Text(
                      '   $price    ',
                      style: TextStyle(
                        color: Color.fromARGB(255, 210, 0, 0),
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HotelCard extends StatelessWidget {
  final List<String> imageList;
  final String name;
  final String location;
  final String review;
  final String comment;
  final String discount;
  final String price;
  final String originalPrice;
  final VoidCallback onPressed;
  final VoidCallback onOtherPagePressed; // Thêm hàm callback mới

  const HotelCard({
    Key? key,
    required this.imageList,
    required this.name,
    required this.location,
    required this.review,
    required this.comment,
    required this.discount,
    required this.price,
    required this.originalPrice,
    required this.onPressed,
    required this.onOtherPagePressed, // Thêm vào constructor
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      onLongPress:
          onOtherPagePressed, // Gọi hàm callback onPressed khi bấm vào HotelCard
      child: Container(
        margin: EdgeInsets.only(bottom: 10),
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 9,
              offset: Offset(0, 9),
            ),
          ],
        ),
        child: Stack(
          // Sử dụng Stack để đặt PriceContainer vào góc phải của container
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Hotel name
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 5),
                // Location
                Row(
                  children: [
                    Icon(
                      Icons.location_pin,
                      color: Colors.black,
                      size: 18,
                    ),
                    SizedBox(width: 5),
                    Text(
                      location,
                      style: TextStyle(
                        fontSize: 15,
                        color: const Color.fromARGB(255, 126, 125, 125),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5),
                // Review
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.star,
                      color: Colors.orange,
                      size: 18,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.orange,
                      size: 18,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.orange,
                      size: 18,
                    ),
                    Icon(
                      Icons.star_half_outlined,
                      color: Colors.orange,
                      size: 18,
                    ),
                    SizedBox(width: 10),
                    Text(
                      review,
                      style: TextStyle(
                        fontSize: 14,
                        color: Color.fromARGB(255, 1, 76, 167),
                      ),
                    ),
                  ],
                ),
                // Comment
                Text(
                  comment,
                  style: TextStyle(
                    fontSize: 14,
                    color: const Color.fromARGB(255, 126, 125, 125),
                  ),
                ),
                Text(
                  discount,
                  style: TextStyle(
                    fontSize: 15,
                    color: Color.fromARGB(255, 239, 7, 7),
                  ),
                ),
                SizedBox(height: 10),
                ImageListContainer(imageList: imageList),
                SizedBox(height: 5),
              ],
            ),
            Align(
              alignment: Alignment.topRight,
              child: PriceContainer(price: price, originalPrice: originalPrice),
            ),
          ],
        ),
      ),
    );
  }
}

class CountdownTimer extends StatefulWidget {
  @override
  _CountdownTimerState createState() => _CountdownTimerState();
}

class _CountdownTimerState extends State<CountdownTimer> {
  late Timer _timer;
  int _remainingHours = 2;
  int _remainingMinutes = 0;
  int _remainingSeconds = 0;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_remainingHours == 0 &&
            _remainingMinutes == 0 &&
            _remainingSeconds == 0) {
          _timer.cancel();
        } else {
          if (_remainingMinutes == 0 && _remainingSeconds == 0) {
            _remainingHours--;
            _remainingMinutes = 59;
            _remainingSeconds = 59;
          } else if (_remainingSeconds == 0) {
            _remainingMinutes--;
            _remainingSeconds = 59;
          } else {
            _remainingSeconds--;
          }
        }
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
    return Text(
      ' Hết hạn sau \n    $_remainingHours:$_remainingMinutes:$_remainingSeconds',
      style: TextStyle(
        color: Colors.white,
        fontSize: 14,
      ),
    );
  }
}
