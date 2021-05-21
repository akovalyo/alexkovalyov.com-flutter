import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:mysite/consts/consts.dart';
import 'package:mysite/consts/routes.dart';
import 'package:mysite/helpers.dart';
import 'package:mysite/widgets/project_card.dart';
import 'package:mysite/widgets/project_button.dart';

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
          padding: EdgeInsets.symmetric(
              vertical: 20,
              horizontal: isSmallScreen(context) ? paddingSmall : paddingLarge),
          child: Wrap(
            spacing: 40,
            runSpacing: 40,
            children: [
              ProjectCard(
                imageProvider:
                    AssetImage('assets/images/projects/css_tree.png'),
                label: 'css',
                title: 'Css image',
                description: 'Css image with animation',
                firstButton: ProjectButton(
                  title: 'Live',
                  link: 'https://codepen.io/akovalyo/full/WNporeY',
                ),
              ),
              ProjectCard(
                imageProvider:
                    AssetImage('assets/images/projects/instaharvest.png'),
                title: 'React + Flask website',
                label: 'web',
                description: 'Place to find local grown fruits and vegetables',
                firstButton: ProjectButton(
                  title: 'Site',
                  link: 'https://instaharvest.net',
                ),
                secondButton: ProjectButton(
                    title: 'Code',
                    link: 'https://github.com/akovalyo/instaHarvest'),
              ),
              ProjectCard(
                imageProvider:
                    AssetImage('assets/images/projects/project_1.png'),
                title: 'Flutter Web',
                label: 'web',
                description: 'This website is built in Flutter',
                firstButton: ProjectButton(
                  link: 'https://github.com/akovalyo/alexkovalyov.com-flutter',
                  title: 'Code',
                ),
              ),
              ProjectCard(
                imageProvider:
                    AssetImage('assets/images/projects/project_minishell.png'),
                title: 'Minimalistic shell',
                label: 'C',
                description: 'Recreating a real shell in C',
                firstButton: ProjectButton(
                  link: routeProjectMinishell,
                  title: 'Demo',
                ),
                secondButton: ProjectButton(
                  link: 'https://github.com/akovalyo/42sv_minishell',
                  title: 'Code',
                ),
              ),
              ProjectCard(
                imageProvider: AssetImage('assets/images/blood/blood.png'),
                title: 'AI Project',
                label: 'ML',
                description:
                    'Identifying white blood cells using CNN with Pytorch',
                firstButton: ProjectButton(
                  link: 'https://github.com/akovalyo/wbc_classification',
                  title: 'Code',
                ),
                secondButton: ProjectButton(
                  link: '2020-06-29-blood_cells',
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
