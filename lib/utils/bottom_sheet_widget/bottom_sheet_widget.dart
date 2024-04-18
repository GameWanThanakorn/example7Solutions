import 'package:flutter/material.dart';
import 'package:flutter_application_1/page/home_logic.dart';
import 'package:flutter_application_1/utils/bottom_sheet_widget/bottom_sheet_logic.dart';

class BottomSheetWidget {
  static void showBottomSheet(
      BuildContext context, List<Map<String, dynamic>> fibList, int calculateFib, int value, void Function(int)? onSelected) {
    HomeLogic logic = HomeLogic();
    BottomSheetLogic bottomSheetLogic = BottomSheetLogic();
    List<Map<String, dynamic>> filterArray = bottomSheetLogic.filterFibonacciList(fibList: fibList, calculateFib: calculateFib);
    bottomSheetLogic.sortFibonacciList(filterArray: filterArray);
    Map<String, dynamic> whereValue = bottomSheetLogic.firstWhereValue(filterArray: filterArray, value: value);
    showModalBottomSheet(
      context: context,
      builder: (context) {
        WidgetsBinding.instance.addPostFrameCallback((_) => bottomSheetLogic.scrollToBottom(filterArray, whereValue));
        return SizedBox(
          height: MediaQuery.of(context).size.height * 0.8,
          child: ListView.builder(
            physics: const ClampingScrollPhysics(),
            itemCount: filterArray.length,
            controller: bottomSheetLogic.scrollController,
            itemBuilder: (context, index) {
              final e = filterArray[index];
              return InkWell(
                key: Key('bottomSheet ${e['value']}'),
                onTap: () => onSelected!(e['value']),
                child: Container(
                  key: Key('container ${e['value']}'),
                  color: whereValue['index'] == e['index'] ? Colors.green : Colors.white,
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(8),
                    leading: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Number: ${e['value']}',
                          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black87),
                        ),
                        Text(
                          'Index: ${e['index']}',
                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.grey[600]),
                        ),
                      ],
                    ),
                    trailing: Icon(logic.typeIcon(e['value']), color: Colors.black, size: 20),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
