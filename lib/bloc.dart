import 'package:flutter_bloc/flutter_bloc.dart';

abstract class ActionEvent {}

class Action1 extends ActionEvent {
  String input;
  Action1(this.input);
}

class Action2 extends ActionEvent {
  String input;
  Action2(this.input);
}

class Action3 extends ActionEvent {
  String input;
  Action3(this.input);
}

class Action4 extends ActionEvent {
  String input;
  Action4(this.input);
}

class ActionBloc extends Bloc<ActionEvent, String> {
  ActionBloc() : super('') {
    on<Action1>((event, emit) {
      final int input = int.tryParse(event.input)!;
      List<String> oList1 = [];
      for (var i = 1; i < input + 1; i++) {
        oList1.add(i.toString());
      }
      String output = oList1.join(' ');
      return emit(output);
    });
    on<Action2>((event, emit) {
      final int input = int.tryParse(event.input)!;
      List<String> oList1 = [];
      for (var i = 1; i < input + 1; i++) {
        oList1.add(i.toString());
      }

      final oList2 = oList1.reversed;
      String output1 = oList2.join(' ');

      oList1.removeLast();

      String output2 = oList1.join(' ');

      String output3 = output2 + ' ' + output1;
      return emit(output3);
    });
    on<Action3>((event, emit) {
      int p1 = int.tryParse(event.input)!;
      int p2 = 0;
      List<int> pList = [];
      for (int i = 1; i < p1 + 1; i++) {
        p2 = p2 + (p1 * 2 + 1);
        pList.add(p2);
      }
      String output = pList.join(' ');
      return emit(output);
    });
    on<Action4>((event, emit) {
      final int inputInt = int.tryParse(event.input)!;
      List<String> sList1 = [];
      for (var i = 1; i < inputInt; i++) {
        if (i % 5 == 0) {
          sList1.add('LIMA');
        } else {
          if (i % 7 == 0) {
            sList1.add('TUJUH');
          } else {
            sList1.add(i.toString());
          }
        }
      }
      String output = sList1.join(' ');
      return emit(output);
    });
  }
}
