# Weighted Symbolic Visibly Pushdown Automata


## definition 1 : Scalar Weights
generalization of SVPA to semiring weight domains

- $`∑`$ input alphabet, finite (large) or infinite,
  $`∑`$ is partitioned into $`\Sigma_i \uplus \Sigma_c \uplus \Sigma_r`$ respectively 
  - internal symbols denoted $`a`$
  - call symbols denoted $`(_a`$
  - return symbols denoted $`)_a`$
- semiring $`S = ( W, \oplus, \otimes, 0, 1)`$ of weight values:
  - $`W`$ is the weight domain
  - $`(W, \oplus, 0)`$ commutative monoid
  - $`(W, \otimes, 1)`$ monoid
  - $`\otimes`$ distributive over $`\oplus`$
  - $`0`$ absorbing for $`\otimes`$
  - $`\oplus`$ is extended to infinite sums
- $`\Phi_n`$ ($`n \geq 0`$) recursively enumerable set of functions from $`∑^n`$ into $`S`$, 
  closed under $`\oplus`$ and $`\otimes`$.
- $`Q`$ finite set of states
- $`Q_0 \subseteq Q`$ initial states
- $`P`$ finite set of stack symbols
- $`\delta_i \subseteq Q \times \Phi_1 \times Q`$ *internal* transitions (finite set)
- $`\delta_c \subseteq Q \times \Phi_1 \times Q \times P`$ *call* transitions (finite set)
- $`\delta_r \subseteq Q \times \Phi_2 \times P \times Q`$ *return* transitions (finite set)
- $`\delta_e \subseteq Q \times \Phi_1 \times Q`$ *empty-stack* return transitions (finite set)

weighted **computation steps**: read $`{\Sigma}^*`$ and update current configuration in $`Q \times (P\times \Sigma)^*`$ ($`(P\times \Sigma)^*`$ is the stack content):
- for $`(q, \phi(x), q') \in \delta_i`$ : 
  - read $`a \in \Sigma_i`$, 
  - update state from $`q`$ to $`q'`$, 
  - do not touch the stack  
  - weight is $`\phi(a)`$
- for $`(q, \phi(x), q', p) \in \delta_c`$ : 
  - read $`(_a \in \Sigma_c`$, 
  - update state from $`q`$ to $`q'`$, 
  - push $`(p, a)`$ to the stack  
  - weight is $`\phi(a)`$
- for $`(q, \psi(x, y), p, q') \in \delta_r`$ : 
  - read $`)_b \in \Sigma_r`$, 
  - update state from $`q`$ to $`q'`$, 
  - pop $`(p, a)`$ from the stack 
  - weight is $`\psi(a, b)`$
- for $`(q, \phi(x), q') \in \delta_e`$ : 
  - read $`)_a \in \Sigma_r`$, 
  - update state from $`q`$ to $`q'`$, 
  - the stack is empty
  - weight is $`\phi(a)`$.

The set of computations (**runs**) $`R(s)`$ over a string of $`s \in {\Sigma}^*`$ is the set of sequence $`\rho`$ of configurations following transitions as above, the weight $`w(rho)`$ of the computation $`\rho`$ is the product with $`\otimes`$ of the weights of the transitions involved.

The **weight** of the sequence $`s \in {\Sigma}^*`$ for the automaton is $`\bigoplus_{\rho \in R(s)} w(\rho)`$.  

This model generalizes Symbolic VPA from Boolean semirings to arbitrary semirings.

> Loris D’Antoni and Rajeev Alur
> Symbolic Visibly Pushdown Automata
> CAV 2014
https://link.springer.com/content/pdf/10.1007/978-3-319-08867-9_14.pdf

The weight of transitions act as guard: a transition is activated for a symbol $`a`$ iff its weight $`\phi(a) \neq 0`$ (or $`\psi(a, b) \neq 0`$), the absorbing element.




## definition 2 : Functional Weights
we follow a definition of weighted automata with functions updating weight, like
> Liang Huang, David Chiang
> Better k-best Parsing
> Proceedings of the 9th International Workshop on Parsing Technologies, 2005. 
https://www.aclweb.org/anthology/W05-1506/

- $`\Phi_n`$ ($`n \geq 0`$) recursively enumerable set of functions from $`W \times ∑^n`$ into $`S`$, 
  closed under $`\oplus`$ and $`\otimes`$.

every **configuration** $`(w, q, c) \in W \times Q \times (P\times \Sigma)^*`$ where
- $`w \in W`$ is the current weight,
- $`q \in Q`$ is the current state,
- $`c \in (P\times \Sigma)^*`$ is the current stack content.

weighted **computation steps**: read $`{\Sigma}^*`$ and update the current configuration $`(w, q, c) \in W \times Q \times (P\times \Sigma)^*`$ into $`(w', q', c')`$ as follows:
- for $`(q, \phi(x), q') \in \delta_i`$, reading $`a \in \Sigma_i`$, 
  - $`c' = c`$,
  - $`w' = w \otimes `\phi(a)`$,
- for $`(q, \phi(x), q', p) \in \delta_c`$, reading $`(_a \in \Sigma_c`$, 
  - $`c' = c . (p, a)`$,
  - $`w' = w \otimes \phi(a)`$,
- for $`(q, \psi(x, y), p, q') \in \delta_r`$, reading $`)_b \in \Sigma_r`$, and with $`c = (p, a).d`$
  - $`c' = d`$,
  - $`w' = w \otimes \psi(a, b)`$
- for $`(q, \phi(x), q') \in \delta_e`$, reading $`)_a \in \Sigma_r`$, and with $`c = \emptyset`$
  - $`c' = \emptyset`$,
  - $`w' = w \otimes \phi(a)`$.

