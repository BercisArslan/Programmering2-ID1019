defmodule Test do
  def double(n) do
    IO.puts("this is n: #{n}")
    IO.puts("this is n doubled: #{n*2}")
  end

  def ftoc(f) do
    c = (f-32)/1.8
    IO.puts("Celcius: #{c} grader")
  end

  def rectangle(a,b) do
    IO.puts("#{a*b}")
    IO.puts("#{a}")
    IO.puts("#{b}")
  end

  def square(c) do
    rectangle(c,c)
  end

  def circle(r) do
    r*r*:math.pi()
  end
  def product(_,0) do
    0
  end
  def product(0,_) do
    0
  end
  def product(a,b) do
  a + product(a, b-1)
  end

  def fall_velocity(n) do
    :math.sqrt(2*9.8*n)
  end

  def nth(0,list) do
    hd list
  end
  def nth(n,list) do
    nth(n-1,tl list)
  end

  def len(list) do
    len(0,list)
  end
  def len(n,[]) do
    n
  end
  def len(n,list) do
  len(n+1,tl list)
  end

  def sum(list) do
    sum(0,list)
  end
  def sum(n,[]) do
    n
  end
  def sum(n,list) do
    sum(n+(hd list), (tl list))
  end

  def duplicate(list) do
    duplicate(list,[])
  end
  def duplicate([],list2) do
    list2
  end
  def duplicate(list, list2) do
    duplicate((tl list), ((list2 ++ ([hd list]) ++ ([hd list]))))
  end

  def add(n, []) do
    [n]
  end
  def add(n,list) do
    if((hd list) !== n) do
    [hd list] ++ add(n,(tl list))
    else
      list
    end
  end

  def remove(n,[]) do
    [n]
  end
  def remove(n, list) do
    if((hd list) == n) do
      remove(n, (tl list)) -- [n]
    else
     [hd list] ++ remove(n, (tl list)) -- [n]
    end
  end

  def unique(list) do
    unique(list, [])
  end
  def unique([],list2) do
    list2
  end
  def unique(list, list2) do
    unique((tl list),add((hd list),list2))
  end

  def pack([]) do
    []
  end
  def pack(list) do
    [(list -- remove((hd list),list))|pack(remove((hd list),list))]
  end

  def reverse(list) do
    reverse(list,[])
  end
  def reverse([], list2) do
    list2
  end
  def reverse(list, list2) do
    reverse((tl list), [hd list] ++ list2)
  end

end
