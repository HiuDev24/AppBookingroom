import 'package:app1/inforks/Payment.dart';
import 'package:app1/inforks/image_ks.dart';
import 'package:flutter/material.dart';

class HotelInfoPage3 extends StatefulWidget {
  @override
  _HotelInfoPageState3 createState() => _HotelInfoPageState3();
}

final List<String> imagePaths = [
  'assets/R1.jpg',
  'assets/R2.jpg',
  'assets/R3.jpg',
  'assets/R4.jpg',
  'assets/R5.jpg',
  'assets/R5.jpg',
  'assets/R5.jpg',
  'assets/R5.jpg',
];

class _HotelInfoPageState3 extends State<HotelInfoPage3> {
  final PageController _pageController = PageController();
  int currentPage = 0;
  bool isChosen = false;

  @override
  Widget build(BuildContext context) {
    _pageController.addListener(() {
      setState(() {
        currentPage = _pageController.page!.toInt() + 1;
      });
    });
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            body: Stack(children: [
          CustomScrollView(slivers: [
            SliverAppBar(
              backgroundColor: Colors.white,
              floating: true,
              pinned: true,
              elevation: 0,
              title: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 45,
                      margin: EdgeInsets.only(left: 10),
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color.fromARGB(255, 240, 237, 237),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.search),
                          SizedBox(width: 10),
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'Search...',
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 15),
                  IconButton(
                    icon: Icon(Icons.favorite_border_outlined),
                    iconSize: 35,
                    onPressed: () {},
                  ),
                  SizedBox(width: 5),
                  IconButton(
                    icon: Icon(Icons.share),
                    iconSize: 35,
                    onPressed: () {},
                  ),
                  SizedBox(width: 5),
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(height: 10),
                    Container(
                      height: 2,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [
                            Color.fromARGB(255, 28, 152, 152).withOpacity(0.8),
                            Colors.transparent,
                            Colors.transparent,
                            Color.fromARGB(255, 28, 152, 152).withOpacity(0.8)
                          ],
                          stops: [0, 0.5, 0.5, 1],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    isChosen = !isChosen;
                  });
                },
                child: Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: (MediaQuery.of(context).size.width - 350) / 2,
                    vertical: 20,
                  ),
                  decoration: BoxDecoration(
                    border:
                        Border.all(color: Color.fromARGB(255, 226, 223, 223)),
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: Container(
                    // Container bổ sung để chứa nội dung
                    height: 50,
                    width: 250,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 212, 228,
                          243), // Màu nền của container chứa nội dung
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.sticky_note_2, size: 30),
                        SizedBox(width: 10),
                        Text(
                          ' 2 Phiếu giảm giá',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(width: 110),
                        Text(
                          isChosen ? 'Loại bỏ' : 'Chọn',
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.bold,
                            color: isChosen
                                ? Colors.red
                                : Color.fromARGB(255, 5, 33, 244),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start, // Đưa văn bản về sát lề trái
                children: [
                  Padding(
                    padding:
                        EdgeInsets.only(left: 25), // Đặt padding ở phía trái
                    child: Text(
                      'Phòng Superior (Superior)',
                      style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                        color: const Color.fromARGB(255, 21, 21, 21),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
            SliverToBoxAdapter(
        child: Container(
          height: 170, // Chiều cao của container
          child: ListView(
            scrollDirection: Axis.horizontal, // Trượt ngang
            children: [
              // Khoảng cách bên trái
              for (int i = 0; i < imagePaths.length; i++)
                GestureDetector(
                  onTap: () {
                    // Khi người dùng nhấn vào ảnh, chuyển sang trang khác
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HotelPhotoGallery()),
                    );
                  },
                  child: Container(
                    width: 360, // Chiều rộng của mỗi ảnh
                    margin: EdgeInsets.symmetric(
                      horizontal: 10, // Khoảng cách giữa các ảnh
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20), // Bo tròn viền
                      image: DecorationImage(
                        image: AssetImage(imagePaths[i]), // Đường dẫn đến hình ảnh
                        fit: BoxFit.cover, // Cách hiển thị ảnh
                      ),
                    ),
                  ),
                ),
            ]))),
    
   
     
   

            SliverToBoxAdapter(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10),
                    Padding(
                      padding: EdgeInsets.only(left: 25),
                      child: Text(
                        '20 m2 |',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 24, 24, 24),
                        ),
                      ),
                    ),
                    SizedBox(
                        height: 5), // Khoảng cách giữa văn bản và container ảnh
                    Padding(
                      padding: EdgeInsets.only(left: 25),
                      child: Text(
                        'Tối đa 2 người lớn, 2 bé(0-11 tuổi) ở MIỄN PHÍ!',
                        style: TextStyle(
                          fontSize: 15,
                          color: const Color.fromARGB(255, 24, 24, 24),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 5), // Khoảng cách giữa các text và ảnh
                    Padding(
                      padding: EdgeInsets.only(left: 25),
                      child: Text(
                        '| 1 giường đôi lớn hoặc 2 giường lớn',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: const Color.fromARGB(255, 24, 24, 24),
                        ),
                      ),
                    ),
                    SizedBox(height: 5), // Khoảng cách giữa các text và ảnh
                    Padding(
                      padding: EdgeInsets.only(left: 25),
                      child: Row(
                        children: [
                          Icon(Icons.bathtub,
                              color: Color.fromARGB(255, 73, 103, 236),
                              size: 20), // Biểu tượng
                          SizedBox(
                              width:
                                  5), // Khoảng cách giữa biểu tượng và văn bản
                          Text(
                            'Bồn tắm/vòi sen riêng',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 5), // Khoảng cách giữa các text và ảnh
                    Padding(
                      padding: EdgeInsets.only(left: 25),
                      child: Row(
                        children: [
                          Icon(Icons.location_city,
                              color: const Color.fromARGB(255, 73, 103, 236),
                              size: 20), // Biểu tượng
                          SizedBox(
                              width:
                                  5), // Khoảng cách giữa biểu tượng và văn bản
                          Text(
                            'Hướng về thành phố',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 5), // Khoảng cách giữa các text và ảnh
                    Padding(
                      padding: EdgeInsets.only(left: 25),
                      child: Row(children: [
                        Icon(Icons.smoke_free,
                            color: const Color.fromARGB(255, 73, 103, 236),
                            size: 20), // Biểu tượng
                        SizedBox(
                            width: 5), // Khoảng cách giữa biểu tượng và văn bản
                        Text('Không hút thuốc',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                            ))
                      ]),
                    ),
                    SizedBox(height: 15), // Khoảng cách giữa các text và ảnh
                    Padding(
                      padding: EdgeInsets.only(left: 25),
                      child: Text(
                        'Xem chi tiết',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: const Color.fromARGB(255, 73, 103, 236),
                        ),
                      ),
                    ),
                  ]),
            ),
            SliverToBoxAdapter(
                child: Container(
              height: 530,
              width: 350,
              margin: EdgeInsets.all(15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: Color.fromARGB(255, 178, 176, 176),
                  width: 1,
                ),
              ),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 15),
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Row(
                        children: [
                          Icon(Icons.people,
                              size: 20,
                              color: Colors.black), // Biểu tượng trước
                          SizedBox(
                              width:
                                  10), // Khoảng cách giữa biểu tượng và văn bản
                          Text(
                            '2 người lớn & 2 trẻ em(0-11 tuổi)',
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Row(
                        children: [
                          Icon(Icons.breakfast_dining,
                              size: 20,
                              color: const Color.fromARGB(
                                  255, 4, 160, 20)), // Biểu tượng trước
                          SizedBox(
                              width:
                                  10), // Khoảng cách giữa biểu tượng và văn bản
                          Text(
                            'Có ăn sáng',
                            style: TextStyle(
                              fontSize: 13,
                              color: Color.fromARGB(255, 0, 0, 0),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Row(
                        children: [
                          Icon(Icons.check,
                              size: 20,
                              color: Color.fromARGB(
                                  255, 0, 0, 0)), // Biểu tượng trước
                          SizedBox(
                              width:
                                  10), // Khoảng cách giữa biểu tượng và văn bản
                          Text(
                            'Chính sách hủy',
                            style: TextStyle(
                              fontSize: 13,
                              color: Color.fromARGB(255, 0, 0, 0),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Row(
                        children: [
                          Icon(Icons.check,
                              size: 20,
                              color: const Color.fromARGB(
                                  255, 4, 160, 20)), // Biểu tượng trước
                          SizedBox(
                              width:
                                  10), // Khoảng cách giữa biểu tượng và văn bản
                          Text(
                            'Trả tiền ở khách sạn',
                            style: TextStyle(
                              fontSize: 13,
                              color: Color.fromARGB(255, 0, 0, 0),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Row(
                        children: [
                          Icon(Icons.coffee,
                              size: 20,
                              color: Color.fromARGB(
                                  255, 0, 0, 0)), // Biểu tượng trước
                          SizedBox(
                              width:
                                  10), // Khoảng cách giữa biểu tượng và văn bản
                          Text(
                            'Cà phê & Trà',
                            style: TextStyle(
                              fontSize: 13,
                              color: Color.fromARGB(255, 0, 0, 0),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Row(
                        children: [
                          Icon(Icons.local_drink,
                              size: 20,
                              color: Color.fromARGB(
                                  255, 1, 1, 1)), // Biểu tượng trước
                          SizedBox(
                              width:
                                  10), // Khoảng cách giữa biểu tượng và văn bản
                          Text(
                            'Nước uống',
                            style: TextStyle(
                              fontSize: 13,
                              color: Color.fromARGB(255, 0, 0, 0),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Row(
                        children: [
                          Icon(Icons.local_parking,
                              size: 20,
                              color: Color.fromARGB(
                                  255, 6, 6, 6)), // Biểu tượng trước
                          SizedBox(
                              width:
                                  10), // Khoảng cách giữa biểu tượng và văn bản
                          Text(
                            'Bãi đậu xe',
                            style: TextStyle(
                              fontSize: 13,
                              color: Color.fromARGB(255, 3, 3, 3),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Row(
                        children: [
                          Icon(Icons.check,
                              size: 20,
                              color: const Color.fromARGB(
                                  255, 4, 160, 20)), // Biểu tượng trước
                          SizedBox(
                              width:
                                  10), // Khoảng cách giữa biểu tượng và văn bản
                          Text(
                            'Nhận phòng nhanh',
                            style: TextStyle(
                              fontSize: 13,
                              color: Color.fromARGB(255, 0, 0, 0),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Row(
                        children: [
                          Icon(Icons.check,
                              size: 20,
                              color: const Color.fromARGB(
                                  255, 4, 160, 20)), // Biểu tượng trước
                          SizedBox(
                              width:
                                  10), // Khoảng cách giữa biểu tượng và văn bản
                          Text(
                            'Wifi và 1 số dịch vụ miễn phí',
                            style: TextStyle(
                              fontSize: 13,
                              color: Color.fromARGB(255, 4, 4, 4),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Row(
                        children: [
                          Icon(Icons.payment,
                              size: 20,
                              color: Color.fromARGB(
                                  255, 0, 0, 0)), // Biểu tượng trước
                          SizedBox(
                              width:
                                  10), // Khoảng cách giữa biểu tượng và văn bản
                          Text(
                            'Hoàn tiền mặt: 214.124 đ \n(Áp dụng các điều khoản)',
                            style: TextStyle(
                              fontSize: 13,
                              color: Color.fromARGB(255, 4, 4, 4),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: EdgeInsets.only(left: 25),
                      child: RichText(
                        text: TextSpan(
                          text: '2.000.000 đ  -50%',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            decoration:
                                TextDecoration.lineThrough, // Thêm gạch ngang
                            decorationColor: const Color.fromARGB(
                                255, 237, 17, 1), // Màu của gạch
                            decorationThickness: 3, // Độ dày của gạch
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 25),
                      child: Text(
                        'Theo Điều khoản hoàn tiền',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 25),
                      child: Text(
                        '724.077 đ',
                        style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                          color: const Color.fromARGB(255, 239, 0, 0),
                        ),
                      ),
                    ),

                    SizedBox(
                        height: 20), // Khoảng cách giữa văn bản và hàng button
                    Row(
                      mainAxisAlignment: MainAxisAlignment
                          .spaceBetween, // Căn hai bên trái và phải
                      children: [
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.only(left: 10),
                            padding: EdgeInsets.symmetric(
                                horizontal: 15,
                                vertical:
                                    10), // Thêm padding ngang và dọc để rộng ra
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                bottomLeft: Radius.circular(20),
                              ),
                              color: const Color.fromARGB(
                                  255, 252, 254, 255), // Màu của container
                              border: Border.all(
                                color: const Color.fromARGB(
                                    255, 177, 175, 175), // Màu viền
                                width: 1, // Độ dày viền
                              ),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Số phòng',
                                      style: TextStyle(
                                        fontSize: 17,
                                        color: Colors.black,
                                      ),
                                    ),
                                    Text(
                                      'Phòng có giới hạn',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                                Icon(
                                  Icons
                                      .keyboard_arrow_right_outlined, // Biểu tượng mũi tên xuống
                                  color: Colors.black,
                                  size: 18,
                                  // Màu của biểu tượng
                                ),
                              ],
                            ),
                          ),
                        ),
 Expanded(
                            child: GestureDetector(
                              onTap: () {
                                // Xử lý khi phần được nhấn
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        PaymentDetailPage(), // Thay YourNextPage() bằng trang bạn muốn chuyển đến
                                  ),
                                );
                              },
                              child: Container(
                                margin: EdgeInsets.only(right: 10),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 15,
                                    vertical:
                                        10), // Thêm padding ngang và dọc để rộng ra
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(20),
                                    bottomRight: Radius.circular(20),
                                  ),
                                  color: Color.fromARGB(
                                      255, 208, 226, 243), // Màu của container
                                  border: Border.all(
                                    color: Color.fromARGB(
                                        255, 177, 175, 175), // Màu viền
                                    width: 1, // Độ dày viền
                                  ),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '      Đặt ngay',
                                      style: TextStyle(
                                        fontSize: 17,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ), // Khoảng cách giữa các văn bản
                                    Text(
                                      '(Trả tiền khách sạn)',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.grey,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ),)
                      ],
                    ),
                  ]),
            )),
            SliverToBoxAdapter(
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    isChosen = !isChosen;
                  });
                },
                child: Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: (MediaQuery.of(context).size.width - 350) / 2,
                    vertical: 20,
                  ),
                  decoration: BoxDecoration(
                    border:
                        Border.all(color: Color.fromARGB(255, 226, 223, 223)),
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: Container(
                    // Container bổ sung để chứa nội dung
                    height: 50,
                    width: 250,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 212, 228,
                          243), // Màu nền của container chứa nội dung
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.sticky_note_2, size: 30),
                        SizedBox(width: 10),
                        Text(
                          ' 5 Phiếu giảm giá',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(width: 110),
                        Text(
                          isChosen ? 'Loại bỏ' : 'Chọn',
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.bold,
                            color: isChosen
                                ? Colors.red
                                : Color.fromARGB(255, 5, 33, 244),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start, // Đưa văn bản về sát lề trái
                children: [
                  Padding(
                    padding:
                        EdgeInsets.only(left: 25), // Đặt padding ở phía trái
                    child: Text(
                      'Phòng Loại Sang (Deluxe)',
                      style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                        color: const Color.fromARGB(255, 21, 21, 21),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                height: 170, // Chiều cao của container
                child: ListView(
                  scrollDirection: Axis.horizontal, // Trượt ngang
                  children: [
                    // Khoảng cách bên trái
                    for (int i = 0;
                        i < imagePaths.length;
                        i++) // imagePaths là danh sách các đường dẫn đến hình ảnh
                      Container(
                        width: 360, // Chiều rộng của mỗi ảnh
                        margin: EdgeInsets.symmetric(
                            horizontal: 10), // Khoảng cách giữa các ảnh
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(20), // Bo tròn viền
                          image: DecorationImage(
                            image: AssetImage(
                                imagePaths[i]), // Đường dẫn đến hình ảnh
                            fit: BoxFit.cover, // Cách hiển thị ảnh
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10),
                    Padding(
                      padding: EdgeInsets.only(left: 25),
                      child: Text(
                        '30 m2 |',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 24, 24, 24),
                        ),
                      ),
                    ),
                    SizedBox(
                        height: 5), // Khoảng cách giữa văn bản và container ảnh
                    Padding(
                      padding: EdgeInsets.only(left: 25),
                      child: Text(
                        'Tối đa 2 người lớn, 2 bé(0-11 tuổi) ở MIỄN PHÍ!',
                        style: TextStyle(
                          fontSize: 15,
                          color: const Color.fromARGB(255, 24, 24, 24),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 5), // Khoảng cách giữa các text và ảnh
                    Padding(
                      padding: EdgeInsets.only(left: 25),
                      child: Text(
                        '| 1 giường đôi lớn hoặc 2 giường lớn',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: const Color.fromARGB(255, 24, 24, 24),
                        ),
                      ),
                    ),
                    SizedBox(height: 5), // Khoảng cách giữa các text và ảnh
                    Padding(
                      padding: EdgeInsets.only(left: 25),
                      child: Row(
                        children: [
                          Icon(Icons.bathtub,
                              color: Color.fromARGB(255, 73, 103, 236),
                              size: 20), // Biểu tượng
                          SizedBox(
                              width:
                                  5), // Khoảng cách giữa biểu tượng và văn bản
                          Text(
                            'Bồn tắm/vòi sen riêng',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 5), // Khoảng cách giữa các text và ảnh
                    Padding(
                      padding: EdgeInsets.only(left: 25),
                      child: Row(
                        children: [
                          Icon(Icons.location_city,
                              color: const Color.fromARGB(255, 73, 103, 236),
                              size: 20), // Biểu tượng
                          SizedBox(
                              width:
                                  5), // Khoảng cách giữa biểu tượng và văn bản
                          Text(
                            'Hướng về thành phố',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 5), // Khoảng cách giữa các text và ảnh
                    Padding(
                      padding: EdgeInsets.only(left: 25),
                      child: Row(children: [
                        Icon(Icons.smoke_free,
                            color: const Color.fromARGB(255, 73, 103, 236),
                            size: 20), // Biểu tượng
                        SizedBox(
                            width: 5), // Khoảng cách giữa biểu tượng và văn bản
                        Text('Không hút thuốc',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                            ))
                      ]),
                    ),
                    SizedBox(height: 15), // Khoảng cách giữa các text và ảnh
                    Padding(
                      padding: EdgeInsets.only(left: 25),
                      child: Text(
                        'Xem chi tiết',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: const Color.fromARGB(255, 73, 103, 236),
                        ),
                      ),
                    ),
                  ]),
            ),
            SliverToBoxAdapter(
                child: Container(
              height: 530,
              width: 350,
              margin: EdgeInsets.all(15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: Color.fromARGB(255, 178, 176, 176),
                  width: 1,
                ),
              ),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 15),
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Row(
                        children: [
                          Icon(Icons.people,
                              size: 20,
                              color: Colors.black), // Biểu tượng trước
                          SizedBox(
                              width:
                                  10), // Khoảng cách giữa biểu tượng và văn bản
                          Text(
                            '2 người lớn & 2 trẻ em(0-11 tuổi)',
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Row(
                        children: [
                          Icon(Icons.breakfast_dining,
                              size: 20,
                              color: const Color.fromARGB(
                                  255, 4, 160, 20)), // Biểu tượng trước
                          SizedBox(
                              width:
                                  10), // Khoảng cách giữa biểu tượng và văn bản
                          Text(
                            'Có ăn sáng',
                            style: TextStyle(
                              fontSize: 13,
                              color: Color.fromARGB(255, 0, 0, 0),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Row(
                        children: [
                          Icon(Icons.check,
                              size: 20,
                              color: Color.fromARGB(
                                  255, 0, 0, 0)), // Biểu tượng trước
                          SizedBox(
                              width:
                                  10), // Khoảng cách giữa biểu tượng và văn bản
                          Text(
                            'Chính sách hủy',
                            style: TextStyle(
                              fontSize: 13,
                              color: Color.fromARGB(255, 0, 0, 0),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Row(
                        children: [
                          Icon(Icons.check,
                              size: 20,
                              color: const Color.fromARGB(
                                  255, 4, 160, 20)), // Biểu tượng trước
                          SizedBox(
                              width:
                                  10), // Khoảng cách giữa biểu tượng và văn bản
                          Text(
                            'Trả tiền ở khách sạn',
                            style: TextStyle(
                              fontSize: 13,
                              color: Color.fromARGB(255, 0, 0, 0),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Row(
                        children: [
                          Icon(Icons.coffee,
                              size: 20,
                              color: Color.fromARGB(
                                  255, 0, 0, 0)), // Biểu tượng trước
                          SizedBox(
                              width:
                                  10), // Khoảng cách giữa biểu tượng và văn bản
                          Text(
                            'Cà phê & Trà',
                            style: TextStyle(
                              fontSize: 13,
                              color: Color.fromARGB(255, 0, 0, 0),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Row(
                        children: [
                          Icon(Icons.local_drink,
                              size: 20,
                              color: Color.fromARGB(
                                  255, 1, 1, 1)), // Biểu tượng trước
                          SizedBox(
                              width:
                                  10), // Khoảng cách giữa biểu tượng và văn bản
                          Text(
                            'Nước uống',
                            style: TextStyle(
                              fontSize: 13,
                              color: Color.fromARGB(255, 0, 0, 0),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Row(
                        children: [
                          Icon(Icons.local_parking,
                              size: 20,
                              color: Color.fromARGB(
                                  255, 6, 6, 6)), // Biểu tượng trước
                          SizedBox(
                              width:
                                  10), // Khoảng cách giữa biểu tượng và văn bản
                          Text(
                            'Bãi đậu xe',
                            style: TextStyle(
                              fontSize: 13,
                              color: Color.fromARGB(255, 3, 3, 3),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Row(
                        children: [
                          Icon(Icons.check,
                              size: 20,
                              color: const Color.fromARGB(
                                  255, 4, 160, 20)), // Biểu tượng trước
                          SizedBox(
                              width:
                                  10), // Khoảng cách giữa biểu tượng và văn bản
                          Text(
                            'Nhận phòng nhanh',
                            style: TextStyle(
                              fontSize: 13,
                              color: Color.fromARGB(255, 0, 0, 0),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Row(
                        children: [
                          Icon(Icons.check,
                              size: 20,
                              color: const Color.fromARGB(
                                  255, 4, 160, 20)), // Biểu tượng trước
                          SizedBox(
                              width:
                                  10), // Khoảng cách giữa biểu tượng và văn bản
                          Text(
                            'Wifi và 1 số dịch vụ miễn phí',
                            style: TextStyle(
                              fontSize: 13,
                              color: Color.fromARGB(255, 4, 4, 4),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Row(
                        children: [
                          Icon(Icons.payment,
                              size: 20,
                              color: Color.fromARGB(
                                  255, 0, 0, 0)), // Biểu tượng trước
                          SizedBox(
                              width:
                                  10), // Khoảng cách giữa biểu tượng và văn bản
                          Text(
                            'Hoàn tiền mặt: 414.124 đ \n(Áp dụng các điều khoản)',
                            style: TextStyle(
                              fontSize: 13,
                              color: Color.fromARGB(255, 4, 4, 4),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: EdgeInsets.only(left: 25),
                      child: RichText(
                        text: TextSpan(
                          text: '3.000.000 đ  -50%',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            decoration:
                                TextDecoration.lineThrough, // Thêm gạch ngang
                            decorationColor: const Color.fromARGB(
                                255, 237, 17, 1), // Màu của gạch
                            decorationThickness: 3, // Độ dày của gạch
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 25),
                      child: Text(
                        'Theo Điều khoản hoàn tiền',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 25),
                      child: Text(
                        '924.077 đ',
                        style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                          color: const Color.fromARGB(255, 239, 0, 0),
                        ),
                      ),
                    ),

                    SizedBox(
                        height: 20), // Khoảng cách giữa văn bản và hàng button
                    Row(
                        mainAxisAlignment: MainAxisAlignment
                            .spaceBetween, // Căn hai bên trái và phải
                        children: [
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.only(left: 10),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 15,
                                  vertical:
                                      10), // Thêm padding ngang và dọc để rộng ra
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  bottomLeft: Radius.circular(20),
                                ),
                                color: const Color.fromARGB(
                                    255, 252, 254, 255), // Màu của container
                                border: Border.all(
                                  color: const Color.fromARGB(
                                      255, 177, 175, 175), // Màu viền
                                  width: 1, // Độ dày viền
                                ),
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Số phòng',
                                        style: TextStyle(
                                          fontSize: 17,
                                          color: Colors.black,
                                        ),
                                      ),
                                      Text(
                                        'Phòng có giới hạn',
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Icon(
                                    Icons
                                        .keyboard_arrow_right_outlined, // Biểu tượng mũi tên xuống
                                    color: Colors.black,
                                    size: 18,
                                    // Màu của biểu tượng
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                // Xử lý khi phần được nhấn
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        PaymentDetailPage(), // Thay YourNextPage() bằng trang bạn muốn chuyển đến
                                  ),
                                );
                              },
                              child: Container(
                                margin: EdgeInsets.only(right: 10),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 15,
                                    vertical:
                                        10), // Thêm padding ngang và dọc để rộng ra
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(20),
                                    bottomRight: Radius.circular(20),
                                  ),
                                  color: Color.fromARGB(
                                      255, 208, 226, 243), // Màu của container
                                  border: Border.all(
                                    color: Color.fromARGB(
                                        255, 177, 175, 175), // Màu viền
                                    width: 1, // Độ dày viền
                                  ),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '      Đặt ngay',
                                      style: TextStyle(
                                        fontSize: 17,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ), // Khoảng cách giữa các văn bản
                                    Text(
                                      '(Trả tiền khách sạn)',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ]),
                  ]),
            ))
          ]),
        ])));
  }
}
