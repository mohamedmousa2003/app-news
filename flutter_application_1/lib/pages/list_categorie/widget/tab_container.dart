import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/source_model/source_model.dart';
import 'package:flutter_application_1/pages/list_categorie/widget/tab_item.dart';
import 'package:flutter_application_1/share/cores/colors.dart';

import '../../news/news_container.dart';

// ignore: must_be_immutable
class TabContainer extends StatefulWidget {
  TabContainer({super.key, required this.sourcesList});
  List<Source> sourcesList;

  @override
  State<TabContainer> createState() => _TabContainerState();
}

class _TabContainerState extends State<TabContainer> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // return tap
        DefaultTabController(
          length: widget.sourcesList.length,
          child: TabBar(
            onTap: (int index) {
              setState(() {
                selectedIndex = index;
              });
            },
            isScrollable: true,
            dividerColor: transparent,
            indicatorColor: transparent,
            tabs: widget.sourcesList
                .map((e) => TabItem(
                    isSelected: selectedIndex == widget.sourcesList.indexOf(e),
                    sourceData: e))
                .toList(),
          ),
        ),
        // return photo ande text
        Expanded(child: NewsContainer(source: widget.sourcesList[selectedIndex],)),
      ],
    );
  }
}
