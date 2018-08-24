
:lambda :abstraction
f(x) = 2x + 5
skriven som lambda funktion blir detta
λx.2x+5 eller λx -> 2x+5
om vi sedan vill ge ett argument till denna funktion f(2) = 2*2+5
(λx -> 2x+5)2 så skrivs funktionen med parantes runt och argumentet efter.

när man pratar om lambda funktioner finns det även en till sak att tänka på, fria och bundna variabler.
i exemplet ovan är x en bunden variabel eftersom funktionen beror av den, det är en del av argumentet.

i funktionen λx = 2x + y är y en fri variabel medan x är bunden.

:alpha :conversion innebär att man rename de :bundna variablerna. detta verkar som en simpel grej men man måste vara noga med att
inte rename en variabel så att en funktion inte längre ger samma output som innan.

λx -> x + y (alpha conversion, byt x till y) λy -> y + y vilket INTE ger samma output som innan conversion.

:beta :reduction innebär att man substituerar bundna variabler med "argument expression in the body of the abstraction"
en substituionen i en beta reduction skrivs [x/3] där x byts ut mot 3.

(λx -> (λy -> x + y))[x/3] vilket ger λy -> 3 + y MEN vad skulle hända om det var [x/y] istället? det skulle ge
λy -> y + y vilket förmodligen inte betyder samma sak längre. därför utför man en alpha conversion innan man gör en beta reduction
för att förebygga att något sådant händer. så tex gör man först en alpha reduction från y till z och sedan är beta reduction
möjlig att göra utan att uttryckets mening ändras.

1. alpha reduction λx -> (λz -> x + z)
2. beta reduction [x/y] λz -> y + z

till sist finns η-conversion (:eta :conversion) som används på fria variabler till skillnad från aplha/beta.
den används för att reducera uttryck som är onödiga. till exempel funktionen

λx -> (λy -> y + 2)x blir med eta conversion λy -> y + 2 eftersom x som argument inte tillför något.

Hur Relateras Detta Till Funktionell Programmering, Som Elixir?

i elixir är λ utbytt mot fn. λx -> x + 2 skrivs som fn(x) -> x + 2 end och argumenten skrivs med .(2) efter end
