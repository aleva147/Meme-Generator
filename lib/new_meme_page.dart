import 'package:code9_meme/api/meme_api.dart';
import 'package:code9_meme/api/meme_request.dart';
import 'package:flutter/material.dart';
import 'common/input_text_field.dart';
import 'meme_image_widget.dart';
import 'meme_options.dart';
import 'separator.dart';
import 'theme/colors/colors.dart';
import 'meme_template_picker_page.dart';
import 'meme.dart';



class NewMemePage extends StatefulWidget {
  const NewMemePage({super.key});

  @override
  State<NewMemePage> createState() => _NewMemePageState();
}

class _NewMemePageState extends State<NewMemePage> {
  String _topText = "";
  String _bottomText = "";
  bool _isGenerateEnabled = false;
  String _selectedMemeId = "aag";
  String _meme = "";
  bool _loading = false;
  final TextEditingController _topController = TextEditingController();
  final TextEditingController _bottomController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
        title: const Text("Meme Generator"),
      ),
      body: Stack(children: [
        Opacity(
          opacity: _loading ? 0.5 : 1,
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  InputTextField("Top text", _topTextChanged, _topController),
                  const Separator(),
                  MemeImage(_meme.isEmpty ? _selectedMemeId : _meme,
                      _onMemeImageTapped),
                  const Separator(),
                  InputTextField(
                      "Bottom text", _bottomTextChanged, _bottomController),
                  const Separator(),
                  MemeOptions(
                    onGenerateAction: _onGenerateAction,
                    isGenerateEnabled: _isGenerateEnabled,
                    onShareAction: _onShareAction,
                    isShareEnabled: _meme.isNotEmpty,
                  ),
                ],
              ),
            ),
          ),
        ),
        _loading
            ? const Center(child: CircularProgressIndicator())
            : Container()
      ]),
    );
  }

  void _updateGenerateButtonState() {
    setState(() {
      _isGenerateEnabled = !(_topText.isEmpty && _bottomText.isEmpty);
    });
  }

  void _topTextChanged(String newText) {
    // debugPrint("User typed in: $newText");
    setState(() {
      _topText = newText;
      _updateGenerateButtonState();
    });
  }

  void _bottomTextChanged(String newText) {
    // debugPrint("User typed in: $newText");
    setState(() {
      _bottomText = newText;
      _updateGenerateButtonState();
    });
  }

  void _onMemeImageTapped() {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => MemeTemplatePickerPage(
                onSelection: _onMemeTemplateSelected,
              )),
    );
  }

  void _onGenerateAction() async {
    setState(() {
      _loading = true;
    });

    final request = MemeRequest(text: [_topText, _bottomText], redirect: false);
    final result = await MemeApi.generateMeme(_selectedMemeId, request);

    _meme = result.url;

    setState(() {
      _topController.clear();
      _bottomController.clear();
      _topText = "";
      _bottomText = "";
      _loading = false;
    });
  }

  void _onShareAction() async {
    await MemeApi.shareMeme(_meme, 'memeImage.jpg');
  }

  void _onMemeTemplateSelected(Meme meme) {
    setState(() {
      _meme = "";
      _selectedMemeId = meme.id;
    });
  }
}
