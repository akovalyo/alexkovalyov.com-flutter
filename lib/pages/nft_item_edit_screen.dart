import 'package:flutter/material.dart';
import 'package:mysite/widgets/nft_item_tile.dart';
import '../models/nft_item.dart';
import '../helpers/nft_helper.dart';
import '../form/form_field_helper.dart';

class TextController {
  final title = TextEditingController();
  final imageUrl = TextEditingController();
  final tokenId = TextEditingController();
  final totalMinted = TextEditingController();
  final createdBy = TextEditingController();
  final createdByUrl = TextEditingController();
  final description = TextEditingController();
  final rarityRank = TextEditingController();

  void dispose() {
    title.dispose();
    imageUrl.dispose();
    tokenId.dispose();
    totalMinted.dispose();
    createdBy.dispose();
    createdByUrl.dispose();
    description.dispose();
    rarityRank.dispose();
  }

  void clear() {
    title.clear();
    imageUrl.clear();
    tokenId.clear();
    totalMinted.clear();
    createdBy.clear();
    createdByUrl.clear();
    description.clear();
    rarityRank.clear();
  }
}

class VariableWrapper {
  String value;
  VariableWrapper(this.value);
}

class NftItemEditScreen extends StatefulWidget {
  final Function(NftItem) onCreate;
  final Function(NftItem) onUpdate;
  final NftItem? originalItem;
  final bool updateOriginal;

  const NftItemEditScreen({
    Key? key,
    required this.onCreate,
    required this.onUpdate,
    this.originalItem,
  })  : updateOriginal = originalItem != null,
        super(key: key);

  @override
  _NftItemEditScreenState createState() => _NftItemEditScreenState();
}

