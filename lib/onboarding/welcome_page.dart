import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:metacards/data/constants.dart' as cnst;
import 'package:metacards/general/const/app_colors.dart';
import 'package:metacards/general/const/app_text_styles.dart';
import 'package:metacards/general/ui/button.dart';
import 'package:metacards/general/ui/language_flag_selector.dart';
import 'package:metacards/general/utils/screen_adapt.dart';
import 'package:metacards/l10n/app_localizations.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  final TextEditingController _nameController = TextEditingController();
  late String _selectedCode;
  String? _errorText;

  @override
  void initState() {
    super.initState();
    final deviceCode =
        WidgetsBinding.instance.platformDispatcher.locale.languageCode;
    _selectedCode = cnst.AppData.supportedDataLocales.contains(deviceCode)
        ? deviceCode
        : cnst.AppData.defaultLocale;
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  Future<void> _onContinue() async {
    final name = _nameController.text.trim();
    final l10n = AppLocalizations.of(context)!;
    if (name.isEmpty) {
      setState(() {
        _errorText = l10n.welcomeNameRequired;
      });
      return;
    }
    final navigator = GoRouter.of(context);
    await cnst.AppInitializer.appData
        .saveUserProfile(context, name, _selectedCode);
    navigator.go('/');
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0.a),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                l10n.welcomeTitle,
                textAlign: TextAlign.center,
                style: AppTextStyles.bold21.copyWith(color: Colors.white),
              ),
              SizedBox(height: 30.0.a),
              Text(
                l10n.welcomeNameLabel,
                style: AppTextStyles.normal16.copyWith(color: Colors.white),
              ),
              SizedBox(height: 10.0.a),
              TextField(
                controller: _nameController,
                style: AppTextStyles.normal16,
                textCapitalization: TextCapitalization.words,
                onChanged: (_) {
                  if (_errorText != null) {
                    setState(() {
                      _errorText = null;
                    });
                  }
                },
                decoration: InputDecoration(
                  filled: true,
                  fillColor: AppColor.buttonColor,
                  hintText: l10n.welcomeNameHint,
                  errorText: _errorText,
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 15.0.a,
                    vertical: 15.0.a,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: cnst.borderRadius15,
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              SizedBox(height: 30.0.a),
              Text(
                l10n.welcomeLanguageLabel,
                style: AppTextStyles.normal16.copyWith(color: Colors.white),
              ),
              SizedBox(height: 10.0.a),
              LanguageFlagSelector(
                selectedCode: _selectedCode,
                onSelect: (code) {
                  setState(() {
                    _selectedCode = code;
                  });
                },
              ),
              SizedBox(height: 40.0.a),
              Button(
                label: l10n.welcomeContinueButton,
                color: AppColor.buttonColor,
                onTap: _onContinue,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
