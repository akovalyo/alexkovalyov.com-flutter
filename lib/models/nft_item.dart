class NftItem {
  final String? id;
  final String title;
  final String imageUrl;
  final String collection;
  final int tokenId;
  final int totalMinted;
  final String createdBy;
  final String? createdByUrl;
  final String description;
  final DateTime dateMinted;
  final DateTime dateAcquired;
  final String? tokenStandard;
  final String blockchain;
  final int? rarityRank;
  final String? rarity;
  final String? contractAddress;
  final String? tokenAddress;

  NftItem({
    this.id,
    required this.title,
    required this.imageUrl,
    required this.collection,
    required this.tokenId,
    required this.totalMinted,
    required this.createdBy,
    this.createdByUrl,
    required this.description,
    required this.dateMinted,
    required this.dateAcquired,
    required this.tokenStandard,
    required this.blockchain,
    this.rarityRank,
    required this.rarity,
    this.contractAddress,
    this.tokenAddress,
  });

  NftItem copyWith({
    String? id,
    String? title,
    String? imageUrl,
    String? collection,
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
  }) {
    return NftItem(
      id: id ?? this.id,
      title: title ?? this.title,
      imageUrl: imageUrl ?? this.imageUrl,
      collection: collection ?? this.collection,
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
    );
  }

  factory NftItem.fromData(Map<String, dynamic> data, String id) {
    // if (data == null) return null;
    return NftItem(
      id: id,
      title: data['title'] as String,
      imageUrl: data['imageUrl'] as String,
      collection: data['collection'] as String,
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
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'title': title,
      'imageUrl': imageUrl,
      'collection': collection,
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
    };
  }
}