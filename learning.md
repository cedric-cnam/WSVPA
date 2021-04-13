# Hankel Matrices for Weighted Visibly Pushdown Automata


> Labai N., Makowsky J.A.
> Hankel Matrices for Weighted Visibly Pushdown Automata
> In Language and Automata Theory and Applications (LATA). Lecture Notes in Computer Science, vol 9618. Springer, 2016.
https://link.springer.com/chapter/10.1007/978-3-319-30000-9_36

https://arxiv.org/abs/1512.02430


base:
- the Hankel matrix $H$ of a series $r$ : $H[u, v] = r(uv)$ (infinite)
- (Carlyle and Paz, 1971)
  for reals, the Hankel matrix $H$ of a rational series $r$ (rec. by WA) has a finite rank 
 (it is = *rank*$(r)$)

hence some WVPA series (e.g. Dyck lang.), non-rational, have a Hankel matrice of infinite rank.

notion of nested Hankel Matrix

- for real and complex valuations, 
  the Hankel matrix $H$ of a WVPA series $r$ has a rank $\leq n^2$ ($n$ nb states).
  (it is = *rank*$(r)$)




---
**abstract**


> Labai N., Makowsky J.A.
> Hankel Matrices for Weighted Visibly Pushdown Automata
> In Language and Automata Theory and Applications (LATA). Lecture Notes in Computer Science, vol 9618. Springer, 2016.
https://link.springer.com/chapter/10.1007/978-3-319-30000-9_36

https://arxiv.org/abs/1512.02430

base:
- the Hankel matrix $H$ of a series $r$ : $H[u, v] = r(uv)$ (infinite)
- (Carlyle and Paz, 1971)
  for reals, the Hankel matrix $H$ of a rational series $r$ (rec. by WA) has a finite rank 
 (it is = *rank*$(r)$)

hence some WVPA series (e.g. Dyck lang.), non-rational, have a Hankel matrice of infinite rank.

notion of nested Hankel Matrix

- for real and complex valuations, 
  the Hankel matrix $H$ of a WVPA series $r$ has a rank $\leq n^2$ ($n$ nb states).
  (it is = *rank*$(r)$)

---
**abstract**
Hankel matrices (aka connection matrices) of word functions and graph parameters have wide applications in automata theory, graph theory, and machine learning. We give a characterization of real-valued functions on nested words recognized by weighted visibly pushdown automata in terms of Hankel matrices on nested words. This complements C. Mathissen’s characterization in terms of weighted monadic second order logic.


---
**learning WVPA**
see spectral methods (for learning HMM), based on SVD of Hankel matrix
in particular for WA learning:

> B. Balle and M. Mohri
> Spectral learning of general weighted automata via constrained matrix completion
> In Advances in neural information processing systems, pages 2168–2176, 2012.

> B. Balle and M. Mohri
> Learning Weighted Automata
> In Algebraic Informatics, pages 1–21. Springer, 2015.


---
**extension to semirings**

theorem of finite rank (square) works for $\R$ and $\mathbb{C}$, not general semirings,
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


