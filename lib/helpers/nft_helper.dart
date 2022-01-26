class Blockchain {
  static const String etherium = 'Etherium';
  static const String wax = 'Wax';
  static const String solana = 'Solana';
  static const String palm = 'Palm';

  static const List<String> all = [
    etherium,
    wax,
    solana,
    palm,
  ];
}

class TokenStandard {
  static const String erc721 = 'ERC-721';
  static const String erc1155 = 'ERC-1155';

  static const List<String> all = [erc721, erc1155];
}

class Rarity {
  static const String common = 'Common';
  static const String uncommon = 'Uncommon';
  static const String rare = 'Rare';
  static const String epic = 'Epic';
  static const String legendary = 'Legendary';

  static const List<String> all = [
    common,
    uncommon,
    rare,
    epic,
    legendary,
  ];
}

class NftSortTypes {
  static const String dateNewest = 'Date (newest)';
  static const String dateOldest = 'Date (oldest)';
  static const String mintedNewest = 'Minted (newest)';
  static const String mintedOldest = 'Minted (oldest)';
  static const String name = 'Name';
  static const String collection = 'Collection';
  static const String tokenIdHighest = 'Token ID (highest)';
  static const String tokenIdLowest = 'Token ID (lowest)';
  static const String createdBy = 'Created by';
  static const String tokenStandard = 'Token standard';
  static const String blockchain = 'Blockchain';
  static const String rarityRank = 'Rarity rank';

  static const List<String> all = [
    dateNewest,
    dateOldest,
    mintedNewest,
    mintedOldest,
    name,
    collection,
    tokenIdHighest,
    tokenIdLowest,
    createdBy,
    blockchain,
    rarityRank,
  ];

  static const map = {
    dateNewest: 'dateAcquired',
    dateOldest: 'dateAcquired',
    mintedNewest: 'dateMinted',
    mintedOldest: 'dateMinted',
    name: 'title',
    collection: 'collection',
    tokenIdHighest: 'tokenId',
    tokenIdLowest: 'tokenId',
    createdBy: 'createdBy',
    blockchain: 'blockchain',
    rarityRank: 'rarityRank',
  };

  static getProperty(String type) {
    return map[type];
  }
}
