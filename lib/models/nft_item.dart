class NftItem {
  final String? id;
  final String title;
  final String imageUrl;
  final String collection;
  final String? collectionUrl;
  final int tokenId;
  final int totalMinted;
  final String createdBy;
  final String? createdByUrl;
  final String description;
  final DateTime dateMinted;
  final DateTime dateAcquired;
  final String? tokenStandard;
  final String blockchain;
  final int rarityRank;
  final String? rarity;
  final String? contractAddress;
  final String? tokenAddress;
  final bool videoMediaType;

  NftItem(
      {this.id,
      required this.title,
      required this.imageUrl,
      required this.collection,
      this.collectionUrl,
      required this.tokenId,
      required this.totalMinted,
      required this.createdBy,
      this.createdByUrl,
      required this.description,
      required this.dateMinted,
      required this.dateAcquired,
      this.tokenStandard,
      required this.blockchain,
      required this.rarityRank,
      this.rarity,
      this.contractAddress,
      this.tokenAddress,
      this.videoMediaType = false});

  NftItem copyWith({
    String? id,
    String? title,
    String? imageUrl,
    String? collection,
    String? collectionUrl,
    int? tokenId,
    int? totalMinted,
    String? createdBy,
    String? createdByUrl,
    String? description,
    DateTime? dateMinted,
    DateTime? dateAcquired,
    String? tokenStandard,
    String? blockchain,
    int? rarityRank,
    String? rarity,
    String? contractAddress,
    String? tokenAddress,
    bool? videoMediaType,
  }) {
    return NftItem(
      id: id ?? this.id,
      title: title ?? this.title,
      imageUrl: imageUrl ?? this.imageUrl,
      collection: collection ?? this.collection,
      collectionUrl: collectionUrl ?? this.collectionUrl,
      tokenId: tokenId ?? this.tokenId,
      totalMinted: totalMinted ?? this.totalMinted,
      createdBy: createdBy ?? this.createdBy,
      createdByUrl: createdByUrl ?? this.createdByUrl,
      description: description ?? this.description,
      dateMinted: dateMinted ?? this.dateMinted,
      dateAcquired: dateAcquired ?? this.dateAcquired,
      tokenStandard: tokenStandard ?? this.tokenStandard,
      blockchain: blockchain ?? this.blockchain,
      rarityRank: rarityRank ?? this.rarityRank,
      rarity: rarity ?? this.rarity,
      contractAddress: contractAddress ?? this.contractAddress,
      tokenAddress: tokenAddress ?? this.tokenAddress,
      videoMediaType: videoMediaType ?? this.videoMediaType,
    );
  }

  factory NftItem.fromData(Map<String, dynamic> data, String id) {
    // if (data == null) return null;
    return NftItem(
      id: id,
      title: data['title'] as String,
      imageUrl: data['imageUrl'] as String,
      collection: data['collection'] as String,
      collectionUrl: data['collectionUrl'] == null
          ? null
          : data['collectionUrl'] as String,
      tokenId: data['tokenId'] as int,
      totalMinted: data['totalMinted'] as int,
      createdBy: data['createdBy'] as String,
      createdByUrl: data['createdByUrl'] == null ? null : data['createdByUrl'],
      description: data['description'] as String,
      dateMinted: DateTime.parse(data['dateMinted'] as String),
      dateAcquired: DateTime.parse(data['dateAcquired'] as String),
      tokenStandard: data['tokenStandard'],
      blockchain: data['blockchain'] as String,
      rarityRank: data['rarityRank'] as int,
      rarity: data['rarity'] as String,
      contractAddress: data['contractAddress'] as String,
      tokenAddress: data['tokenAddress'] as String,
      videoMediaType: data['videoMediaType'] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'title': title,
      'imageUrl': imageUrl,
      'collection': collection,
      'collectionUrl': collectionUrl,
      'tokenId': tokenId,
      'totalMinted': totalMinted,
      'createdBy': createdBy,
      'createdByUrl': createdByUrl,
      'description': description,
      'dateMinted': dateMinted.toIso8601String(),
      'dateAcquired': dateAcquired.toIso8601String(),
      'tokenStandard': tokenStandard,
      'blockchain': blockchain,
      'rarityRank': rarityRank,
      'rarity': rarity,
      'contractAddress': contractAddress,
      'tokenAddress': tokenAddress,
      'videoMediaType': videoMediaType,
    };
  }

  dynamic getValueByStringProperty(String property) {
    final dynamic value = this.toJson()[property];

    switch (property) {
      case 'dateMinted':
      case 'dateAcquired':
        {
          return DateTime.parse(value);
        }
      default:
        {
          return value;
        }
    }
  }
}
