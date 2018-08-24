defmodule Kladd do

def test do
  z = 42
  x = {z,:foo}
  {y,_} = x
  y
  #fungerar eftersom foo är atom, {y,_} = {z,:foo} = {42,:foo}, y = 42
end
def test2 do
  [y,_] = []
  #kommer ej funka för att vi försöker plocka ut head specifikt
  #men det finns inte dont care kan va [] men y måste vara ett element
end
def test3 do
  [x,y,z] = [1|[2,3]]
  #funkar eftersom [1|[2,3]] = [1,2,3], y = 2
end
def test4 do
  x = 32
  z = [52]
  #y = [x,y]
  #fungerar inte eftersom y i listan är inte definierad.
end
#phone nr uppg
#sparad som int, string eller i list
#int = bra för aretmetik och jämförelser
#string = skriva ut
#lista, change individual numbers

def freq(key,[]) do
  [{key,1}]
end
def freq(key,[{key,freq}|t]) do
  [{key,freq+1},t]
end
def freq(key,[h|t]) do
  [h|freq(key,t)] #spara head så man kan returnera hela listan
end

def fraq([]) do
  []
end
def fraq(keys = [h|t]) do
  freq(h,fraq(t))
end

def new() do
  {:queue,[],[]}
end
def enqueue(elem,queue = {:queue,first,last}) do
  {:queue,first,[elem|last]}
end
def dequeue({:queue,[],[]}) do
  :fail
end
def dequeue({:queue,first = [h|t],last = [h1,t1]}) do
  {:ok,h,{:queue,[t],last}}
end
def dequeue({:queue,[],last}) do
  [elem,rest] = reverse(last)
  {:ok,elem,{:queue,[rest],[]}}
end

end
