import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/nft_item.dart';
import '../widgets/image_placeholder.dart';
import '../widgets/link_button.dart';
import '../models/app_state.dart';
import '../pages/nft_item_screen.dart';
import '../widgets/nft_item_field.dart';
import '../widgets/hyperlink.dart';
import 'video_player.dart';

class NftItemTile extends StatefulWidget {
  final NftItem item;
  final double height;
  final double width;
  final void Function()? onPressedEditButton;
  final bool disableEditButton;
  const NftItemTile({
    Key? key,
    required this.item,
    required this.height,
    required this.width,
    this.onPressedEditButton,
    this.disableEditButton = false,
  }) : super(key: key);

  @override
  State<NftItemTile> createState() => _NftItemTileState();
}

class _NftItemTileState extends State<NftItemTile> {
  @override
  Widget build(BuildContext context) {
    final AppState appState = Provider.of<AppState>(context, listen: false);

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: Theme.of(context).primaryColor,
      ),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: InkWell(
          onTap: () {
            Navigator.of(context).push(
              PageRouteBuilder(
                  opaque: false,
                  pageBuilder: (BuildContext context, _, __) =>
                      NftItemScreen(item: widget.item)),
            );
          },
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20.0, bottom: 10),
                child: widget.item.videoMediaType
                    ? VideoPlayer(path: widget.item.imageUrl)
                    : ImagePlaceholder(
                        width: 200,
                        height: 200,
                        fit: BoxFit.fitWidth,
                        imagePath: widget.item.imageUrl,
                        loadingIndicator: true,
                        placeholder: Container(
                          height: 200,
                          width: 200,
                          color: Theme.of(context).primaryColorDark,
                        ),
                      ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  children: [
                    NftItemField(
                      leftChild: Text(
                        widget.item.title.toUpperCase(),
                        style: TextStyle(
                          color: Theme.of(context).secondaryHeaderColor,
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                        ),
                      ),
                      rightChild: Text(
                        '#${widget.item.tokenId.toString()}',
                        style: TextStyle(
                          color: Theme.of(context).secondaryHeaderColor,
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    Container(
                      child: Divider(
                        thickness: 5,
                        color: Theme.of(context).secondaryHeaderColor,
                      ),
                    ),
                    NftItemField(
                      leftChild: 'Collection:',
                      rightChild: widget.item.blockchain,
                      color: Theme.of(context).secondaryHeaderColor,
                    ),
                    NftItemField(
                      leftChild: 'Blockchain:',
                      rightChild: widget.item.collection,
                      color: Theme.of(context).secondaryHeaderColor,
                    ),
                    NftItemField(
                      leftChild: 'Created by:',
                      rightChild: widget.item.createdByUrl != null
                          ? Hyperlink(
                              link: widget.item.createdByUrl as String,
                              title: widget.item.createdBy,
                              color: Theme.of(context).secondaryHeaderColor,
                            )
                          : Text(
                              widget.item.blockchain,
                              style: TextStyle(
                                color: Theme.of(context).secondaryHeaderColor,
                              ),
                            ),
                      color: Theme.of(context).secondaryHeaderColor,
                    ),
                    appState.isLoggedIn && !widget.disableEditButton
                        ? LinkButton(
                            title: 'Edit',
                            color: Theme.of(context).secondaryHeaderColor,
                            onPressed: widget.onPressedEditButton!,
                          )
                        : Container(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      width: widget.width,
      height: widget.height,
    );
  }
}
