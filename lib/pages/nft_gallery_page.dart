import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

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

class NftGalleryPage extends StatefulWidget {
  const NftGalleryPage({Key? key}) : super(key: key);

  @override
  State<NftGalleryPage> createState() => _NftGalleryPageState();
}

class _NftGalleryPageState extends State<NftGalleryPage> {
  var nftItems = <NftItem>[];
  bool isLoading = false;

  void loadNfts() async {
    setState(() {
      isLoading = true;
    });

    nftItems.clear();
    final Query postsRef = FirebaseFirestore.instance.collection('nft');
    final QuerySnapshot snapshot =
        await postsRef.orderBy('dateAcquired', descending: true).get();

    setState(() {
      snapshot.docs.forEach((e) {
        NftItem nft = NftItem.fromData(e.data() as Map<String, dynamic>, e.id);
        nftItems.add(nft);
      });

      isLoading = false;
    });
  }

  void saveNft(NftItem item) async {
    if (item.id != null) {
      await FirebaseFirestore.instance
          .collection('nft')
          .doc(item.id)
          .update(item.toJson());
    } else {
      await FirebaseFirestore.instance.collection('nft').add(item.toJson());
    }
  }

  void deleteNft(NftItem item) async {
    await FirebaseFirestore.instance.collection('nft').doc(item.id).delete();
  }

  void openNftItemEditScreen(NftItem? item) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => NftItemEditScreen(
            originalItem: item,
            onCreate: (item) {
              saveNft(item);
              loadNfts();
              Navigator.pop(context);
            },
            onUpdate: (item) {
              saveNft(item);
              loadNfts();
              Navigator.pop(context);
            },
            onDelete: (item) {
              deleteNft(item);
              loadNfts();
              Navigator.pop(context);
            }),
      ),
    );
  }

  @override
  void initState() {
    loadNfts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    final AppState _appState = Provider.of<AppState>(context, listen: false);
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
          // SliverPersistentHeader(
          //   delegate: NftGalleryHeader(),
          //   pinned: true,
          //   floating: false,
          // ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
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
            sliver: SliverGrid(
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                mainAxisExtent: _appState.isLoggedIn ? 410 : 380,
                maxCrossAxisExtent: 380,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
              ),
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return NftItemTile(
                    width: 300,
                    height: 430,
                    item: nftItems[index],
                    onPressedEditButton: () {
                      openNftItemEditScreen(nftItems[index]);
                    },
                  );
                },
                childCount: nftItems.length,
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
