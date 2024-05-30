#include <algorithm>
#include <chrono>
#include <iostream>
#include <thread>
#include <vector>

using namespace std;
//cl main.cpp /Zi /DEBUG /Od
int main() {
  vector<int> vec{1, 3, 4, 6, 7, 3, 4, 5};

  vec.push_back(3);

  vec.push_back(5);
  std::sort(vec.begin(), vec.end());

  std::string str("hello");

  std::string str2("world");

  while (1) {
    for (auto i : vec) {
      cout << i << " ";
    }
    std::string str3 = str + str2;

    cout << str3 << std::endl;

    std::this_thread::sleep_for(std::chrono::seconds(1));
  }

  return 0;
}
