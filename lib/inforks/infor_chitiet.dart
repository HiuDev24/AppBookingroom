import 'package:app1/inforks/book_ks.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(HotelInfoPage());
}

class HotelInfoPage extends StatefulWidget {
  @override
  _HotelInfoPageState2 createState() => _HotelInfoPageState2();
}

class _HotelInfoPageState2 extends State<HotelInfoPage> {
  bool notificationsEnabled = true;
  final List<String> imagePaths = [
    'assets/R1.jpg',
    'assets/R2.jpg',
    'assets/R14.jpg',
    'assets/R4.jpg',
    'assets/R5.jpg',
    'assets/R6.jpg',
    'assets/R7.jpg',
    'assets/R8.jpg',
  ];
  final PageController _pageController = PageController(viewportFraction: 0.8);
  int currentPage = 0;

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
        body: CustomScrollView(slivers: [
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
                    margin: EdgeInsets.only(left: 30),
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color.fromARGB(255, 240, 237, 237),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.search),
                        SizedBox(width: 20),
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
              child: Column(children: [
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
                SizedBox(height: 15),
                Container(
                  height: 240,
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: imagePaths.length,
                    itemBuilder: (context, index) {
                      return AnimatedBuilder(
                        animation: _pageController,
                        builder: (context, child) {
                          double value = 1.0;
                          if (_pageController.position.haveDimensions) {
                            value = (_pageController.page ?? 0.0) -
                                index.toDouble();
                            value = (1 - (value.abs() * 1.5)).clamp(0.46, 2.0);
                          }
                          return Center(
                            child: SizedBox(
                              height: Curves.easeInOut.transform(value) * 400,
                              width: Curves.easeInOut.transform(value) * 400,
                              child: child,
                            ),
                          );
                        },
                        child: _buildImageWithZoom(imagePaths[index]),
                      );
                    },
                  ),
                ),
                SizedBox(height: 5),
                Text('$currentPage/${imagePaths.length}'),
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
                SizedBox(height: 10),
                Row(
                  children: [
                    SizedBox(width: 20), // Khoảng cách từ lề trái
                    CircleAvatar(
                      // Hình ảnh của khách sạn
                      backgroundImage: AssetImage('assets/OIP.jpg'),
                      radius: 20, // Độ lớn của hình ảnh
                    ),
                    SizedBox(width: 10), // Khoảng cách giữa hình ảnh và văn bản
                    Text(
                      'Khách sạn The Lumiere',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(width: 20), // Khoảng cách từ lề trái
                    Text(
                      '(Cherry Hotel and Apartment)',
                      style: TextStyle(
                        fontSize: 15,
                        color: const Color.fromARGB(255, 128, 126, 126),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    SizedBox(width: 20), // Khoảng cách từ lề trái
                    Icon(Icons.star,
                        color: Colors.amber), // Biểu tượng sao màu vàng
                    Icon(Icons.star, color: Colors.amber),
                    Icon(Icons.star, color: Colors.amber),
                    Icon(Icons.star, color: Colors.amber),
                    Icon(Icons.star_border,
                        color: Colors.amber), // Biểu tượng sao rỗng
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    SizedBox(width: 20), // Khoảng cách từ lề trái
                    CircleAvatar(
                      // Hình ảnh của khách sạn
                      backgroundImage: AssetImage('assets/map.jpg'),
                      radius: 15, // Độ lớn của hình ảnh
                    ),
                    SizedBox(width: 10),
                    Text(
                      'Map',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(width: 180),
                    Text(
                      '8,1 Tuyệt Vời',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 1, 52, 148),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(width: 290),
                    Text(
                      '899 nhận xét',
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 15, horizontal: 5),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 171, 220, 243),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.notifications),
                      SizedBox(width: 5),
                      Text(
                        'Thông báo cho tôi khi có giá tốt hơn',
                        style: TextStyle(
                          fontSize: 15.5,
                          fontWeight: FontWeight.bold,
                          color: const Color.fromARGB(255, 48, 48, 48),
                        ),
                      ),
                      Expanded(
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Switch(
                            value: notificationsEnabled,
                            onChanged: (value) {
                              setState(() {});
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 5),
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
                SizedBox(height: 15),
                Row(
                  children: [
                    SizedBox(width: 25), // Khoảng cách từ lề trái
                    Expanded(
                      child: Text(
                        'Tiện nghi chung',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ), // Khoảng cách giữa text và icons
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          IconText(
                            icon: Icons.ac_unit,
                            text: 'Máy lạnh',
                          ),
                          SizedBox(height: 5),
                          IconText(
                            icon: Icons.tv,
                            text: 'Thang máy',
                          ),
                          SizedBox(height: 5),
                          IconText(
                            icon: Icons.wifi,
                            text: 'Wifi',
                          ),
                          SizedBox(height: 5),
                          IconText(
                            icon: Icons.car_rental,
                            text: 'Xe oto',
                          ),
                          SizedBox(height: 5),
                          IconText(
                            icon: Icons.pedal_bike_outlined,
                            text: 'Xe máy',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Xem tất cả tiện nghi',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 1, 52, 148),
                      ),
                    ),
                  ],
                ),
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
                SizedBox(height: 10),
                Row(
                  children: [
                    SizedBox(width: 30), // Khoảng cách từ lề trái
                    Expanded(
                      child: Text(
                        'Vị trí',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      width: 111,
                      height: 111,
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: Color.fromARGB(255, 226, 224, 224),
                            width: 2), // Đặt viền
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(
                            8), // Giảm border radius để ảnh không bị cắt
                        child: Image.asset(
                          'assets/mapp.jpg', // Thay 'assets/your_image.jpg' bằng đường dẫn đến tệp ảnh của bạn
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            right:
                                135, // Khoảng cách từ bên phải của văn bản đến container
                          ),
                          child: Text(
                            '8.1 Tuyệt Vời',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 1, 52, 148),
                            ),
                          ),
                        ),
                        SizedBox(height: 5),
                        Padding(
                          padding: const EdgeInsets.only(
                            right:
                                125, // Khoảng cách từ bên phải của văn bản đến container
                          ),
                          child: Text(
                            'Điểm đánh giá vị trí',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.black54,
                            ),
                          ),
                        ),
                        SizedBox(height: 5),
                        Padding(
                          padding: const EdgeInsets.only(
                            right:
                                40, // Khoảng cách từ bên phải của văn bản đến container
                          ),
                          child: Text(
                            '406/14/ Cong Hoa Street, Ward 13\nTan Binh Disrtict,Ho Chi Minh City\nTân Bình, Hồ Chí Minh, Việt Nam \n00000',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.black54,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 5),
                Divider(
                  indent: 30, // Căn lề bên trái của Divider
                  endIndent: 30, // Căn lề bên phải của Divider
                ),
                SizedBox(height: 5),
                Padding(
                  padding: const EdgeInsets.only(left: 20), // Đặt lề bên trái
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(Icons.museum),
                          SizedBox(width: 5),
                          Text(
                            'Bảo tàng chứng tích chiến tranh                         6km',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(Icons.museum),
                          SizedBox(width: 5),
                          Text(
                            'Dinh độc lập                                                     4.28km',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(Icons.local_parking_outlined),
                          SizedBox(width: 5),
                          Text(
                            'Bưu điện trung tâm sài gòn                           3.12km',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(Icons.park_sharp),
                          SizedBox(width: 5),
                          Text(
                            'Thảo cầm viên                                                 3.12km',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(Icons.store_rounded),
                          SizedBox(width: 5),
                          Text(
                            'Chợ bến thành                                                 3.12km',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(width: 5),
                          Text(
                            'Xem tất cả',
                            style: TextStyle(
                              fontSize: 17,
                              color: Color.fromARGB(255, 36, 86, 157),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Divider(
                        indent: 20, // Căn lề bên trái của Divider
                        endIndent: 30, // Căn lề bên phải của Divider
                      ),
                      SizedBox(height: 10),
                      Text('Một số thông tin hữu ích',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          )),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(Icons.location_history_outlined),
                          SizedBox(width: 5),
                          Text(
                            'Nhận phòng/ Trả phòng',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 5),
                      Text(
                          '         Nhận phòng từ:    14:00 \n         Trả phòng đến:     12:00',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                          )),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(Icons.local_hotel),
                          SizedBox(width: 5),
                          Text(
                            'Về khách sạn',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 5),
                      Text('         Số lượng phòng: 10',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                          )),
                    ],
                  ),
                ),
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
                SizedBox(height: 10),
                SizedBox(height: 10),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 25), // Cách lề trái 25 pixel
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Ngôn ngữ sử dụng',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(
                          height: 10), // Khoảng cách giữa dòng văn bản và hàng
                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(8),
                            child: Icon(Icons.language),
                          ),
                          SizedBox(
                              width:
                                  10), // Khoảng cách giữa biểu tượng và văn bản
                          Text(
                            'Tiếng Việt',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(
                              width:
                                  20), // Khoảng cách giữa hai phần tử trong hàng
                          Container(
                            padding: EdgeInsets.all(8),
                            child: Icon(Icons.language),
                          ),
                          SizedBox(
                              width:
                                  10), // Khoảng cách giữa biểu tượng và văn bản
                          Text(
                            'Tiếng Anh',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
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
                SizedBox(height: 10),
                Container(
                  margin: EdgeInsets.only(left: 28), // Cách trái 30 pixel
                  width: double
                      .infinity, // Sử dụng chiều rộng tối đa của container cha
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Một số thông tin hữu ích',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Text('Trẻ sơ sinh 0-2 tuoir [bao gồm cả bé 2 tuổi]',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          )),
                      Text(
                          'Ở miễn phí nếu sử dụng giường có sẵn. Xin lưu ý, nếu cần cũi/nôi em bé thì có thể có phụ thu',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                          )),
                      SizedBox(height: 15),
                      Text('Trẻ sơ sinh 3-6 tuổi [bao gồm cả bé 6 tuổi]',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          )),
                      Text(
                          'Ở miễn phí nếu sử dụng giường có sẵn. \nNhững khách từ 7 tuổi trử lên tính là người lớn',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                          ))
                    ],
                  ),
                ),
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
                SizedBox(height: 10),
                Container(
                  margin: EdgeInsets.only(left: 30), // Cách trái 30 pixel
                  width: double
                      .infinity, // Sử dụng chiều rộng tối đa của container cha
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Bạn có thắc mắc về Khách sạn và Căn hộ?',
                            style: TextStyle(
                              fontSize: 17,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        SizedBox(height: 15),
                        Container(
                          width: 320,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  Colors.blue, // Đổi màu nền của nút
                            ),
                            child: Text(
                              'Liên hệ với chỗ nghỉ',
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.white, // Đổi màu của văn bản
                              ),
                            ),
                          ),
                        ),
                      ]),
                ),
                SizedBox(height: 15),
                Container(
                  height: 8, // Chiều cao 2cm (1cm = 10)
                  color: Colors.grey, // Màu của đường chia
                ),
                SizedBox(height: 15),
                Positioned(
                  bottom: 0,
                  left: 0,
                  child: Container(
                    height: 90, // Đặt chiều cao container
                    width: MediaQuery.of(context).size.width,
                    color: const Color.fromARGB(255, 255, 255, 255),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment
                          .spaceBetween, // Căn chỉnh nút và biểu tượng ở hai phía của container
                      crossAxisAlignment: CrossAxisAlignment
                          .end, // Căn chỉnh phía dưới của container
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              left: 16,
                              bottom:
                                  10), // Điều chỉnh khoảng cách giữa chữ "Khởi điểm" và nút
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment
                                .start, // Căn chỉnh chữ bên trái
                            children: [
                              Text(
                                'Khởi điểm',
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Color.fromARGB(255, 60, 60, 60),
                                ),
                              ),
                              Text(
                                'đ 690.000',
                                style: TextStyle(
                                  fontSize: 19,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 180, 8, 8),
                                ),
                              ),
                              Text(
                                '-99% ĐẶT NGAY HÔM NAY',
                                style: TextStyle(
                                  fontSize: 13,
                                  color: const Color.fromARGB(255, 1, 0, 0),
                                ),
                              ),
                            ],
                          ),
                        ),
                      Row(
  children: [
    Padding(
      padding: EdgeInsets.only(
          right: 10,
          bottom:
              28), // Điều chỉnh khoảng cách giữa biểu tượng và nút
      child: Icon(
        Icons.phone_android_outlined,
        color: Color.fromARGB(
            255, 6, 96, 241), // Màu của biểu tượng
        size: 30, // Kích thước của biểu tượng
      ),
    ),
    Padding(
      padding: EdgeInsets.only(
          right: 10,
          bottom:
              30), // Điều chỉnh khoảng cách giữa nút và bên dưới
      child: ElevatedButton(
        onPressed: () {
          // Xử lý khi nút được nhấn
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HotelInfoPage3(), // Thay YourNextPage() bằng trang bạn muốn chuyển đến
            ),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
          padding: EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 25,
          ),
        ),
        child: Text(
          'Xem mọi phòng',
          style: TextStyle(
            fontSize: 14,
            color: Colors.white,
          ),
        ),
      ),
    ),
  ],
),


                      ],
                    ),
                  ),
                ),
              ]),
            ),
          ),
        ]),
      ),
    );
  }
}

Widget _buildImageWithZoom(String imagePath) {
  return GestureDetector(
    onTap: () {
      print('Image tapped!');
    },
    child: Container(
      width: 240,
      margin: EdgeInsets.symmetric(horizontal: 1),
      decoration: BoxDecoration(
        borderRadius:
            BorderRadius.circular(20), // Đặt giá trị bo tròn viền ở đây
      ),
      child: ClipRRect(
        borderRadius:
            BorderRadius.circular(20), // Đặt giá trị bo tròn viền ở đây
        child: Image.asset(
          imagePath,
          fit: BoxFit.cover,
        ),
      ),
    ),
  );
}

class IconText extends StatelessWidget {
  final IconData icon;
  final String text;

  IconText({
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon),
        SizedBox(width: 5), // Khoảng cách giữa icon và text
        Text(text),
      ],
    );
  }
}
