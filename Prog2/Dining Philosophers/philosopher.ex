defmodule Philosopher do
  def sleep(t) do
    :timer.sleep(:rand.uniform(t))
    #:timer.sleep(t)
  end

  def timeout(t) do
    :rand.uniform(t)
  end

  def start(hunger,right,left,name,ctrl) do
    philosopher = spawn_link(fn -> dreaming(hunger,right,left,name,ctrl) end)
  end

  def dreaming(0,_,_,name,ctrl) do
    IO.puts("#{name} is full")
    send(ctrl,:done)
  end
  def dreaming(hunger,right,left,name,ctrl) do
    IO.puts("#{name} is dreaming")
    sleep(100)
    waiting(hunger,right,left,name,ctrl)
  end

  def waiting(hunger,right,left,name,ctrl) do
    case Chopstick.request({:stick,left}) do
      :ok ->
        IO.puts("#{name} has received left chopstick")
        case Chopstick.request({:stick,right}) do
          :ok ->
            IO.puts("#{name} has received right chopstick")
            eating(hunger-1,right,left,name,ctrl)
        end
    end
  end

    def eating(hunger,right,left,name,ctrl) do
      IO.puts("#{name} is eating")
      sleep(100)
      Chopstick.return({:stick,right})
      IO.puts("#{name} has returned right chopstick")
      Chopstick.return({:stick,left})
      IO.puts("#{name} has returned left chopstick")
     dreaming(hunger,right,left,name,ctrl)
    end
end
