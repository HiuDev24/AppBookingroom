import 'package:flutter/material.dart';

class CurrencySelectionPage extends StatelessWidget {
  final String selectedCurrency;

  CurrencySelectionPage({required this.selectedCurrency});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select Currency'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('USD'),
            onTap: () {
              _selectCurrency('USD', context);
            },
          ),
          ListTile(
            title: Text('VND'),
            onTap: () {
              _selectCurrency('VND', context);
            },
          ),
          ListTile(
            title: Text('EUR'),
            onTap: () {
              _selectCurrency('EUR', context);
            },
          ),
          ListTile(
            title: Text('GBP'),
            onTap: () {
              _selectCurrency('GBP', context);
            },
          ),
          ListTile(
            title: Text('AUD'),
            onTap: () {
              _selectCurrency('AUD', context);
            },
          ),
          ListTile(
            title: Text('CAD'),
            onTap: () {
              _selectCurrency('CAD', context);
            },
          ),
          ListTile(
            title: Text('JPY'),
            onTap: () {
              _selectCurrency('JPY', context);
            },
          ),
          ListTile(
            title: Text('CHF'),
            onTap: () {
              _selectCurrency('CHF', context);
            },
          ),
          ListTile(
            title: Text('CNY'),
            onTap: () {
              _selectCurrency('CNY', context);
            },
          ),
          ListTile(
            title: Text('HKD'),
            onTap: () {
              _selectCurrency('HKD', context);
            },
          ),
        ],
      ),
    );
  }

  void _selectCurrency(String currency, BuildContext context) {
    Navigator.pop(context, currency); // Trả về tiền tệ đã chọn khi nhấp vào
  }
}
