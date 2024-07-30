import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:for_the_table/core/constants/assets.dart';
import 'package:for_the_table/core/routes/app_router.dart';
import 'package:for_the_table/core/styles/app_colors.dart';
import 'package:permission_handler/permission_handler.dart';
import '../shared/providers.dart';
import 'bottom_item.dart';

class BottomNavigation extends ConsumerStatefulWidget {
  const BottomNavigation({super.key});
  @override
  ConsumerState<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends ConsumerState<BottomNavigation> {
  Future<void> _checkPermissions({required VoidCallback onSuccess}) async {
    final cameraStatus = await Permission.camera.request();

    if (cameraStatus.isGranted) {
      onSuccess();
    } else {
      _showPermissionDialog();
    }
  }

  void _showPermissionDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Camera Permission'),
        content: const Text(
          'Camera and files access are required to use this feature. Please enable them in the app settings.',
        ),
        actions: [
          TextButton(
            onPressed: () async {
              Navigator.of(context).pop();
              await openAppSettings();
            },
            child: const Text('Open Settings'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(baseNotifierProvider);
    final stateNotifier = ref.watch(baseNotifierProvider.notifier);

    final Size size = MediaQuery.of(context).size;

    List<Map> bottomItems = [
      {'icon': Assets.homeInactive, 'active': Assets.home, 'name': 'Home'},
      {'icon': Assets.listInactive, 'active': Assets.listActive, 'name': 'List'},
      {'icon': Assets.post, 'active': Assets.post, 'name': 'Post'},
      {'icon': Assets.leaderboardInactive, 'active': Assets.leaderboardActive, 'name': 'Standings'},
      {'icon': Assets.profileInactive, 'active': Assets.profileActive, 'name': 'Profile'},
    ];


    return SizedBox(
      width: size.width,
      height: 80,
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: AppColors.colorWhite,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
              boxShadow: [
                BoxShadow(
                    color: AppColors.colorBlack.withOpacity(0.15),
                    blurRadius: 54,
                    spreadRadius: 0,
                    offset: const Offset(0, -1)),
              ],
            ),
          ),

          Center(
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(
                    5,
                    (index) => GestureDetector(
                        onTap: () {
                          FocusScope.of(context).unfocus();
                          if (index == 1) {
                            stateNotifier.tapBottomNavIndex(index);
                          }
                          if (index == 2) {
                            _checkPermissions(onSuccess: () {
                              if (!mounted) return;

                              AutoRouter.of(context).push(const PhotoClickRoute());
                            });
                          } else {
                            stateNotifier.tapBottomNavIndex(index);
                          }
                        },
                        child: BottomItem(
                          icon: state.bottomNavIndex == index
                              ? bottomItems[index]['active']
                              : bottomItems[index]['icon'],
                          text: '',
                          active: state.bottomNavIndex == index,
                        )))),
          ),
        ],
      ),
    );

  }
}
