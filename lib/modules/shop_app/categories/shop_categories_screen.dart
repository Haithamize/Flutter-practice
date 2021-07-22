import 'package:flutter/material.dart';
import 'package:flutter_app/layout/shop_app/cubit/shop_cubit.dart';
import 'package:flutter_app/layout/shop_app/cubit/shop_states.dart';
import 'package:flutter_app/models/shop_app/shop_categories_model.dart';
import 'package:flutter_app/shared/components/components.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShopCategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return ListView.separated(
            physics: BouncingScrollPhysics(),
              itemBuilder: (context, index){
                return buildCategoryItem(ShopCubit.get(context).shopCategoriesModel.categories[index], index, ShopCubit.get(context).shopCategoriesModel.categories[index].image[0]);
              },
              separatorBuilder: (context, index){
                return listViewSeparator();
              },
              itemCount: 6);
        });
  }

  Widget buildCategoryItem(Categories category, index, ImageModel image) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Row(
        children: [
          Image(
            image: NetworkImage(
                '${index == 0 || image == null? 'https://wp-dev.zumrafood.com/wp-content/uploads/2021/04/White-basmati-with-mushroom-oyster-sauce-1.jpg' : image.url}'),
            width: 100,
            height: 100,
            fit: BoxFit.cover,
          ),
          SizedBox(
            width: 15,
          ),
          Container(
            width: 180,
            child: Text(
              '${category.name}',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
          Spacer(),
          Icon(
            Icons.arrow_forward_ios,
          ),
        ],
      ),
    );
  }
}
