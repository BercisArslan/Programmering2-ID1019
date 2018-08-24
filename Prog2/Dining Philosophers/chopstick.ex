defmodule Chopstick do

  def start do
    stick = spawn_link(fn -> available() end)
  end
  # send(skicka till, skickar från)
  def available() do
    receive do
      {:request, from} ->
      send(from, :ok)
      gone()
      :quit ->
         :ok
    end
  end

  def gone() do
    receive do
      :return ->
        available()
      :quit ->
        :ok
    end
  end
  #stick = {:stick,pid}
  def request({:stick, pid}) do
    send(pid,{:request,self()})
    receive do
      :ok ->
         :ok
    end
  end

# def request({:stick, pid}, timeout) do
#    send(pid,{:request,self()})
  #  receive do
  #    :ok -> :ok
  #  after
  #    timeout ->
  #    :no
  #  end
  #end

  def return({:stick,pid}) do
    send(pid,:return)
  end

  def quit(c) do
    Process.exit(c, :kill)
  end
end
