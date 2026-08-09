#include <iostream>
using namespace std;

void print(const int arr[]) {
    for (int i = 0; i < 4; i++) {
        cout << arr[i] << " ";
    }
}

int main() {
    const int arr[] = {91, 97, 94, 84};
    print(arr);
    return 0;
}
