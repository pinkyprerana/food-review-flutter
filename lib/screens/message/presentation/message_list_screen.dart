import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:for_the_table/widgets/custom_search_field.dart';
import '../../../core/constants/assets.dart';
import '../../../core/routes/app_router.dart';
import '../../../core/styles/app_colors.dart';
import '../../../core/styles/app_text_styles.dart';

@RoutePage()
class MessageListScreen extends ConsumerStatefulWidget {
  const MessageListScreen({super.key});

  @override
  ConsumerState<MessageListScreen> createState() => _MessageListScreenState();
}

class _MessageListScreenState extends ConsumerState<MessageListScreen> {

  String generateChatId(String userId1, String userId2) {
    return userId1.compareTo(userId2) < 0 ? '$userId1\_$userId2' : '$userId2\_$userId1';
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: false,
        automaticallyImplyLeading: false,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: 10.h, left: 20.w, right: 0, bottom: 10.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColors.colorPrimary.withOpacity(0.20),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                5.horizontalSpace,
                Icon(Icons.arrow_back_ios, color: AppColors.colorPrimary, size: 15.h),
              ],
            ),
          ),
        ),
        title: Text(
          'Messages',
          style: AppTextStyles.textStylePoppinsBold.copyWith(
            color: AppColors.colorPrimary,
            fontSize: 16.sp,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           16.verticalSpace,
            const CustomSearchField(),
            20.verticalSpace,
            Text(
              'Message List',
              style: AppTextStyles.textStylePoppinsMedium.copyWith(
                color: AppColors.colorPrimary,
                fontSize: 13.sp,
              ),
            ),
            4.verticalSpace,
            Text(
              '05 Connections',
              style: AppTextStyles.textStylePoppinsRegular.copyWith(
                color: AppColors.colorPrimaryAlpha,
                fontSize: 10.sp,
              ),
            ),
            10.verticalSpace,
            // Message List
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return ListTile(
                    contentPadding: EdgeInsets.symmetric(vertical: 1.h),
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: SizedBox(
                        width: 45.w,
                        height: 45.h,
                        child: CachedNetworkImage(
                          imageUrl: Assets.avatar,
                          placeholder: (context, url) => const CircularProgressIndicator(color: AppColors.colorPrimary),
                          errorWidget: (context, url, error) => ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              Assets.profileImage,
                              fit: BoxFit.cover,
                            ),
                          ),
                          imageBuilder: (context, imageProvider) => Container(
                            width: 45.w,
                            height: 45.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              image: DecorationImage(
                                image: imageProvider,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    title: Text(
                      'User Name $index',
                      style: AppTextStyles.textStylePoppinsMedium.copyWith(
                        color: AppColors.colorPrimary,
                        fontSize: 13.sp,
                      ),
                    ),
                    subtitle: Text(
                      'Lorem ipsum dolor sit amet consectetur.',
                      style: AppTextStyles.textStylePoppinsRegular.copyWith(
                        color: AppColors.colorPrimaryAlpha,
                        fontSize: 10.sp,
                      ),
                      maxLines: 1,
                    ),
                    trailing: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Feb 28, 2024',
                          style: AppTextStyles.textStylePoppinsRegular.copyWith(
                            fontSize: 10.sp,
                            color: AppColors.colorText3,
                          ),
                        ),
                        4.verticalSpace,
                        Container(
                          width: 16.w, //messageCount > 10 ? 20.w : 16.w,
                          height: 16.h,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.black,
                          ),
                          child: Center(
                            child: Text(
                              '10+', //messageCount > 10 ? '10+' : messageCount.toString(),
                              style: AppTextStyles.textStylePoppinsRegular.copyWith(
                                color: AppColors.colorWhite,
                                fontSize: 8.sp,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    onTap: () {
                      // final chatId = generateChatId(AppPreferenceKeys.userId, user);
                      AutoRouter.of(context).push( DirectMessageRoute(chatId: '', peopleId: ''));
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
