class Blockchain {
  static String etherium = 'Etherium';
  static String wax = 'Wax';
  static String solana = 'Solana';
  static String palm = 'palm';

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
