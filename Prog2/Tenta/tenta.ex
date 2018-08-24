defmodule Tenta do

  def freq(key,[]) do
    [{key,1}]
  end
  def freq(key,[{key,freq}|t]) do
    [{key,freq+1}|t]
  end
  def freq(key,[h|t]) do
    [h|freq(key,t)]
  end

  def fraq(keys) do
    fraq(keys,[])
  end
  def fraq([],list) do
    list
  end
  def fraq(keys=[h|t],list) do
    fraq(t,freq(h,list))
  end

  def new() do
    {:queue,[],[]}
  end
  #lägg till i kön
  def enqueue(elem,{:queue,first,last}) do
    {:queue,first,[elem|last]}
  end
  #ta bort från listan
  def dequeue({:queue,[],[]}) do
    :fail
  end
  def dequeue({:queue,[],last}) do
    [h|t] = List.reverse(last)
    {:ok,h,{:queue,[t],[]}}
  end
  def dequeue({:queue,first = [h|t],last = [h2|t2]}) do
    {:ok,h,{:queue,t,last}}
  end

  def appqueue({:queue,first,last},{:queue,first2,last2}) do
    {:queue,List.append(first,List.reverse(last)),List.append(last2,List.reverse(first2))}
  end

  #str() :: = {:str, listofchars} | {:str,str(),str()}
  #eftersom str är definierat som ovan, och säg att str1/str2 = {:str,listofchars},
  #och eftersom en str är definierat som {:str,str(),str()} behöver man inte appenda något "egentligen"
  def str_append(str1, str2) do
    {:str,str1,str2}
  end

  def str_to_list(str = {:str,listofchars}) do
    listofchars
  end
  def str_to_list(str = {:str,lof1,lof2}) do
    List.append(str_to_list(lof1),str_to_list(lof2))
  end

  # bnf grammar:
  # :: = 'definieras som'
  # | 'eller'
  # <> 'kategorinamn'

 #<arithm> :: = <integer> | <var> | '('<arithm> '+' <arithm> ')' | '(' <arithm> '-' <arithm> ')'

 def start() do
   lock = spawn_link(fn -> closed() end)
 end

 def closed do
   receive do
     's' -> s()
     _ -> closed()
   end
 end

 def s() do
   receive do
     'e' -> se()
     's' -> s()
     _ -> closed()
   end
   end

   def se() do
     receive do
     's' -> ses()
     _ -> closed()
   end
 end

   def ses() do
     receive do
     'a' -> sesa()
     's' -> s()
     'e' -> se()
     _ -> closed()
   end
 end

 def sesa() do
   receive do
     'm' -> done()
     's' -> s()
     _ -> closed()
   end
 end

 def done() do
   open()
 end

 def open() do
   receive do
     {:msg,from} ->
       open()
       close -> closed()
       _ -> open()
   end
 end

 def test1 (x) do
   y = x+1
 end

 def test2(x) do
   y = x+2
 end

 def test3(x) do
   test1(x) |> test2
 end

#användning av case
def casefunc(x) do
  case x do
    [] -> :empty
    [e] -> :element
    [h|t] -> :list
  end
end
end
