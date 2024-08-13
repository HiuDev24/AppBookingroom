import 'dart:async';
import 'package:app1/Login_Register/Login.dart';
import 'package:app1/Login_Register/Register.dart';
import 'package:flutter/material.dart';
import 'package:app1/pages/Start/page_popview.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart'; // Thêm thư viện SmoothPageIndicator

class IntroductionScreen extends StatefulWidget {
  const IntroductionScreen({Key? key}) : super(key: key);

  @override
  State<IntroductionScreen> createState() => _IntroductionScreenState();
}

class _IntroductionScreenState extends State<IntroductionScreen> {
  late PageController pageController;
  List<PageViewData> pageViewModelData = [];
  late Timer sliderTimer;
  var currentShowIndex = 0;

  @override
  void initState() {
    super.initState();
    pageViewModelData.add(PageViewData(
      titleText: 'THE HEALING LAND', 
      subText: 'Babylon Mini Resort đem đến cho bạn cả thiên nhiên', 
      assetImage: 'assets/wel4.jpg', 
    ));

    pageViewModelData.add(PageViewData(
    titleText: 'KHÔNG GIAN CHỮA LÀNH', 
    subText: 'Trải nghiệm rất riêng biệt .', 
    assetImage: 'assets/welcome5.jpg', 
          )
        );
    pageViewModelData.add(PageViewData(
      titleText: 'DỊCH VỤ XANH', 
      subText: '     Hãy tận hưởng cảm giác thư thái,\nnuôi dưỡng thân - tâm - trí của bạn nhé ',
      assetImage: 'assets/wel6.jpg', 
    ));
     Text(
      pageViewModelData[currentShowIndex].subText,
      textAlign: TextAlign.center, 
      style: TextStyle(
        fontSize: 16.0,
            ),
          );

    pageController = PageController(initialPage: 0);

    sliderTimer = Timer.periodic(Duration(seconds: 5), (timer) {
      currentShowIndex = (currentShowIndex + 1) % pageViewModelData.length;
      pageController.animateToPage(
        currentShowIndex,
        duration: Duration(seconds: 1),
        curve: Curves.fastOutSlowIn,
      );
    });
  }

  @override
  void dispose() {
    sliderTimer.cancel();
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).padding.top,
          ),
          Expanded(
            child: Stack(
              children: [
                PageView.builder(
                  controller: pageController,
                  pageSnapping: true,
                  onPageChanged: (index) {
                    setState(() {
                      currentShowIndex = index;
                    });
                  },
                  itemCount: pageViewModelData.length,
                  itemBuilder: (context, index) {
                    return PagePoup(imageData: pageViewModelData[index]);
                  },
                ),
                Positioned(
                  bottom: 70.0,
                  left: 0,
                  right: 0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SmoothPageIndicator( 
                        controller: pageController,
                        count: pageViewModelData.length,
                        effect: SlideEffect( 
                          activeDotColor: Theme.of(context).primaryColor,
                          dotColor: Theme.of(context).dividerColor,
                          dotHeight: 10.0,
                          dotWidth: 15.0,
                          spacing: 10.0,
                        ),
                      ),
                      SizedBox(height:15.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [ 
                          Text(
                            pageViewModelData[currentShowIndex].titleText,
                            style: TextStyle(
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            pageViewModelData[currentShowIndex].subText,
                            style: TextStyle(
                              fontSize: 15.0,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 30.0),
                      Column( 
                        mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                        SizedBox(
                          width: 300,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => LoginPage()), // Trang đăng nhập
                              );
                            },
                            child: Text(
                              'Đăng nhập',
                              style: TextStyle(
                                color: Color.fromARGB(255, 236, 236, 236), 
                                fontSize: 18, 
                              ),
                            ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 28, 152, 152),  
                                                  )
                            ),
                          ),
                          SizedBox(height: 15.0),
                         SizedBox(
                              width: 300,
                              height: 50,
                              child: ElevatedButton(
                                onPressed: () {
                                   Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => RegisPage()), 
                              );
                            },     
                                child: Text(
                                  'Tạo tài khoản',
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 236, 236, 236), 
                                    fontSize: 18, 
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Color.fromARGB(255, 28, 152, 152),
                              )
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
