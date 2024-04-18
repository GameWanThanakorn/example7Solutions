part of '../home_view.dart';

class BodyHomeView extends StatefulWidget {
  const BodyHomeView({super.key});

  @override
  State<BodyHomeView> createState() => _BodyHomeViewState();
}

class _BodyHomeViewState extends State<BodyHomeView> {
  late HomeLogic _logic;
  late List<int> _fibList;

  @override
  void initState() {
    super.initState();
    _logic = HomeLogic();
    _fibList = _logic.fibonacciSequence();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView.separated(
        key: const Key('listViewScrollable'),
        itemCount: _fibList.length,
        controller: _logic.scrollController,
        itemBuilder: (BuildContext context, int index) {
          final value = _fibList[index];
          if (_logic.containsIndex(index)) {
            return const SizedBox.shrink();
          }
          return Container(
            key: Key('buildIndexItemWidget $index'),
            color: _logic.catchToggledIndexes['index'] == index ? Colors.red : Colors.white,
            child: BuildIndexItemWidget(
              onTap: () => _onSelected(index),
              index: index,
              value: value,
              icon: _logic.typeIcon(value),
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          if (_logic.containsIndex(index)) {
            return const SizedBox.shrink();
          }
          return const Divider(
            height: 0,
            color: Colors.grey,
          );
        },
      ),
    );
  }

  _onSelected(int index) {
    final value = _fibList[index];
    final calculateFib = value % 3;
    setState(() {
      _logic.selected({'index': index, 'value': value});
    });
    _buildBottomSheet(calculateFib, value, index);
  }

  _buildBottomSheet(int calculateFib, int value, int index) {
    return BottomSheetWidget.showBottomSheet(context, _logic.toggledIndexes, calculateFib, value, (value) {
      final map = _logic.firstWhereValue(value);
      setState(() {
        _logic.selected(map);
      });
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _logic.scrollToBottom(_logic.catchToggledIndexes);
        Navigator.pop(context);
      });
    });
  }
}
