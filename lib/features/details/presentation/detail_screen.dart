import 'package:drawing_tutorial/features/details/presentation/widgets/one_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../my_painter.dart';
import '../provider/man_provider.dart';

class DetailsScreen extends ConsumerStatefulWidget {
  const DetailsScreen(this.weight, {super.key});
  final int weight;

  @override
  ConsumerState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends ConsumerState<DetailsScreen> {
  final offsets = <Offset?>[];
  @override
  void initState() {
    super.initState();
    // ref.read(manProvider(widget.weight).notifier).showMan();
  }

  @override
  Widget build(BuildContext context) {
    final man = ref.watch(manProvider(widget.weight));

    return Scaffold(
      floatingActionButton: FloatingActionButton.large(onPressed: () {
        ref.read(manProvider(widget.weight).notifier).showMan();
      }),
      appBar: AppBar(
        title: Text('${widget.weight}'),
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
