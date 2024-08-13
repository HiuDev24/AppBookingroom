import 'package:app1/pages/sales_home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(BookingConfirmationPage()); // Khởi chạy ứng dụng Flutter
}

class BookingConfirmationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Đặt phòng đã hoàn tất',
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
            child: Column(children: [
              Container(
                padding: EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Color.fromARGB(255, 227, 226, 226),
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Form(
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
                          SizedBox(height: 10),
                          Text(
                            'Cảm ơn quý khách đã đặt phòng với Babylon!',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 3, 129, 22),
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Xác nhận đặt phòng của quý khách, gồm cả chi tiết về chỗ\n  nghỉ và đơn đựat phòng, sẽ được gửi cho trong vài phút\n   tới. Quý khách cũng có thể ghé Đơn đặt chỗ của tôi để\n         xem chi tiết đặt phòng của mình bất cứ lúc nào.',
                            style: TextStyle(
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10),
              Container(
                  padding: EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Color.fromARGB(255, 3, 129, 22),
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        SizedBox(height: 10),
                        Text(
                          '• Mã số đặt phòng',
                          style: TextStyle(fontSize: 17),
                        ),
                        Text(
                          '   4214510811',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 19),
                        ),
                        Text(
                          '   Khách sạn ABC ',
                          style: TextStyle(fontSize: 17),
                        ),
                        SizedBox(height: 10),
                        Column(
                          children: [
                            Divider(
                              color: Color.fromARGB(255, 221, 219, 219),
                            ),
                            Text(
                              'Th7, thg5 27 - CN thg 5 28                      1 đêm',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Color.fromARGB(255, 73, 73, 73)),
                            ),
                          ],
                        ),
                        Column(children: [
                          Divider(
                            color: Color.fromARGB(255, 221, 219, 219),
                          ),
                          Text(
                            'Phòng Tiêu chuẩn cho 2 người - Không hút thuốc',
                            style: TextStyle(
                                fontSize: 15,
                                color: Color.fromARGB(255, 73, 73, 73)),
                          ),
                          SizedBox(height: 10),
                          Text(
                            '1 phòng X 1 đêm                                     900.000 đ',
                            style: TextStyle(
                                fontSize: 15,
                                color: Color.fromARGB(255, 73, 73, 73)),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Thuế và phí                                              124.141 đ',
                            style: TextStyle(
                                fontSize: 15,
                                color: Color.fromARGB(255, 73, 73, 73)),
                          ),
                        ]),
                        SizedBox(height: 10),
                        Column(
                          children: [
                            Divider(
                              color: Color.fromARGB(255, 221, 219, 219),
                            ),
                            Row(children: [
                              Text(
                                '   Tổng tiền',
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 73, 73, 73)),
                              ),
                              SizedBox(width: 160),
                              Text(
                                '1.124.141 đ',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 186, 4, 4)),
                              ),
                            ])
                          ],
                        ),
                      ])),
              SizedBox(height: 10),
              Container(
                padding: EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Color.fromARGB(255, 3, 129, 22),
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      '•  Chú thích',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                    Text(
                      '    Các yêu cầu đặc biệt tùy thuộc vào khách sạn còn\n     phòng trống hay không và không thể bảo đảm.Nhận\n     phòng sớm hoặc Đưa đón ở sân bay có thể sẽ phải \n    trả thêm phụ phí',
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Container(
                padding: EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Color.fromARGB(255, 3, 129, 22),
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        '•  Chính sách Khách sạn',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      Text(
                        '    Thú nuôi tuyệt đối không được phép vào chỗ nghỉ',
                        style: TextStyle(fontSize: 14),
                      ),
                      SizedBox(height: 10),
                      Text(
                        '    Khi đặt trên 3 phòng chính sách và các điều \n    khoản bổ sung có thể được áp dụng',
                        style: TextStyle(fontSize: 14),
                      ),
                      SizedBox(height: 10),
                      Text(
                        '    Khi đặt trên 3 phòng chính sách và các điều \n    khoản bổ sung có thể được áp dụng',
                        style: TextStyle(fontSize: 14),
                      ),
                    ]),
              ),
              SizedBox(height: 10),
              Container(
                padding: EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Color.fromARGB(255, 3, 129, 22),
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        '•  Mô tả Khách sạn',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      SizedBox(width: 20),
                      Text(
                        '    Trên con đường nhộn nhịp của trung tâm thành phố, \n    bên dòng người vội vã, tồn tại một nơi mang đến sự \n    yên bình và tiện nghi cho du khách: Khách Sạn \n    Sunshine. Với vị trí thuận lợi và dịch vụ chuyên \n    nghiệp, Sunshine Hotel không chỉ là điểm dừng chân \n    lý tưởng mà còn là điểm sáng rực rỡ giữa hàng ngàn \n    lựa chọn lưu trú.',
                        style: TextStyle(fontSize: 14),
                      ),
                    ]),
              ),
              Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(vertical: 20),
                child: ElevatedButton(
                  onPressed: () { Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SalesHomePage(),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      'Quay về trang chủ',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: const Color.fromARGB(
                        255, 28, 152, 152), // Màu chữ trên nút
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(8), // Độ bo tròn của góc nút
                    ),
                  ),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
