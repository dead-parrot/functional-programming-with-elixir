defmodule Ex4 do

  # Recursao de cauda e acumuladores

  # Aqui esta a versao recursiva normal que vimos para a funcao soma

  @doc "Soma os numeros a e b."
  def soma_rec(a, 0), do: a
  def soma_rec(a, b), do: 1 + soma_rec(a, b - 1)

  # Esta funcao nao apresenta recursividade de cauda, pois precisa somar
  # 1 ao resultado da chamada recursiva.

  # Escreva uma funcao similar de soma que tenha recursividade de cauda.
  # Use um parametro acumulador para evitar a soma apos a chamada recursiva.

  # Voce pode criar uma funcao auxiliar privada com o parametro acumulador,
  # ou fazer de outra forma.

  def soma(a, 0), do: a
  def soma(a, b), do: soma(a+1, b-1)


  # Escreva as funcoes a seguir usando recursividade de cauda. Se precisar,
  # crie funcoes auxiliares que usam um parametro acumulador.

  # Obs: os testes nao vao testar se as funcoes apresentam recursividade
  # de cauda ou nao, apenas se o objetivo da funcao e' cumprido.


  defp mult_acc(_a, 0, acc), do: acc
  defp mult_acc(a, b, acc), do: mult_acc(a, b-1, acc+a)
  @doc "Multiplica os numeros a e b (b >= 0), usando apenas somas."
  def mult(a, b), do: mult_acc(a, b, 0)


  defp tamanho_acc([], acc), do: acc
  defp tamanho_acc([_x | r], acc), do: tamanho_acc(r, acc+1)
  @doc "Obtem o tamanho da lista l."
  def tamanho(l), do: tamanho_acc(l, 0)


  defp replica_acc([], _n, acc), do: acc
  defp replica_acc(_l, 0, acc), do: acc
  defp replica_acc(l, n, acc), do: replica_acc(l, n-1, acc <> l)
  @doc """
  Replica a string s, n vezes.

  Exemplo:
  iex> Ex4.replica("ruby", 4)
  "rubyrubyrubyruby"
  """
  def replica(s, n), do: replica_acc(s, n, "")


  defp map_acc([], _f , acc), do: Enum.reverse(acc)
  defp map_acc([x | r], f, acc), do: map_acc(r, f, [f.(x) | acc])
  @doc """
  Aplica a funcao f em cada elemento da lista l, retornando uma nova lista
  com os elementos transformados.

  Exemplo:
  iex> Ex4.map([1, 2, 3], fn x -> x * 2 end)
  [2, 4, 6]
  """
  def map(l, f), do: map_acc(l, f, [])


  defp soma_lista_acc([], acc), do: acc
  defp soma_lista_acc([x | r], acc), do: soma_lista_acc(r, acc+x)
  @doc "Calcula a soma dos numeros da lista l."
  def soma_lista(l), do: soma_lista_acc(l, 0)


  defp mult_lista_acc([], acc), do: acc
  defp mult_lista_acc([x | r], acc), do: mult_lista_acc(r, acc*x)
  @doc "Calcula o produto dos numeros da lista l."
  def mult_lista(l), do: mult_lista_acc(l, 1)

  defp concat_lista_acc([], acc), do: acc
  defp concat_lista_acc([x | r], acc), do: concat_lista_acc(r, acc<>x)
  @doc "Retorna uma string que e' a concatenacao de todas as strings na lista ls."
  def concat_lista(ls), do: concat_lista_acc(ls, "")


  defp filter_acc([], _f , acc), do: Enum.reverse(acc)
  defp filter_acc([x | r], f, acc) do
    if f.(x) do
      filter_acc(r, f, [x | acc])
    else
      filter_acc(r, f, acc)
    end
  end
  @doc """
  Retorna uma lista com os elementos da lista l para os quais o predicado p
  returna true.

  Exemplo:
  iex> Ex4.filter([10, 2, 15, 9, 42, 27], fn x -> x > 10 end)
  [15, 42, 27]
  """
  def filter(l, p), do: filter_acc(l, p, [])

end
