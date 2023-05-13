pure integer function d(n)
! too slow for hackerrank, should have 
! done a prime factors algorithm plus a
! subsets algorithm
    integer, intent(in) ::n
    integer :: sq
    d=1
    sq=int(sqrt(real(n))) 
    do i=2,sq-1
        if (mod(n,i)==0) then
            d=d+i+n/i
        end if
    end do
    if (mod(n,sq)==0) then
        d=d+sq
    end if
end function

integer function sumpairs(n) result (s)
    integer, intent(in) :: n 
    integer :: i,j
    integer :: d
    s = 0
    do i=220,n-1 !all zero under 221
        j=d(i)
        !note j not necessarily < n.  if filtering
        !for both under n, answer not accepted.  but only
        ! the member i<n of the pair is added to the answer.
        if (j<i) then !filter to only check each pair once
            if (d(j)==i) then
                s = s+i+j
            end if
        else if (j>=n) then
            if (d(j)==i) then
                s = s+i
            end if
        end if
    end do
end function

program main
    implicit none
    integer :: t,n,j
    integer :: sumpairs
    read *, t
    do j=1,t
        read *, n
        write(*,"(8I0)") sumpairs(n)
    end do
end program
