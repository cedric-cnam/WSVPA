about the two first remarks in review 1, presented as "major problems in the proof of Prop.3":

1. indeed, there are no edges from $Q\times Q$ to $Q\times P\times Q$.
   It means that the weight, by $\eta_A$, of every such edge is 0 (of the semiring).
   It is generally the convention for missing edges in weighted graphs or missing transition of weighted automata. However, we could have staten it explicitely.

2. the weight the edges from $Q\times P\times Q$ to $Q\times P\times Q$ is actually an element of the semiring $S$.  

The typing is as follows:   
on the one hand, 

- $w_i(...) \in \Phi_{ci}$
- $\oplus_{\Delta_i} w_i \in \Phi_{c}$

on the other hand, 

- $w_c(...) \in \Phi_{cc}$   
- $w_r(...) \in \Phi_{cr}$   
- $\oplus_{\Delta_r} w_r \in \Phi_{c}$
- $w_c(...) \otimes_2 \oplus_{\Delta_r} w_r \in \Phi_{c}$

Hence $\oplus_{\Delta_r}$ of the sum of the two above terms (i.e. $\eta_A$ of the edge) is in $S$.
