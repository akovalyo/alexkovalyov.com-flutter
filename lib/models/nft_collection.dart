import 'package:flutter/foundation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../helpers/nft_helper.dart';
import 'nft_item.dart';

class NftCollection with ChangeNotifier {
  List<NftItem> _allItems = [];
  List<NftItem> _itemsToShow = [];
  List<String> _titles = [];
  String currentFilterCollectionTitle = 'All';
  String currentSortType = NftSortTypes.dateNewest;
  bool isLoading = true;

  List<NftItem> get itemsToShow => _itemsToShow;
  List<String> get titles => _titles;

  void switchStatus() {
    isLoading = !isLoading;
    notifyListeners();
  }

  Future<void> loadNftItemsFromFirestore() async {
    _allItems.clear();
    _itemsToShow.clear();

    final Query postsRef = FirebaseFirestore.instance.collection('nft');
    final QuerySnapshot snapshot = await postsRef.get();
    snapshot.docs.forEach((e) {
      NftItem nft = NftItem.fromData(e.data() as Map<String, dynamic>, e.id);
      _allItems.add(nft);
    });

    sortCollection(currentSortType);
    _titles = getCollectionNames();
    filterCollection(
      currentFilterCollectionTitle,
      force: true,
    );
  }

  Future<void> load([bool initialLoad = false]) async {
    if (initialLoad && _allItems.isNotEmpty) {
      return;
    }
    if (!initialLoad) {
      switchStatus();
    }
    await loadNftItemsFromFirestore();

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

    await loadNftItemsFromFirestore();

    switchStatus();
  }

  Future<void> deleteItem(NftItem item) async {
    switchStatus();
    await FirebaseFirestore.instance.collection('nft').doc(item.id).delete();
    await loadNftItemsFromFirestore();
    switchStatus();
  }

  void filterCollection(String collectionName, {bool force = false}) {
    if (currentFilterCollectionTitle == collectionName && !force) return;
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
    sortCollection(currentSortType);
    switchStatus();
  }

  void sortCollection(String type) {
    // if (type == currentSortType) return;

    switchStatus();

    final List<NftItem> itemsWithoutValue = [];
    List<NftItem> itemsWithValue = [];
    final String property = NftSortTypes.getProperty(type);

    _itemsToShow.forEach((element) {
      final elementValue = element.getValueByStringProperty(property);

      if (elementValue != null) {
        if ((elementValue is int && elementValue > 0) ||
            (elementValue is String && elementValue != '') ||
            elementValue is DateTime) {
          itemsWithValue.add(element);
        } else {
          itemsWithoutValue.add(element);
        }
      }
    });

    switch (type) {
      case NftSortTypes.rarityRank:
        {
          itemsWithValue.sort((a, b) => a.rarityRank.compareTo(b.rarityRank));
          break;
        }
      case NftSortTypes.dateNewest:
      case NftSortTypes.dateOldest:
        {
          itemsWithValue
              .sort((a, b) => a.dateAcquired.compareTo(b.dateAcquired));
          if (type == NftSortTypes.dateNewest) {
            itemsWithValue = itemsWithValue.reversed.toList();
          }
          break;
        }
      case NftSortTypes.mintedNewest:
      case NftSortTypes.mintedOldest:
        {
          itemsWithValue.sort((a, b) => a.dateMinted.compareTo(b.dateMinted));
          if (type == NftSortTypes.mintedNewest) {
            itemsWithValue = itemsWithValue.reversed.toList();
          }
          break;
        }
      case NftSortTypes.name:
        {
          itemsWithValue.sort((a, b) => a.title.compareTo(b.title));
          break;
        }

      case NftSortTypes.collection:
        {
          itemsWithValue.sort((a, b) => a.collection.compareTo(b.collection));
          break;
        }
      case NftSortTypes.tokenIdHighest:
      case NftSortTypes.tokenIdLowest:
        {
          itemsWithValue.sort((a, b) => a.tokenId.compareTo(b.tokenId));
          if (type == NftSortTypes.tokenIdHighest) {
            itemsWithValue = itemsWithValue.reversed.toList();
          }
          break;
        }

      case NftSortTypes.createdBy:
        {
          itemsWithValue.sort((a, b) => a.createdBy.compareTo(b.createdBy));
          break;
        }

      case NftSortTypes.blockchain:
        {
          itemsWithValue.sort((a, b) => a.blockchain.compareTo(b.blockchain));
          break;
        }
    }

    _itemsToShow = [...itemsWithValue, ...itemsWithoutValue];
    currentSortType = type;
    switchStatus();
  }
}
