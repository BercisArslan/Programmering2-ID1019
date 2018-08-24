defmodule Tenta do
  def new(id,brand,color) do
    {:car,id,brand,color}
  end
  def color({:car,_,_,color}) do
    color
  end
  def paint({:car,id,brand,_},color) do
    {:car,id,brand,color}
  end
  def once(list) do
    once(list,{0,0})
  end
  def once([],{sum,length}) do
    {sum,length}
  end
  def once([h|t],{sum,length}) do
    once(t,{sum+h,length+1})
  end
  def ack(m,n) do
    case {m,n} do
      {0,_} -> n+1
      {m,0} -> ack(m-1,1)
      {m,n} -> ack(m-1,ack(m,n-1))
    end
  end
  def eval([h|t]) do
    eval(t,h)
  end
  def eval([],ans) do
    ans
  end
  def eval([h|t],ans) do
    case h do
      '+' -> eval(t,ans,1)
      '-' -> eval(t,ans,0)
    end
  end
  def eval([h|t],ans,1) do
    eval(t,ans+h)
  end
  def eval([h|t],ans,0) do
    eval(t,ans-h)
  end
  def isomorfic(nil,nil) do
    true
  end
  def isomorfic({:tree,value,right,left},{:tree,value,right2,left2}) do
    case isomorfic(right,right2) do
    true -> isomorfic(left,left2)
    false -> false
    end
  end
  def mirror(nil) do
    nil
  end
  def mirror({:tree,value,treeright,treeleft}) do
    {:tree,value,mirror(treeleft),mirror(treeright)}
  end

  def calc([h|t],x) do
    calc([h|t],x,0)
  end
  def calc([],x,ans) do
    ans
  end
  def calc([h|t],x,ans) do
    calc(t,x,ans*x + h)
  end

  def collect() do
    coll([])
  end
  def coll(res) do
    receive do
      msg -> coll([msg|res])
      :done -> res
    end
  end

  def available() do
    receive do
      request -> unavailable()
    end
  end
  def unavailable() do
    receive do
      :done -> available()
    end
  end
  #noder i trädet {:huf,zero,one}
  #löven i trädet {:char,char}
  def decode(list,tree) do
    decode(list,tree,tree)
  end
  def decode([],{:char,char},tree) do
    [char]
  end
  def decode([h|t],{:char,char),tree) do
    [char|decode(t,tree,tree)]
  end
  def decode(codedtext = [h|t],encodingtree = {:huf,zero,one},tree) do
    case h do
      1 -> decode(t,one,tree)
      0 -> decode(t,zero,tree)
    end
  end
  # frekvenstabell {:freq,{:char,char},f}
  def huffman([{:freq,{:char,char},f},{:freq,{:char,char2},f2}|t]) do
    huffman(insert({:freq,{:huff,char,char2},f+f2},rest)
  end

  def start(pid) do
    child = spawn_link(fn -> start(pid) end)
  end
  def init(pid) do
    send(pid,{request,self()})
  end
  def coordinator(pid) do
    receive do
      {:calc,pixle,point,max,collector} -> send(collector,{:color,pixle,color(mandel(point,max))})
      :done -> :done
    end
  end
  def start(width,height,x,y,k,max,ctrl) do
    spawn_link(fn -> manager(width,height,x,y,k,max,ctrl) end)
  end
  def manager(width,height,x,y,k,max,ctrl) do
    collector = spawn_link(fn -> collector())
    server(width,height,x,y,k,max,collector)
  end

end
