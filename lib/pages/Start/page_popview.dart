import 'package:flutter/material.dart';

class PagePoup extends StatelessWidget {
  final PageViewData imageData;

  const PagePoup({Key? key, required this.imageData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 3,
          child: Center(
            child: Container(
              width: MediaQuery.of(context).size.width - 40,
              decoration: BoxDecoration(
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(40), 
                child: AspectRatio(
                  aspectRatio: 1.4,
                  child: Image.asset(
                    imageData.assetImage,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity, 
                  ),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: SizedBox(),
        ),
      ],
    );
  }
}

class PageViewData {
  final String titleText;
  final String subText;
  final String assetImage;

  PageViewData({
    required this.titleText,
    required this.subText,
    required this.assetImage,
  });
}
