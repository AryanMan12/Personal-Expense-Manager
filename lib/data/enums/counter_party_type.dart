
enum CounterPartyType { Source,Sink,Both }

CounterPartyType counterPartyTypeFromIndex(int index){
  if (index < 0 || index >= CounterPartyType.values.length) {
    throw ArgumentError('Invalid index: $index');
  }
  return CounterPartyType.values[index];
}