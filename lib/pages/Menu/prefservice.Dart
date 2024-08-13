import 'package:flutter/material.dart';
import 'discountcard.dart'; // Import DiscountCard từ file discountcard.dart

class ServiceAndOffersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title: Text(
          'Phiếu giảm giá & Ưu đãi',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true, // Căn giữa tiêu đề
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Tìm hiểu thêm về phiếu quà tặng',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 15),
              Container(
                width: double.infinity, // Đặt chiều rộng của khung bằng toàn bộ không gian có sẵn
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15), // Khoảng cách giữa viền và văn bản bên trong
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8), // Định hình viền của khung
                  border: Border.all(color: Colors.grey), // Màu và độ dày của viền
                ),
                child: TextFormField(
                  decoration: InputDecoration(
                    border: InputBorder.none, // Loại bỏ viền xung quanh TextFormField
                    hintText: 'Nhập Mã số khuyến mãi', // Văn bản gợi ý khi không có nội dung
                    suffixIcon: Icon(Icons.check_circle, color: Colors.green),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Bạn có phiếu giảm giá hoặc mã khuyến mãi? Nhập vào đây.',
                style: TextStyle(color: Colors.grey),
              ),
              SizedBox(height: 20),
              Text(
                'ƯU ĐÃI',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  for (int i = 1; i <= 5; i++)
                    DiscountCard(
                      discountPercentage: i * 10,
                      image: 'assets/discount_image_$i.jpg',
                      expiryDays: 30 - i * 2, // Example expiry days
                      promotion: 'Thuê giảm ngay tiền phòng', // Example promotion
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class IconCircle extends StatelessWidget {
  final Color color;

  const IconCircle({required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      margin: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
    );
  }
}


void main() {
  runApp(MaterialApp(
    home: ServiceAndOffersPage(),
  ));
}
