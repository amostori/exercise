class Man {
  final String breathing;
  final String pulse;
  final String mask;
  final String tube;

  Man(
      {required this.breathing,
      required this.pulse,
      required this.mask,
      required this.tube});

  Man copyWith({
    String? breathing,
    String? pulse,
    String? mask,
    String? tube,
  }) {
    return Man(
      breathing: breathing ?? this.breathing,
      pulse: pulse ?? this.pulse,
      mask: mask ?? this.mask,
      tube: tube ?? this.tube,
    );
  }
}
