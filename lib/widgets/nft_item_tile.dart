import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/nft_item.dart';
import '../consts/consts.dart';
import '../helpers/screen_helper.dart';
import '../widgets/image_placeholder.dart';
import '../widgets/link_button.dart';
import 'package:universal_html/js.dart' as js;
import '../models/app_state.dart';
import '../pages/nft_item_edit_screen.dart';

class NftItemTile extends StatefulWidget {
  final NftItem item;
  final double? height;
  final double? width;
  final void Function()? onPressedEditButton;
  final bool disableEditButton;
  const NftItemTile({
    Key? key,
    required this.item,
    this.height,
    this.width,
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
        child: GestureDetector(
          onTap: () {
            print('tapped');
          },
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20.0, bottom: 10),
                child: ImagePlaceholder(
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.item.title.toUpperCase(),
                          style: TextStyle(
                            color: Theme.of(context).secondaryHeaderColor,
                            fontWeight: FontWeight.w700,
                            fontSize: 18,
                          ),
                        ),
                        Text(
                          '#${widget.item.tokenId.toString()}',
                          style: TextStyle(
                            color: Theme.of(context).secondaryHeaderColor,
                            fontWeight: FontWeight.w700,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      child: Divider(
                        thickness: 5,
                        color: Theme.of(context).secondaryHeaderColor,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Collection:',
                          style: TextStyle(
                            color: Theme.of(context).secondaryHeaderColor,
                          ),
                        ),
                        Text(
                          widget.item.collection,
                          style: TextStyle(
                            color: Theme.of(context).secondaryHeaderColor,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Blockchain:',
                          style: TextStyle(
                            color: Theme.of(context).secondaryHeaderColor,
                          ),
                        ),
                        Text(
                          widget.item.blockchain,
                          style: TextStyle(
                            color: Theme.of(context).secondaryHeaderColor,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Created by:',
                          style: TextStyle(
                            color: Theme.of(context).secondaryHeaderColor,
                          ),
                        ),
                        widget.item.createdByUrl != null
                            ? LinkButton(
                                title: widget.item.createdBy,
                                color: Theme.of(context).secondaryHeaderColor,
                                onPressed: () {
                                  js.context.callMethod(
                                      'open', [widget.item.createdByUrl]);
                                },
                              )
                            : Text(
                                widget.item.blockchain,
                                style: TextStyle(
                                  color: Theme.of(context).secondaryHeaderColor,
                                ),
                              ),
                      ],
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
