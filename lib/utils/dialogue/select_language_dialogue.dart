import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/utils/widgets/custome_button.dart';
import '../../config/constants/app_colors.dart';

class LanguageSelectionDialog extends StatefulWidget {
  const LanguageSelectionDialog({super.key});

  @override
  _LanguageSelectionDialogState createState() =>
      _LanguageSelectionDialogState();
}

class _LanguageSelectionDialogState extends State<LanguageSelectionDialog> {
  late String _selectedLanguage;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _selectedLanguage =
        context.locale == const Locale('am', 'ET') ? "Amharic" : "English";
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('select_language'.tr()),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          RadioListTile<String>(
            title: const Text('English'),
            value: 'English',
            groupValue: _selectedLanguage,
            onChanged: (value) {
              setState(() {
                _selectedLanguage = value!;
              });
            },
          ),
          RadioListTile<String>(
            title: const Text('amharic').tr(),
            value: 'Amharic',
            groupValue: _selectedLanguage,
            onChanged: (value) {
              setState(() {
                _selectedLanguage = value!;
              });
            },
          ),
        ],
      ),
      actions: [
        CustomButton(
          padding: 12.h,
          onTap: () => Navigator.of(context).pop(_selectedLanguage),
          lable: "submit".tr(),
          backgroundColor: AppColors.primaryColor,
        )
        // ElevatedButton(
        //   onPressed: () {
        //     Navigator.of(context).pop(_selectedLanguage);
        //   },
        //   child: const Text('Submit'),
        // ),
      ],
    );
  }
}
