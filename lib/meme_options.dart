import 'package:flutter/material.dart';
import 'theme/colors/colors.dart';



class MemeOptions extends StatelessWidget {
  final Function() onGenerateAction;
  final bool isGenerateEnabled;
  final Function() onShareAction;
  final bool isShareEnabled;

  const MemeOptions({
    super.key,
    required this.onGenerateAction,
    required this.isGenerateEnabled,
    required this.onShareAction,
    required this.isShareEnabled,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton.icon(
              onPressed: isGenerateEnabled ? onGenerateAction : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.mainColor,
                foregroundColor: AppColors.mainWhite,
                disabledBackgroundColor: AppColors.mainColor.withOpacity(0.3),
                disabledForegroundColor: AppColors.mainWhite,
              ),
              icon: const Icon(Icons.auto_fix_high_outlined),
              label: const Padding(
                padding: EdgeInsets.fromLTRB(4, 12, 0, 12),
                child: Text("Generate"),
              ),
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: ElevatedButton.icon(
              onPressed: isShareEnabled ? onShareAction : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.mainOrange,
                foregroundColor: AppColors.mainWhite,
                disabledBackgroundColor: AppColors.mainOrange.withOpacity(0.3),
                disabledForegroundColor: AppColors.mainWhite,
              ),
              icon: const Icon(Icons.share),
              label: const Padding(
                padding: EdgeInsets.fromLTRB(4, 12, 0, 12),
                child: Text("Share"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
