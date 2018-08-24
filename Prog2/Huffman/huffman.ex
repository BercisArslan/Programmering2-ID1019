defmodule Huffman do

  def sample do
'the quick brown fox jumps over the lazy dog this is a sample text that we will use when we build up a table we will only handle lower case letters and no punctuation symbols the frequency will of course not represent english but it is probably not that far off'
end
def test do
  'hej jag heter bercis'
end

  def freq(sample) do
    freq(sample, [])
  end
  def freq([], freq) do
    freq
  end
  def freq([char|rest],freq) do
    freq(rest,frequpdate(char, freq))
  end

  def frequpdate(char,[]) do
    [{char,1}]
  end
  def frequpdate(char, [{char, val}|t]) do
    [{char, val+1} | t]
  end
  def frequpdate(char, [h|t]) do
    [h | frequpdate(char, t)]
  end

  def cnode([_|[]] = list) do
    list
  end
  def cnode([{c1,val1}|[{c2,val2}|t]]) do
    s = List.keysort([{{c1,c2}, val1+val2}|t],1)
    cnode(s)
  end

  def tree(sample) do
    temp = freq(sample)
    sorted = List.keysort(temp,1)
    cnode(sorted)
  end

  def encode_table(sample) do
    list = tree(sample)
    traverse(list)
  end

  def traverse([{tree,_}]) do
    traverse(tree,[])
  end
  def traverse({left,right}, list) do
    left = traverse(left,[0|list])
    right = traverse(right,[1|list])
    left ++ right
  end
  def traverse(char,list) do
    [{char,list}]
  end

  def encode(list) do
    table = encode_table(sample)
    encode((list),[],table)
  end
  def encode([],res,table) do
    res
  end
  def encode([char|rest],res,table) do
  encode(rest,makelist(char,res,table),table)
  end

  def makelist(char,res,table) do
    {_,list} = List.keyfind(table,char,0,nil)
    res ++ list
  end

  def decode([],_) do
    []
  end
  def decode(seq,table) do
    {char, rest} = decode_char(seq,1,table)
    [char|decode(rest,table)]
  end

 def decode_char(seq,n,table) do
    {code, rest} = Enum.split(seq,n)

    case List.keyfind(table,code,1) do
      {char,code} ->
        {char,rest}
      nil ->
        decode_char(seq,n+1,table)
    end
  end

end
