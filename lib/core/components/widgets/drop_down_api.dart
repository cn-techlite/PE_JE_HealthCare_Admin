import '../utils/package_export.dart';

class BottomSheetSelector extends StatefulWidget {
  final List<String> options;
  final String title;

  const BottomSheetSelector({
    super.key,
    required this.options,
    this.title = 'Select an Option',
  });

  /// Call this to show the selector
  static Future<String?> show({
    required BuildContext context,
    required List<String> options,
    String title = 'Select an Option',
  }) {
    return showModalBottomSheet<String>(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) => BottomSheetSelector(options: options, title: title),
    );
  }

  @override
  State<BottomSheetSelector> createState() => _BottomSheetSelectorState();
}

class _BottomSheetSelectorState extends State<BottomSheetSelector> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 12),
          Text(
            widget.title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const Divider(),
          ListView.separated(
            padding: const EdgeInsets.symmetric(vertical: 8),
            shrinkWrap: true,
            itemCount: widget.options.length,
            itemBuilder: (context, index) {
              final option = widget.options[index];
              return ListTile(
                title: Text(option),
                onTap: () => Navigator.of(context).pop(option),
              );
            },
            separatorBuilder: (_, __) => const Divider(),
          ),
        ],
      ),
    );
  }
}
