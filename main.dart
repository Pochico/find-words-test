void main() {
  List<List<String>> matrix = [
    ['a', 'e', 't', 'l'],
    ['d', 'a', 'e', 'u'],
    ['t', 'e', 'a', 'r'],
    ['c', 'h', 'x', 'g'],
  ];

  List<String> words = [
    'leadtech',
    'notleadtech',
    'potato',
    'anotherCompany',
    'great',
  ];

  List<String> findWords(List<List<String>> matrix, List<String> words) {
    List<String> foundWords = [];

    int numRows = matrix.length;
    int numCols = matrix[0].length;

    List<List<int>> directions = [
      [0, 1],
      [1, 0],
      [0, -1],
      [-1, 0],
      [1, 1],
      [-1, -1],
      [1, -1],
      [-1, 1]
    ];

    bool isWordFound(
        String word, int index, int row, int col, List<List<bool>> visited) {
      if (index == word.length) return true;

      if (row < 0 ||
          row >= numRows ||
          col < 0 ||
          col >= numCols ||
          visited[row][col] ||
          matrix[row][col] != word[index]) {
        return false;
      }

      visited[row][col] = true;

      for (var dir in directions) {
        if (isWordFound(word, index + 1, row + dir[0], col + dir[1], visited)) {
          return true;
        }
      }

      visited[row][col] = false;
      return false;
    }

    for (var word in words) {
      bool found = false;

      List<List<bool>> visited =
          List.generate(numRows, (_) => List.filled(numCols, false));

      for (int row = 0; row < numRows; row++) {
        for (int col = 0; col < numCols; col++) {
          if (isWordFound(word, 0, row, col, visited)) {
            foundWords.add(word);
            found = true;
            break;
          }
        }
        if (found) break;
      }
    }

    return foundWords;
  }

  findWords(matrix, words);
}
