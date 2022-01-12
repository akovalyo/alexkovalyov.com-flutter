class NftItem {
  final String? id;
  final String title;
  final String imageUrl;
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

  NftItem({
    this.id,
    required this.title,
    required this.imageUrl,
    required this.tokenId,
    required this.totalMinted,
    required this.createdBy,
    this.createdByUrl,
    required this.description,
    required this.dateMinted,
    required this.dateAcquired,
    required this.tokenStandard,
    required this.blockchain,
    required this.rarityRank,
  });

  NftItem copyWith({
    String? id,
    String? title,
    String? imageUrl,
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
  }) {
    return NftItem(
      id: id ?? this.id,
      title: title ?? this.title,
      imageUrl: imageUrl ?? this.imageUrl,
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
    );
  }

  factory NftItem.fromData(Map<String, dynamic> data, String id) {
    // if (data == null) return null;
    return NftItem(
      id: id,
      title: data['title'] as String,
      imageUrl: data['imageUrl'] as String,
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
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'title': title,
      'imageUrl': imageUrl,
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
    };
  }
}
