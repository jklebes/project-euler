#include <cmath>
#include <cstdio>
#include <vector>
#include <math.h>
#include <iostream>
#include <algorithm>
using namespace std;


int main() {
    int T;
    scanf("%d", &T);
    for (int i=0; i<T; i++){
    int N;
    //read stdin
    scanf("%d", &N);
    double log10of5 = 0.69897000433;
    double log10phi = 0.2089876402499;
    double estimate = (float(N)-1 + .5*log10of5)/log10phi;
    int index = ceil(estimate);
    printf("%d\n", index); }
    return 0;
}
