import 'package:flutter/material.dart';
import 'theme/colors/colors.dart';
import 'package:url_launcher/url_launcher.dart';



class InfoPage extends StatelessWidget {
  const InfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
        title: const Text("Meme Generator"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            children: [
              const Spacer(),
              _subheadText("Developed by:"),
              const SizedBox(height: 10),
              _bodyText("aleva147"),
              const SizedBox(height: 40),
              _subheadText("Check API @"),
              const SizedBox(height: 10),
              _linkBodyText("http://apimeme.com"),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  Text _subheadText(String text) {
    return Text(
      text,
      style: const TextStyle(fontSize: 15),
    );
  }

  Text _bodyText(String text) {
    return Text(
      text,
      style: const TextStyle(fontSize: 17),
    );
  }

  Widget _linkBodyText(String text) {
    return InkWell(
      onTap: () => _launchUrl(Uri.parse(text)),
      child: Text(
        text,
        style: const TextStyle(fontSize: 17, color: AppColors.mainColor),
      ),
    );
  }

  Future<void> _launchUrl(Uri url) async {
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }
}
