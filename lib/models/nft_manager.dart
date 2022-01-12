// import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

import 'nft_item.dart';

class NftManager with ChangeNotifier {
  final _nftItems = <NftItem>[];

  List<NftItem> get nftItems => List.unmodifiable(_nftItems);

  Future<void> load() async {
    final Query postsRef = FirebaseFirestore.instance.collection('nft');
    final QuerySnapshot snapshot =
        await postsRef.orderBy('dateAcquired', descending: true).get();
    snapshot.docs.forEach((e) {
      NftItem nft = NftItem.fromData(e.data() as Map<String, dynamic>, e.id);
      _nftItems.add(nft);
    });
    notifyListeners();
  }

  Future<void> addItem() async {}
}
