import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

import '../models/nft_item.dart';
import '../page_elements/drawer.dart';
import '../page_elements/ak_app_bar.dart';
import '../consts/consts.dart';
import '../models/app_state.dart';
import 'nft_item_edit_screen.dart';
import '../widgets/nft_item_tile.dart';

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

  void saveNft(NftItem nftItem) async {
    await FirebaseFirestore.instance.collection('nft').add(nftItem.toJson());
  }

  @override
  void initState() {
    loadNfts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    final AppState appState = Provider.of<AppState>(context, listen: false);
    return Scaffold(
      floatingActionButton: appState.isLoggedIn
          ? FloatingActionButton(
              child: const Icon(Icons.add),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => NftItemEditScreen(
                              onCreate: (item) {
                                saveNft(item);
                                loadNfts();
                                Navigator.pop(context);
                              },
                              onUpdate: (item) {
                                saveNft(item);
                                loadNfts();
                              },
                            )));
              })
          : null,
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: PreferredSize(
        preferredSize: Size(_screenSize.width, appBarHeight),
        child: AkAppBar(),
      ),
      drawer: AkDrawer(),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Wrap(
                children: nftItems.map((e) {
                  return NftItemTile(item: e);
                }).toList(),
              ),
            ),
    );
  }
}
