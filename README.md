# Idris
Idris é uma linguagem de programação puramente funcional com tipos dependentes , avaliação lenta opcional e recursos como um verificador de totalidade . Idris pode ser usado como assistente de prova , mas foi projetado para ser uma linguagem de programação de uso geral semelhante ao Haskell .

O sistema do tipo Idris é semelhante ao Agda , e as provas são semelhantes ao Coq , incluindo táticas . Comparado à Agda e à Coq, Idris prioriza o gerenciamento de efeitos colaterais e o suporte a idiomas específicos de domínio incorporados . Idris compila para C (confiando em um coletor de lixo de cópia personalizado usando o algoritmo de Cheney ) e JavaScript (tanto no navegador quanto no Node.js. ). Existem geradores de código de terceiros para outras plataformas, incluindo JVM , CIL e LLVM . 

O Idris 2, que possui um back-end do Chez Scheme e usa a teoria quantitativa dos tipos , está atualmente sendo trabalhado.

Idris recebeu o nome de um dragão cantor do programa infantil de televisão britânico dos anos 70, Ivor the Engine .

# A programação funcional 
A sintaxe de Idris mostra muitas semelhanças com a de Haskell. Um programa hello world em Idris pode ser assim:

module  Main

main  :  IO  () 
main = putStrLn "Olá, mundo!"

# Tipos de dados indutivos e paramétricos 
Idris suporta tipos de dados definidos indutivamente e polimorfismo paramétrico . Esses tipos podem ser definidos tanto na sintaxe tradicional " Haskell98 ":

 Árvore de dados a =  Nó  ( Árvore a )  ( Árvore a )  |  Folha a
ou na sintaxe mais geral do GADT :

 Árvore de  dados :  Tipo  ->  Tipo  onde 
    Nó  :  Árvore a ->  Árvore a ->  Árvore a
     Folha  : a ->  Árvore a

# Tipos dependentes 
Com tipos dependentes , é possível que os valores apareçam nos tipos; com efeito, qualquer cálculo em nível de valor pode ser executado durante a digitação . A seguir, define um tipo de lista cujos comprimentos são conhecidos antes da execução do programa, tradicionalmente chamados de vetores :

data  Vect  :  Nat  ->  Tipo  ->  Tipo  onde 
  Nil   :  Vect  0 a
   (: :)  :  ( x : a )  ->  ( xs :  Vect na )  ->  Vect  ( n +  1 ) a

# Este tipo pode ser usado da seguinte maneira:

anexo  total :  Vect na ->  Vect ma ->  Vect  ( n + m ) a
acrescentar Nil        ys = ys
anexar ( x :: xs ) ys = x :: anexar xs ys