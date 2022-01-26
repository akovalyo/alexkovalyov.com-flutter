import 'package:flutter/foundation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'nft_item.dart';

class NftCollection with ChangeNotifier {
  List<NftItem> _allItems = [];
  List<NftItem> _itemsToShow = [];
  List<String> _titles = [];
  String currentFilterCollectionTitle = 'All';
  bool isLoading = true;

  List<NftItem> get itemsToShow => _itemsToShow;
  List<String> get titles => _titles;

  void switchStatus() {
    isLoading = !isLoading;
    notifyListeners();
  }

  Future<void> load([bool initialLoad = false]) async {
    if (initialLoad && _allItems.isNotEmpty) {
      return;
    }
    if (!initialLoad) {
      switchStatus();
    }

    _allItems.clear();
    _itemsToShow.clear();
    final Query postsRef = FirebaseFirestore.instance.collection('nft');
    final QuerySnapshot snapshot =
        await postsRef.orderBy('dateAcquired', descending: true).get();

    snapshot.docs.forEach((e) {
      NftItem nft = NftItem.fromData(e.data() as Map<String, dynamic>, e.id);
      _allItems.add(nft);
    });
    _itemsToShow = [..._allItems];
    _titles = getCollectionNames();
    switchStatus();
  }

  List<String> getCollectionNames() {
    Set<String> collections = Set();
    _allItems.forEach((e) {
      collections.add(e.collection);
    });

    return ['All', ...collections.toList()];
  }

  Future<void> saveItem(NftItem item) async {
    switchStatus();
    if (item.id != null) {
      await FirebaseFirestore.instance
          .collection('nft')
          .doc(item.id)
          .update(item.toJson());
    } else {
      await FirebaseFirestore.instance.collection('nft').add(item.toJson());
    }
    switchStatus();
  }

  Future<void> deleteItem(NftItem item) async {
    switchStatus();
    await FirebaseFirestore.instance.collection('nft').doc(item.id).delete();
    switchStatus();
  }

  void filterCollection(String collectionName) {
    if (currentFilterCollectionTitle == collectionName) return;
    switchStatus();
    _itemsToShow.clear();
    if (collectionName == 'All') {
      _itemsToShow = List.from(_allItems);
    } else {
      _allItems.forEach((element) {
        if (element.collection == collectionName) {
          _itemsToShow.add(element);
        }
      });
    }
    currentFilterCollectionTitle = collectionName;
    switchStatus();
  }
}
