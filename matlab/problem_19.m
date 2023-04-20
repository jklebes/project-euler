month_lengths=[31 28 31 30 31 30 31 31 30 31 30 31];
assert(length(month_lengths)==12);

%year numbers
years=(1900:2000);
%filter indentiying leap years
leap_years=mod(years,4)==0&~mod(years,100)==0 | mod(years,400)==0;

%big array of month lengths 1900 to 2000
month_lengths_years = repmat(month_lengths, [length(years) 1]);
month_lengths_years(leap_years,2)=29;

%array of weekday of first of the month, coded 0(Sun) to 6(Sat)
first_weekdays=zeros( [length(years) 12]);
initial=1; %1 for monday
next=initial;
%fill sequentially by adding month length to previous starting weekday
for i=1:size(first_weekdays,1)
    for j=1:size(first_weekdays,2)
        first_weekdays(i,j)=next;
        next=mod(first_weekdays(i,j)+month_lengths_years(i,j),7);
    end
end

assert(first_weekdays(end-7,11)==1); %check my bday - Nov 1993 starts Mon

%identify and count sundays starting 1901
sundays=first_weekdays==0;
disp(sum(sundays(2:end,:),"all"));
