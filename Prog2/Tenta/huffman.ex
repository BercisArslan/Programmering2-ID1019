defmodule Huffman do
  def sample do
  'the quick brown fox jumps over the lazy dog this is a sample text that we will use when we build up a table we will only handle lower case letters and no punctuation symbols the frequency will of course not represent english but it is probably not that far off'
  end

  def text() do
    'this is something that we should encode'
  end

  def test do
    sample = sample()
    tree = tree(sample)
    encode = encode_table(tree)
    decode = decode_table(tree)
    text = text()
    seq = encode(text, encode)
    decode(seq, decode)
  end

  def tree(sample) do
    freq1 = freq(sample)
    s = List.keysort(freq1,1)
    huffman(s)
  end

  def freq(sample) do
    freq(sample, [])
  end
  def freq([], freq) do
    freq
  end
  def freq([char | rest], freq) do
    freq(rest,freq2(char,freq))
  end
  def freq2(char,[]) do
    [{char,1}]
  end
  def freq2(char,freq = [{char,number}|t]) do
    [{char,number+1}|t]
  end
  def freq2(char,freq = [h|t]) do
    [h|freq2(char,t)]
  end

  def huffman([_|[]] = list) do
    list
  end
  def huffman(freq = [{c1,f1},{c2,f2}|t]) do
   s =  List.keysort([{{c1,c2}, f1+f2}|t],1)
   huffman(s)
  end


  def encode_table(tree) do
    # To implement...
  end

  def decode_table(tree) do
  # To implement...
  end

  def encode(text, table) do
    # To implement...
  end

  def decode(seq, tree) do
    # To implement...
  end

end
