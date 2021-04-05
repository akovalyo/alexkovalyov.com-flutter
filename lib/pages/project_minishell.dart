import 'dart:ui' as ui;
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:universal_html/html.dart' as html;
import 'package:universal_html/js.dart' as js;

import 'package:mysite/helpers.dart';
import 'package:mysite/consts/consts.dart';
import 'package:mysite/page_elements/footer.dart';
import 'package:mysite/widgets/image_placeholder.dart';

class ProjectMinishell extends StatefulWidget {
  @override
  _ProjectMinishellState createState() => _ProjectMinishellState();
}

class _ProjectMinishellState extends State<ProjectMinishell> {
  String createdViewId = 'repl';

  void initState() {
    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(
        createdViewId,
        (int viewId) => html.IFrameElement()
          ..width = MediaQuery.of(context).size.width.toString()
          ..height = MediaQuery.of(context).size.height.toString()
          ..src = 'https://repl.it/@akovalyo/minishell?lite=false'
          ..style.border = 'none');

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          SizedBox(
            width: _screenSize.width,
            height: _screenSize.height * 0.4,
            child: FadeInImageAny(
              imagePath: 'assets/images/projects/project_minishell.png',
              placeholder: SizedBox(
                width: _screenSize.width,
                height: _screenSize.height * 0.4,
              ),
              width: _screenSize.width,
              height: _screenSize.height * 0.4,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 40.0),
            child: Text(
              'MINISHELL',
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
          TextBlock(),
          Center(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 20),
              width: isSmallScreen(context)
                  ? _screenSize.width * 0.95
                  : _screenSize.width * 0.6,
              height: 600,
              child: MouseRegion(
                child: Directionality(
                  textDirection: TextDirection.ltr,
                  child: HtmlElementView(
                    viewType: createdViewId,
                  ),
                ),
              ),
            ),
          ),
          Footer()
        ],
      ),
    );
  }
}

class TextBlock extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 10,
        horizontal: isSmallScreen(context) ? paddingSmall : paddingLarge,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Text(
            'The objective of this project is to create a simple shell and learn about processes and file descriptors.',
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Text(
              'Common Instructions (mandatory part):',
              style: Theme.of(context).textTheme.headline5,
              textAlign: TextAlign.center,
            ),
          ),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text:
                      '∘ The project must be written in C and in accordance with the school\'s ',
                  style: Theme.of(context).textTheme.bodyText2,
                ),
                TextSpan(
                  text: 'Norm.',
                  style: Theme.of(context).textTheme.caption,
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      js.context.callMethod(
                        'open',
                        [
                          'https://github.com/akovalyo/akovalyo/blob/master/42_NORM.md'
                        ],
                      );
                    },
                ),
              ],
            ),
          ),
          Text(
            '∘ Functions should not quite unexpectedly (segmentation fault, bus error, double free, etc).',
            style: Theme.of(context).textTheme.bodyText2,
          ),
          Text(
            '∘ No memory leaks',
            style: Theme.of(context).textTheme.bodyText2,
            textAlign: TextAlign.start,
          ),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: '∘ Allowed functions: ',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text:
                      'malloc, free, write, open, read, close, fork, wait, wait3, wait4, signal, kill, exit, getcwd, chdir, stat, fstat, lstat, execve, dup, dup2, pipe, opendir, readdir, closedir, strerror, errno, and functions from ',
                  style: Theme.of(context).textTheme.bodyText2,
                ),
                TextSpan(
                    text: 'libft.',
                    style: Theme.of(context).textTheme.caption,
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        js.context.callMethod(
                            'open', ['https://github.com/akovalyo/42sv_libft']);
                      }),
              ],
            ),
          ),
          Text(
            '∘ Implement the builtins like in bash:',
            style: Theme.of(context).textTheme.bodyText2!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          Text('  ∘ echo with option \'-n\''),
          Text('  ∘ cd with only a relative or absolute path'),
          Text('  ∘ pwd without any options'),
          Text('  ∘ export without any options'),
          Text('  ∘ unset without any options'),
          Text('  ∘ env without any options and any arguments'),
          Text('  ∘ exit without any options'),
          Text(
              '∘ Search and launch the right executable (based on the PATH variable or by using relative or absolute path) like in bash'),
          Text('∘ ; in the command should separate commands like in bash'),
          Text(
              '∘ ’ and " should work like in bash except for multiline commands'),
          Text(
              '∘ Redirections \'<\' \'>\' \'>>\' should work like in bash except for file descriptor aggregation'),
          Text('∘ Pipes | should work like in bash'),
          Text(
              '∘ Environment variables (\$ followed by characters) should work like in bash'),
          Text('∘ \$? should work like in bash'),
          Text(
              '∘ ctrl-C, ctrl-D and ctrl- should have the same result as in bash'),
        ],
      ),
    );
  }
}
