import 'package:fifa_worldcup/lib.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:path/path.dart';

class TableStanding extends StatelessWidget {
  const TableStanding({super.key, required this.standing});
  final Standings standing;
  TextStyle get textStyle => const TextStyle(color: Colors.white);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
              color: primarycolor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
            ),
            width: Get.width,
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                standing.group,
                style: textStyle,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(color: primarycolor.shade700),
            width: Get.width,
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(flex: 2, child: Text('Team', style: textStyle, textAlign: TextAlign.center)),
                  Expanded(flex: 1, child: Text('P', style: textStyle, textAlign: TextAlign.center)),
                  Expanded(flex: 1, child: Text('W', style: textStyle, textAlign: TextAlign.center)),
                  Expanded(flex: 1, child: Text('L', style: textStyle, textAlign: TextAlign.center)),
                  Expanded(flex: 1, child: Text('D', style: textStyle, textAlign: TextAlign.center)),
                  Expanded(flex: 1, child: Text('Points', style: textStyle, textAlign: TextAlign.center)),
                ],
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(color: primarycolor.shade50),
            width: Get.width,
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: standing.table.map(
                  (e) {
                    return Container(
                      width: Get.width,
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Expanded(
                                flex: 2,
                                child: Row(
                                  children: [
                                    TeamAvatar(team: e.team),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: Text(e.team.tla, textAlign: TextAlign.center),
                                    ),
                                  ],
                                )),
                            Expanded(flex: 1, child: Text('${e.playedGames}', textAlign: TextAlign.center)),
                            Expanded(flex: 1, child: Text('${e.won}', textAlign: TextAlign.center)),
                            Expanded(flex: 1, child: Text('${e.lost}', textAlign: TextAlign.center)),
                            Expanded(flex: 1, child: Text('${e.draw}', textAlign: TextAlign.center)),
                            Expanded(flex: 1, child: Text('${e.points}', textAlign: TextAlign.center)),
                          ],
                        ),
                      ),
                    );
                  },
                ).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TeamAvatar extends StatelessWidget {
  const TeamAvatar({
    Key? key,
    required this.team,
  }) : super(key: key);
  final Team team;

  @override
  Widget build(BuildContext context) {
    const double size = 33;
    return SizedBox(
      width: size,
      height: size,
      child: ClipOval(
        clipBehavior: Clip.hardEdge,
        child: team.crest.isEmpty
            ? const Icon(
                Icons.sports_soccer_sharp,
                size: size - 8,
                color: Colors.white,
              )
            : extension(team.crest) == '.svg'
                ? SvgPicture.network(
                    team.crest,
                    width: size,
                    height: size,
                    fit: BoxFit.cover,
                  )
                : Image.network(
                    team.crest,
                    width: size,
                    fit: BoxFit.fitHeight,
                    height: size,
                  ),
      ),
    );
  }
}
