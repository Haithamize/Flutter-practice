import 'package:flutter/material.dart';
import 'package:flutter_app/layout/shop_app/cubit/shop_cubit.dart';
import 'package:flutter_app/layout/shop_app/cubit/shop_states.dart';
import 'package:flutter_app/models/shop_app/shop_home_model.dart';
import 'package:flutter_app/shared/components/components.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_conditional_rendering/conditional.dart';

class ShopSearchScreen extends StatelessWidget {

  var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context,state){},
      builder: (context,state){

        var list = ShopCubit.get(context).listOfSearchedItems;

        return Scaffold(
                body: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: SafeArea(
                    child: Column(
                      children: [
                        buildDefaultTFF(
                        isPassword: false,
                        controller: searchController,
                        prefix: Icons.search,
                        labelText: 'Search',
                          onChange: (search){
                          ShopCubit.get(context).getSearchedDataFromApi(search);
                          }
                        ),
                        SizedBox(height: 10,),
                        if(state is ShopSearchLoadingState)
                          LinearProgressIndicator(),
                        if(state is ShopSearchSuccessState)
                        Expanded(
                          child: ListView.separated(
                              physics: BouncingScrollPhysics(),
                              itemBuilder: (context,index){
                                // shopSearchModel.docs[index]
                                return buildSearchItem(list[index],context, index);
                              },
                              separatorBuilder: (context,index){
                                return listViewSeparator();
                              },
                              itemCount: list.length
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
      },
    );
  }

  Widget buildSearchItem( Docs item,context, index){
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Row(
        children: [
          Image(
            image: NetworkImage('${item.images[0].url}'),
            height: 120,
            width: 120,
            fit: BoxFit.cover,
          ),
          SizedBox(width: 10,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '${item.name}',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 20,),
                Row(
                  children: [
                    Text(
                      '${item.price}',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                    SizedBox(width: 5,),
                    if(item.price != item.regularPrice)
                    Text(
                      '${item.regularPrice}',
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                        decoration: TextDecoration.lineThrough
                      ),
                    ),
                    Spacer(),
                    CircleAvatar(
                      child: IconButton(
                        icon: Icon(Icons.favorite_border_outlined),
                        iconSize: 20,
                        color: Colors.white,
                        onPressed: () {  },
                      ),
                      radius: 17,
                      backgroundColor: Colors.grey,
                    ),
                  ],
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }
}