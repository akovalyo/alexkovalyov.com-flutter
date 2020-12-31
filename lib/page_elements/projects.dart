import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:universal_html/prefer_sdk/js.dart' as js;

import 'package:mysite/helpers.dart';
import 'package:mysite/consts/consts.dart';

class Projects extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Text(
            'PROJECTS',
            style: Theme.of(context).textTheme.headline3,
          ),
        ),
        Container(
          width: 160,
          child: Divider(
            thickness: 5,
            color: Theme.of(context).primaryColor,
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(
            vertical: 20,
            horizontal: paddingSmall,
          ),
          child: Wrap(
            spacing: 40,
            runSpacing: 40,
            children: [
              ProjectCard(
                imageProvider:
                    AssetImage('assets/images/projects/project_1.png'),
                title: 'Flutter Web',
                description: 'This website is built in Flutter',
                firstButton: ProjectFlatButton(
                  link: 'https://github.com/akovalyo/alexkovalyov.com-flutter',
                  title: 'Code',
                ),
              ),
              ProjectCard(
                imageProvider: AssetImage('assets/images/blood/blood.png'),
                title: 'AI Project',
                description:
                    'Identifying white blood cells using CNN with Pytorch',
                firstButton: FlatButton(
                  child: Text('Code', style: TextStyle(color: Colors.white)),
                  onPressed: () {
                    js.context.callMethod('open', [
                      'https://github.com/akovalyo/alexkovalyov.com-flutter'
                    ]);
                  },
                  mouseCursor: SystemMouseCursors.click,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              // ProjectCard(),
              // ProjectCard()
            ],
          ),
        ),
      ],
    );
  }
}

class ProjectCard extends StatefulWidget {
  final ImageProvider imageProvider;
  final String title;
  final String description;
  final Widget firstButton;
  final Widget secondButton;

  ProjectCard({
    @required this.imageProvider,
    this.title = '',
    this.description = '',
    this.firstButton,
    this.secondButton,
  });
  @override
  _ProjectCardState createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  Widget _image;
  Widget _hoverImage;
  Widget _secondWidget;
  Widget _firstAnimatedWidget;
  Widget _secondAnimatedWidget;

  @override
  void initState() {
    super.initState();
    _image = Image(fit: BoxFit.fitWidth, image: widget.imageProvider);
    _hoverImage = Opacity(
      opacity: 0.5,
      child: _image,
    );

    _secondWidget = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FittedBox(
          fit: BoxFit.scaleDown,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: Text(
              widget.title,
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        FittedBox(
          fit: BoxFit.scaleDown,
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
            child: Text(
              widget.description,
              style: TextStyle(fontSize: 20),
              softWrap: true,
              overflow: TextOverflow.clip,
            ),
          ),
        ),
        widget.firstButton == null
            ? Container()
            : FittedBox(
                fit: BoxFit.scaleDown,
                child: widget.firstButton,
              ),
        widget.secondButton == null
            ? Container()
            : FittedBox(
                fit: BoxFit.scaleDown,
                child: widget.secondButton,
              ),
      ],
    );

    _firstAnimatedWidget = _image;
  }

  void _onEnter(PointerEvent details) {
    setState(() {
      _firstAnimatedWidget = _hoverImage;
      _secondAnimatedWidget = _secondWidget;
    });
  }

  void _onExit(PointerEvent details) {
    setState(() {
      _firstAnimatedWidget = _image;
      _secondAnimatedWidget = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    var _size = MediaQuery.of(context).size.height * 0.6;
    return SizedBox(
      width: _size > 300 ? _size : 300,
      height: _size > 300 ? _size : 300,
      child: MouseRegion(
        onEnter: _onEnter,
        onExit: _onExit,
        child: Stack(
          fit: StackFit.expand,
          children: [
            AnimatedSwitcher(
              duration: Duration(milliseconds: 300),
              child: _firstAnimatedWidget,
            ),
            AnimatedSwitcher(
              duration: Duration(milliseconds: 800),
              child: _secondAnimatedWidget,
              switchInCurve: Curves.easeInOutBack,
              switchOutCurve: Curves.decelerate,
              transitionBuilder: (Widget child, Animation<double> animation) {
                return ScaleTransition(
                  scale: animation,
                  child: child,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ProjectFlatButton extends StatelessWidget {
  final String link;
  final String title;

  ProjectFlatButton({
    this.link,
    this.title,
  });
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      child: Text(title, style: TextStyle(color: Colors.white)),
      onPressed: () {
        if (link.startsWith('http')) {
          js.context.callMethod('open', [link]);
        } else {}
      },
      mouseCursor: SystemMouseCursors.click,
      color: Theme.of(context).primaryColor,
    );
  }
}
