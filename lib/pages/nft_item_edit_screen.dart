import 'package:flutter/material.dart';
import 'package:mysite/widgets/nft_item_tile.dart';
import 'package:intl/intl.dart';

import '../models/nft_item.dart';
import '../helpers/nft_helper.dart';
import '../helpers/form_helper.dart';
import '../models/variable_wrapper.dart';
import '../widgets/link_button.dart';

class TextController {
  final title = TextEditingController();
  final imageUrl = TextEditingController();
  final collection = TextEditingController();
  final tokenId = TextEditingController();
  final totalMinted = TextEditingController();
  final createdBy = TextEditingController();
  final createdByUrl = TextEditingController();
  final description = TextEditingController();
  final rarityRank = TextEditingController();
  final contractAddress = TextEditingController();
  final tokenAddress = TextEditingController();

  void dispose() {
    title.dispose();
    imageUrl.dispose();
    collection.dispose();
    tokenId.dispose();
    totalMinted.dispose();
    createdBy.dispose();
    createdByUrl.dispose();
    description.dispose();
    rarityRank.dispose();
    contractAddress.dispose();
    tokenAddress.dispose();
  }

  void clear() {
    title.clear();
    imageUrl.clear();
    collection.clear();
    tokenId.clear();
    totalMinted.clear();
    createdBy.clear();
    createdByUrl.clear();
    description.clear();
    rarityRank.clear();
    contractAddress.clear();
    tokenAddress.clear();
  }
}

class NftItemEditScreen extends StatefulWidget {
  final Function(NftItem) onCreate;
  final Function(NftItem) onUpdate;
  final Function(NftItem) onDelete;
  final NftItem? originalItem;
  final bool updateOriginal;

  const NftItemEditScreen({
    Key? key,
    required this.onCreate,
    required this.onUpdate,
    required this.onDelete,
    this.originalItem,
  })  : updateOriginal = originalItem != null,
        super(key: key);

  @override
  _NftItemEditScreenState createState() => _NftItemEditScreenState();
}

