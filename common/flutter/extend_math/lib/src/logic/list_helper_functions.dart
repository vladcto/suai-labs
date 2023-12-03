double sum(Iterable<double> list) =>
    list.reduce((value, element) => value + element);

List<T> roll<T>(List<T> inputList, int shiftAmount) {
  final length = inputList.length;
  if (length == 0) {
    return inputList;
  }

  final effectiveShift = shiftAmount % length;

  if (effectiveShift == 0) {
    return inputList;
  }

  final startIndex = effectiveShift < 0 ? -effectiveShift : length - effectiveShift;
  final part1 = inputList.sublist(startIndex);
  final part2 = inputList.sublist(0, startIndex);
  return [...part1, ...part2];
}