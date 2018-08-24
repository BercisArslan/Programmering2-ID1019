defmodule Brot do

  # c = {r,i} m = max nr of iterations
  def mandelbrot(c,m) do
    z0 = Cmplx.new(0,0)
    i = 0
    test(i,z0,c,m)
  end

  def test(i,z0,c,m) when (i >= m) do
    0
  end
  def test(i,z0,c,m) do
    if Cmplx.abs(z0) >= 2.0 do
      i
    else
    test(i+1,Cmplx.add(Cmplx.sqr(z0),c),c,m)
    end
  end
end
