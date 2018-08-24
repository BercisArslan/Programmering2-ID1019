defmodule Extenta do

  def init do
    spawn_link(fn -> start() end)
  end
  def start() do
    receive do
      's' -> s()
      _ -> start()
    end
  end

  def s() do
    receive do
      'e' -> se()
      's' -> s()
      _ -> start()
    end
  end

  1234 8765
  rev 8765 = 5678
  append 12345678

  9abcdef mlkjih
  mlkjihfedcbac9

  ny kö
  12345678 mlkjihfedcbac9

  rev mlkjihfedcbac9
  123456789abcdefhijklm

  <arithm> :: = <integer> | <var> | '('<arithm> '+' <arithm> ')' | '(' <arithm> '-' <arithm> ')'

  Eo((e1 + e2)) -> Eo(e1) + Eo(e2)

  def replace([],_,_) do
    []
  end
  def replace(list=[h|t],elem,0) do
    [elem|t]
  end
  def replace(list=[h|t],elem,index) do
    [h|replace(t,elem,index-1)]
  end

  def replace2([],_,_,_) do
    []
  end
  def replace2([h|t],elem,0,res) do
    reverse(res) ++ [elem] ++ t
  end
  def replace2([h|t],elem,index,res) do
    replace2(t,elem,index-1,[h|res])
  end

  #för att använda maps måste man skriva Enum

  Enum.map([0,1,2],fn(x) -> 2*x end)
  Enum.map(['hell ',(fn(c) ->
    case c do
    ' ' -> 'o'
  _ > c
end
end)
end
