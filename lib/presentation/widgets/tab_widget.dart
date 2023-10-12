import 'package:flutter/material.dart';
import 'package:stock_app/core/constants/palletes.dart';
import 'package:stock_app/core/constants/styles.dart';

class TabWidget extends StatefulWidget {
  final List<String> tabs;
  final ValueChanged<int> onTab;
  final Widget main;
  final int currentTab;

  const TabWidget({
    super.key,
    required this.tabs,
    required this.main,
    required this.onTab,  this.currentTab = 0,
  });

  @override
  State<TabWidget> createState() => _TabWidgetState();
}

class _TabWidgetState extends State<TabWidget> {
  int _currentTab = 0;

  @override
  void initState() {
    super.initState();
    _currentTab = widget.currentTab;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 40,
          child: ListView(
            physics: const ClampingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            children: List.generate(widget.tabs.length, (index) {
              return GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () {
              _currentTab = index;
                  widget.onTab.call(index);
                  setState(() {});
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 4),
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
                    decoration: BoxDecoration(
                        border: Border(
                      bottom: _currentTab == index
                          ? const BorderSide(color: Palletes.secondaryColor)
                          : BorderSide.none,
                    )),
                    child: Text(
                      widget.tabs[index],
                      style: _currentTab == index
                          ? Styles.titleStyle
                              .copyWith(color: Palletes.secondaryColor)
                          : Styles.regulerStyle,
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
        const SizedBox(height: 16),
        widget.main,
      ],
    );
  }
}
