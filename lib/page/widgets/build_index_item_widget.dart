part of '../home_view.dart';

class BuildIndexItemWidget extends StatelessWidget {
  final void Function()? onTap;
  final int index, value;
  final IconData icon;
  const BuildIndexItemWidget({
    super.key,
    required this.onTap,
    required this.index,
    required this.value,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RichText(
              text: TextSpan(
                text: 'Index:',
                style: DefaultTextStyle.of(context).style.copyWith(fontSize: 20, fontWeight: FontWeight.bold),
                children: <TextSpan>[
                  TextSpan(text: ' $index', style: const TextStyle(fontWeight: FontWeight.w400, color: Colors.black87)),
                  const TextSpan(text: ' , ', style: TextStyle(fontWeight: FontWeight.w400)),
                  const TextSpan(text: 'Number:', style: TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(text: ' $value', style: const TextStyle(fontWeight: FontWeight.w400, color: Colors.black87)),
                ],
              ),
            ),
            Icon(
              icon,
              color: Colors.black,
              size: 20,
            )
          ],
        ),
      ),
    );
  }
}
