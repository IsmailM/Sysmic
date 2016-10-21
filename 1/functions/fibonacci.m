function r = fibonacci(n)
  r = [];
  for elm = n 
    r = [r calculate_fibonacci(elm)];
  end

function f = calculate_fibonacci(n)
if (n== 0)
  f = 1;
elseif (n == 1)
  f = 1;
elseif (n == 2)
  f = 2;
else
  f = calculate_fibonacci(n-1) + calculate_fibonacci(n-2);
end
