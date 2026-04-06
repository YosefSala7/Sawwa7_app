sealed class PassState {
  final bool isHidden;

  PassState({required this.isHidden});
}

class PassInit extends PassState {
  PassInit() : super(isHidden: true);
}

class PassUpdate extends PassState {
  PassUpdate({required super.isHidden});
}
