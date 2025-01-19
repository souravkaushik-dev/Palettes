import 'package:rive/rive.dart';

class RiveUtils {
  static SMIInput<bool>? getRiveInput(Artboard artboard, {required String stateMachineName}) {
    StateMachineController? controller = StateMachineController.fromArtboard(artboard, stateMachineName);
    if (controller != null) {
      artboard.addController(controller);
      return controller.findInput<bool>('status');
    }
    return null;
  }

  static void changeSMIBoolState(SMIInput<bool>? input) {
    if (input != null) {
      input.value = !input.value;
    }
  }
}