class _NftItemEditScreenState extends State<NftItemEditScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextController _textController = TextController();
  DateTime _dateMinted = DateTime.now();
  DateTime _dateAcquired = DateTime.now();
  String _tokenStandard = TokenStandard.erc721;
  VariableWrapper _blockchain = VariableWrapper(Blockchain.etherium);
  VariableWrapper _rarity = VariableWrapper(Rarity.common);

  @override
  void initState() {
    print('NFT_ITEM_EDIT_SCREEN');
    final originalItem = widget.originalItem;
    if (originalItem != null) {
      _textController.title.text = originalItem.title;
      _textController.imageUrl.text = originalItem.imageUrl;
      _textController.tokenId.text = originalItem.tokenId.toString();
      _textController.totalMinted.text = originalItem.totalMinted.toString();
      _textController.createdBy.text = originalItem.createdBy;
      _textController.createdByUrl.text = originalItem.createdByUrl ?? '';
      _textController.description.text = originalItem.description;
      _textController.rarityRank.text = originalItem.rarityRank.toString();
      _dateMinted = originalItem.dateMinted;
      _dateAcquired = originalItem.dateAcquired;
      _blockchain.value = originalItem.blockchain;
      _tokenStandard = originalItem.tokenStandard ?? _tokenStandard;
      _rarity.value = originalItem.rarity ?? _rarity.value;
    }
    super.initState();
  }

  @override
  void dispose() {
    print('DISPOSE EDIT');
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        centerTitle: true,
        title: Text('Add/Edit NFT'),
        actions: [
          IconButton(
            icon: const Icon(Icons.check),
            onPressed: () {
              // print('TITLE CONTROLLER: ${_formKey.currentState!.validate()}');
              if (_formKey.currentState!.validate()) {
                final nftItem = NftItem(
                  id: widget.updateOriginal ? widget.originalItem?.id : null,
                  title: _textController.title.text,
                  imageUrl: _textController.imageUrl.text,
                  tokenId: int.parse(_textController.tokenId.text),
                  totalMinted: int.parse(_textController.totalMinted.text),
                  createdBy: _textController.createdBy.text,
                  createdByUrl: _textController.createdByUrl.text,
                  description: _textController.description.text,
                  dateMinted: _dateMinted,
                  dateAcquired: _dateAcquired,
                  tokenStandard: _tokenStandard,
                  blockchain: _blockchain.value,
                  rarityRank: _textController.rarityRank.text.isEmpty
                      ? null
                      : int.parse(_textController.rarityRank.text),
                  rarity: _rarity.value,
                );

                print(nftItem.toJson());

                // if (widget.updateOriginal) {
                //   widget.onUpdate(nftItem);
                // } else {
                //   widget.onCreate(nftItem);
                // }
              }
            },
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            Form(
              key: _formKey,
              child: Column(children: [
                FormFieldHelper.textFieldBuilder(
                  controller: _textController.title,
                  hint: 'Title',
                  validator: FormFieldHelper.validator('empty'),
                ),
                FormFieldHelper.textFieldBuilder(
                  controller: _textController.imageUrl,
                  hint: 'Url of the nft',
                  validator: FormFieldHelper.validator('empty'),
                ),
                FormFieldHelper.textFieldBuilder(
                  controller: _textController.tokenId,
                  hint: 'Token ID',
                  keyboardType: TextInputType.number,
                  validator: FormFieldHelper.validator('numbers'),
                ),
                FormFieldHelper.textFieldBuilder(
                  controller: _textController.totalMinted,
                  hint: 'Total minted',
                  keyboardType: TextInputType.number,
                  validator: FormFieldHelper.validator('numbers'),
                ),
                FormFieldHelper.textFieldBuilder(
                  controller: _textController.createdBy,
                  hint: 'Created by',
                  validator: FormFieldHelper.validator('empty'),
                ),
                FormFieldHelper.textFieldBuilder(
                  controller: _textController.createdByUrl,
                  hint: 'Url of the project that minted nft',
                  validator: FormFieldHelper.validator(''),
                ),
                FormFieldHelper.textFieldBuilder(
                  controller: _textController.description,
                  hint: 'Description',
                  keyboardType: TextInputType.multiline,
                  validator: FormFieldHelper.validator('empty'),
                ),
                FormFieldHelper.textFieldBuilder(
                  controller: _textController.rarityRank,
                  hint: 'Rarity rank',
                  keyboardType: TextInputType.number,
                  validator: FormFieldHelper.validator(''),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: buildChoiceChipField(
                      Blockchain.all, 'Blockchain', _blockchain),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: buildChoiceChipField(Rarity.all, 'Rarity', _rarity),
                ),
              ]),
            ),
            const SizedBox(height: 20.0),
            Text('Preview'),
            NftItemTile(
              item: NftItem(
                title: _textController.title.text,
                imageUrl: _textController.imageUrl.text,
                tokenId: _textController.tokenId.text.isEmpty
                    ? 0
                    : int.parse(_textController.tokenId.text),
                totalMinted: _textController.totalMinted.text.isEmpty
                    ? 0
                    : int.parse(_textController.totalMinted.text),
                createdBy: _textController.createdBy.text,
                createdByUrl: _textController.createdByUrl.text,
                description: _textController.description.text,
                dateMinted: _dateMinted,
                dateAcquired: _dateAcquired,
                tokenStandard: _tokenStandard,
                blockchain: _blockchain.value,
                rarityRank: _textController.rarityRank.text.isEmpty
                    ? null
                    : int.parse(_textController.rarityRank.text),
                rarity: _rarity.value,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildChoiceChipField(
      List<dynamic> choices, String title, VariableWrapper variable) {
    return FormField(
      builder: (FormFieldState state) {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: Wrap(
                spacing: 10.0,
                runSpacing: 5,
                children: choices.map((e) {
                  return ChoiceChip(
                    selectedColor: Theme.of(context).colorScheme.secondary,
                    label: Text(
                      e,
                      style: TextStyle(
                          color: Theme.of(context).secondaryHeaderColor),
                    ),
                    selected: variable.value == e,
                    onSelected: (selected) {
                      setState(() {
                        variable.value = e;
                      });
                    },
                  );
                }).toList(),
              ),
            ),
          ],
        );
      },
      initialValue: variable.value,
      onSaved: (value) => variable.value = value as String,
      validator: FormFieldHelper.validator('empty'),
    );
  }

  // Widget buildDateField
}
