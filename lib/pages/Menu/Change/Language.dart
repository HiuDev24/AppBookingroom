import 'package:flutter/material.dart';

class LanguageSelectionPage extends StatelessWidget {
  final String selectedLanguage;

  LanguageSelectionPage({required this.selectedLanguage});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chọn Ngôn Ngữ'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('English'),
            onTap: () {
              _selectLanguage('English', context);
            },
          ),
          ListTile(
            title: Text('Vietnamese'),
            onTap: () {
              _selectLanguage('Vietnamese', context);
            },
          ),
          ListTile(
            title: Text('Spanish'),
            onTap: () {
              _selectLanguage('Spanish', context);
            },
          ),
          ListTile(
            title: Text('French'),
            onTap: () {
              _selectLanguage('French', context);
            },
          ),
          ListTile(
            title: Text('German'),
            onTap: () {
              _selectLanguage('German', context);
            },
          ),
          ListTile(
            title: Text('Chinese'),
            onTap: () {
              _selectLanguage('Chinese', context);
            },
          ),
          ListTile(
            title: Text('Japanese'),
            onTap: () {
              _selectLanguage('Japanese', context);
            },
          ),
          ListTile(
            title: Text('Korean'),
            onTap: () {
              _selectLanguage('Korean', context);
            },
          ),
          ListTile(
            title: Text('Russian'),
            onTap: () {
              _selectLanguage('Russian', context);
            },
          ),
          ListTile(
            title: Text('Arabic'),
            onTap: () {
              _selectLanguage('Arabic', context);
            },
          ),
        ],
      ),
    );
  }

  void _selectLanguage(String language, BuildContext context) {
    Navigator.pop(context, language); // Trả về ngôn ngữ đã chọn khi nhấp vào
  }
}
