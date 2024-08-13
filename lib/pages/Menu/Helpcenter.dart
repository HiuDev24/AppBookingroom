import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; // Import thư viện url_launcher

class SupportCenterPage extends StatefulWidget {
  @override
  _SupportCenterPageState createState() => _SupportCenterPageState();
}

class _SupportCenterPageState extends State<SupportCenterPage> {
  List<bool> _isExpandedList = List.generate(7, (index) => false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Trung tâm hỗ trợ',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true, // Căn giữa tiêu đề
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  height: 150,
                  color: const Color.fromARGB(255, 28, 152, 152),
                  child: Center(
                    child: Text(
                      'Cần hỗ trợ? Đã có chúng tôi ở đây...',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'Thắc mắc về dịch vụ cho thuê phòng?',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                _buildQuestionCard(
                  context,
                  'Làm thế nào để tôi đặt phòng?',
                  'Để đặt phòng, vui lòng truy cập trang web hoặc ứng dụng di động của chúng tôi và điều hướng đến phần cho thuê phòng. Từ đó, bạn có thể tìm kiếm phòng trống, chọn ngày mong muốn và tiếp tục quá trình đặt phòng.',
                  0,
                ),
                _buildQuestionCard(
                  context,
                  'Thời gian nhận phòng và trả phòng là mấy giờ?',
                  'Thời gian nhận phòng là 15:00, và thời gian trả phòng là 12:00. Tuy nhiên, vui lòng lưu ý rằng thời gian nhận và trả phòng cụ thể có thể thay đổi tùy thuộc vào tài sản và tính sẵn có.',
                  1,
                ),
                _buildQuestionCard(
                  context,
                  'Tôi có thể hủy hoặc sửa đổi đặt chỗ của mình không?',
                  'Có, bạn có thể hủy hoặc sửa đổi đặt chỗ của mình, nhưng vui lòng lưu ý rằng chính sách hủy và sửa đổi có thể thay đổi tùy thuộc vào tài sản và các điều khoản của đặt chỗ của bạn. Nên xem xét lại chính sách hủy trước khi thực hiện đặt chỗ.',
                  2,
                ),
                _buildQuestionCard(
                  context,
                  'Trong phòng có những tiện nghi gì?',
                  'Các tiện nghi thay đổi tùy thuộc vào loại phòng và tài sản. Tuy nhiên, các tiện nghi thông thường có thể bao gồm Wi-Fi, truyền hình, điều hòa không khí, đồ vệ sinh và nhiều hơn nữa. Bạn có thể tìm thông tin chi tiết về các tiện nghi được cung cấp trên trang web của tài sản hoặc trong quá trình đặt phòng.',
                  3,
                ),
                _buildQuestionCard(
                  context,
                  'Câu hỏi 5',
                  'Câu trả lời cho câu hỏi số 5.',
                  4,
                ),
                _buildQuestionCard(
                  context,
                  'Câu hỏi 6',
                  'Câu trả lời cho câu hỏi số 6.',
                  5,
                ),
                _buildQuestionCard(
                  context,
                  'Câu hỏi 7',
                  'Câu trả lời cho câu hỏi số 7.',
                  6,
                ),
              ],
            ),
          ),
         Positioned(
  bottom: 20,
  right: 20,
  child: FloatingActionButton(
    onPressed: () async {
      const url = 'https://www.facebook.com/profile.php?id=100011232069871'; // URL của ứng dụng Messenger
      if (await canLaunch(url)) {
        await launch(url); // Mở ứng dụng Messenger nếu có thể
      } else {
        throw 'Không thể mở ứng dụng Messenger';
      }
    },
    backgroundColor: Color.fromARGB(255, 127, 129, 132), // Màu nền của nút
    child: Icon(Icons.facebook_rounded), // Logo Facebook
  ),
),

        ],
      ),
    );
  }

  Widget _buildQuestionCard(BuildContext context, String question, String answer, int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: ExpansionTile(
          title: Text(
            question,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          childrenPadding: EdgeInsets.fromLTRB(16, 0, 16, 16),
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  answer,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _isExpandedList[index] = false;
                    });
                  },
                  child: Text('Đóng'),
                ),
              ],
            ),
          ],
          initiallyExpanded: _isExpandedList[index],
          onExpansionChanged: (bool expanded) {
            setState(() {
              _isExpandedList[index] = expanded;
            });
          },
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: SupportCenterPage(),
  ));
}
