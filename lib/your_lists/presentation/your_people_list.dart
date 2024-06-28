import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:for_the_table/widgets/custom_search_field.dart';
import '../../core/constants/assets.dart';
import '../../core/styles/app_colors.dart';
import '../../core/styles/app_text_styles.dart';
import '../../widgets/app_button.dart';
import '../shared/provider.dart';
import 'widgets/custom_widgets.dart';

@RoutePage()
class YourPeopleListPage extends ConsumerStatefulWidget{
  const YourPeopleListPage({super.key});

  @override
  ConsumerState<YourPeopleListPage> createState() => _YourPeopleListPageState();
}

class _YourPeopleListPageState extends ConsumerState<YourPeopleListPage> {

  @override
  Widget build(BuildContext context) {
    final _selectedIndex = ref.watch(YourPeopleNotifierProvider).selectedIndex;
    final stateNotifier = ref.read(YourPeopleNotifierProvider.notifier);

    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: false,
      appBar: AppBar(
        elevation: 0,
        centerTitle: false,
        automaticallyImplyLeading: false,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Container(
            alignment: Alignment.center,
            margin:
            const EdgeInsets.only(top: 10, left: 20, right: 0, bottom: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColors.colorPrimary.withOpacity(0.20),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                5.horizontalSpace, //this is for centering the icon
                Icon(Icons.arrow_back_ios,
                    color: AppColors.colorPrimary, size: 15.h),
              ],
            ),
          ),
        ),
        title: Text(
          'Your Follow List',
          style: AppTextStyles.textStylePoppinsBold.copyWith(
            color: AppColors.colorPrimary,
            fontSize: 16.sp,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
                                          stateNotifier.updateSelectedIndex(index);
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




