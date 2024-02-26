class Man {
  final String breathing;
  final String pulse;
  final String mask;

  Man({required this.breathing, required this.pulse, required this.mask});

  Man copyWith({
    String? breathing,
    String? pulse,
    String? mask,
  }) {
    return Man(
      breathing: breathing ?? this.breathing,
      pulse: pulse ?? this.pulse,
      mask: mask ?? this.mask,
    );
  }
}
