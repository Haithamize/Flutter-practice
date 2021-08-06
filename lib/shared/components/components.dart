import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/modules/news_app_modules/web_view/web_view_screen.dart';
import 'package:flutter_app/modules/shop_app/shop_login/shop_login_screen.dart';
import 'package:flutter_app/network/local/cache_sharedpref.dart';
import 'package:flutter_app/shared/cubit/cubit.dart';
import 'package:flutter_conditional_rendering/conditional.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gender_picker/source/enums.dart';
import 'package:gender_picker/source/gender_picker.dart';

Widget buildDefaultTFF(
        {Function onTap,
        TextEditingController controller,
        String labelText,
        TextInputType type,
        IconData prefix,
        IconData suffix,
        Function obsPress,
        Function onChange,
        bool isPassword,
        Function validate}) =>
    TextFormField(
      controller: controller,
      obscureText: isPassword,
      onTap: onTap,
      validator: validate,
      onFieldSubmitted: (value) {
        print(value);
      },
      onChanged: onChange,
      decoration: InputDecoration(
        labelText: labelText,
        // icon: Icon(
        //   Icons.email
        // ),
        border: OutlineInputBorder(),
        prefixIcon: Icon(prefix),
        suffixIcon: suffix != null
            ? IconButton(
                icon: Icon(suffix),
                onPressed: obsPress,
              )
            : null,
      ),
      keyboardType: type,
    );

Widget buildDefaultButton(Function function, String name,
    {Color containerColor, Color textColor}) {
  return Container(
      width: double.infinity,
      color: containerColor == null ? Colors.blue : containerColor,
      child: IconButton(
        icon: Text(
          '${name.toUpperCase()}',
          style: TextStyle(color: textColor == null ? Colors.white : textColor),
        ),
        onPressed: function,
      ));
}

Widget buildTaskItem(Map obj, context) {
  return Dismissible(
    confirmDismiss: (direction) async {
      if (direction == DismissDirection.startToEnd) {
        AppCubit.get(context).deleteTask(obj['id']);
        return true;
      } else {
        return false;
      }
    },
    key: UniqueKey(),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.blue,
                    radius: 50,
                  ),
                  Text(
                    '${obj['time']}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: 20,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${obj['title']}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      '${obj['date']}',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              IconButton(
                  icon: Icon(
                    Icons.check_box,
                    color: Colors.green,
                  ),
                  onPressed: () {
                    AppCubit.get(context).updateDatabase('done', obj['id']);
                  }),
              SizedBox(
                width: 10,
              ),
              IconButton(
                  icon: Icon(
                    Icons.archive,
                    color: Colors.black45,
                  ),
                  onPressed: () {
                    AppCubit.get(context).updateDatabase('archived', obj['id']);
                  }),
            ],
          ),
        ],
      ),
    ),
  );
}

Widget taskBuilder(context, tasks) {
  return Conditional.single(
    context: context,
    conditionBuilder: (BuildContext context) {
      return tasks.length > 0;
    },
    widgetBuilder: (context) => ListView.separated(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return buildTaskItem(tasks[index], context);
        },
        separatorBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(15),
            child: Container(
              width: double.infinity,
              height: 1,
              color: Colors.black,
            ),
          );
        },
        itemCount: tasks.length),
    fallbackBuilder: (context) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.menu,
              size: 100,
              color: Colors.grey,
            ),
            Text(
              'No items to show yet!',
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black45),
            )
          ],
        ),
      );
    },
  );
}

Widget buildBusinessNewsItem(Map listItem, context) {
  return InkWell(
    onTap: () {
      navigateTo(context, WebViewScreen(listItem['url']));
    },
    child: Padding(
      padding: const EdgeInsets.all(15),
      child: Row(
        children: [
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  20.0,
                ),
                image: DecorationImage(
                  image: NetworkImage(listItem['urlToImage'] != null
                      ? '${listItem['urlToImage']}'
                      : 'https://tech-echo.com/wp-content/uploads/2020/09/android-11-update-features-850x478.jpg'),
                  fit: BoxFit.cover,
                )),
          ),
          SizedBox(
            width: 15,
          ),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${listItem['title']}',
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  '${listItem['publishedAt']}',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

Widget listViewSeparator() {
  return Padding(
    padding: const EdgeInsets.all(15.0),
    child: Container(
      width: double.infinity,
      height: 1,
      color: Colors.grey,
    ),
  );
}

void navigateTo(context, widget) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) {
      return widget;
    }),
  );
}

void navigateToAndReplace(context, widget) {
  Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(builder: (context) {
      return widget;
    }),
    (Route<dynamic> route) {
      return false;
    }, //de a3mlha false lw 3ayz a3ml replace w al8i el routes eli fatt w true lw msh 3ayz a3ml replace
  );
}

void makeToast({
  String message,
  MaterialColor toastColor,
  ToastGravity gravity,
}) {
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: gravity,
      timeInSecForIosWeb: 1,
      backgroundColor: toastColor,
      textColor: Colors.white,
      fontSize: 16.0);
}

signOut(context) {
  CacheHelper.removeData('token').then((value) {
    if (value) {
      //lw el value true w da eli rag3 mn el remove method bta3t el shared pref w da ma3naha eno successfully removed the data
      navigateToAndReplace(context, ShopLoginScreen());
    }
  });
}

void printFullText(String text) {
  final pattern = RegExp('.{1,800}');
  pattern.allMatches(text).forEach((match) => print(match.group(0)));
}

Widget makeGender(TextEditingController genderController) {
  return GenderPickerWithImage(
    showOtherGender: false,
    verticalAlignedText: false,
    selectedGender: Gender.Male,
    selectedGenderTextStyle:
        TextStyle(color: Color(0xFF8b32a8), fontWeight: FontWeight.bold),
    unSelectedGenderTextStyle:
        TextStyle(color: Colors.white, fontWeight: FontWeight.normal),
    onChanged: (Gender gender) {
      // print(gender.index);
      if (gender.index == 0) {
        genderController.text = 'Male';
      } else if (gender.index == 1) {
        genderController.text = 'Female';
      } else {
        genderController.text = 'Other';
      }
    },
    equallyAligned: false,
    animationDuration: Duration(milliseconds: 300),
    isCircular: true,
    // default : true,
    opacityOfGradient: 0.4,
    padding: const EdgeInsets.all(3),
    size: 50, //default : 40
  );
}
