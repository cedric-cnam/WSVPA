# Weighted Symbolic Automata with Data Storage


> Luisa Herrmann, Heiko Vogler
> Weighted Symbolic Automata with Data Storage
> DLT 2016: 203-215

**paper**

- https://link.springer.com/chapter/10.1007/978-3-662-53132-7_17
- https://dl.acm.org/citation.cfm?id=3081476.3081493
- doi: [10.1007/978-3-662-53132-7_17](https://doi.org/10.1007/978-3-662-53132-7_17)

**slides**

- https://wwwtcs.inf.tu-dresden.de/~herrmann/pdf/slides_dlt16.pdf



---

see also

> Luisa Herrmann 
> Weighted Automata with Storage
> PhD thesis. Technische Universität Dresden, 2020, 
> urn:nbn:de:bsz:14-qucosa2-740685

https://tud.qucosa.de/api/qucosa%3A74068/attachment/ATT-0/

---
**abstract**

We introduce weighted symbolic automata with data storage, which combine and generalize the concepts of

- automata with storage types,
- weighted automata, and
- symbolic automata.

By defining two particular data storages, we show that this combination is rich enough to capture

- symbolic visibly pushdown automata and
- weighted timed automata.

We introduce a weighted MSO-logic and prove a Büchi-Elgot-Trakhtenbrot theorem,
*i.e.*, the new logic and the new automaton model are expressively equivalent.


---
**Definition**

$A = (Q, \Pi, Q_0, Q_f, T, wt, \eta)$ Weighted Symbolic Automata with Data Storage over $(S, D, K)$ where:
- $S = (C, M, P, F, c_0)$ is a data storage type:
  - $C$ set of configurations
  - $M$ set of storage inputs
  - $P$ set of predicates over $C \times M$
  - $F$ set of functions $C \times M \to C$ (instructions)
  - $c_0 \in C$ (initial configuration)
- $D$ infinite set of input labels
- $K$ semiring
- $Q$ finite set of states
- $\Pi$ set of decidable predicates over $D$, Boolean-closed
- $Q_0 \subseteq Q$ (initial states)
- $Q_f \subseteq Q$ (final states)
- $T \subseteq Q \times \Pi \times P \times Q \times F$ (transitions)
- $wt: T \times D \to K$ (weight assignement)
- $\eta: D \to M$ (storage encoding)

$A$-configuration = triple of $Q \times D^* \times C$.

move with transition $\tau = (q, \pi, p, q', f)$:
$$
(q, dw, c) \to_\tau (q', w, f(c, \eta(d)))
$$
such that
- $q, q' \in Q$
- $d \in D$
- $w \in D^*$ 
- $c \in C$ 
- $\pi(d)$ is true
- $p(c, \eta(d))$ is true
- $f(c, \eta(d))$ is defined

computation = sequence of configurations chained with $\to_{\tau_i}$
its weight is the semiring K-product of $wt(\tau_i, d_i)$

---
**Expressiveness**

- can express Symbolic Visibly Pushdown Automata
with a specific data storage type (nested sets)

- can express Weighted Timed Automata
with a specific data storage type (simulating clocks)


- Weighted Symbolic MSO-Logic with Storage Behaviour
