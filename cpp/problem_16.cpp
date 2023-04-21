#include <cmath>
#include <cstdio>
#include <vector>
#include <iostream>
#include <algorithm>

using namespace std;

int powerDigitSum(int n){
    // handles big enough ints but too slow
    // for hackerrank
    
    // 2^N as an array of digits
    int len=3012; //2^10000 is 3011 digits
    int digits[len]={ }; // initialize to zero
    int d;
    int carry;
    int filled=1;
    digits[0]=1; //initial state: 2^0=1
    for (int i=1;  i<=n; i++){ //double n times
    carry=0;
        for (int j=0;j<=filled;j++){ //go over all digits
            d=digits[j]*2+carry;
            if (d>=10){
                digits[j]=d-10;
                carry=1;
            }
            else{
                digits[j]=d;
                carry=0;
            }
    
        }
        if (carry==1){
            digits[filled+1]=1;
            filled++;
        }
    }
    int sum = 0;
    for (int j=0;j<len;j++){ 
        sum=sum+digits[j];
    }
    return sum;
}

int powerDigitSumLimited(int n){
    // only for small numbers where 2^n is small
    int p=pow(2,n); //long long wouldn't be big enough either
    std::string str = std::to_string(p);
    int len =str.length();
    int sum=0;
    for (int i=0; i<len;i++){
        //(int) converts to ASCII value.
        // numbers '0' to '9' are ASCII values
        // 48 to 57
        sum += (int)str[i] - 48;
    };
    return sum;
}

int main() {
    int T;
    scanf("%d", &T);
    for (int i=0; i<T; i++){
    int N;
    scanf("%d", &N);
    int  ans = powerDigitSum(N);
    printf("%d\n", ans); }
    return 0;  
    return 0;
}
