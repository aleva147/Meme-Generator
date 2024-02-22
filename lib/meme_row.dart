import 'package:flutter/material.dart';
import 'meme.dart';



class MemeRow extends StatelessWidget {
  const MemeRow({required this.meme, required this.onSelect, super.key});

  final Meme meme;
  final Function onSelect;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => {onSelect()},
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
        child: Row(
          children: [
            Image.asset(
              'lib/memes/images/${meme.id}.png',
              width: 50,
              height: 50,
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                meme.name,
                maxLines: 2,
              ),
            )
          ],
        ),
      ),
    );
  }
}
