class Blockchain {
  static String etherium = 'Etherium';
  static String wax = 'Wax';
  static String solana = 'Solana';
  static String palm = 'Palm';

  static List<String> all = [
    etherium,
    wax,
    solana,
    palm,
  ];
}

class TokenStandard {
  static String erc721 = 'ERC-721';
  static String erc1155 = 'ERC-1155';

  static List<String> all = [erc721, erc1155];
}

class Rarity {
  static String common = 'Common';
  static String uncommon = 'Uncommon';
  static String rare = 'Rare';
  static String epic = 'Epic';
  static String legendary = 'Legendary';

  static List<String> all = [
    common,
    uncommon,
    rare,
    epic,
    legendary,
  ];
}

class NftGalleryOrderBy {
  static String dateNewest = 'Date (newest)';
  static String dateOldest = 'Date (oldest)';
  static String mintedNewest = 'Minted (newest)';
  static String mintedOldest = 'Minted (oldest)';
  static String name = 'Name';
  static String collection = 'Collection';
  static String tokenIdHighest = 'Token ID (highest)';
  static String tokenIdLowest = 'Token ID (lowest)';
  static String createdBy = 'Created by';
  static String tokenStandard = 'Token standard';
  static String blockchain = 'Blockchain';
  static String rarityRank = 'Rarity rank';

  static List<String> all = [
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
}
