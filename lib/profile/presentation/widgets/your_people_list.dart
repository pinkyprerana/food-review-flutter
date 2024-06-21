import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:for_the_table/widgets/custom_search_field.dart';
import '../../../core/constants/assets.dart';
import '../../../core/styles/app_colors.dart';
import '../../../core/styles/app_text_styles.dart';
import '../../../widgets/app_button.dart';
import 'custom_widgets.dart';

@RoutePage()
class FollowListPage extends ConsumerStatefulWidget{
  const FollowListPage({super.key});

  @override
  ConsumerState<FollowListPage> createState() => _FollowListPageState();
}

class _FollowListPageState extends ConsumerState<FollowListPage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: false,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                IconButton(
                  icon: Image.asset(
                    Assets.backArrowButton,
                    scale: 1.5,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                5.horizontalSpace,
                Text(
                  'Your Follow List',
                  style: AppTextStyles.textStylePoppinsSemiBold.copyWith(
                    fontSize: 15.sp,
                    color: AppColors.colorBlack,
                  ),
                ),
              ],
            ),
            const CustomSearchField(
              hint: 'Search',
            ),
            16.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: List.generate(
                3,
                    (index) => Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: FilterButton(
                                        text: index == 0 ? 'Followers' : index == 1 ? 'Following' : 'Requests',
                                        isSelected: _selectedIndex == index,
                                        onPressed: () {
                                        setState(() {
                                          _selectedIndex = index;
                                        });
                                        },
                                      ),
                    ),
              ).toList(),
            ),
            16.verticalSpace,
            Expanded(
              child: _selectedIndex == 0
                  ? _FollowersList()
                  : (_selectedIndex == 1 ? _FollowingList() : _RequestsList()),
            ),
          ],
        ),
      ),
    );
  }


Widget _FollowersList(){
    return Container(
      height: 500,
      child: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Text('Followers List',
              style: AppTextStyles.textStylePoppinsMedium.copyWith(
                fontSize: 13.sp,
                color: AppColors.colorBlack,
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              itemCount: followers.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 3 / 4,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemBuilder: (context, index) {
                return CustomCard(
                    name: followers[index]['name'].toString(),
                    date: followers[index]['date'].toString(),
                    imagePath: followers[index]['image'].toString(),
                  button: AppButton(
                    height: 30,
                    width: 80,
                    text: "Follow",
                    onPressed: (){},
                    color: AppColors.colorCommentBoxBorder,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

Widget _FollowingList(){
  return Container(
    height: 500,
    child: Column(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Text('List of Your Following',
            style: AppTextStyles.textStylePoppinsMedium.copyWith(
              fontSize: 13.sp,
              color: AppColors.colorBlack,
            ),
          ),
        ),
        Expanded(
          child: GridView.builder(
            itemCount: followers.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 3 / 4,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
            ),
            itemBuilder: (context, index) {
              return CustomCard(
                name: following[index]['name'].toString(),
                date: following[index]['date'].toString(),
                imagePath: following[index]['image'].toString(),
                button: AppButton(
                  height: 30,
                  width: 100,
                  text: "Unfollow",
                  onPressed: (){},
                  color: AppColors.colorCommentBoxBorder,
                ),
              );
            },
          ),
        ),
      ],
    ),
  );
}

Widget _RequestsList(){
  return Container(
    height: 500,
    child: Column(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Text('Pending Requests',
            style: AppTextStyles.textStylePoppinsMedium.copyWith(
              fontSize: 13.sp,
              color: AppColors.colorBlack,
            ),
          ),
        ),
        Expanded(
          child: GridView.builder(
            itemCount: followers.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 3 / 4,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
            ),
            itemBuilder: (context, index) {
              return CustomCard(
                name: requests[index]['name'].toString(),
                date: requests[index]['date'].toString(),
                imagePath: requests[index]['image'].toString(),
                button: AppButton(
                  height: 30,
                  width: 150,
                  text: "Accept Request",
                  onPressed: (){},
                  color: AppColors.colorCommentBoxBorder,
                ),
              );
            },
          ),
        ),
      ],
    ),
  );
}
}


final List<Map<String, String>> followers = [
  {'name': 'Hanna Philips', 'date': 'Joined May 5, 2018', 'image': Assets.woman},
  {'name': 'Omar Hewitz', 'date': 'Joined May 5, 2018', 'image': Assets.man},
  {'name': 'Mira Saris', 'date': 'Joined May 5, 2018', 'image': Assets.woman},
  {'name': 'Lincoln Philips', 'date': 'Joined May 5, 2018', 'image': Assets.woman},
  {'name': 'Person 5', 'date': 'Joined May 5, 2018', 'image': Assets.man},
  {'name': 'Person 6', 'date': 'Joined May 5, 2018', 'image': Assets.man},
];

final List<Map<String, String>> following = [
  {'name': 'Hanna Philips', 'date': 'Joined May 5, 2018', 'image': Assets.profileImage},
  {'name': 'Omar Hewitz', 'date': 'Joined May 5, 2018', 'image': Assets.man},
  {'name': 'Mira Saris', 'date': 'Joined May 5, 2018', 'image': Assets.woman},
  {'name': 'Lincoln Philips', 'date': 'Joined May 5, 2018', 'image': Assets.woman},
  {'name': 'Person 5', 'date': 'Joined May 5, 2018', 'image': Assets.profileImage},
  {'name': 'Person 6', 'date': 'Joined May 5, 2018', 'image': Assets.man},
];

final List<Map<String, String>> requests = [
  {'name': 'Hanna Philips', 'date': 'Joined May 5, 2018', 'image': Assets.woman},
  {'name': 'Omar Hewitz', 'date': 'Joined May 5, 2018', 'image': Assets.profileImage},
  {'name': 'Mira Saris', 'date': 'Joined May 5, 2018', 'image': Assets.woman},
  {'name': 'Lincoln Philips', 'date': 'Joined May 5, 2018', 'image': Assets.man},
  {'name': 'Person 5', 'date': 'Joined May 5, 2018', 'image': Assets.man},
  {'name': 'Person 6', 'date': 'Joined May 5, 2018', 'image': Assets.profileImage},
];





