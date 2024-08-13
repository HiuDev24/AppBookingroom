import 'dart:async';

import 'package:app1/inforks/Booking_Gra.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PaymentDetailPage extends StatefulWidget {
  @override
  _PaymentDetailPageState createState() => _PaymentDetailPageState();
}

class _PaymentDetailPageState extends State<PaymentDetailPage> {
  int? selectedRadio;
  bool agreeTerms = false;
  bool showTextFields1 =
      false; // Biến state để kiểm soát việc hiển thị của TextFormFields 1
  bool showTextFields2 = false;
  bool showTextFields3 =
      false; // Biến state để kiểm soát việc hiển thị của TextFormFields 2
  TextEditingController cardNumberController1 = TextEditingController();
  TextEditingController cardNumberController2 = TextEditingController();
  TextEditingController cardNumberController3 = TextEditingController();
  TextEditingController cardNumberController4 = TextEditingController();
  TextEditingController cardNumberController5 = TextEditingController();

  List<String> optionsForCardNumber5 = [
    'MOMO',
    'PayPal',
    'Ngân Hàng',
    'Zalo Pay'
  ];

  @override
  void initState() {
    super.initState();
    cardNumberController1.text = '';
    cardNumberController2.text = '';
    cardNumberController3.text = '';
    cardNumberController4.text = '';
    cardNumberController5.text = '';
  } // Biến để lưu trữ giá trị của radio được chọn

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: Text(
              'Chi tiết thanh toán',
              style: TextStyle(
                fontSize: 25,
                color: Color.fromARGB(255, 0, 0, 0),
              ),
            ),
            automaticallyImplyLeading: false,
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            child: Container(
              alignment: Alignment.topCenter,
              child: Column(
                mainAxisAlignment: MainAxisAlignment
                    .center, // Đặt mainAxisAlignment thành center
                crossAxisAlignment: CrossAxisAlignment
                    .center, // Đặt crossAxisAlignment thành center
                children: [
                  Padding(
                    padding: const EdgeInsets.all(1.0),
                  ),
                  Container(
                    height: 40,
                    color: Color.fromARGB(255, 250, 210, 211),
                    padding: EdgeInsets.only(left: 16, right: 16),
                    alignment: Alignment.centerLeft,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            'Chúng tôi giữ giá cho quý khách...',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        CountdownTimer(),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    height: 280,
                    width: 370,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color:
                            Color.fromARGB(255, 195, 194, 194).withOpacity(0.5),
                        width: 1,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromARGB(255, 223, 222, 222)
                              .withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 6,
                          offset: Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16, bottom: 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 20,
                            width: 90,
                            color: const Color.fromARGB(255, 131, 239, 135),
                            child: Center(
                              child: Text(
                                'Wifi miễn phí',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Color.fromARGB(255, 1, 17, 1),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Container(
                                height: 110,
                                width: 90,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                    image: AssetImage('assets/ks3.jpg'),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              SizedBox(width: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'First Hotel',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.star,
                                        color: Color.fromARGB(255, 199, 92, 4),
                                        size: 20,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: const Color.fromARGB(
                                            255, 199, 92, 4),
                                        size: 20,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Color.fromARGB(255, 199, 92, 4),
                                        size: 20,
                                      ),
                                      Icon(
                                        Icons.star,
                                        color: Color.fromARGB(255, 199, 92, 4),
                                        size: 20,
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10),
                                  Row(
                                    children: [
                                      Text(
                                        '8,2 Rất tốt',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 17,
                                          color:
                                              Color.fromARGB(255, 64, 100, 233),
                                        ),
                                      ),
                                      SizedBox(width: 10),
                                      Text(
                                        '185 đánh giá',
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 3),
                                  Text(
                                    '18 Hoàng Việt, Quận Tân Bình, Tân Bình...',
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 15),
                          Container(
                            width: 350,
                            height: 0.1,
                            color: Color.fromARGB(255, 123, 122, 122),
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              SizedBox(width: 5),
                              Text(
                                'T3, tháng 5 7',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(width: 15),
                              Icon(
                                Icons.arrow_right,
                                color: Colors.black,
                              ),
                              SizedBox(width: 20),
                              Text(
                                'T4, tháng 5 8',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(width: 55),
                              Text(
                                '1',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 5),
                          Row(
                            children: [
                              SizedBox(width: 5),
                              Text(
                                'Nhận phòng',
                                style: TextStyle(
                                  fontSize: 14,
                                  color:
                                      const Color.fromARGB(255, 134, 131, 131),
                                ),
                              ),
                              SizedBox(width: 70),
                              Text(
                                'Trả phòng',
                                style: TextStyle(
                                  fontSize: 14,
                                  color:
                                      const Color.fromARGB(255, 134, 131, 131),
                                ),
                              ),
                              SizedBox(width: 70),
                              Text(
                                'đêm',
                                style: TextStyle(
                                  color:
                                      const Color.fromARGB(255, 134, 131, 131),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 15),
                          Container(
                            width: 350,
                            height: 0.1,
                            color: Color.fromARGB(255, 123, 122, 122),
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Icon(
                                Icons.security,
                                color: Color.fromARGB(255, 0, 0, 0),
                                size: 20,
                              ),
                              SizedBox(width: 10),
                              Text(
                                'Chính sách hủy',
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Color.fromARGB(255, 0, 0, 0),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    height: 290,
                    width: 370,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color:
                            Color.fromARGB(255, 195, 194, 194).withOpacity(0.5),
                        width: 1,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromARGB(255, 223, 222, 222)
                              .withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 6,
                          offset: Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16, bottom: 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 110,
                                width: 90,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                    image: AssetImage('assets/R10.jpg'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              SizedBox(width: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '1 x Phòng Superior...',
                                    style: TextStyle(
                                      fontSize: 19,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Row(
                                    children: [
                                      Text(
                                        '20 m2  |',
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Color.fromARGB(255, 0, 0, 0),
                                        ),
                                      ),
                                      SizedBox(width: 15),
                                      Text(
                                        'Tối đa: 2 người lớn,\n2 trẻ em (0-11 tuổi)',
                                        style: TextStyle(
                                          fontSize: 13,
                                          color: const Color.fromARGB(
                                              255, 0, 0, 0),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    'Khách: 2 người lớn',
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 15),
                          Container(
                            width: 350,
                            height: 0.1,
                            color: Color.fromARGB(255, 123, 122, 122),
                          ),
                          SizedBox(height: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  SizedBox(width: 5),
                                  Icon(
                                    Icons.hotel,
                                    color: Colors.black,
                                    size: 20,
                                  ),
                                  SizedBox(width: 5),
                                  Text(
                                    '1 giường đôi lớn hoặc 2 giường đơn',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 5),
                              Row(
                                children: [
                                  SizedBox(width: 5),
                                  Icon(
                                    Icons.payments_rounded,
                                    color: Color.fromARGB(255, 3, 147, 27),
                                    size: 20,
                                  ),
                                  SizedBox(width: 5),
                                  Text(
                                    'Thanh toán tại nơi ở',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Color.fromARGB(255, 3, 147, 27),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 5),
                              Row(
                                children: [
                                  SizedBox(width: 5),
                                  Icon(
                                    Icons.donut_small_sharp,
                                    color:
                                        const Color.fromARGB(255, 234, 31, 31),
                                    size: 20,
                                  ),
                                  SizedBox(width: 5),
                                  Text(
                                    'Có hóa đơn thuế',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: const Color.fromARGB(
                                          255, 234, 31, 31),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 5),
                              Row(
                                children: [
                                  SizedBox(width: 5),
                                  Icon(
                                    Icons.timer,
                                    color: Colors.black,
                                    size: 20,
                                  ),
                                  SizedBox(width: 5),
                                  Text(
                                    'Chúng tôi chỉ có số phòng giới hạn ở mức giá này.',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 15),
                              Container(
                                width: 350,
                                height: 0.1,
                                color: Color.fromARGB(255, 123, 122, 122),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              SizedBox(width: 5),
                              Icon(
                                Icons.car_crash,
                                color: Color.fromARGB(255, 3, 147, 27),
                                size: 20,
                              ),
                              SizedBox(width: 5),
                              Text(
                                'Bãi đỗ xe',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Color.fromARGB(255, 3, 147, 27),
                                ),
                              ),
                              SizedBox(width: 15),
                              Icon(
                                Icons.fastfood,
                                color: Color.fromARGB(255, 3, 147, 27),
                                size: 20,
                              ),
                              SizedBox(width: 5),
                              Text(
                                'Bữa ăn sáng miễn phí',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Color.fromARGB(255, 3, 147, 27),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    height: 320,
                    width: 370,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color:
                            Color.fromARGB(255, 195, 194, 194).withOpacity(0.5),
                        width: 1,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromARGB(255, 223, 222, 222)
                              .withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 6,
                          offset: Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16, bottom: 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 25,
                            child: Container(
                              height: 60,
                              width: 180,
                              color: Colors.red,
                              child: Center(
                                child: Text(
                                  'Giảm 40% HÔM NAY',
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 15),
                          Row(
                            children: [
                              Text(
                                'Giá gốc (1 phòng x 1 đêm)',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Color.fromARGB(255, 0, 0, 0),
                                ),
                              ),
                              SizedBox(width: 85),
                              Stack(
                                children: [
                                  Text(
                                    '1.587.584 đ',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: const Color.fromARGB(255, 0, 0, 0),
                                    ),
                                  ),
                                  Positioned(
                                    left: 0,
                                    right: 0,
                                    top: 10, // Điều chỉnh vị trí gạch ngang
                                    child: Container(
                                      height: 1,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Text(
                                'Giá phòng (1 phòng x 1 đêm)',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Color.fromARGB(255, 0, 0, 0),
                                ),
                              ),
                              SizedBox(width: 65),
                              Text(
                                '1.187.584 đ',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: const Color.fromARGB(255, 0, 0, 0),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Container(
                            width: 350,
                            height: 0.1,
                            color: Color.fromARGB(255, 123, 122, 122),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 10),
                              Row(
                                children: [
                                  Text(
                                    'Giá cuối cùng',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17,
                                      color: Color.fromARGB(255, 0, 0, 0),
                                    ),
                                  ),
                                  SizedBox(width: 125),
                                  Text(
                                    '1.187.584 đ',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17,
                                      color: const Color.fromARGB(255, 0, 0, 0),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),
                              Row(
                                children: [
                                  Text(
                                    ' Giá đã bao gồm:',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13,
                                      color: Color.fromARGB(255, 0, 0, 0),
                                    ),
                                  ),
                                  Text(
                                    ' Phí dịch vụ 55.123 đ VAT 92.113 đ',
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: const Color.fromARGB(255, 0, 0, 0),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 15),
                              SizedBox(
                                height: 55,
                                child: Container(
                                  height: 60,
                                  width: 340,
                                  color: Color.fromARGB(255, 77, 214, 150),
                                  child: Center(
                                    child: Text(
                                      ' Tìm được giá nào thấp hơn thì chúng tôi sẽ\n khớp giá đó và hoàn 50% tiền!',
                                      style: TextStyle(
                                        fontSize: 15,
                                        color:
                                            Color.fromARGB(255, 255, 255, 255),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 10),
                              Row(
                                children: [
                                  SizedBox(width: 5),
                                  Icon(
                                    Icons.money,
                                    color: Colors.black,
                                    size: 20,
                                  ),
                                  SizedBox(width: 5),
                                  Text(
                                    'Bạn sẽ thanh toán tại khách sạn bằng ngoại tệ (đ ).',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),
                              Text(
                                '  Lựa chọn khôn khéo! Bạn sẽ tiết kiệm được 483.131 đ.',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.black,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SingleChildScrollView(
                      child: Container(
                          alignment: Alignment.topCenter,
                          child: Padding(
                              padding: const EdgeInsets.all(6.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 10),
                                  Container(
                                      height: 370,
                                      width: 380,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                          color:
                                              Color.fromARGB(255, 195, 194, 194)
                                                  .withOpacity(0.5),
                                          width: 1,
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Color.fromARGB(
                                                    255, 223, 222, 222)
                                                .withOpacity(0.5),
                                            spreadRadius: 2,
                                            blurRadius: 6,
                                            offset: Offset(0, 5),
                                          ),
                                        ],
                                      ),
                                      child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 18, top: 10),
                                          child: SingleChildScrollView(
                                            child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Phương thức thanh toán',
                                                    style: TextStyle(
                                                      fontSize: 19,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                  SizedBox(height: 10),
                                                  Row(
                                                    children: [
                                                      Icon(
                                                        Icons
                                                            .system_security_update,
                                                        color: Color.fromARGB(
                                                            255, 3, 147, 27),
                                                        size: 20,
                                                      ),
                                                      SizedBox(width: 5),
                                                      Text(
                                                        'Mọi dữ liệu thanh toán được mã hóa và bảo mật',
                                                        style: TextStyle(
                                                          fontSize: 12,
                                                          color: Color.fromARGB(
                                                              255, 2, 91, 17),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        children: [
                                                          Radio(
                                                            value: 1,
                                                            groupValue:
                                                                selectedRadio,
                                                            onChanged: (value) {
                                                              setState(() {
                                                                selectedRadio =
                                                                    value
                                                                        as int?;
                                                                showTextFields1 =
                                                                    selectedRadio ==
                                                                        1;
                                                                showTextFields2 =
                                                                    !showTextFields1;
                                                              });
                                                            },
                                                            activeColor:
                                                                Colors.black,
                                                          ),
                                                          Text(
                                                            'Thẻ tín dụng/thẻ ghi nợ *',
                                                            style: TextStyle(
                                                              fontSize: 12,
                                                              color:
                                                                  Colors.black,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Row(
                                                        children: [
                                                          SizedBox(
                                                              width:
                                                                  40), // Để tạo khoảng cách giữa radio button và icons
                                                          SizedBox(
                                                            width:
                                                                30, // Kích thước của hình ảnh
                                                            height:
                                                                30, // Kích thước của hình ảnh
                                                            child:
                                                                Image.network(
                                                              'https://th.bing.com/th/id/R.d201a5b0e53d870fa436d64438b00621?rik=19Iq%2fBataT2EpQ&riu=http%3a%2f%2fpluspng.com%2fimg-png%2fvisa-logo-png-visa-logo-png-transparent-amp-svg-vector-pluspng-2400x2400.png&ehk=nFx2LlazjBd%2fQTkFzEJBVwnv9%2foG4hopIBBBjz1Et7M%3d&risl=&pid=ImgRaw&r=0', // Thay thế bằng URL của hình ảnh ngân hàng đầu tiên
                                                              fit: BoxFit
                                                                  .cover, // Đảm bảo hình ảnh được vừa với kích thước container
                                                            ),
                                                          ),
                                                          SizedBox(
                                                              width:
                                                                  10), // Khoảng cách giữa các icons
                                                          SizedBox(
                                                            width:
                                                                30, // Kích thước của hình ảnh
                                                            height:
                                                                30, // Kích thước của hình ảnh
                                                            child: Image.network(
                                                                'https://th.bing.com/th/id/R.93432c12cb348bdefdcc27d465fac524?rik=LhggmvPksBkFkA&riu=http%3a%2f%2flogos-download.com%2fwp-content%2fuploads%2f2016%2f04%2fJCB_logo_logotype_emblem_Japan_Credit_Bureau.png&ehk=Q0%2f%2fhZsj0IOI9CRwjKhtQ%2bPCmN0Dgyiqi5VNsI67lvM%3d&risl=&pid=ImgRaw&r=0'),
                                                          ),
                                                          SizedBox(
                                                              width:
                                                                  10), // Khoảng cách giữa các icons
                                                          SizedBox(
                                                            width:
                                                                30, // Kích thước của hình ảnh
                                                            height:
                                                                30, // Kích thước của hình ảnh
                                                            child:
                                                                Image.network(
                                                              'https://th.bing.com/th/id/OIP.OljkiIdOTrNsVbqLdmG5BgHaE0?rs=1&pid=ImgDetMain', // Thay thế bằng URL của hình ảnh ngân hàng thứ ba
                                                              fit: BoxFit
                                                                  .fill, // Đảm bảo hình ảnh được vừa với kích thước container
                                                            ),
                                                          ),
                                                          SizedBox(
                                                              width:
                                                                  10), // Khoảng cách giữa các icons
                                                          SizedBox(
                                                            width:
                                                                30, // Kích thước của hình ảnh
                                                            height:
                                                                30, // Kích thước của hình ảnh
                                                            child:
                                                                Image.network(
                                                              'https://pngimg.com/uploads/mastercard/mastercard_PNG14.png', // Thay thế bằng URL của hình ảnh ngân hàng thứ tư
                                                              fit: BoxFit
                                                                  .fill, // Đảm bảo hình ảnh được vừa với kích thước container
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Row(
                                                        children: [
                                                          Radio(
                                                            value: 2,
                                                            groupValue:
                                                                selectedRadio,
                                                            onChanged: (value) {
                                                              setState(() {
                                                                selectedRadio =
                                                                    value
                                                                        as int?;
                                                                showTextFields2 =
                                                                    selectedRadio ==
                                                                        2;
                                                                showTextFields1 =
                                                                    !showTextFields2;
                                                              });
                                                            },
                                                            activeColor:
                                                                Color.fromARGB(
                                                                    255,
                                                                    3,
                                                                    147,
                                                                    27),
                                                          ),
                                                          Text(
                                                            'Thanh toán kỹ thuật số',
                                                            style: TextStyle(
                                                              fontSize: 12,
                                                              color: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      3,
                                                                      147,
                                                                      27),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Row(
                                                        children: [
                                                          SizedBox(
                                                              width:
                                                                  40), // Để tạo khoảng cách giữa radio button và icons
                                                          SizedBox(
                                                            width:
                                                                30, // Kích thước của hình ảnh
                                                            height:
                                                                30, // Kích thước của hình ảnh
                                                            child:
                                                                Image.network(
                                                              'https://pngimg.com/uploads/paypal/paypal_PNG6.png', // Thay thế bằng URL của hình ảnh ngân hàng đầu tiên
                                                              fit: BoxFit
                                                                  .fill, // Đảm bảo hình ảnh được vừa với kích thước container
                                                            ),
                                                          ),
                                                          SizedBox(
                                                              width:
                                                                  10), // Khoảng cách giữa các icons
                                                          SizedBox(
                                                            width:
                                                                30, // Kích thước của hình ảnh
                                                            height:
                                                                30, // Kích thước của hình ảnh
                                                            child: Image.network(
                                                                'https://img.mservice.io/momo-payment/icon/images/logo512.png'),
                                                          ),
                                                          SizedBox(
                                                              width:
                                                                  10), // Khoảng cách giữa các icons
                                                          SizedBox(
                                                            width:
                                                                30, // Kích thước của hình ảnh
                                                            height:
                                                                30, // Kích thước của hình ảnh
                                                            child:
                                                                Image.network(
                                                              'https://play-lh.googleusercontent.com/Sek2hVyVQRvLl26-9cwCnuAs4s6C9EJXLZ5p0hKfMbATxK11IlTVrFmqChYJ2nMUJw', // Thay thế bằng URL của hình ảnh ngân hàng thứ ba
                                                              fit: BoxFit
                                                                  .fill, // Đảm bảo hình ảnh được vừa với kích thước container
                                                            ),
                                                          ),
                                                          SizedBox(
                                                              width:
                                                                  10), // Khoảng cách giữa các icons
                                                          SizedBox(
                                                            width:
                                                                30, // Kích thước của hình ảnh
                                                            height:
                                                                30, // Kích thước của hình ảnh
                                                            child:
                                                                Image.network(
                                                              'https://cardtot.com/wp-content/uploads/2020/01/zalopay.png', // Thay thế bằng URL của hình ảnh ngân hàng thứ tư
                                                              fit: BoxFit
                                                                  .fill, // Đảm bảo hình ảnh được vừa với kích thước container
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Row(
                                                        children: [
                                                          Radio(
                                                            value: 3,
                                                            groupValue:
                                                                selectedRadio,
                                                            onChanged: (value) {
                                                              setState(() {
                                                                selectedRadio =
                                                                    value
                                                                        as int?;
                                                                showTextFields3 =
                                                                    selectedRadio ==
                                                                        2;
                                                                showTextFields3 =
                                                                    !showTextFields3;
                                                              });
                                                            },
                                                            activeColor:
                                                                Color.fromARGB(
                                                                    255,
                                                                    3,
                                                                    147,
                                                                    27),
                                                          ),
                                                          Text(
                                                            'Khác *',
                                                            style: TextStyle(
                                                              fontSize: 12,
                                                              color: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      3,
                                                                      147,
                                                                      27),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Row(
                                                        children: [
                                                          Checkbox(
                                                            value: agreeTerms,
                                                            onChanged: (value) {
                                                              setState(() {
                                                                agreeTerms =
                                                                    value!;
                                                              });
                                                            },
                                                          ),
                                                          Text(
                                                            'Tôi đồng ý nhận thông tin cập nhật và chương \ntrình khuyến mãi về Babylon và các chi nhánh \nhoặc đối tác dinh doanh của babylon thông qua \nnhiều kênh,bao gồm cả Whatapps.\nCó thể ngừng nhận thông tin bất cứ lúc nào.',
                                                            style: TextStyle(
                                                              fontSize: 12,
                                                              color:
                                                                  Colors.black,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(height: 20),
                                                      if (showTextFields1 ||
                                                          showTextFields2) ...[
                                                        Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .symmetric(
                                                                    horizontal:
                                                                        20),
                                                            child: Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  SizedBox(
                                                                      height:
                                                                          10),
                                                                  if (showTextFields1) ...[
                                                                    Text(
                                                                      'Số thẻ tín dụng/thẻ ghi nợ*',
                                                                      style:
                                                                          TextStyle(
                                                                        fontSize:
                                                                            12,
                                                                        color: Colors
                                                                            .black,
                                                                      ),
                                                                    ),
                                                                    SizedBox(
                                                                        height:
                                                                            10),
                                                                    Container(
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        border: Border.all(
                                                                            color:
                                                                                Colors.grey),
                                                                        borderRadius:
                                                                            BorderRadius.circular(5),
                                                                      ),
                                                                      child:
                                                                          Padding(
                                                                        padding: const EdgeInsets
                                                                            .symmetric(
                                                                            horizontal:
                                                                                10),
                                                                        child:
                                                                            TextFormField(
                                                                          decoration:
                                                                              InputDecoration(
                                                                            border:
                                                                                InputBorder.none,
                                                                            hintText:
                                                                                'Nhập số ',
                                                                            contentPadding:
                                                                                EdgeInsets.symmetric(
                                                                              vertical: 5,
                                                                              horizontal: 10,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    SizedBox(
                                                                        height:
                                                                            10),
                                                                    Text(
                                                                      'Tên trên thẻ *',
                                                                      style:
                                                                          TextStyle(
                                                                        fontSize:
                                                                            12,
                                                                        color: Colors
                                                                            .black,
                                                                      ),
                                                                    ),
                                                                    SizedBox(
                                                                        height:
                                                                            10),
                                                                    Container(
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        border: Border.all(
                                                                            color:
                                                                                Colors.grey),
                                                                        borderRadius:
                                                                            BorderRadius.circular(5),
                                                                      ),
                                                                      child:
                                                                          Padding(
                                                                        padding: const EdgeInsets
                                                                            .symmetric(
                                                                            horizontal:
                                                                                10),
                                                                        child:
                                                                            TextFormField(
                                                                          decoration:
                                                                              InputDecoration(
                                                                            border:
                                                                                InputBorder.none,
                                                                            hintText:
                                                                                'Nhập tên',
                                                                            contentPadding:
                                                                                EdgeInsets.symmetric(
                                                                              vertical: 5,
                                                                              horizontal: 10,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    SizedBox(
                                                                        height:
                                                                            10),
                                                                    Row(
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Expanded(
                                                                          child:
                                                                              Column(
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children: [
                                                                              Text(
                                                                                'NNgày hết hạn *',
                                                                                style: TextStyle(
                                                                                  fontSize: 12,
                                                                                  color: Colors.black,
                                                                                ),
                                                                              ),
                                                                              SizedBox(height: 10),
                                                                              Container(
                                                                                decoration: BoxDecoration(
                                                                                  border: Border.all(color: Colors.grey),
                                                                                  borderRadius: BorderRadius.circular(5),
                                                                                ),
                                                                                child: Padding(
                                                                                  padding: const EdgeInsets.symmetric(
                                                                                    horizontal: 10,
                                                                                  ),
                                                                                  child: TextFormField(
                                                                                    decoration: InputDecoration(
                                                                                      border: InputBorder.none,
                                                                                      hintText: 'Nhập ngày',
                                                                                      contentPadding: EdgeInsets.symmetric(
                                                                                        vertical: 5,
                                                                                        horizontal: 10,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        SizedBox(
                                                                            width:
                                                                                10),
                                                                        Expanded(
                                                                          child:
                                                                              Column(
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children: [
                                                                              Text(
                                                                                'Mã bảo mật CVC *',
                                                                                style: TextStyle(
                                                                                  fontSize: 12,
                                                                                  color: Colors.black,
                                                                                ),
                                                                              ),
                                                                              SizedBox(height: 10),
                                                                              Container(
                                                                                decoration: BoxDecoration(
                                                                                  border: Border.all(color: Colors.grey),
                                                                                  borderRadius: BorderRadius.circular(5),
                                                                                ),
                                                                                child: Padding(
                                                                                  padding: const EdgeInsets.symmetric(
                                                                                    horizontal: 10,
                                                                                  ),
                                                                                  child: TextFormField(
                                                                                    decoration: InputDecoration(
                                                                                      border: InputBorder.none,
                                                                                      hintText: 'Nhập mã',
                                                                                      contentPadding: EdgeInsets.symmetric(
                                                                                        vertical: 5,
                                                                                        horizontal: 10,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              SizedBox(height: 20),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ],
                                                                  if (showTextFields2) ...[
                                                                    // Hiển thị TextFormFields của Radio thứ 2
                                                                    Text(
                                                                      'Chọn phương thức thanh toán',
                                                                      style:
                                                                          TextStyle(
                                                                        fontSize:
                                                                            12,
                                                                        color: Colors
                                                                            .black,
                                                                      ),
                                                                    ),
                                                                    SizedBox(
                                                                        height:
                                                                            10),
                                                                    Container(
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        border: Border.all(
                                                                            color:
                                                                                Colors.grey),
                                                                        borderRadius:
                                                                            BorderRadius.circular(5),
                                                                      ),
                                                                      child:
                                                                          Padding(
                                                                        padding: const EdgeInsets
                                                                            .symmetric(
                                                                            horizontal:
                                                                                10),
                                                                        child:
                                                                            TextFormField(
                                                                          controller:
                                                                              cardNumberController5,
                                                                          readOnly:
                                                                              true, // Không cho phép chỉnh sửa trực tiếp từ người dùng
                                                                          onTap:
                                                                              () {
                                                                            // Hiển thị hộp thoại khi người dùng bấm vào cardNumberController5
                                                                            showDialog(
                                                                              context: context,
                                                                              builder: (BuildContext context) {
                                                                                return AlertDialog(
                                                                                  title: Text('Chọn phương thức thanh toán'),
                                                                                  content: Column(
                                                                                    mainAxisSize: MainAxisSize.min,
                                                                                    children: optionsForCardNumber5
                                                                                        .map(
                                                                                          (option) => ListTile(
                                                                                            title: Text(option),
                                                                                            onTap: () {
                                                                                              // Cập nhật giá trị cho cardNumberController5 khi người dùng chọn một tùy chọn
                                                                                              setState(() {
                                                                                                cardNumberController5.text = option;
                                                                                              });
                                                                                              Navigator.pop(context); // Đóng hộp thoại
                                                                                            },
                                                                                          ),
                                                                                        )
                                                                                        .toList(),
                                                                                  ),
                                                                                );
                                                                              },
                                                                            );
                                                                          },
                                                                          decoration:
                                                                              InputDecoration(
                                                                            border:
                                                                                InputBorder.none,
                                                                            hintText:
                                                                                'Chọn phương thức thanh toán',
                                                                            contentPadding:
                                                                                EdgeInsets.symmetric(vertical: 5, horizontal: 10), // Điều chỉnh kích thước của ô nhập liệu
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    SizedBox(
                                                                        height:
                                                                            20),
                                                                  ]
                                                                ])),
                                                      ],
                                                    ],
                                                  ),
                                                ]),
                                          ))),
                                  Container(
                                    width: double.infinity,
                                    margin: EdgeInsets.symmetric(vertical: 20),
                                    child: GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    BookingConfirmationPage()),
                                          );
                                        },
                                        child: ElevatedButton(
                                          onPressed: () {
                                            // Thực hiện hành động khi nút được nhấn
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      BookingConfirmationPage()), // Thay NewPage bằng trang bạn muốn chuyển đến
                                            );
                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.all(12.0),
                                            child: Text(
                                              'Đặt phòng ngay',
                                              style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                const Color.fromARGB(
                                                    255, 28, 152, 152),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                          ),
                                        )),
                                  )
                                ],
                              ))))
                ],
              ),
            ),
          ),
        ));
  }
}

class CountdownTimer extends StatefulWidget {
  @override
  _CountdownTimerState createState() => _CountdownTimerState();
}

class _CountdownTimerState extends State<CountdownTimer> {
  int _remainingTime = 1200; // 20 phút = 1200 giây
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_remainingTime > 0) {
          _remainingTime--;
        } else {
          _timer.cancel();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    int hours = _remainingTime ~/ 3600;
    int minutes = (_remainingTime % 3600) ~/ 60;
    int seconds = _remainingTime % 60;
    String formattedTime =
        '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';

    return Row(
      children: [
        Icon(
          Icons.timer_off,
          color: Color.fromARGB(255, 255, 21, 4),
        ),
        SizedBox(width: 5),
        Text(
          formattedTime,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 17,
            color: Color.fromARGB(255, 196, 16, 3),
          ),
        ),
      ],
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: PaymentDetailPage(),
  ));
}
