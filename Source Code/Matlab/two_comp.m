function y = two_comp(x)
%converting into 2's complement in matlab, so that no need to change in verilog.
    c1 = not(x-'0');
    d = 1;

    for k=numel(x):-1:1
        r = d & c1(k);
        c2(1,k) = xor(d,c1(k));
        d = r;
    end
    q = int2str(c2);
    y = q(q ~= ' ');
end

