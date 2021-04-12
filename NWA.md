# Nested Word Automata









---
## Nested-Word Automata

simple definition Blass and Alur
$(Q, Q_{in}, Q_f, \delta)$ over $\Sigma$ where $\delta = (\delta_c, \delta_i, \delta_r)$, 

- $\delta_c \subseteq Q \times \Sigma \times Q$, 
- $\delta_i \subseteq Q \times \Sigma \times Q$, 
- $\delta_r \subseteq Q \times Q \times \Sigma \times Q$. 

run over nested word $(a_1\ldots a_k, ⇢)$ = sequence $q_0, \ldots, q_k$ such that
- $q_0 \in Q_{in}$
- for all $i$ call position of $⇢$, $(q_{i-1}, a_i, q_i) \in \delta_c$, 
- for all $i$ internal position of $⇢$, $(q_{i-1}, a_i, q_i) \in \delta_i$, 
- for all $i$ return position of $⇢$,  with $j⇢i$,
  $(q_{i-1}, q_{j-1}, a_i, q_i) \in \delta_r$.

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

