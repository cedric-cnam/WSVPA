# Nested Word Automata etc


model of extended automata :
- for structured words (pushdown variants)
- weighted 
- infinite alphabet (symbolic)

see also https://www.cis.upenn.edu/~alur/nw.html


---
## Nested-Word Automata

simple definition Blass and Alur
$`(Q, Q_{in}, Q_f, \delta)`$ over $`∑`$ where $`\delta = (\delta_c, \delta_i, \delta_r)`$, 

- $`\delta_c \subseteq Q \times \Sigma \times Q`$, 
- $`\delta_i \subseteq Q \times \Sigma \times Q`$, 
- $`\delta_r \subseteq Q \times Q \times \Sigma \times Q`$. 

run over nested word $`(a_1\ldots a_k, ⇢)`$ = sequence $`q_0, \ldots, q_k`$ such that
- $`q_0 \in Q_{in}`$
- for all $`i`$ call position of $`⇢`$, $`(q_{i-1}, a_i, q_i) \in \delta_c`$, 
- for all $`i`$ internal position of $`⇢`$, $`(q_{i-1}, a_i, q_i) \in \delta_i`$, 
- for all $`i`$ return position of $`⇢`$,  with $`j⇢i`$, $`(q_{i-1}, q_{j-1}, a_i, q_i) \in \delta_r`$.

it means that at call position, the current state is pushed to the stack, and it is popped at return positions.




---
## Motley-word automata

> A note on nested words
> A. Blass, Y. Gurevich
> Microsoft Research. 2006.
https://www.microsoft.com/en-us/research/publication/180-a-note-on-nested-words/

results:
- For every regular language of nested words, the underlying strings form a context-free language, and every context-free language can be obtained in this way. 
  (pushdown automata can recognize the projections of nested words)
- Nested words and nested-word automata are generalized to motley words and motley-word automata. 
- Every motley-word automation is equivalent to a deterministic one. 
- For every regular language of motley words, the underlying strings form a finite intersection of context-free languages, and every finite intersection of context-free languages can be obtained in this way.




---
## Visibly Pushdown Automata


---
## Stepwise Hedge Automata



> Joachim Niehren, Momar Sakho
> Determinization and Minimization of Automata for Nested Words Revisited
> [Algorithms](www.mdpi.com/journal/algorithms) (*submitted*), 2021.
https://hal.inria.fr/hal-03134596





---
## Weighted Visibly Pushdown Automata
extension of VPA by assigning weights from a commutative semiring S to their transitions


> S. Kiefer, A. S. Murawski, J. Ouaknine, B. Wachter, and J. Worrell
> On the complexity of equivalence and minimisation for Q-weighted automata
> Logical Methods in Computer Science (LMCS), 9(1:8):1–22, 2013.

the equivalence problem for WVPA is showed to be logspace reducible to polynomial identity testing


---
## Weighted Nested Word Automata
nested-words are trees 
VPA recognize exactly word encodings (with matching open/close symbols) of regular nested-word languages

> C. Mathissen
> Weighted logics for nested words and algebraic formal power series
> In Automata, Languages and Programming, pages 221–232. Springer, 2008.

logical characterization of WNWA functions using a modification of WMSOL


---
## Symbolic Visibly Pushdown Automata


> Symbolic Visibly Pushdown Automata
> Loris D’Antoni and Rajeev Alur
> CAV 2014
https://link.springer.com/content/pdf/10.1007/978-3-319-08867-9_14.pdf



---
## Weighted nested word automata and logics over strong bimonoids

> Droste, Manfred, and Bundit Pibaljommee
> Weighted nested word automata and logics over strong bimonoids 
> International Journal of Foundations of Computer Science 25.05 (2014): 641-666.


---
## Weighted Logics for Nested Words and Algebraic Formal Power Series

> Weighted Logics for Nested Words and Algebraic Formal Power Series
> Christian Mathissen
> Logical Methods in Computer Science, Volume 6, Issue 1 (February 19, 2010) lmcs:854
https://arxiv.org/abs/1001.2175


---
## Weighted Specifications over Nested Words



> Weighted Specifications over Nested Words
> Benedikt Bollig, Paul Gastin, Benjamin Monmege
> FoSSaCS'13
https://hal.inria.fr/hal-00909035

in particular for WA learning:

> B. Balle and M. Mohri
> Spectral learning of general weighted automata via constrained matrix completion
> In Advances in neural information processing systems, pages 2168–2176, 2012.

> B. Balle and M. Mohri
> Learning Weighted Automata
> In Algebraic Informatics, pages 1–21. Springer, 2015.


**extension to semirings**

theorem of finite rank (square) works for $`\R`$ and $`\mathbb{C}`$, not general semirings,
because it uses the singular value decomposition (SVD) theorem.

extension to tropical semirings?
see the *symmetrized max algebra* 
= extended max algebra corresponding to R, called a
with an analogue SVD theorem

> B. De Schutter and B. De Moor
> The singular-value decomposition in the extended max algebra
> Linear Algebra and Its Applications, 250:143–176, 1997.

> B. De Schutter and B. De Moor
> The QR decomposition and the singular value decomposition in the symmetrized max-plus algebra revisited
> SIAM review, 44(3):417–454, 2002.


