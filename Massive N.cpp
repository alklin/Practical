#include <iostream>
using namespace std;
int main() {
    int N;
    cout << "Enter array size:  ";
    cin >> N;

    int A[100]; // максимум 100 элементов

    cout << "Enter elements N of array A  ";
    for (int i = 0; i < N; i++) {
        cin >> A[i];
    }

    int maxVal = A[0];
    int minVal = A[0];
    int imax = 0, imin = 0;

    for (int i = 1; i < N; i++) {
        if (A[i] > maxVal) {
            maxVal = A[i];
            imax = i;
        }
        if (A[i] < minVal) {
            minVal = A[i];
            imin = i;
        }
    }
    int start = min(imax, imin) + 1;
    int end = max(imax, imin);

    int sum = 0;

    for (int i = start; i < end; i++) {
        if (A[i] < 0) {
            sum += A[i];
        }
    }
    cout << "Sum of negative elements :"
        << sum << endl;

    return 0;

}