import 'package:flutter/material.dart';
import 'theme/colors/colors.dart';



class MemeImage extends StatelessWidget {
  const MemeImage(this.meme, this.onTap, {super.key});
  final String meme;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: InkWell(
        onTap: () => onTap(),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
          child: Column(
            children: [
              const Text(
                "Meme template:",
                style: TextStyle(color: AppColors.mainGray),
              ),
              const Spacer(),
              Row(
                children: [
                  const SizedBox(
                    width: 36,
                    height: 36,
                  ),
                  const Spacer(),
                  meme.startsWith("http")
                      ? Image.network(
                          meme,
                          width: 200,
                          height: 200,
                        )
                      : Image.asset(
                          'lib/memes/images/$meme.png',
                          width: 200,
                          height: 200,
                        ),
                  const Spacer(),
                  const Icon(
                    Icons.chevron_right,
                    size: 36,
                  )
                ],
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
