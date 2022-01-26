import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mysite/navigation/routes.dart';
import 'package:provider/provider.dart';
import 'dart:async';

import '../models/nft_item.dart';
import '../page_elements/drawer.dart';
import '../page_elements/ak_app_bar.dart';
import '../consts/consts.dart';
import '../helpers/screen_helper.dart';
import '../models/app_state.dart';
import 'nft_item_edit_screen.dart';
import '../widgets/nft_item_tile.dart';
import '../page_elements/footer.dart';
import '../widgets/nft_gallery_header.dart';
import '../models/nft_collection.dart';
import '../widgets/hover_link.dart';
import '../widgets/nft_filter_field.dart';

class NftGalleryPage extends StatefulWidget {
  const NftGalleryPage({Key? key}) : super(key: key);

  @override
  State<NftGalleryPage> createState() => _NftGalleryPageState();
}

class _NftGalleryPageState extends State<NftGalleryPage> {
  late NftCollection collection;

  void openNftItemEditScreen(NftItem? item) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => NftItemEditScreen(
            originalItem: item,
            onSave: (item) {
              collection.saveItem(item);
              collection.load();
              Navigator.pop(context);
            },
            onDelete: (item) {
              collection.deleteItem(item);
              collection.load();
              Navigator.pop(context);
            }),
      ),
    );
  }

  // Widget buildFilterField(String title,) {

  // }

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    final AppState _appState = context.watch<AppState>();
    collection = context.watch<NftCollection>();
    collection.load(true);
    return Scaffold(
      floatingActionButton: _appState.isLoggedIn
          ? FloatingActionButton(
              child: const Icon(Icons.add),
              onPressed: () {
                openNftItemEditScreen(null);
              },
            )
          : null,
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: PreferredSize(
        preferredSize: Size(_screenSize.width, appBarHeight),
        child: AkAppBar(),
      ),
      drawer: AkDrawer(),
      body: CustomScrollView(
        slivers: [
          // Header with filters
          SliverAppBar(
            pinned: true,
            backgroundColor: Theme.of(context).backgroundColor,
            automaticallyImplyLeading: false,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                NftFilterField(
                  title: 'Collection',
                  currentChoice: collection.currentFilterCollectionTitle,
                  choices: collection.titles,
                  onSelected: (String value) {
                    print(value);

                    collection.filterCollection(value);
                  },
                ),

                Text(
                  collection.itemsToShow.length.toString(),
                  style:
                      TextStyle(color: Theme.of(context).secondaryHeaderColor),
                ),
                // Text(
                //   'Filter by: Date Acquired',
                //   overflow: TextOverflow.fade,
                //   softWrap: false,
                //   style: TextStyle(color: Colors.black),
                // ),
              ],
            ),
          ),
          // SliverPersistentHeader(
          //   delegate: NftGalleryHeader(
          //       totalItems: collection.itemsToShow.length,
          //       collections: collection.titles),
          //   pinned: true,
          //   floating: false,
          // ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Center(
                  child: Text(
                'Nft Gallery',
                style: Theme.of(context).textTheme.headline3,
              )),
            ),
          ),

          // Nft tiles list
          SliverPadding(
            padding: EdgeInsets.symmetric(
                horizontal: ScreenHelper.isSmallScreen(context)
                    ? paddingSmall
                    : paddingLarge),
            sliver: collection.isLoading == true
                ? SliverToBoxAdapter(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  )
                : SliverGrid(
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      mainAxisExtent: _appState.isLoggedIn ? 420 : 390,
                      maxCrossAxisExtent: 380,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                    ),
                    delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                        return NftItemTile(
                          width: 300,
                          height: _appState.isLoggedIn ? 420 : 380,
                          item: collection.itemsToShow[index],
                          onPressedEditButton: () {
                            openNftItemEditScreen(
                                collection.itemsToShow[index]);
                          },
                        );
                      },
                      childCount: collection.itemsToShow.length,
                    ),
                  ),
          ),

          SliverFillRemaining(),

          // Footer
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Footer(),
            ),
          ),
        ],
      ),
    );
  }
}
