// ignore_for_file: dead_code

void main() {
  const isVertical = false;
  const isLandscape = false;

  const cardHeight2 = isVertical
      ? isLandscape
          ? 100.0
          : 80.0
      : 120.0;

  final cardHeight = switch ((isVertical, isLandscape)) {
    (false, _) => 120.0,
    (_, false) => 80.0,
    _ => 100.0,
  };

  const trueOrFalseisVertical = isVertical ? 'true' : 'false';
  const trueOrFalseisLandscape = isLandscape ? 'true' : 'false';

  print(
    'Exemplo com isVertical: $trueOrFalseisVertical e isLandscape: $trueOrFalseisLandscape',
  );

  print(cardHeight);
  print(cardHeight2);
}
