import 'dart:async';

import 'package:ezy_ui/bloc/cubit/increment_decrement_cubit.dart';
import 'package:ezy_ui/utils/custom_funcation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class IncrementalTextField extends StatefulWidget {
  final void Function(double?) onEditingComplete;
  final double? preSelected;
  final String title;
  const IncrementalTextField(
      {super.key, required this.onEditingComplete, this.preSelected, required this.title});

  @override
  State<IncrementalTextField> createState() => _IncrementalTextFieldState();
}

class _IncrementalTextFieldState extends State<IncrementalTextField> {
  double number = 0.0;
  late TextEditingController textEditingController;
  bool doOnes = true;
  @override
  void initState() {
    doOnes = true;
        super.initState();
  }

  @override
  void didUpdateWidget(covariant IncrementalTextField oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.preSelected != widget.preSelected) {
      // Video properties have changed, dispose of the old controller and create a new one
      doOnes = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    Timer? timer;
    if (doOnes) {
      textEditingController =
          TextEditingController(text: widget.preSelected.toString());
      number = widget.preSelected ?? 0.0;
      doOnes = false;
    } else {
      textEditingController = TextEditingController(text: number.toString());
    }
    // final counterCubit =BlocProvider.of<IncrementDecrementCubit>(context);
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: BlocBuilder<IncrementDecrementCubit, double>(
        builder: (context, state) {
          return Column(
            children: [
              Text(widget.title),
              Row(
                children: [
                  GestureDetector(
                    onTap:    () {
                      if (number <= 0) {
                        number = 0.0;
                        setState(() {});
                        return;
                      }
                      number -= 1;
                      widget.onEditingComplete(number);
                      setState(() {});
                      // counterCubit.decrement();
                    },
                      onLongPressStart: (details) {
                        setState(() {
                          timer = Timer.periodic(const Duration(milliseconds: 150), (t) {


                        if (number <= 0) {
                          number = 0.0;
                          setState(() {});
                          return;
                        }
                        number -= 1;
                        widget.onEditingComplete(number);
                        // counterCubit.decrement();
                          });
                        });
                      },
                      onLongPressEnd: (detail) {

                          timer?.cancel();

                      },
                      child: const Icon(Icons.remove)),
                  Expanded(
                    child: TextField(
                      controller: textEditingController,
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      textAlign: TextAlign.center,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                      ),
                      onEditingComplete: () {
                        final value = double.tryParse(textEditingController.text);
                        //  counterCubit.setValue(value ?? 0.0);
                        number = value ?? 0.0;
                        setState(() {});
                        widget.onEditingComplete(value);
                        hideKeyBoard();
                      },
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.add),
                    onPressed: () {
                      number += 1;
                      widget.onEditingComplete(number);
                      setState(() {});
                      //counterCubit.decrement();
                    },
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
