import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:for_the_table/core/constants/assets.dart';
import 'package:swipe_cards/draggable_card.dart';
import 'package:swipe_cards/swipe_cards.dart';

class PostFeedPage extends ConsumerStatefulWidget {
  const PostFeedPage({super.key});

  @override
  ConsumerState<PostFeedPage> createState() => _PostFeedPageState();
}

class _PostFeedPageState extends ConsumerState<PostFeedPage> {
  final List<SwipeItem> _swipeItems = <SwipeItem>[];
  MatchEngine? _matchEngine;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  final List<String> _names = [
    "Post 1",
    "Post 2",
    "Post 3",
    "Post 4",
    "Post 5",
    "Post 6",
    "Post 7",
    "Post 8"
  ];

  @override
  void initState() {
    for (int i = 0; i < _names.length; i++) {
      _swipeItems.add(SwipeItem(
          content: Content(text: _names[i]),
          likeAction: () {
            // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            //   content: Text("Liked ${_names[i]}"),
            //   duration: const Duration(milliseconds: 500),
            // ));
          },
          nopeAction: () {
            // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            //   content: Text("Nope ${_names[i]}"),
            //   duration: const Duration(milliseconds: 500),
            // ));
          },
          superlikeAction: () {
            // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            //   content: Text("Superliked ${_names[i]}"),
            //   duration: const Duration(milliseconds: 500),
            // ));
          },
          onSlideUpdate: (SlideRegion? region) async {
            print("Region $region");
          }));
    }

    _matchEngine = MatchEngine(swipeItems: _swipeItems);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height - kToolbarHeight,
            child: SwipeCards(
              matchEngine: _matchEngine!,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  height: MediaQuery.of(context).size.height,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(Assets.photo),
                      fit: BoxFit.cover,
                    ),
                  ),
                  // child: Text(
                  //   _swipeItems[index].content.text,
                  //   style: const TextStyle(fontSize: 100),
                  // ),
                );
              },
              onStackFinished: () {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text("Stack Finished"),
                  duration: Duration(milliseconds: 500),
                ));
              },
              itemChanged: (SwipeItem item, int index) {
                print("item: ${item.content.text}, index: $index");
              },
              upSwipeAllowed: true,
              fillSpace: true,
            ),
          ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //   children: [
          //     ElevatedButton(
          //         onPressed: () {
          //           _matchEngine!.currentItem?.nope();
          //         },
          //         child: const Text("Nope")),
          //     ElevatedButton(
          //         onPressed: () {
          //           _matchEngine!.currentItem?.superLike();
          //         },
          //         child: const Text("Superlike")),
          //     ElevatedButton(
          //         onPressed: () {
          //           _matchEngine!.currentItem?.like();
          //         },
          //         child: const Text("Like"))
          //   ],
          // )
        ],
      ),
    );
  }
}

class Content {
  final String? text;

  Content({this.text});
}
