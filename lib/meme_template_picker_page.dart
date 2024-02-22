import 'package:flutter/material.dart';
import 'theme/colors/colors.dart';

import 'meme.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'meme_row.dart';



class MemeTemplatePickerPage extends StatefulWidget {
  const MemeTemplatePickerPage({
    super.key,
    required this.onSelection,
  });
  final Function(Meme meme) onSelection;

  @override
  State<MemeTemplatePickerPage> createState() => _MemeTemplatePickerPageState();
}

class _MemeTemplatePickerPageState extends State<MemeTemplatePickerPage> {
  List<Meme> _memes = [];

  @override
  Widget build(BuildContext context) {
    if (_memes.isEmpty) {
      readJson();
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
        title: const Text("Select meme template"),
      ),
      body: ListView.separated(
          itemBuilder: (BuildContext context, int index) {
            return MemeRow(
                meme: _memes[index],
                onSelect: () => {
                      selected(_memes[index]),
                    });
          },
          separatorBuilder: (BuildContext context, int index) => const Divider(
                height: 2,
                thickness: 2,
                color: AppColors.separator,
              ),
          itemCount: _memes.length),
    );
  }

  Future<void> readJson() async {
    final String response = await rootBundle.loadString('lib/memes/memes.json');
    final data = await json.decode(response);
    var memes = Memes.fromJson(data);
    setState(() {
      _memes = memes.list;
    });
  }

  void selected(Meme meme) {
    widget.onSelection(meme);
    Navigator.pop(context);
  }
}
