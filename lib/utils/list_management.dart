extension ListManagement<T> on List<T> {
  Map<int, T> transformToMap(int Function(T) getKey) =>
      this.fold({}, (map, element) {
        map[getKey(element)] = element;
        return map;
      });

  T? find(bool Function(T) find) {
    List<T> filteredList = this.where(find).toList();

    return filteredList.isNotEmpty ? filteredList.single : null;
  }
}
