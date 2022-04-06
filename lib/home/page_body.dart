import 'package:first_flutter_app/utils/colors.dart';
import 'package:first_flutter_app/widgets/big_text.dart';
import 'package:first_flutter_app/widgets/icon_and_text_widget.dart';
import 'package:first_flutter_app/widgets/small_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PageBody extends StatefulWidget {
  const PageBody({Key? key}) : super(key: key);

  @override
  State<PageBody> createState() => _PageBodyState();
}

class _PageBodyState extends State<PageBody> {
  PageController pageController = PageController(viewportFraction: 0.85);
  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.red,
      height: 320,
      child: PageView.builder(
        controller: pageController,
        itemCount: 5,
        itemBuilder: (context, position){
        return _buildPageItem(position);
      }),
    );
  }
  Widget _buildPageItem(int index){
    return Stack(
      children: [
        Container(
          height: 220,
          margin: EdgeInsets.only(left: 10, right: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: index.isEven?Color(0xFF69c5df):Color(0xFF9294cc),
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                      "assets/image/food0.png"
                  )
              )
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 120,
            margin: EdgeInsets.only(left: 30, right: 30, bottom: 30),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.white,
            ),
            child: Container(
              padding: EdgeInsets.only(top: 15,left: 15, right: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BigText(text: "Thomas Muller",size: 14),
                  SizedBox(height: 10,),
                  Row(
                    children: [
                       Wrap(
                         children: List.generate(5, (index) =>Icon(Icons.star,color: AppColors.mainColor,size: 15,)),
                       ),
                      SizedBox(width: 10,),
                      SmallText(text: "4.5"),
                      SizedBox(width: 10,),
                      SmallText(text: "1287"),
                      SizedBox(width: 10,),
                      SmallText(text: "comments"),
                    ],
                  ),
                  SizedBox(height: 20,),
                  Row(
                    children: [
                      IconAndTextWidget(
                          text: "Normal",
                          icon: Icons.circle_sharp,
                          iconColor: AppColors.iconColor1),
                      IconAndTextWidget(
                          text: "1.7km",
                          icon: Icons.location_on,
                          iconColor: AppColors.mainColor),
                      IconAndTextWidget(
                          text: "Third",
                          icon: Icons.access_time_rounded,
                          iconColor: AppColors.iconColor1)
                    ],
                  )

                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
