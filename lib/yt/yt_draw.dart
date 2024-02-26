import 'package:drawing_tutorial/yt/providers/functions_provider.dart';
import 'package:drawing_tutorial/yt/widgets/one_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'flip_book_painter.dart';

class ViewManScreen extends ConsumerStatefulWidget {
  const ViewManScreen(this.weight, {super.key});
  final int weight;

  @override
  ConsumerState createState() => _ViewManScreenState();
}

class _ViewManScreenState extends ConsumerState<ViewManScreen> {
  final offsets = <Offset?>[];
  @override
  Widget build(BuildContext context) {
    final man = ref.watch(manProvider(widget.weight));

    return Scaffold(
      floatingActionButton: FloatingActionButton.large(onPressed: () {
        ref.watch(manProvider(5).notifier).showMan();
      }),
      appBar: AppBar(
        title: const Text('3 m.ż.'),
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
            painter: FlipBookPainter(offsets: offsets),
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