class _NftItemEditScreenState extends State<NftItemEditScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextController _textController = TextController();
  WrappedVariable<DateTime> _dateMinted =
      WrappedVariable<DateTime>(DateTime.now());
  WrappedVariable<DateTime> _dateAcquired =
      WrappedVariable<DateTime>(DateTime.now());
  WrappedVariable<String> _tokenStandard = WrappedVariable<String>('');
  WrappedVariable<String> _blockchain =
      WrappedVariable<String>(Blockchain.etherium);
  WrappedVariable<String> _rarity = WrappedVariable<String>('');
  bool _videoMediaType = false;

  @override
  void initState() {
    final originalItem = widget.originalItem;
    if (originalItem != null) {
      _textController.title.text = originalItem.title;
      _textController.imageUrl.text = originalItem.imageUrl;
      _textController.collection.text = originalItem.collection;
      _textController.tokenId.text = originalItem.tokenId.toString();
      _textController.totalMinted.text = originalItem.totalMinted.toString();
      _textController.createdBy.text = originalItem.createdBy;
      _textController.createdByUrl.text = originalItem.createdByUrl ?? '';
      _textController.description.text = originalItem.description;
      _textController.rarityRank.text = originalItem.rarityRank.toString();
      _textController.contractAddress.text = originalItem.contractAddress ?? '';
      _textController.tokenAddress.text = originalItem.tokenAddress ?? '';
      _dateMinted.value = originalItem.dateMinted;
      _dateAcquired.value = originalItem.dateAcquired;
      _blockchain.value = originalItem.blockchain;
      _tokenStandard.value = originalItem.tokenStandard ?? _tokenStandard.value;
      _rarity.value = originalItem.rarity ?? _rarity.value;
      _videoMediaType = originalItem.videoMediaType;
    }

    super.initState();
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  void clearVars() {
    _dateMinted.value = DateTime.now();
    _dateAcquired.value = DateTime.now();
    _blockchain.value = Blockchain.etherium;
    _tokenStandard.value = '';
    _rarity.value = '';
    _videoMediaType = false;
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
              if (_formKey.currentState!.validate()) {
                final nftItem = NftItem(
                  id: widget.updateOriginal ? widget.originalItem?.id : null,
                  title: _textController.title.text,
                  imageUrl: _textController.imageUrl.text,
                  collection: _textController.collection.text,
                  tokenId: int.parse(_textController.tokenId.text),
                  totalMinted: int.parse(_textController.totalMinted.text),
                  createdBy: _textController.createdBy.text,
                  createdByUrl: _textController.createdByUrl.text,
                  description: _textController.description.text,
                  contractAddress: _textController.contractAddress.text,
                  tokenAddress: _textController.tokenAddress.text,
                  dateMinted: _dateMinted.value,
                  dateAcquired: _dateAcquired.value,
                  tokenStandard: _tokenStandard.value,
                  blockchain: _blockchain.value,
                  rarityRank: _textController.rarityRank.text.isEmpty
                      ? 0
                      : int.parse(_textController.rarityRank.text),
                  rarity: _rarity.value,
                  videoMediaType: _videoMediaType,
                );
                if (widget.updateOriginal) {
                  widget.onUpdate(nftItem);
                } else {
                  widget.onCreate(nftItem);
                }
              }
            },
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            LinkButton(
              title: 'Clear form',
              onPressed: () {
                setState(() {
                  _textController.clear();
                  clearVars();
                });
              },
            ),
            Form(
              key: _formKey,
              child: Column(children: [
                FormHelper.textFieldBuilder(
                  controller: _textController.title,
                  context: context,
                  label: 'Title',
                  validator: FormHelper.validator('empty'),
                  mandatory: true,
                ),
                FormHelper.textFieldBuilder(
                  controller: _textController.imageUrl,
                  context: context,
                  label: 'Url of the nft image',
                  validator: FormHelper.validator('empty'),
                  mandatory: true,
                ),
                FormHelper.textFieldBuilder(
                  controller: _textController.collection,
                  context: context,
                  label: 'Collection',
                  validator: FormHelper.validator('empty'),
                  mandatory: true,
                ),
                FormHelper.textFieldBuilder(
                  controller: _textController.tokenId,
                  context: context,
                  label: 'Token ID',
                  hint: 'Enter number',
                  keyboardType: TextInputType.number,
                  validator: FormHelper.validator('numbers'),
                  mandatory: true,
                ),
                FormHelper.textFieldBuilder(
                  controller: _textController.totalMinted,
                  context: context,
                  label: 'Total minted',
                  hint: 'Enter number',
                  keyboardType: TextInputType.number,
                  validator: FormHelper.validator('numbers'),
                  mandatory: true,
                ),
                FormHelper.textFieldBuilder(
                  controller: _textController.createdBy,
                  context: context,
                  label: 'Created by',
                  validator: FormHelper.validator('empty'),
                  mandatory: true,
                ),
                FormHelper.textFieldBuilder(
                  controller: _textController.createdByUrl,
                  context: context,
                  label: 'Url of the project that minted nft',
                  validator: FormHelper.validator(''),
                ),
                FormHelper.textFieldBuilder(
                  controller: _textController.description,
                  context: context,
                  label: 'Description',
                  keyboardType: TextInputType.multiline,
                  validator: FormHelper.validator('empty'),
                  mandatory: true,
                  maxLines: 5,
                ),
                FormHelper.textFieldBuilder(
                  controller: _textController.rarityRank,
                  context: context,
                  label: 'Rarity rank',
                  hint: 'Enter number',
                  keyboardType: TextInputType.number,
                  validator: FormHelper.validator(''),
                ),
                FormHelper.textFieldBuilder(
                  controller: _textController.contractAddress,
                  context: context,
                  label: 'Contract Address',
                  validator: FormHelper.validator(''),
                ),
                FormHelper.textFieldBuilder(
                  controller: _textController.tokenAddress,
                  context: context,
                  label: 'Token Address',
                  validator: FormHelper.validator(''),
                ),
              ]),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Nft is video:'),
                  const SizedBox(
                    width: 10,
                  ),
                  Checkbox(
                      value: _videoMediaType,
                      onChanged: (val) {
                        setState(() {
                          _videoMediaType = val as bool;
                        });
                      })
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: buildChoiceChipField(Rarity.all, 'Rarity', _rarity,
                  clear: true),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: buildChoiceChipField(
                  Blockchain.all, 'Blockchain', _blockchain),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: buildChoiceChipField(
                  TokenStandard.all, 'Token Standard', _tokenStandard,
                  clear: true),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: buildDateField(context, 'Date Minted', _dateMinted),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: buildDateField(context, 'Date Acquired', _dateAcquired),
            ),
            const SizedBox(height: 20.0),
            Text('Preview'),
            Container(
              width: 350,
              height: 400,
              alignment: Alignment.center,
              child: NftItemTile(
                width: 350,
                height: 400,
                item: NftItem(
                  id: 'preview',
                  title: 'title',
                  imageUrl: _textController.imageUrl.text,
                  collection: _textController.collection.text,
                  tokenId: _textController.tokenId.text.isEmpty
                      ? 0
                      : int.parse(_textController.tokenId.text),
                  totalMinted: _textController.totalMinted.text.isEmpty
                      ? 0
                      : int.parse(_textController.totalMinted.text),
                  createdBy: _textController.createdBy.text,
                  createdByUrl: _textController.createdByUrl.text,
                  description: _textController.description.text,
                  contractAddress: _textController.contractAddress.text,
                  tokenAddress: _textController.tokenAddress.text,
                  dateMinted: _dateMinted.value,
                  dateAcquired: _dateAcquired.value,
                  tokenStandard: _tokenStandard.value,
                  blockchain: _blockchain.value,
                  rarityRank: _textController.rarityRank.text.isEmpty
                      ? 0
                      : int.parse(_textController.rarityRank.text),
                  rarity: _rarity.value,
                  videoMediaType: _videoMediaType,
                ),
                disableEditButton: true,
              ),
            ),
            widget.updateOriginal
                ? LinkButton(
                    title: 'Delete',
                    color: Colors.red,
                    onPressed: () => showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        title: const Text('Delete NFT'),
                        content: const Text(
                            'Are you sure you want to delete the NFT?'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('Cancel'),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                              widget.onDelete(widget.originalItem!);
                            },
                            child: const Text('Confirm'),
                          )
                        ],
                      ),
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }

  Widget buildChoiceChipField(
      List<dynamic> choices, String title, WrappedVariable<String?> variable,
      {bool? clear}) {
    return FormField(
      builder: (FormFieldState state) {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title),
            const SizedBox(
              width: 10,
            ),
            clear != null
                ? LinkButton(
                    title: 'Clear',
                    onPressed: () {
                      setState(() {
                        variable.value = '';
                      });
                    },
                  )
                : Container(),
            const SizedBox(
              width: 10,
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
      validator: FormHelper.validator('empty'),
    );
  }

  Widget buildDateField(
      BuildContext context, String title, WrappedVariable date) {
    return FormField(builder: (FormFieldState state) {
      return Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text('$title: '),
        Text('${DateFormat('LLL dd, yyyy').format(date.value)}'),
        const SizedBox(
          width: 20,
        ),
        LinkButton(
          title: 'Select',
          onPressed: () async {
            final currentDate = date.value;

            final selectedDate = await showDatePicker(
              context: context,
              initialDate: currentDate,
              firstDate: DateTime(currentDate.year - 20),
              lastDate: DateTime.now(),
            );

            setState(
              () {
                if (selectedDate != null) {
                  date.value = selectedDate;
                }
              },
            );
          },
        ),
      ]);
    });
  }
}
