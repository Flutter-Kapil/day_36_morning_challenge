import '../bin/main.dart';
import 'package:test/test.dart';

void main() {
  test("test case 1", () {
    //2 accounts with comon email and 3rd account with same name as previous two accounts,
    //so same name but no common emails
    expect(
        merge([
          ["John", "johnsmith@mail.com", "john00@mail.com"],
          ["John", "johnnybravo@mail.com"],
          ["John", "johnsmith@mail.com", "john_newyork@mail.com"],
          ["Mary", "mary@mail.com"]
        ]),
        [
          [
            "John",
            'john00@mail.com',
            'john_newyork@mail.com',
            'johnsmith@mail.com'
          ],
          ["John", "johnnybravo@mail.com"],
          ["Mary", "mary@mail.com"]
        ]);

//simple list of accounts
    expect(
        merge([
          ["John", "johnsmith@mail.com", "john00@mail.com"],
          ["John", "johnsmith@mail.com", "john_newyork@mail.com"],
          ["Mary", "mary@mail.com"]
        ]),
        [
          [
            "John",
            'john00@mail.com',
            'john_newyork@mail.com',
            'johnsmith@mail.com'
          ],
          ["Mary", "mary@mail.com"]
        ]);

    // 3 accounts with same details that needs to be merged
    expect(
        merge([
          ["John", "johnsmith@mail.com", "john00@mail.com"],
          ["John", "johnnybravo@mail.com"],
          ["John", "johnsmith@mail.com", "john_newyork@mail.com"],
          ["Mary", "mary@mail.com"],
          ["John", "johnsmith@mail.com", "john00@mail.com"],
        ]),
        [
          [
            "John",
            'john00@mail.com',
            'john_newyork@mail.com',
            'johnsmith@mail.com'
          ],
          ["John", "johnnybravo@mail.com"],
          ["Mary", "mary@mail.com"]
        ]);

    expect(
        merge([
          ["John", "johnsmith@mail.com", "john00@mail.com"],
          ["John", "johnnybravo@mail.com"],
          ["John", "johnsmith@mail.com", "john_newyork@mail.com"],
          ["John", "johnnybravo@mail.com"],
          ["John", "johnsmith@mail.com", "john_newyork@mail.com"],
          ["Mary", "mary@mail.com"]
        ]),
        [
          [
            'John',
            'john00@mail.com',
            'john_newyork@mail.com',
            'johnsmith@mail.com'
          ],
          ['John', 'johnnybravo@mail.com'],
          ['Mary', 'mary@mail.com']
        ]);

        expect(
        merge([
          ['john', 'a', 'b'],
          ['john', 'a', 'b'],
          ['john', 'a', 'b'],
          ['john', 'c', 'd'],
          ['john', 'b', 'c'],
          ['john', 'e', 'd'],
          ['john', 'e', 'f'],
          ["Mary", "mary@mail.com"]
        ]),
        [
          ['john', 'a', 'b', 'c', 'd', 'e', 'f'],
          ['Mary', 'mary@mail.com']
        ]);

  });
}
