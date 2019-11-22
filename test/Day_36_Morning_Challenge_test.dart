import '../bin/main.dart';
import 'package:test/test.dart';
void main() {
  test("test case 1", () {
	expect(merge([["John", "johnsmith@mail.com", "john00@mail.com"],
 ["John", "johnsmith@mail.com", "john_newyork@mail.com"],
["Mary", "mary@mail.com"]]), [["John", 'john00@mail.com', 'john_newyork@mail.com', 'johnsmith@mail.com'],
  ["Mary", "mary@mail.com"]]);
  });
}
