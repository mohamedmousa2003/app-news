import 'package:flutter/material.dart';
import 'package:flutter_application_1/share/constatan.dart';
import 'package:flutter_application_1/share/cores/colors.dart';
import 'package:provider/provider.dart';

import '../../../generated/l10n.dart';
import '../../../share/cores/newtwork_layer/my_provider.dart';


class BottomLanguage extends StatelessWidget {
  const BottomLanguage({super.key});

  @override
  Widget build(BuildContext context) {
    var local = S.of(context);
    var theme = Theme.of(context);
    var provider = Provider.of<MyProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          InkWell(
            onTap: () {
              provider.chanageLanguage("en");
              Navigator.pop(context);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  local.english,
                  
                  style: theme.textTheme.bodyLarge?.copyWith(
                    color:
                    
                    provider.localeProvider == "en"
                        ? primary
                        : black,
                    
                  ),
                ),
                
                provider.localeProvider == "en"
                    ? Icon(Icons.done, color: primary)
                    : const SizedBox.shrink(),
                
              ],
            ),
          ),
          const SizedBox(height: 20),
          InkWell(
            onTap: () {
              provider.chanageLanguage("ar");
              Navigator.pop(context);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  local.arabic,
                 
                  style: theme.textTheme.bodyLarge?.copyWith(
                    color: provider.localeProvider == "ar"
                        ? primary
                        : black,
                     
                  ),
                ),
                
                provider.localeProvider == "ar"
                    ? Icon(Icons.done, color: primary)
                    : const SizedBox.shrink(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
