import 'package:flutter/material.dart';

class HotelPhotoGallery extends StatelessWidget {
  final List<String> imagePaths = [
    'assets/R1.jpg',
    'assets/R2.jpg',
    'assets/R4.jpg',
    'assets/R7.jpg',
    'assets/R8.jpg',
    'assets/R9.jpg',
    'assets/R13.jpg',
    'assets/R14.jpg',
    // Thêm các đường dẫn đến các ảnh khác tại đây
  ];
  final List<String> imagePath = [
    'assets/G1.jpg',
    'assets/R10.jpg',
    'assets/R14.jpg',
    'assets/R11.jpg',
    'assets/R4.jpg',
    // Thêm các đường dẫn đến các ảnh khác tại đây
  ];
  final List<String> imageNames = [
    'Khách sạn',
    'Phòng',
    'Tiện nghi',
    'Ăn uống',
    'Khác',
    // Thêm các tên ảnh khác tại đây
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bộ Sưu Tập Ảnh Khách Sạn'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Tổng quan về chỗ nghỉ',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 150,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          image: DecorationImage(
                            image:
                                AssetImage(imagePath[index % imagePath.length]),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      SizedBox(height: 14),
                      Text(
                        imageNames[index % imageNames.length],
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Divider(
            color:
                const Color.fromARGB(255, 182, 181, 181), // Màu của đường line
            thickness: 1, // Độ dày của đường line
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Khách sạn',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
                children: List.generate(
                  imagePaths.length,
                  (index) => GestureDetector(
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        image: DecorationImage(
                          image: AssetImage(imagePaths[index]),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HotelPhotoGallery(),
  ));
}
