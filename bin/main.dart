/// Challenge
/// Accounts Merge
// Given a list accounts, each element accounts[i] is a list of strings, where
// the first element accounts[i][0] is a name, and the rest of the elements are
// emails representing emails of the account.
//
// Now, we would like to merge these accounts. Two accounts definitely belong to
// the same person if there is some email that is common to both accounts. Note
// that even if two accounts have the same name, they may belong to different people
// as people could have the same name. A person can have any number of accounts
// initially, but all of their accounts definitely have the same name.
//
// After merging the accounts, return the accounts in the following format: the
// first element of each account is the name, and the rest of the elements are
// emails in sorted order. The accounts themselves can be returned in any order.
/// Example 1:
/// Input:
// accounts = [["John", "johnsmith@mail.com", "john00@mail.com"],
// ["John", "johnnybravo@mail.com"], ["John", "johnsmith@mail.com", "john_newyork@mail.com"],
// ["Mary", "mary@mail.com"]]
/// Output: [["John", 'john00@mail.com', 'john_newyork@mail.com', 'johnsmith@mail.com'],
/// ["John", "johnnybravo@mail.com"], ["Mary", "mary@mail.com"]]
///

class Account {
  String name;
  List emailsList;
  Account({this.name, this.emailsList});

  bool anyCommonEmailBetweenTwoAccounts(Account anotherAccount) =>
      anotherAccount.emailsList.any((item) => this.emailsList.contains(item));

  Account mergeBothAccounts(Account account1, Account account2) {
    account1.emailsList.addAll(account2.emailsList);
    account1.emailsList.toSet().toList();
    account1.emailsList.sort();
    return account1;
  }
}

List<List> merge(List<List> listOfDuplicateAccounts) {
  //convert given list into list of objects
  List<Account> listOfAccounts = [];
  listOfAccounts = ListtoAccounts(listOfDuplicateAccounts);
  for (int i = 0; i < listOfAccounts.length; i++) {
    Account singleAccount = listOfAccounts[i];
    for (int j = i + 1; j < listOfAccounts.length; j++) {
      if (singleAccount.anyCommonEmailBetweenTwoAccounts(listOfAccounts[j])) {
        singleAccount =
            singleAccount.mergeBothAccounts(singleAccount, listOfAccounts[j]);
        listOfAccounts.removeAt(j);
        // print('j:$j j--:${j-1}');
        j--;
      }
    }
  }
  return AccountsToList(listOfAccounts);
}

// turn normal list of list of accounts into list of Account Objects
ListtoAccounts(List<List> listOfAccounts) {
  List<Account> accountsList = [];
  listOfAccounts.forEach((account) => accountsList
      .add(Account(name: account[0], emailsList: account.sublist(1).toList())));
  return accountsList;
}

// turn list of Account Objects into list of list of accounts
AccountsToList(List<Account> accountsList) {
  List<List> listOfAccounts = [];
  accountsList.forEach((accountObject) {
    List temp = [];
    temp.add(accountObject.name);
    temp.addAll(accountObject.emailsList);
    temp = temp.toSet().toList();
    listOfAccounts.add(temp);
  });
  return listOfAccounts;
}

//-------------
main() {
  List<List> duplicateAccountsList = [
    ["John", "johnsmith@mail.com", "john00@mail.com"],
    ["John", "johnnybravo@mail.com"],
    ["John", "johnsmith@mail.com", "john_newyork@mail.com"],
    ["John", "johnnybravo@mail.com"],
    ["John", "johnsmith@mail.com", "john_newyork@mail.com"],
    ["Mary", "mary@mail.com"]
  ];
  print(merge(duplicateAccountsList));
}
