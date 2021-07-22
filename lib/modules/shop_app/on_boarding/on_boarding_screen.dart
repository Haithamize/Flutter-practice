import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/modules/shop_app/shop_login/shop_login_screen.dart';
import 'package:flutter_app/network/local/cache_sharedpref.dart';
import 'package:flutter_app/shared/components/components.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingModel {
  final String image;
  final String title;
  final String body;
  OnBoardingModel(this.image, this.title, this.body);
}

class OnBoardingScreen extends StatelessWidget {
  final List<OnBoardingModel> list = [
    OnBoardingModel(
        'https://storage.googleapis.com/gweb-uniblog-publish-prod/images/Flagship_100_Blog_2880x1800_Apparel.max-1000x1000.jpg',
        'OnBoarding 1',
        'body of 1'),
    OnBoardingModel(
        'https://storage.googleapis.com/gweb-uniblog-publish-prod/images/Hero_Image_Google_Shopping_Blog_Illustrati.max-1000x1000.png',
        'OnBoarding 2',
        'body of 2'),
    OnBoardingModel(
        'https://www.almrsal.com/wp-content/uploads/2015/01/shopping-900x675.jpg',
        'OnBoarding 3',
        'body of 3'),
  ];

  @override
  Widget build(BuildContext context) {

     var pageController = PageController();
     bool isLast = false;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white70,
        elevation: 0,
        actions:
        [
          TextButton(onPressed: (){submit(context);}, child: Text('SKIP',style: TextStyle(color: Colors.red),))
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              onPageChanged: (index){
                if(index == list.length){
                  isLast = true;
                  print(isLast);

                }else{
                  isLast = false;
                  print(isLast);
                }
              },
              physics: BouncingScrollPhysics(),
              controller: pageController,
              itemBuilder: (context, index) {
                return buildPageViewItem(list[index]);
              },
              itemCount: list.length,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(40),
            child: Row(
              children:
              [
                SmoothPageIndicator(
                    controller: pageController,
                    count: list.length,
                    effect: ExpandingDotsEffect(
                    activeDotColor: Colors.red,
                    dotHeight: 10,
                    expansionFactor: 4,
                    dotWidth: 8,
                    spacing: 5,
                  ),
                ),
                Spacer(),
                FloatingActionButton(onPressed: (){
                  if(isLast){
                    submit(context);
                  }else{
                    pageController.nextPage(duration: Duration(microseconds: 750), curve: Curves.fastLinearToSlowEaseIn);
                  }
                },
                child: Icon(Icons.arrow_forward),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  void submit(context){
    CacheHelper.setData('onBoarding', true).then((value) {
      if(value){ //lw el value b true y3ni el sharedpref et3ml feh save lel kema successfully
        navigateToAndReplace(context, ShopLoginScreen());
      }
    });
  }

  Widget buildPageViewItem(OnBoardingModel list) {
    return Padding(
      padding: const EdgeInsets.all(40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Image(
              image: NetworkImage('${list.image}'),
            ),
          ),
          Text(
            '${list.title}',
            style: TextStyle(
              fontSize: 24,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            '${list.body}',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
          ),
        ],
      ),
    );
  }
}
