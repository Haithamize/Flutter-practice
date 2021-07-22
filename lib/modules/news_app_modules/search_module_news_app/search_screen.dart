import 'package:flutter/material.dart';
import 'package:flutter_app/layout/news_app/cubit/news_cubit.dart';
import 'package:flutter_app/layout/news_app/cubit/news_states.dart';
import 'package:flutter_app/shared/components/components.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchScreen extends StatelessWidget {
  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {



    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state){},
      builder: (context, state){
        var list = NewsCubit.get(context).search;
        return SafeArea(
          child: Scaffold(
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    buildDefaultTFF(
                        type: TextInputType.text,
                        labelText: 'Search',
                        prefix: Icons.search,
                        controller: searchController,
                        isPassword: false,
                        onChange: (String value) {
                          NewsCubit.get(context).getSearch(value);
                        }),
                    SizedBox(height: 15,),
                    ListView.separated(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index){
                        return buildBusinessNewsItem(list[index], context);
                      },
                      separatorBuilder: (context, index) => listViewSeparator(),
                      itemCount: list.length,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
