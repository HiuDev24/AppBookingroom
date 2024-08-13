import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PersonalInformationPage extends StatefulWidget {
  @override
  _PersonalInformationPageState createState() =>
      _PersonalInformationPageState();
}

class _PersonalInformationPageState extends State<PersonalInformationPage> {
  late TextEditingController _userNameController;
  late TextEditingController _emailController;
  late TextEditingController _phoneNumberController;
  late TextEditingController _dobController;
  late TextEditingController _addressController;
  late TextEditingController _passwordController;
  String? _selectedGender;
  String? _selectedNationality;
  List<String> _genders = ['Male', 'Female', 'Other'];
  List<String> _nationalities = [
    'USA',
    'UK',
    'Canada',
    'Australia',
    'Vietnam',
    'France',
    'Germany'
  ];

  @override
  void initState() {
    super.initState();
    _userNameController = TextEditingController();
    _emailController = TextEditingController();
    _phoneNumberController = TextEditingController();
    _dobController = TextEditingController();
    _addressController = TextEditingController();
    _passwordController = TextEditingController();
    _loadPersonalInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Thông tin cá nhân',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Widgets for user information inputs
            Center(
              child: GestureDetector(
                onTap: () {
                  // TODO: Handle changing avatar
                },
                child: CircleAvatar(
                  radius: 80,
                  backgroundImage: AssetImage('assets/profile_image.jpg'),
                ),
              ),
            ),
            SizedBox(height: 20),
            _buildTextField('User Name', _userNameController),
            _buildTextField('Email', _emailController),
            _buildTextField('Phone Number', _phoneNumberController),
            _buildTextField('CMND', _dobController),
            _buildTextField('Address', _addressController),
            _buildTextField('Password', _passwordController),
            _buildDropdown('Gender', _genders, _selectedGender),
            _buildDropdown('Nationality', _nationalities, _selectedNationality),

            // Button to save information
            Center(
              child: Container(
                height: 50,
                width: 300,
                child: ElevatedButton(
                  onPressed: () {
                    _savePersonalInfo();
                    _showSuccessDialog();
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Color.fromARGB(255, 28, 152, 152)),
                  ),
                  child: Text(
                    'Lưu',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        TextField(
          controller: controller,
          decoration: InputDecoration(
            hintText: 'Nhập $label',
            border: OutlineInputBorder(),
            suffixIcon: Icon(Icons.edit),
          ),
        ),
        SizedBox(height: 10),
      ],
    );
  }

  Widget _buildDropdown(
      String label, List<String> items, String? selectedValue) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        DropdownButton<String>(
          value: selectedValue,
          onChanged: (newValue) {
            setState(() {
              if (label == 'Gender') {
                _selectedGender = newValue;
              } else if (label == 'Nationality') {
                _selectedNationality = newValue;
              }
            });
          },
          items: items.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
        SizedBox(height: 5),
      ],
    );
  }

  void _savePersonalInfo() {
    String userName = _userNameController.text;
    String email = _emailController.text;
    String phoneNumber = _phoneNumberController.text;
    String dob = _dobController.text;
    String address = _addressController.text;
    String password = _passwordController.text;
    String? selectedGender = _selectedGender;
    String? selectedNationality = _selectedNationality;

    _saveToSharedPreferences(userName, email, phoneNumber, dob, address,
        password, selectedGender, selectedNationality);
  }

  Future<void> _saveToSharedPreferences(
      String userName,
      String email,
      String phoneNumber,
      String dob,
      String address,
      String password,
      String? selectedGender,
      String? selectedNationality) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('userName', userName);
    prefs.setString('email', email);
    prefs.setString('phoneNumber', phoneNumber);
    prefs.setString('dob', dob);
    prefs.setString('address', address);
    prefs.setString('password', password);
    prefs.setString('selectedGender', selectedGender ?? '');
    prefs.setString('selectedNationality', selectedNationality ?? '');
  }

  Future<void> _loadPersonalInfo() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _userNameController.text = prefs.getString('userName') ?? '';
      _emailController.text = prefs.getString('email') ?? '';
      _phoneNumberController.text = prefs.getString('phoneNumber') ?? '';
      _dobController.text = prefs.getString('dob') ?? '';
      _addressController.text = prefs.getString('address') ?? '';
      _passwordController.text = prefs.getString('password') ?? '';
      _selectedGender = prefs.getString('selectedGender');
      _selectedNationality = prefs.getString('selectedNationality');
    });
  }

  void _showSuccessDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Cập nhật thành công'), 
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Thông tin của bạn đã được cập nhật.'),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: PersonalInformationPage(),
  ));
}
