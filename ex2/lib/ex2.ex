defmodule Ex2 do
  @moduledoc "Codigo para o Exercicio 2 de LPIII - Programacao Funcional"

  @doc "Retorna o terceiro elemento da lista l, ou nil caso l tenha menos de 3 elementos."
  def terceiro([]), do: nil
  def terceiro([_]), do: nil
  def terceiro([_h , _t]), do: nil
  def terceiro([ _ , _ , x | _]), do: x

  @doc "Obtem o tamanho da lista l"
  def tamanho([]), do: 0
  def tamanho([_h|t]), do: 1 + tamanho(t)

  # Um tipo comum de processamento de lista e' calcular um resultado levando
  # em consideracao todos os elementos da lista, por exemplo a soma ou
  # produto de uma lista de numeros.

  @doc "Calcula a soma dos numeros da lista l."
  def soma_lista([]), do: 0
  def soma_lista(l), do: hd(l) + soma_lista(tl(l))

  @doc "Calcula o produto dos numeros da lista l."
  def mult_lista([]), do: 1
  def mult_lista([h|t]), do: h * mult_lista(t)

  # Opcional: escreva uma versao de mult_lista que retorne zero assim que
  # encontrar um elemento 0 na lista, sem precisar ir ate' o fim da lista
  # e efetuar todas as multiplicacoes.

  def mult_list([]), do: 1
  def mult_list([0|_]), do: 0
  def mult_list([h|t]), do: h * mult_list(t)

  @doc "Retorna uma string que e' a concatenacao de todas as strings na lista ls."
  def concat_lista([]), do: ""
  def concat_lista([h|t]), do: h <> concat_lista(t)

  @doc "Retorna o maior numero em uma lista de numeros (nil se a lista for vazia)."
  def max_lista([]), do: nil
  def max_lista([x]), do: x
  def max_lista([h | t]), do: if max_lista(t) > h, do: max_lista(t), else: h

  # As vezes podemos querer uma parte dos elementos da lista, sejam
  # os primeiros ou ultimos.

  @doc """
  Retorna os primeiros n elementos da lista l.
  Se l tem n elementos ou menos, retorna a lista inteira.

  Exemplo:
  iex> Ex2.primeiros_n([1, 2, 3, 4], 2)
  [1, 2]
  """
  def primeiros_n([], _n), do: []
  def primeiros_n(_l, 0), do: []
  def primeiros_n(l, n), do: [hd(l) | primeiros_n(tl(l), n-1)]


  @doc """
  Retorna os ultimos n elementos da lista l.
  Se l tem n elementos ou menos, retorna a lista inteira.

  Exemplo:
  iex> Ex2.ultimos_n([1, 2, 3, 4], 2)
  [3, 4]
  """
  def ultimos_n(l, n), do: retirar_n_primeiros(l, max(0, length(l)-n))

  def retirar_n_primeiros([], _n), do: []
  def retirar_n_primeiros(l, 0), do: l
  def retirar_n_primeiros(l, n), do: retirar_n_primeiros(tl(l), n-1)

  # Em algumas situacoes, queremos transformar cada elemento de uma lista da
  # mesma forma, obtendo uma nova lista com os resultados.

  @doc """
  Dada uma lista de numeros, retorna uma nova lista com os numeros da lista
  original, multiplicados por 2.

  Exemplo:
  iex> Ex2.dobro_lista([1, 2, 3, 4])
  [2, 4, 6, 8]
  """
  def dobro_lista([]), do: []
  def dobro_lista([x | r]), do: [2 * x | dobro_lista(r)]
  #def dobro_lista(l), do: [2*hd(l) | dobro_lista(tl(l)) ]

  @doc """
  Dada uma lista de numeros, retorna uma nova lista com os numeros da lista
  original elevados ao quadrado.

  Exemplo:
  iex> Ex2.quadrado_lista([1, 2, 3, 4])
  [1, 4, 9, 16]
  """
  def quadrado_lista([]), do: []
  def quadrado_lista([h | t]), do: [h*h | quadrado_lista(t) ]

  # Uma outra necessidade comum e' selecionar apenas os elementos de uma lista
  # que possuem alguma propriedade, por exemplo apenas os numeros positivos, ou
  # apenas as strings que comecam com uma letra maiuscula.

  @doc """
  Dada uma lista de numeros, retorna uma nova lista com os numeros positivos
  da lista original.

  Exemplo:
  iex> Ex2.positivos_lista([-2, 2, 0, 88, 15, -11, 42])
  [2, 88, 15, 42]
  """
  def positivos_lista([]), do: []
  def positivos_lista([x | r]) when x > 0, do: [x | positivos_lista(r)]
  def positivos_lista([ _ | r]), do: positivos_lista(r)

  #Dá pra fazer assim tbm:
  #def positivos_lista([h|t]), do: if (h > 0), do: [h | positivos_lista(t)], else: positivos_lista(t)


  def eh_par(0), do: true
  def eh_par(x), do: not eh_par(abs(x-1))
  @doc "Retorna apenas os numeros pares de uma lista de numeros."
  def pares_lista([]), do: []
  def pares_lista([h|t]), do: if (eh_par(h)), do: [h | pares_lista(t)], else: pares_lista(t)


  # Podemos querer fazer operacoes no agregado, combinando os elementos
  # de mesma posicao em duas listas, gerando uma terceira lista. Por exemplo,
  # somar as listas [1, 2, 3] e [4, 5, 6] elemento a elemento, resultando na
  # lista [5, 7, 9].

  @doc """
  Dadas duas listas de numeros, retorna uma lista com a soma de cada elemento
  de mesma posicao nas duas listas. Se uma das listas for menor que a outra,
  retorna uma lista do tamanho da menor.

  Exemplo:
  iex> Ex2.soma_listas([1, 2, 3], [7, 8, 9, 3])
  [8, 10, 12]
  """
  def soma_listas(_l1, []), do: []
  def soma_listas([], _l2), do: []
  def soma_listas(l1, l2), do: [hd(l1)+hd(l2) | soma_listas(tl(l1), tl(l2))]

  @doc """
  Dadas duas listas de strings l1 e l2, retorna uma lista em que cada elemento
  e' a concatenacao dos elementos de mesma posicao em l1 e l2.
  Se uma das listas for menor que a outra, retorna uma lista do tamanho da menor.

  Exemplo:
  iex> Ex2.concat_listas(["a", "b", "c"], ["x", "y", "z"])
  ["ax", "by", "cz"]
  """
  def concat_listas(_l1, []), do: []
  def concat_listas([], _l2), do: []
  def concat_listas(l1, l2), do: [hd(l1)<>hd(l2) | concat_listas(tl(l1), tl(l2))]

  # Algumas outras manipulacoes de listas.

  # Dica: para append, e' possivel resolver apenas fazendo recursao e seguindo
  # a estrutura de uma das listas e pensando qual deve ser a resposta quando essa
  # lista for vazia.

  @doc """
  Junta/concatena duas listas, retornando uma lista com todos os elementos da
  primeira seguidos pelos elementos da segunda.

  Exemplo:
  iex> Ex2.append([1, 2, 3], [4, 5, 6])
  [1, 2, 3, 4, 5, 6]
  """
  def append([], l2), do: l2
  def append(l1, l2), do: [hd(l1) | append(tl(l1), l2)]


  # Dica: para a funcao a seguir, pode ser necessario definir uma funcao auxiliar.

  @doc """
  Retorna uma lista apenas com os elementos de posicao (indice) par na lista l.
  Considere o primeiro elemento como posicao 1 (e nao 0 como seria o indice).

  Exemplo:
  iex> Ex2.posicoes_pares([2, 4, 6, 8, 10])
  [4, 8]
  """

  def posicoes_pares([]), do: []
  def posicoes_pares([_x]), do: []
  def posicoes_pares(l), do: [hd(tl(l)) | posicoes_pares(retirar_n_primeiros(l, 2))]

end
