import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/setting/widget/buttom_language.dart';
import 'package:flutter_application_1/share/components/custom_extension.dart';
import 'package:flutter_application_1/share/constatan.dart';
import 'package:flutter_application_1/share/cores/colors.dart';
import 'package:provider/provider.dart';

import '../../generated/l10n.dart';
import '../../share/constatan.dart';
import '../../share/constatan.dart';
import '../../share/cores/newtwork_layer/my_provider.dart';

class SettingView extends StatefulWidget {
  const SettingView({super.key});

  @override
  State<SettingView> createState() => _SettingViewState();
}

class _SettingViewState extends State<SettingView> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var local =S.of(context);
    
    var provider = Provider.of<MyProvider>(context);
    return Container(
      decoration: const BoxDecoration(
        color: white,
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(
            "assets/images/background.png",
            
          )
        )
      ),
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              15.height,
              Text(local.language ,style:  theme.textTheme.bodyMedium?.copyWith(color: black ,fontSize: 20),),
              15.height,  
              builderSetting(
                   
                    local: provider.localeProvider == "en"
                        ? local.english
                        : local.arabic
                ),
            ],
          ),
        )),
    );
  }

//{/*required String local*/}
builderSetting({required String local}) {
  var local = S.of(context);
    return InkWell(
      onTap: () {
         builderShowModalBottomLanguage();
           },
      child: Container(
        
        padding: const EdgeInsets.all(10),
        height: 60,
        width: double.infinity,
        decoration:
            BoxDecoration(border: Border.all(color: primary, width: 3)),
        child:  Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //local
            Text(local.english, style: const TextStyle(color: primary, fontSize: 20)),
            const Icon(
              Icons.arrow_downward,
              color: primary,
            ),
          ],
        ),
      ),
    );
  }

builderShowModalBottomLanguage() {
    return showModalBottomSheet(
      
        context: context, builder: (context) => BottomLanguage());
  }
}