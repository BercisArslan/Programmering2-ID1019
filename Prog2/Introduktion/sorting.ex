defmodule Sorting do

  def insertion(element,[]) do
    [element]
  end
  def insertion(element, list) do
    if(element > (hd list)) do
      [(hd list)|insertion(element,(tl list))]
    else
      [element,(hd list)|tl list]
    end
  end

  def isort(list) do
    isort(list,[])
  end
  def isort([],list2) do
    list2
  end
  def isort(list,list2) do
    isort((tl list),insertion((hd list),list2))
  end

  def sortlists([],list1,list2) do
    {list1,list2}
  end
  def sortlists([h|t],list1,list2) do
    sortlists(t,list2,[h|list1])
  end

  def msort([]) do
    []
  end
  def msort([a]) do
    [a]
  end
  def msort(list) do
    {list1,list2} = sortlists(list,[],[])
    a = msort(list1)
    b = msort(list2)
    merge(a,b)
  end
  def merge([a|t],[]) do
    [a|t]
  end
  def merge([],[b|t]) do
    [b|t]
  end
  def merge([ah|at],[bh|bt]) do
    case ah > bh do
      true -> [bh|merge([ah|at],bt)]
      false -> [ah|merge(at,[bh|bt])]
    end
  end

  def qsort([]) do
    []
  end
  def qsort([a]) do
    [a]
  end
  def qsort([p|t]) do
    {small,large} = qsplit(p,[p|t],[],[])
    a = qsort(small)
    b = qsort(large)
    a ++ b
  end
  def qsplit(_,[],small,large) do
    {small,large}
  end
  def qsplit(p,[h|t],small,large) do
    case h < p do
      true -> qsplit(p,t,[h|small],large)
      false -> qsplit(p,t,small,[h|large])
    end
  end
end
