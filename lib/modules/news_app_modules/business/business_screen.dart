import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/layout/news_app/cubit/news_cubit.dart';
import 'package:flutter_app/layout/news_app/cubit/news_states.dart';
import 'package:flutter_app/shared/components/components.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/flutter_conditional_rendering.dart';

class BusinessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = NewsCubit.get(context).business;
        return Conditional.single(
          context: context,
          conditionBuilder: (context) {
            return state is! NewsGetBusinessLoadingState;
          },
          //da condition 3mlo 3shan lw ana msh f el loading state e3ml el ui w yezher el progress bar lw hwa loading
          widgetBuilder: (context) {

            return ListView.separated(
              physics: BouncingScrollPhysics(), //de bt5leni lma a3ml swipe fo2 l8ayt el akher el list tnzl le t7t akni b3ml refresh fl instagram
                itemBuilder: (context, index) {
                  return buildBusinessNewsItem(list[index],context);
                },
                separatorBuilder: (context, index) {
                  return listViewSeparator();
                },
                itemCount: list.length);
          },
          fallbackBuilder: (BuildContext context) {
            return Center(child: CircularProgressIndicator());
          },
        );
      },
    );
  }
}
