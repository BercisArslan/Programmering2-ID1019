defmodule Env do
  #return an empty environment
  def new() do
    []
  end

  #return an environment where the binding of the
  #variable id to the structure str has been added to the environment
  #env.
  def add(id, str, env) do
    [{id,str}|env]
  end

  #return either {id, str}, if the variable id was
  #bound, or nil
  def lookup(id, env) do
    List.keyfind(env,id,0,nil)
  end

  def remove([],env) do
    env
  end
  def remove(ids = [h|t], env) do
    case lookup(h,env) do
      nil -> remove(t,env)
      {_,_} -> remove(ids,List.keydelete(env,h,0))
    end
  end
end
