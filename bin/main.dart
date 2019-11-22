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
List<List> merge(List<List> accountsList){
  List<List> output=[];
  List processesNames =[];
  for(int i=0;i<accountsList.length;i++){
    List<dynamic> temp=[];
    dynamic account = accountsList[i];
    // if(accountsList.sublist(i+1).contains(account[0]));
    temp.add(account);
    if(processesNames.contains(account[0])){
      continue;
    }
    temp.addAll(accountsList.sublist(i+1).where((item)=>item[0]==account[0]).toList());
    // print(megreSublists(temp));
    temp = temp.toSet().toList();
    temp = megreSublists(temp);
    output.add(temp);
    processesNames.add(account[0]);
    // print(temp);
    // break;
  }
  
  return output;
}

List megreSublists(List<dynamic> list){
  List temp=[];
  for(List sameAccount in list){
  temp.addAll(sameAccount.sublist(1));
  temp.sort();
  temp.insert(0, list[0][0]);
  }
  return temp.toSet().toList();
}


//-------------
main() {
  List<List> duplicateAccountsList = [["John", "johnsmith@mail.com", "john00@mail.com"],
["John", "johnnybravo@mail.com"], ["John", "johnsmith@mail.com", "john_newyork@mail.com"],
["Mary", "mary@mail.com"]];
  // merge(duplicateAccountsList);
List<Account> accountsList =[];
duplicateAccountsList.forEach((account)=>accountsList.add(Account(name: account[0],emailsList: account.sublist(1))));
print(accountsList);
}


class Account {
  String name;
  List emailsList;
  Account({this.name,this.emailsList});
}
