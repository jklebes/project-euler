#include <iostream>
#include <string>

class TenDigitInt{
    // my class TenDigitInt, a ring with its own operations
    // + and * mapping to truncated 10-digit results 
    public:
    unsigned long long int x;  //annoyingly 32 bits is just short of all 10 or 11 digit numbers
    
    unsigned long long int truncate(unsigned long long int &x){
        std::string s = std::to_string(x);
        uint l = s.length();
        if (l>10){
            s = s.substr(l-10, 10);
        }
        return stoull(s);
    }
    TenDigitInt(unsigned long long int x_in){
        x=truncate(x_in);
    }

    // overloading these operators
    TenDigitInt operator+(const TenDigitInt &b){
        return TenDigitInt(x+b.x); //truncated on construction
    }

    TenDigitInt& operator+=(const TenDigitInt &b){
        x += b.x;
        x = truncate(x);
        return *this;
    }

    TenDigitInt operator*(const TenDigitInt &b){
        return TenDigitInt(x*b.x);
    }
    
    TenDigitInt& operator*=(const TenDigitInt &b){
        x *= b.x;
        x = truncate(x);
        return *this;
    }

    TenDigitInt exp(const int &b){
        TenDigitInt result = TenDigitInt(1);
        for (int i=0; i<b; i++){
            result *= x;
        }
        return result;
    }
};

int main(){
    TenDigitInt x= TenDigitInt(998887776653534334ull);
    TenDigitInt result = TenDigitInt(0);
    uint query = 10;
    for (int i=1; i<=query; i++){
        TenDigitInt ti = TenDigitInt(i);
        result += ti.exp(i);
    }
    // TODO write a test: should be 0405071317 for query 10
    std::cout << result.x << std::endl;
    return 0;
}