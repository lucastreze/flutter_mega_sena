import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mega_sena/games/mega_sena_saved_games_notifier.dart';
import 'package:provider/provider.dart';

class _SavedGameLuckyNumbers extends StatelessWidget {
  final double circleSize = 35.0;
  final List<int> luckyNumbers;

  _SavedGameLuckyNumbers(this.luckyNumbers);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: luckyNumbers.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          width: circleSize,
          height: circleSize,
          decoration: BoxDecoration(
            color: Colors.black12,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Text(
              luckyNumbers[index].toString().padLeft(2, '0'),
            ),
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return SizedBox(
          width: 10.0,
        );
      },
    );
  }
}

class _SavedGameControl extends StatelessWidget {
  final IconData icon;
  final Function action;

  _SavedGameControl({
    @required this.icon,
    @required this.action,
  });

  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: const ShapeDecoration(
        color: Colors.grey,
        shape: CircleBorder(),
      ),
      child: IconButton(
        icon: Icon(icon),
        color: Colors.black,
        onPressed: action,
      ),
    );
  }
}

class MegaSenaSavedGames extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (
        BuildContext context,
        MegaSenaSavedGamesNotifier notifier,
        Widget child,
      ) {
        return Column(
          children: [
            Container(
              alignment: Alignment.centerRight,
              child: Ink(
                decoration: const ShapeDecoration(
                  color: Colors.grey,
                  shape: CircleBorder(),
                ),
                child: IconButton(
                  icon: Icon(Icons.autorenew),
                  onPressed: notifier.clearSavedGames,
                ),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: notifier.savedGames.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  height: 50.0,
                  child: Row(
                    children: [
                      Expanded(
                        child: _SavedGameLuckyNumbers(
                          notifier.savedGames[index].luckyNumbers,
                        ),
                      ),
                      Container(
                        child: _SavedGameControl(
                          icon: Icons.clear,
                          action: () => notifier.removeSavedGame(index),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }
}