# Dynamic Time Warping

measure of similarity between 2 temporal (timestamped) sequences 
over an alphabet $`\Sigma`$ of timestamped symbols (finite or infinite).


---
**definition**

Let $`s, t ∈ \Sigma^*`$ of resp. lengths  $`n`$, $`m`$.
We consider alignments (= *match* $`M \in 1..n \times 1..m`$) between the 2 sequences, such that:

- Every index from $`s`$ sequence must be matched with one or more indices from $`t`$, and vice versa.

  $`\forall i \in 1..n\, \exists j \in 1..m \, M(i, j),\, \forall j \in 1..m\, \exists i \in 1..n \, M(i, j)`$
  
- The first index from $s$ must be matched with the first index from $`t`$ (but it does not have to be its only match).
  
  $`M(1,1)`$

- The last index from $s$ must be matched with the last index from $`t`$ (but it does not have to be its only match).

  $`M(n,m)`$

- The mapping of the indices from $`s`$ to indices from $t$ must be monotonically increasing, and vice versa, 
  
   i.e. if $`i < j`$ are indices from $`s`$, then there must not be two indices $`\ell > k`$ in the other sequence $`t`$, such that index $`i`$ is matched with index $`\ell`$ and index $`j`$ is matched with index $`k`$, and vice versa.
  
  for $`1 \leq i < j \leq n`$, $`1 \leq \ell < k \leq m`$ with $`M(i, \ell)`$ then $`\neg M(j, k)`$.

- [opt] *locality constraint*
  if  $`i`$ from $`s`$ is matched with $`j`$ from $`t`$, then $`|i - j| \leq W`$ (window parameter).

Using the alignements, a similarity measure is defined with value in a semiring $`S = ( K, \oplus, \otimes, 0, 1)`$
where

- $`K`$ is the domain of $`S`$
- $`0`$ is the neutral element for $`\oplus`$
- $`1`$ is the neutral element for $`\otimes`$

ex: minplus semiring where 
- $`K = \R^+ \cup \{ +\infty \}`$, 
- $`\oplus`$ is min, 
- $`0`$ is  $`+\infty`$
- $`\otimes`$ is +, 
- $`1`$ is 0 (in $`\R^+`$). 


The measure is based on a distance between symbols:
- $`\delta: ∑^2 \to S`$, 
- $`\delta(a, b) = |time(a) - time(b)|`$ for $`a, b \in \Omega`$.

Let $`s = s_1... s_n`$ and $`t = t_1 ... t_m`$.

The cost of an alignment $`M`$ in $`S`$ is $`\bigotimes_{(i, j) \in M} \delta(s_i, t_j)`$.

The measure is the value of an optimal alignment:

$`d(s, t) = \bigoplus_M \bigotimes_{(i, j) \in M} \delta(s_i, t_j)`$

ATTENTION: triangle inequality does not always hold!



see also the algebraic definition Mohri, which permits a more precise definition of the base cost of insertion and deletion of symbols, in [distance-languages.md](distance-languages.md) 

> Mehryar Mohri 
> Edit-distance of weighted automata: General definitions and algorithms
> International Journal of Foundations of Computer Science 14.06 (2003): 957-982.



Let $`\Omega = ∑ ⋃ \{ \epsilon \} \times ∑ ⋃ \{ \epsilon \} \setminus \{ (\epsilon, \epsilon) \}`$ and let $`h`$ be the morphism from $`\Omega^*`$ into $`∑^* \times ∑^*`$  defined over the concatenation of strings of $`∑^*`$ that removes the $`\epsilon`$'s.

An *alignment* between 2 strings  $`s, t ∈ \Sigma^*`$ is an element $`\omega ∈ \Omega^*`$ such that $`h(\omega) = (s, t)`$.

The base cost function is here defined over $`\Omega`$ : $`\delta: \Omega \to S`$, and for  $`\omega ∈ \Omega^*`$, $`\delta(\omega) = \bigotimes_{0 ≤ i < |\omega|} \delta(\omega_i)`$.

Then for  $`s, t ∈ \Sigma^*`$,  $`d(s, t) = \bigoplus_{\omega ∈ \Omega^*, h(\omega) = (s, t)} \delta(\omega)`$




---
**computation** (classical)

fill a $`n+1 \times m+1`$ matrix $`D`$
- $`D[0, 0] = 1`$ (minimum) and for all $`(i, j) \neq (0, 0)`$, $`D[i, j] = 0`$ (maximum)
- for all $`1 \leq i \leq n`$ and $`1 \leq j \leq m`$
  $`D[i, j] = \delta(s_i, t_j) \otimes \min (D[i-1, j], D[i, j-1], D[i-1, j-1])`$.

$`D[i, j]`$ is the distance between $`s_1... s_i`$ and $`t_1 ... t_j`$, hence the distance $`d(s, t)`$ is $`D[n, m]`$.



---
**variant** with *locality constraint*:

- initially $`D(i, j) = 1`$ (minimum) for all $`1 \leq i \leq n`$ and $`\max(1, i-\omega) \leq j \leq \min(m, i+W)`$. 
- recompute $`D`$ for all $`1 \leq i \leq n`$ and $`\max(1, i - W) \leq j \leq \min(m, i + W)`$. 



---
**complexity** DTW

- classical: TIME and SPACE $`O(|s| . |t|)`$ 

  i.e. $`O(n^2)`$ if $`|s| = n \geq m = |t|`$.

- subquadratic TIME and SPACE $`O(\frac{n^2}{\log \log n})`$ 

  [Gold and Sharir 2018 JACM] https://doi.org/10.1145/3230734

- SPACE $`O(|s| + |t|)`$ 

  [Tralie and Dempsey 2020 ISMIR] https://arxiv.org/abs/2008.02734


---
**accelerations**

Fast DTW
> Stan Salvador, Philip Chan
> FastDTW: Toward Accurate Dynamic Time Warping in Linear Time and Space
> KDD Workshop on Mining Temporal and Sequential Data, pp. 70–80, 2004.

Sparse DTW
> Al-Naymat, G., Chawla, S., Taheri, J.
> SparseDTW: A Novel Approach to Speed up Dynamic Time Warping.
> 2012

pruned DTW
> Silva, D. F., Batista, G. E. A. P. A.
> Speeding Up All-Pairwise Dynamic Time Warping Matrix Calculation.
> 2015


Multiscale DTW (audio)
> Meinard Müller, Henning Mattes, and Frank Kurth
> An Efficient Multiscale Approach to Audio Synchronization
> ISMIR 2006.

> Thomas Prätzlich, Jonathan Driedger, and Meinard Müller 
> Memory-Restricted Multiscale Dynamic Time Warping
> IEEE ICASSP 2016.


