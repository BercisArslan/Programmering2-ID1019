defmodule Tenta do
  #den första metoden förklarar för varje ruta om det finns en pjäs eller inte på rutan.
  #för att leta efter positionen på pjäserna måste man därför söka igenom hela brädet.
  #i den andra metoden ser man positionen på alla pjäser om du söker igenom alla pjäser. dvs du måste söka igenom
  #alla pjäserna (istället för alla rutorna) för att hitta status.

  def seven([]) do
    []
  end
  def seven([h|t]) do
    case h do
      ?å -> [ ?} |seven(t)]
      ?ä -> [ ?{ |seven(t)]
      ?ö -> [ ?| |seven(t)]
      _ -> [h|seven(t)]
    end
  end

  # {:tree,val,left,right} | nil
  def traverse(nil) do
    []
  end
  def traverse({:tree,val,left,right}) do
    # kommer göra append n gånger men längden på det vi appendar förändras i logaritmisk följd dvs vi kommer besöka alla noderna
    # n gånger men gör append i formen lg n vilket ger komplexiteten O(n*lg(n))
    traverse(left) ++ [val|traverse(right)]
  end
  def better(tree) do
    traverse(tree,[])
  end
  def traverse(nil,element) do
    element
  end
  def traverse({:tree,val,left,right},element) do
    #här kommer komplexiteten endast vara O(n) eftersom vi behöver gå igenom alla element en gång
    #men cons operationen är konstant.
    traverse(left,[val|traverse(right,element)])
  end
  #kom til nil och skapa noden som ska läggas till i slutet av trädet
  def insert(nil,element) do
    {:tree,element,nil,nil}
  end
  def insert({:tree,val,left,right},element) do
    case element > val do
      #bygg på trädet genom att ha kvar grunden dvs {:tree,val,left,right}
      #då sparas noderna och allt tills man kommer till nil där noden till sist läggs tills
      #om vi bara hade skrivit tex true -> insert(right,element) då hade vi inte sparat resten av trädet.
      true -> {:tree,val,left,insert(right,element)}
      false -> {:tree,val,insert(left,element),right}
    end
  end
  def delete(nil) do
    nil
  end
  def delete({:tree,element,left,right},element) do
    {rest,max} = rightmost(left)
    {:tree,max,rest,right}
  end
  def delete({:tree,val,left,right},element) do
    case element > val do
      true -> {:tree,val,left,delete(right,element)}
      false -> {:tree,val,delete(left,element),right}
    end
  end

  <arithm> ::= <integer> | <var> | '(' <arithm> '-' <arithm> ')' | '(' <arithm> '+' <arithm> ')'
  <expression> ::= ... | <arithm>

  def create() do
    id = spawn_link(fn -> open() end)
  end
  def open() do
    receive do
      {:take,id} ->
        send(id,:granted)
        locked()
    end
  end
  def locked() do
    receive do
    :release -> open()
    end
  end
  def critical(idlock) do
    send(idlock,{:take,self()})
    receive do
      :granted -> 
        do_it()
    end
    send(idlock,:release)
  end
end
