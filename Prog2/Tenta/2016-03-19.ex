defmodule Tenta do
  @type str() :: [char()]| {:str,str()} | {:str,str(),str()}
  def concat({:str,str1},{:str,str2}) do
    {:str,str1,str2}
  end

  def reduce([]) do
    []
  end
  def reduce([h,h|t]) do
    reduce([h|t])
  end
  def reduce([h|t]) do
    [h|reduce(t)]
  end

  def encode([]) do
    []
  end
  def encode([h|t]) do
    case h do
      97 -> [120|encode(t)]
      98 -> [121|encode(t)]
      99 -> [122|encode(t)]
      32 -> [32|encode(t)]
      h -> [(h-3)|encode(t)]
    end
  end
  # {:card,val,:colour}
  def triss([]) do
    false
  end
  def triss([{:card,val,:color}|t]) do
    case :lists.filter(fn({:card,_,:c}) -> :c == :color end, t) do
      [_,_|_] -> true
      _ -> triss(t)
    end
  end

  def merge([h|t],[]) do
    [h|t]
  end
  def merge([],[h|t]) do
    [h|t]
  end
  def merge([h|t],[h2|t2]) do
    case h > h2 do
      true -> [h2|merge([h|t],t2)]
      false -> [h|merge(t,[h2|t2])]
    end
  end

  def heap_to_list(nil) do
    []
  end
  def heap_to_list({:heap,element,right,left}) do
    [element|merge(heap_to_list(right),heap_to_list(left))]
  end

  def pop(heap) do
    pop(heap,[])
  end
  def pop()
  def pop({:heap,element,right,left},newheap) do
    a = pop(right,[element|newheap])
    b = pop(left,newheap)
  end
end
