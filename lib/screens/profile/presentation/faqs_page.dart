import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:for_the_table/core/styles/app_colors.dart';
import 'package:for_the_table/core/styles/app_text_styles.dart';
import 'package:for_the_table/screens/profile/presentation/widgets/faq_option.dart';
import 'package:for_the_table/screens/profile/shared/providers.dart';
import 'package:for_the_table/widgets/custom_search_field.dart';

import '../../../core/utils/app_log.dart';

@RoutePage()
class FaqsPage extends ConsumerStatefulWidget {
  const FaqsPage({super.key});

  @override
  ConsumerState<FaqsPage> createState() => _FaqsPageState();
}

class _FaqsPageState extends ConsumerState<FaqsPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await ref.read(profileNotifierProvider.notifier).getFAQList();
    });
  }


  @override
  Widget build(BuildContext context) {
    final profileState = ref.watch(profileNotifierProvider);
    final profileNotifier = ref.watch(profileNotifierProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: false,
        // leadingWidth: 60,
        automaticallyImplyLeading: false,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.only(top: 10, left: 20, right: 0, bottom: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColors.colorPrimary.withOpacity(0.20),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                5.horizontalSpace, //this is for centering the icon
                Icon(Icons.arrow_back_ios, color: AppColors.colorPrimary, size: 15.h),
              ],
            ),
          ),
        ),
        title: Text(
          'FAQs',
          style: AppTextStyles.textStylePoppinsBold.copyWith(
            color: AppColors.colorPrimary,
            fontSize: 16.sp,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0).r,
          child: Column(
            children: [
               CustomSearchField(
                controller: profileNotifier.searchController,
                 onChanged: (_)=> profileNotifier.searchFAQ(),
              ),
              20.verticalSpace,
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: profileState.faqList?.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(bottom: 10.0.h),
                    child: FaqOption(
                      faqId: profileState.faqList?[index].id,
                      question: profileState.faqList?[index].question,
                      answer: profileState.faqList?[index].answer,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
