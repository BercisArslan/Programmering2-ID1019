defmodule Eager do
  def eval_expr({:atm, id}, _) do {:ok,id} end
  def eval_expr({:var, id}, env) do
    case List.keyfind(env,id,0,nil) do
      nil ->
        :error
      {_, str} ->
        {:ok,str}
      end
    end
    def eval_expr({:cons, h, t}, env) do
      case eval_expr(h, env) do
        :error ->
          :error
        {:ok, str} ->
        case eval_expr(t, env) do
          :error ->
            :error
          {:ok, str2} ->
            {str,str2}
        end
      end
    end

  # env = [{id,str}]
  def eval_match(:ignore, str, env) do
    {:ok, env}
  end
  def eval_match({:atm, id}, id, _) do
    {:ok, []}
  end
  def eval_match({:var, id}, str, env) do
    case List.keyfind(env,id,0,nil) do
      nil ->
        {:ok, Env.add(id,str,env)}
      {_, ^str} ->
        {:ok,env}
      {_, _} ->
        :fail
    end
  end

  def eval_match({:cons, hp, tp}, {:cons,hp2,tp2}, env) do
    case eval_match(hp, hp2, env) do
      :fail ->
        :fail
      {:ok,env2} ->
        eval_match(tp, tp2, env2)
    end
  end
  def eval_match(_, _, _) do
    :fail
  end

  def eval_seq([exp], env) do
    eval_expr(exp, env)
  end
  def eval_seq([{:match, ..., ...} | ...], ...) do
    case eval_expr(..., ...) do
      ... ->
        ...
      ... ->
        vars = extract_vars(...)
        env = Env.remove(vars, ...)
        case eval_match(..., ..., ...) do
          :fail ->
            :error
          {:ok, env} ->
            eval_seq(..., ...)
        end
    end
  end

  def extract_vars(list) do
    
  end


end
