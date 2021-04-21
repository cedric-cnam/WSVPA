# Weighted Symbolic Visibly Pushdown Automata

addition of weighted to Symbolic VPA of

> Loris D’Antoni and Rajeev Alur
>
> Symbolic Visibly Pushdown Automata
> CAV 2014
> https://link.springer.com/content/pdf/10.1007/978-3-319-08867-9_14.pdf



- $`∑`$ input alphabet (infinite)
- semiring $`S = ( K, \oplus, \otimes, 0, 1)`$
- $`\Psi`$ rec. enumerable set of formula closed under Boolean op.
- $`Q`$ finite set of states

- $`Q_0 \subseteq Q`$ initial states
- $`P`$ finite set of stack symbols



## Scalar Weights

transitions



**internal**

```math
( q, \psi(x), w, q')
```

with 

- $`q, q' ∈ Q`$
- $`\psi(x) ∈ \Psi`$
- $`w ∈ K`$







