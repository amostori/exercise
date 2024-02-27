import 'package:drawing_tutorial/features/details/presentation/widgets/one_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_picker/flutter_picker.dart';
import '../my_painter.dart';
import '../provider/man_provider.dart';

class DetailsScreen extends ConsumerStatefulWidget {
  DetailsScreen(this.weight, {super.key});
  int weight;

  @override
  ConsumerState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends ConsumerState<DetailsScreen> {
  final offsets = <Offset?>[];

  void showPickerNumber(BuildContext context, WidgetRef ref) {
    Picker(
        adapter: NumberPickerAdapter(data: [
          const NumberPickerColumn(begin: 1, end: 100),
        ]),
        hideHeader: true,
        title: const Text('Dopasuj wagę'),
        cancelText: 'Anuluj',
        confirmText: 'Ok',
        onConfirm: (Picker picker, List value) {
          setState(() {
            widget.weight = picker.getSelectedValues()[0];
          });
          // ref
          //     .read(manProvider(picker.getSelectedValues()[0]).notifier)
          //     .showMan();
        }).showDialog(context);
  }

  @override
  Widget build(BuildContext context) {
    final man = ref.watch(manProvider(widget.weight));
    // print('build method, man.maska = ${man.mask}');

    return Scaffold(
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.black,
          onPressed: () {
            showPickerNumber(context, ref);
          },
          child: const Icon(
            Icons.monitor_weight_outlined,
            size: 40.0,
            color: Colors.white,
          )),
      appBar: AppBar(
        title: Text('Index ${widget.weight} ${man.mask}'),
      ),
      body: GestureDetector(
        onPanDown: (details) {
          setState(() {
            offsets.add(details.localPosition);
          });
        },
        onPanUpdate: (details) {
          setState(() {
            offsets.add(details.localPosition);
          });
        },
        onPanEnd: (details) {
          setState(() {
            offsets.add(null);
          });
        },
        child: Center(
          child: CustomPaint(
            painter: MyPainter(offsets: offsets),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const OneRow(
                        title: 'AVPU:',
                        descript: '',
                      ),
                      OneRow(
                        title: 'Częstość oddechu: ',
                        descript: man.breathing,
                      ),
                      OneRow(
                        title: 'Akcja serca: ',
                        descript: man.pulse,
                      ),
                      OneRow(
                        title: 'Maska: ',
                        descript: man.mask,
                      ),
                      OneRow(
                        title: 'Rurka: ',
                        descript: man.tube,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
