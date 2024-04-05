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
      child: ListView.builder(
        physics: const ClampingScrollPhysics(),
        itemCount: _fibList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'index: $index, Number: ${_fibList[index]}',
                  style: const TextStyle(fontSize: 16),
                ),
                Icon(
                  _logic.typeIcon(_fibList[index]),
                  color: Colors.black,
                  size: 20,
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
