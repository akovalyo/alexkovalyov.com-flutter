import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:mysite/widgets/hyperlink.dart';
import 'package:universal_html/js.dart' as js;
import 'package:intl/intl.dart';

import 'package:mysite/helpers/screen_helper.dart';
import '../widgets/image_placeholder.dart';
import '../models/nft_item.dart';
import '../widgets/link_button.dart';
import '../widgets/nft_item_field.dart';

class NftItemScreen extends StatelessWidget {
  final NftItem item;
  const NftItemScreen({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool _isSmallScreen = ScreenHelper.isSmallScreen(context);
    final double _containerWidth = _isSmallScreen
        ? ScreenHelper.screenWidthDivided(context, 90)
        : ScreenHelper.screenWidthDivided(context, 60);
    final double _contaninerHeight =
        ScreenHelper.screenHeightDivided(context, 90);

    final left = Container(
      width: _isSmallScreen ? _containerWidth * 0.9 : 270,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          NftItemField(
            leftChild: 'Total minted:',
            bold: true,
            rightChild: item.totalMinted.toString(),
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            color: Theme.of(context).primaryColor,
          ),
          item.rarityRank != null
              ? NftItemField(
                  leftChild: 'Rarity rank:',
                  bold: true,
                  rightChild: item.rarityRank.toString(),
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  color: Theme.of(context).primaryColor,
                )
              : Container(),
          item.rarity != null && item.rarity!.isNotEmpty
              ? NftItemField(
                  leftChild: 'Rarity:',
                  bold: true,
                  rightChild: item.rarity,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  color: Theme.of(context).primaryColor,
                )
              : Container(),
          NftItemField(
            leftChild: 'Date minted:',
            bold: true,
            rightChild: '${DateFormat('LLL dd, yyyy').format(item.dateMinted)}',
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            color: Theme.of(context).primaryColor,
          ),
          NftItemField(
            leftChild: 'Date acquired:',
            bold: true,
            rightChild:
                '${DateFormat('LLL dd, yyyy').format(item.dateAcquired)}',
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            color: Theme.of(context).primaryColor,
          ),
          item.tokenStandard != null && item.tokenStandard!.isNotEmpty
              ? NftItemField(
                  leftChild: 'Token standard:',
                  bold: true,
                  rightChild: item.tokenStandard,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  color: Theme.of(context).primaryColor,
                )
              : Container(),
          item.contractAddress != null
              ? NftItemField(
                  leftChild: 'Token address:',
                  bold: true,
                  rightChild: item.contractAddress!.startsWith('http')
                      ? Hyperlink(
                          link: item.contractAddress!,
                          title: item.contractAddress!.split('/').last,
                          titleWidget: Container(
                              width: 100,
                              child: Text(
                                item.contractAddress!.split('/').last,
                                softWrap: true,
                                overflow: TextOverflow.ellipsis,
                              )),
                        )
                      : SelectableText(
                          item.contractAddress!,
                        ),
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  color: Theme.of(context).primaryColor,
                )
              : Container(),
          item.tokenAddress != null
              ? NftItemField(
                  leftChild: 'Token address:',
                  bold: true,
                  rightChild: item.tokenAddress!.startsWith('http')
                      ? Hyperlink(
                          link: item.tokenAddress!,
                          title: item.tokenAddress!.split('/').last,
                          titleWidget: Container(
                              width: 100,
                              child: Text(
                                item.tokenAddress!.split('/').last,
                                softWrap: true,
                                overflow: TextOverflow.ellipsis,
                              )),
                        )
                      : SelectableText(
                          item.tokenAddress!,
                        ),
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  color: Theme.of(context).primaryColor,
                )
              : Container(),
        ],
      ),
    );

    final right = Container(
      width: _isSmallScreen ? _containerWidth * 0.9 : 270,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Description:',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(item.description),
        ],
      ),
    );

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor.withOpacity(0),
      body: Center(
        child: InkWell(
          mouseCursor: SystemMouseCursors.basic,
          onTap: () {
            Navigator.of(context).pop();
          },
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).backgroundColor,
                borderRadius: BorderRadius.circular(5),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    offset: Offset(5, 5),
                    blurRadius: 10,
                  )
                ],
              ),
              // color: Theme.of(context).backgroundColor,
              width: _containerWidth,
              height: _contaninerHeight,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.topRight,
                      child: IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: Icon(Icons.close,
                            color: Theme.of(context).primaryColor),
                      ),
                    ),
                    Expanded(
                      child: ListView(
                        children: [
                          Wrap(
                            spacing: 20,
                            runSpacing: 20,
                            alignment: WrapAlignment.center,
                            direction: Axis.horizontal,
                            crossAxisAlignment: WrapCrossAlignment.start,
                            children: [
                              ImagePlaceholder(
                                width: 250,
                                fit: BoxFit.fitWidth,
                                imagePath: item.imageUrl,
                                placeholder: Container(
                                  height: 250,
                                  width: 250,
                                  color: Theme.of(context).primaryColorDark,
                                ),
                              ),
                              Container(
                                width: 200,
                                child: Center(
                                  child: Column(
                                    children: [
                                      // Title and Id

                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            item.title.toUpperCase(),
                                            style: TextStyle(
                                              color: Theme.of(context)
                                                  .primaryColor,
                                              fontWeight: FontWeight.w700,
                                              fontSize: 18,
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 20,
                                          ),
                                          Text(
                                            '#${item.tokenId.toString()}',
                                            style: TextStyle(
                                              color: Theme.of(context)
                                                  .primaryColor,
                                              fontWeight: FontWeight.w700,
                                              fontSize: 18,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Container(
                                        child: Divider(
                                          thickness: 5,
                                          color: Theme.of(context).primaryColor,
                                        ),
                                      ),
                                      const SizedBox(height: 20),

                                      NftItemField(
                                        leftChild: 'Collection:',
                                        bold: true,
                                        rightChild: item.collection,
                                        color: Theme.of(context).primaryColor,
                                      ),
                                      NftItemField(
                                        leftChild: 'Blockchain:',
                                        bold: true,
                                        rightChild: item.blockchain,
                                        color: Theme.of(context).primaryColor,
                                      ),

                                      NftItemField(
                                        leftChild: 'Created by:',
                                        bold: true,
                                        rightChild: item.createdByUrl != null
                                            ? LinkButton(
                                                title: item.createdBy,
                                                onPressed: () {
                                                  js.context.callMethod('open',
                                                      [item.createdByUrl]);
                                                },
                                              )
                                            : Text(
                                                item.blockchain,
                                                style: TextStyle(
                                                  color: Theme.of(context)
                                                      .primaryColor,
                                                ),
                                              ),
                                        color: Theme.of(context).primaryColor,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          _containerWidth < 690.0
                              ? Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    left,
                                    SizedBox(
                                      height: 10,
                                    ),
                                    right
                                  ],
                                )
                              : Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    left,
                                    SizedBox(
                                      width: 40,
                                    ),
                                    right
                                  ],
                                ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
