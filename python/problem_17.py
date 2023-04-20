labels = ["", " Thousand ", " Million ", " Billion "]
digit = {1:"One", 2:"Two", 3:"Three", 4:"Four", 5:"Five", 6:"Six", 7:"Seven", 8:"Eight", 9:"Nine"}
teens = {10:"Ten", 11:"Eleven", 12:"Twelve", 13:"Thirteen", 14:"Fourteen", 15:"Fifteen", 16:"Sixteen", 17:"Seventeen", 18:"Eighteen", 19:"Nineteen"}
tens = { 2:"Twenty", 3:"Thirty", 4:"Forty", 5:"Fifty", 6:"Sixty", 7:"Seventy", 8:"Eighty", 9:"Ninety"}

def tensname(a,b):
    if a!="0" and b!="0":
        return tens[int(b)]+" "+digit[int(a)]
    elif b=="0" and a!='0':
        return digit[int(a)]
    elif b!='0' and a=='0':
        return tens[int(b)]
    else:
        return None

def hundredsname(x):
    if all([c=='0' for c in x]):
        return None
    elif len(x)==1:
        return digit[int(x[0])]
    elif len(x)==2:
        if x[1]=="1":
            return teens[int(x[1]+x[0])]
        else:
            return tensname(x[0], x[1])
    else:
        if x[1]=="1":
            t= teens[int(x[1]+x[0])]
        else:
            t=tensname(x[0], x[1])
            if t is None:
                return digit[int(x[2])]+ " Hundred "
        if x[2]!="0":
            return digit[int(x[2])]+ " Hundred " + t
        else:
            return t

def name(n_):
    n=list(reversed(n_))
    i=0
    ans = ""
    i=0
    j=0
    while i<len(n):
        threegroup = n[i:i+3]
        i+=3
        #print(threegroup)
        threename = hundredsname(threegroup)
        if threename is not None:
            ans = threename + labels[j] + ans
        j+=1
    return ans

t = int(input())
for i in range(t):
    n = input()
    print(name(n))
