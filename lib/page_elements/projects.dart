import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:universal_html/prefer_sdk/js.dart' as js;

import 'package:mysite/consts/consts.dart';
import 'package:mysite/consts/routes.dart';
import 'package:mysite/widgets/project_card.dart';
import 'package:mysite/widgets/project_flat_button.dart';

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
                imageProvider:
                    AssetImage('assets/images/projects/project_minishell.png'),
                title: 'Minimalistic shell',
                description: 'Recreating a real shell in C',
                firstButton: ProjectFlatButton(
                  link: routeProjectMinishell,
                  title: 'Demo',
                ),
                secondButton: ProjectFlatButton(
                  link: 'https://github.com/akovalyo/42sv_minishell',
                  title: 'Code',
                ),
              ),
              ProjectCard(
                imageProvider: AssetImage('assets/images/blood/blood.png'),
                title: 'AI Project',
                description:
                    'Identifying white blood cells using CNN with Pytorch',
                firstButton: ProjectFlatButton(
                  link: 'https://github.com/akovalyo/wbc_classification',
                  title: 'Code',
                ),
                secondButton: ProjectFlatButton(
                  link: '/2020-06-29-blood_cells',
                  title: 'Description',
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
