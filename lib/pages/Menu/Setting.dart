import 'package:app1/pages/Menu/Change/Language.dart';
import 'package:app1/pages/Menu/Change/Money.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  String selectedLanguage = 'English'; // Ngôn ngữ được chọn mặc định
  String selectedCurrency = 'USD'; // Tiền tệ được chọn mặc định
  bool notificationsEnabled = true; // Trạng thái bật/tắt thông báo mặc định

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Cài Đặt',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true, // Căn giữa tiêu đề
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16.0), // Đặt lề trái là 16.0
                  child: Text(
                    'Cài đặt thiết bị',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Spacer(),
              ],
            ),
            SizedBox(height: 10),
            ListTile(
              title: Text('Language'),
              subtitle: Text(selectedLanguage), // Hiển thị ngôn ngữ được chọn
              trailing: Icon(Icons.language),
              onTap: () async {
                // Navigate to language selection panel
                final newLanguage = await Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => LanguageSelectionPage(
                          selectedLanguage: selectedLanguage)),
                );
                if (newLanguage != null) {
                  setState(() {
                    selectedLanguage = newLanguage;
                  });
                }
              },
            ),
            ListTile(
              title: Text('Tiền Tệ'),
              subtitle: Text(selectedCurrency), // Hiển thị tiền tệ được chọn
              trailing: Icon(Icons.money_sharp),
              onTap: () async {
                // Navigate to currency selection panel
                final newCurrency = await Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CurrencySelectionPage(
                          selectedCurrency: selectedCurrency)),
                );
                if (newCurrency != null) {
                  setState(() {
                    selectedCurrency = newCurrency;
                  });
                }
              },
            ),
            ListTile(
              title: Text('Thông Báo'),
              trailing: Switch(
                value: notificationsEnabled,
                onChanged: (value) {
                  setState(() {
                    notificationsEnabled = value;
                  });
                },
              ),
            ),
            // Divider mờ toàn bộ chiều rộng
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16.0),
              child: Divider(color: Colors.grey[400], height: 20),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16.0), // Đặt lề trái là 16.0
                  child: Text(
                    'Khác',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Spacer(),
              ],
            ),
            ListTile(
              title: Text('Chính sách bảo mật'),
              onTap: () {
                // TODO: Navigate to privacy policy page
              },
              trailing: Icon(Icons.key_sharp),
            ),
            ListTile(
              title: Text('Quản lý cài đặt riêng tư'),
              onTap: () {
                // TODO: Navigate to privacy settings page
              },
              trailing: Icon(Icons.key_off_outlined),
            ),
            ListTile(
              title: Text('Thực hiện các quyền về dữ liệu'),
              onTap: () {
                // TODO: Navigate to data permissions page
              },
              trailing: Icon(Icons.data_array_rounded),
            ),
            ListTile(
              title: Text('Điều khoản và điều kiện'),
              onTap: () {
                // TODO: Navigate to terms and conditions page
              },
              trailing: Icon(Icons.account_circle),
            ),
            ListTile(
              title: Text('Về chúng tôi'),
              onTap: () {
                // TODO: Navigate to terms and conditions page
              },
              trailing: Icon(Icons.people_outline),
            ),
            ListTile(
              title: Text('Tin nhắn từ chỗ nghỉ'),
              onTap: () {
                // TODO: Navigate to terms and conditions page
              },
              trailing: Icon(Icons.message_sharp),
            ),
            ListTile(
              title: Text('Thông tin Pháp lý'),
              onTap: () {
                // TODO: Navigate to terms and conditions page
              },
              trailing: Icon(Icons.info_outline),
            ),
            ListTile(
              title: Text('Quản lý thông báo giá'),
              onTap: () {
                // TODO: Navigate to terms and conditions page
              },
              trailing: Icon(Icons.money_off_rounded),
            ),
            ListTile(
              title: Text('Babylon hoạt động thế nào'),
              subtitle: Text(''), // Thay đổi version tại đây
            ),
            ListTile(
              title: Text('Version'),
              subtitle: Text('1.0.0'), // Thay đổi version tại đây
            ),
          ],
        ),
      ),
    );
  }
}
