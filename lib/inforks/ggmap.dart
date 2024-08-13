import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

class FilterPage extends StatefulWidget {
  @override
  _FilterPageState createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  late GoogleMapController mapController;
  Position? currentPosition;
  bool isFavorite = true;
  double bottomSheetHeight = 0;
  double maxPrice = 1000000;
  double currentPrice = 0;
  late TextEditingController _searchController;
  MapType _currentMapType = MapType.normal;
  bool isHeartVisible = true;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
    _searchController = TextEditingController();
    _timer = Timer.periodic(Duration(milliseconds: 500), (timer) {
      setState(() {
        isHeartVisible = !isHeartVisible; // Đảo ngược trạng thái
      });
    });
  }

  Future<void> _searchLocation() async {
    String query = _searchController.text;
    if (query.isEmpty) return;

    try {
      List<Location> locations = await locationFromAddress(query);
      if (locations.isNotEmpty) {
        Location location = locations.first;
        _moveToLocation(LatLng(location.latitude, location.longitude));
      } else {
        print("No location found for the given query");
      }
    } catch (e) {
      print("Error searching location: $e");
    }
  }

  void _moveToLocation(LatLng latLng) {
    mapController.animateCamera(
      CameraUpdate.newLatLng(
        latLng,
      ),
    );
  }

  Future<void> _getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      setState(() {
        currentPosition = position;
      });

      // Cập nhật vị trí mới trên bản đồ
      mapController.animateCamera(
        CameraUpdate.newLatLng(
          LatLng(position.latitude, position.longitude),
        ),
      );
    } catch (e) {
      print("Error getting current location: $e");
    }
  }

  void _toggleMapType() {
    setState(() {
      _currentMapType = _currentMapType == MapType.normal
          ? MapType.satellite
          : MapType.normal;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 1.0),
              child: Container(
                width: 350,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Color.fromARGB(255, 235, 233, 233),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: IconButton(
                        icon: Icon(Icons.search),
                        onPressed: _searchLocation,
                      ),
                    ),
                    Expanded(
                      child: TextField(
                        controller: _searchController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Tìm kiếm',
                          hintStyle: TextStyle(color: Colors.grey),
                          contentPadding: EdgeInsets.symmetric(vertical: 8.0),
                          isDense: true,
                        ),
                        textAlignVertical: TextAlignVertical.center,
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.clear),
                      onPressed: () {
                        _searchController.clear();
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(width: 15),
          AnimatedOpacity(
            duration: Duration(milliseconds: 100),
            opacity: isHeartVisible ? 1.0 : 0.0,
            child: Icon(
              Icons.favorite,
              size: 40,
              color: Colors.red,
            ),
          ),
        ]),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: FilterOption(
                    title: '    Bộ lọc',
                    icon: Icons.keyboard_arrow_down,
                    onTap: () {
                      // Handle filter option here
                    },
                  ),
                ),
                FilterDivider(),
                Expanded(
                  child: FilterOption(
                    title: '       Giá',
                    icon: Icons.keyboard_arrow_down,
                    onTap: () {
                      // Show bottom sheet when price is tapped
                      setState(() {
                        bottomSheetHeight = 170; // Set bottom sheet height
                      });
                      _showPriceBottomSheet(context);
                    },
                  ),
                ),
                FilterDivider(),
                Expanded(
                  child: FilterOption(
                    title: ' Sắp xếp',
                    icon: Icons.keyboard_arrow_down,
                    onTap: () {
                      // Handle sort option here
                    },
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 1.0,
            color: Colors.grey,
          ),
          Expanded(
            child: Stack(children: [
              GoogleMap(
                initialCameraPosition: currentPosition != null
                    ? CameraPosition(
                        target: LatLng(currentPosition!.latitude,
                            currentPosition!.longitude),
                        zoom: 20,
                      )
                    : CameraPosition(
                        target: LatLng(10.8231,
                            106.6297), // Hoặc bạn có thể chọn vị trí mặc định khác
                        zoom: 20,
                      ),
                mapType: _currentMapType,
                onMapCreated: (GoogleMapController controller) {
                  mapController = controller;
                },
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 100,
                child: Container(
                  height: 150,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      SizedBox(width: 10),
                      _buildHorizontalBox('Horizontal 1'),
                      SizedBox(width: 10),
                      _buildHorizontalBox('Horizontal 2'),
                      SizedBox(width: 10),
                      _buildHorizontalBox('Horizontal 3'),
                      SizedBox(width: 10),
                      _buildHorizontalBox('Horizontal 4'),
                      SizedBox(width: 10),
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(height: 50), // Khoảng cách giữa hai nút
                  FloatingActionButton(
                    onPressed: _toggleMapType,
                    mini: true,
                    child: Icon(Icons.layers),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(height: 150), // Khoảng cách giữa hai nút
                  FloatingActionButton(
                    onPressed: _getCurrentLocation,
                    mini: true,
                    child: Icon(Icons.my_location),
                  ),
                ],
              ),
            ]),
          )
        ],
      ),
    );
  }

  Widget _buildHorizontalBox(String text) {
    return Container(
      width: 290,
      height: 120,
      color: Colors.white.withOpacity(0.9),
      child: Stack(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 100,
                  height: 120,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(8.0),
                    image: DecorationImage(
                      image: AssetImage('assets/R3.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        'The Lumiere',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Icon(Icons.star,
                            color: Color.fromARGB(255, 213, 173, 14)),
                        Icon(Icons.star,
                            color: const Color.fromARGB(255, 213, 173, 14)),
                        Icon(Icons.star,
                            color: const Color.fromARGB(255, 213, 173, 14)),
                        Icon(Icons.star,
                            color: const Color.fromARGB(255, 213, 173, 14)),
                        Icon(Icons.star_half, color: Colors.yellow),
                      ],
                    ),
                    SizedBox(height: 4),
                    Row(
                      children: [
                        Icon(Icons.location_on, color: Colors.grey, size: 18),
                        SizedBox(width: 4),
                        Text(
                          'cách bạn 0.5 km',
                          style: TextStyle(
                            fontSize: 9,
                            fontWeight: FontWeight.bold,
                            color: const Color.fromARGB(255, 43, 43, 43),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            top: 0,
            right: 0,
            child: FavoriteIcon(),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    '1 đêm',
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(255, 43, 43, 43),
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    '₫600,000',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            left: 0,
            child: Container(
              width: 80,
              height: 30,
              color: Colors.red,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.star_border,
                    color: Colors.white,
                    size: 15,
                  ),
                  SizedBox(width: 4),
                  Text(
                    'Bán chạy \nnhất',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 10,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  void _showPriceBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
              ),
              height: 200,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 10),
                  Text(
                    'Ngân sách',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Giá tiền: ${currentPrice.toInt()}đ',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 10),
                  Slider(
                    onChanged: (double value) {
                      setState(() {
                        currentPrice = value;
                      });
                    },
                    min: 0,
                    max: maxPrice,
                    divisions: 1000,
                    label: '${currentPrice.toInt()}đ',
                    value: currentPrice,
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            currentPrice = 0;
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 28, 152, 152),
                          minimumSize: Size(150, 40),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Text(
                          'Xóa',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          // Handle your filter button action
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 28, 152, 152),
                          minimumSize: Size(150, 40),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Text(
                          'Lọc',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}

class FavoriteIcon extends StatefulWidget {
  @override
  _FavoriteIconState createState() => _FavoriteIconState();
}

class _FavoriteIconState extends State<FavoriteIcon> {
  bool _isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isFavorite = !_isFavorite;
        });
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Icon(
          _isFavorite ? Icons.favorite : Icons.favorite_border,
          color: _isFavorite ? Colors.red : Colors.grey,
        ),
      ),
    );
  }
}

class FilterOption extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  const FilterOption({
    Key? key,
    required this.title,
    required this.icon,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(10.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(width: 5),
            Icon(icon),
          ],
        ),
      ),
    );
  }
}

class FilterDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.0,
      child: VerticalDivider(
        color: Colors.grey,
      ),
    );
  }
}
