defmodule Cmplx do

  # returns the complex number with real value r and imaginary i
    def new(r,i) do
      {r,i}
    end

  #adds two complex numbers a= {r,i} b= {r1,i1}
    def add({r,i}, {r1,i1}) do
      {r+r1,i+i1}
    end

    #squares a complex number (x + yi)^2 = {(x^2 − y^2), 2xy}
    def sqr({r,i}) do
      {(r*r)-(i*i),(2*r*i)}
    end

    #the absolute value of a = {r,i}
    def abs({r,i}) do
      :math.sqrt((r*r) + (i*i))
    end
end
