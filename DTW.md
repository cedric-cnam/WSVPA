# Dynamic Time Warping

measure of similarity between 2 temporal (timestamped) sequences 
over an infinite alphabet $`\Omega`$ of timestamped symbols.


---
**definition**

Let $`s, t \in \Omega^*`$ of lengths resp. $`n`$, $`m`$.
An By computation of optimal alignment (*match* $`M \in 1..n \times 1..m`$) between the sequences, such that:

- Every index from $s$ sequence must be matched with one or more indices from $t$, and vice versa.
```math
\forall i \in 1..n\, \exists j \in 1..m \, M(i, j)$, $\forall j \in 1..m\, \exists i \in 1..n \, M(i, j)
```
  
- The first index from $s$ must be matched with the first index from $`t`$ (but it does not have to be its only match).
```math
M(1,1)
```

- The last index from $s$ must be matched with the last index from $`t`$ (but it does not have to be its only match).
```math
M(n,m)
```

- The mapping of the indices from $`s`$ to indices from $t$ must be monotonically increasing, and vice versa, 
  i.e. if $`i < j`$ are indices from $`s`$, then there must not be two indices $`\ell > k`$ in the other sequence $`t`$, such that index $`i`$ is matched with index $`\ell`$ and index $`j`$ is matched with index $`k`$, and vice versa.
  for $`1 \leq i < j \leq n`$, $`1 \leq \ell < k \leq m`$ with $`M(i, \ell)`$ then $`\neg M(j, k)`$.

- [opt] *locality constraint*
  if $`i`$ from $`s`$ is matched with $`j`$ from $t$, then $`|i - j| \leq \omega`$ (window parameter).
  

Based on a distance between symbols, 
typically $`\delta(a, b) = |time(a) - time(b)|`$ for $`a, b \in \Omega`$.

Let $`s = s_1... s_n`$ and $`t = t_1 ... t_m`$.
The cost of an alignment $`M`$ is $`\bigotimes_{(i, j) \in M} \delta(s_i, t_j)`$.
The measure is the value of an optimal alignment:
```math
d(s, t) = \bigoplus_M \bigotimes_{(i, j) \in M} \delta(s_i, t_j)
```

ATTENTION: triangle inequality does not always hold.


---
**computation** (classical)

fill a $n+1 \times m+1$ matrix $D$
- $`D[0, 0] = 1`$ (minimum) and for all $`(i, j) \neq (0, 0)`$, $`D[i, j] = 0`$ (maximum)
- for all $`1 \leq i \leq n`$ and $`1 \leq j \leq m`$
  $`D[i, j] = \delta(s_i, t_j) \otimes \min (D[i-1, j], D[i, j-1], D[i-1, j-1])`$.

$`D[i, j]`$ is the distance between $`s_1... s_i`$ and $`t_1 ... t_j`$.

---
**variant** with *locality constraint*:
- initially $`D(i, j) = 1`$ (minimum) for all $`1 \leq i \leq n`$ and $`\max(1, i-\omega) \leq j \leq \min(m, i+\omega)`$. 
- recompute $`D`$ for all $`1 \leq i \leq n`$ and $`\max(1, i-\omega) \leq j \leq \min(m, i+\omega)`$. 

---
**complexity** DTW

- classical TIME and SPACE $`O(|s| . |t|)`$ i.e. $`O(n^2)`$ if $`|s| = n \geq m = |t|`$.
- subquadratic TIME and SPACE $`O(\frac{n^2}{\log \log n})`$ [Gold and Sharir 2018 JACM]
  https://doi.org/10.1145/3230734
- SPACE $`O(|s| + |t|)`$ [Tralie and Dempsey 2020 ISMIR]
  https://arxiv.org/abs/2008.02734


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


