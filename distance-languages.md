# Distance between words and word languages


## Distance between words over finite alphabet
We consider an alphabet $`\Sigma`$ = fixed set of symbols (finite or not).

edit-distance $`d`$:
- defined over $`∑^* \times ∑^*`$ 
- into a semiring  $`S = ( K, \oplus, \otimes, 0, 1)`$ 
  $`K`$ is the domain
  $`0`$ is the neutral element for $`\oplus`$, absorbing for $`\otimes`$
  $`1`$ is the neutral element for $.`\otimes`$.

algebraic definition of edit-distance of Mohri, in 

> Mehryar Mohri 
> Edit-distance of weighted automata: General definitions and algorithms
> International Journal of Foundations of Computer Science 14.06 (2003): 957-982.



Let $`\Omega = ∑ ⋃ \{ \epsilon \} \times ∑ ⋃ \{ \epsilon \} \setminus \{ (\epsilon, \epsilon) \}`$ 

and let $`h`$ be the morphism from $`\Omega^*`$ into $`∑^* \times ∑^*`$  defined over the concatenation of strings of $`∑^*`$ (that removes the $`\epsilon`$'s).

An *alignment* between 2 strings  $`s, t ∈ \Sigma^*`$ is an element $`\omega ∈ \Omega^*`$ such that $`h(\omega) = (s, t)`$.



We assume a base cost function $`\Omega`$ : $`\delta: \Omega \to S`$, extended to $`\Omega^*`$ by  $`\delta(\omega) = \bigotimes_{0 ≤ i < |\omega|} \delta(\omega_i)`$  for $`\omega ∈ \Omega^*`$.



Then for  $`s, t ∈ \Sigma^*`$, the edit-distance between $`s`$ and $`t`$ is  $`d(s, t) = \bigoplus_{\omega ∈ \Omega^*, h(\omega) = (s, t)} \delta(\omega)`$.

e.g. Levenstein edit-distance: $`S`$ is min-plus and $`\delta(a, b) = 1`$ for all $`(a, b) ∈ \Omega`$.



Complexity for computation of $`d(s, t)`$:
  - classical : $`O(|s| . |t|)`$ [Wagner, Fisher 1974]
    assuming $`\Sigma`$ fixed and finite.
  - improved $`O(|s| + |t| + d^2)`$ [Ukonnen 1985]
  - subquadratic


## Distance between word languages
for alphabet $`\Sigma`$,
for $`L_1, L_2 \subseteq \Sigma^*`$, 
$`d(L_1, L_2) = \bigoplus_{s_1 \in L_1, s_2 \in L_2} d(s_1, s_2)`$. 

rem: we need to define infinite sums with $`\oplus`$.

Results:
- $`d(L_1, L_2)`$ computable in TIME $`O(| A_1| . | A_2 |)`$ (resp. sizes of automata) for $`L_1, L_2`$ regular.

> Mehryar Mohri , Fernando Pereira, and Michael Riley
> The design principles of a weighted finite-state transducer library
> Theoretical Computer Science 231.1 (2000): 17-32
https://www.sciencedirect.com/science/article/pii/S0304397599000146

> Cyril Allauzen, , Michael Riley, Johan Schalkwyk, Wojciech Skut, and Mehryar Mohri
> OpenFst: A general and efficient weighted finite-state transducer library
> In International Conference on Implementation and Application of Automata, pp. 11-23, 2007.
https://doi.org/10.1007/978-3-540-76336-9_3


- $`d(L_1, L_2)`$ computable in linear space for $`L_1`$ singleton, $`L_2`$ regular.

> Cyril Allauzen, Mehryar Mohri
> Linear-space computation of the edit-distance between a string and a finite automaton
> 2009
https://arxiv.org/abs/0904.4686  

see also

> Jorge Calvo-Zaragoza, Jose Oncina and Colin de la Higuera
> Computing the Expected Edit Distance from a String to a Probabilistic Finite-State Automaton
> International Journal of Foundations of Computer Science Vol. 28, No. 05, pp. 603-621 (2017) Special Issue: 21st International Conference on Implementation and Application of Automata (CIAA 2016)
https://doi.org/10.1142/S0129054117400093Cited by:2



- $`d(L_1, L_2)`$ not computable for $`L_1, L_2`$ CF.

reduction of non-emptiness of the intersection of 2 CF languages.

- $`d(L_1, L_2)`$ computable for $`L_1`$ regular and $`L_2`$ CF
  - PTIME algorithm based on unary homomorphisms
  - optimal alignment in worst case exponential in size of grammar automaton.

> Han, Yo-Sub, Sang-Ki Ko, and Kai Salomaa
> The edit-distance between a regular language and a context-free language
> International Journal of Foundations of Computer Science 24.07 (2013): 1067-1082.
https://doi.org/10.1142/S0129054113400315

- $`d(L_1, L_2)`$ computable for $`L_1, L_2`$ VPA ?
  (ref. ?) 


## Distance between weighted word languages (power series)
for $`A_1, A_2 : \Sigma^*  \to S`$ (power series),
$`d(A_1, A_2) = \bigoplus_{s_1, s_2 \in \Sigma^*} 
  A_1(s_1) \otimes d(s_1, s_2) \otimes A_2(s_2)`$ 

rem: the unweighted definition is a particular case of Boolean semiring ($`A_1`$, $`A_2`$ compute the characteristic functions of $`L_1`$ and $`L_2`$).


for $`∑`$ finite:
- for $`A_1`$,  $`A_2`$ defined by weighted automata, $`d(A_1, A_2)`$ is computated by the weighted transducer $`A_2 \circ T \circ A_1`$  where $`T`$ computed the distance $`d`$ between words, by
  - composition and $`\epsilon`$-removal of Weighted Transducers
  - determinizartion of WA
  - synchronization of Weighted Transducers w. bounded delays
  - for general E.D. that can be represented by finite weighted transducers
  - on-the-fly transducer's composition & pruning.

it is presented in the following paper:

> Mehryar Mohri 
> Edit-distance of weighted automata: General definitions and algorithms
> International Journal of Foundations of Computer Science 14.06 (2003): 957-982.



## Infinite Alphabet
infinite set of symbols $`\Sigma`$

**ex.**  [alphabet]
timestamped events (onsets, offsets), 
$`\Sigma`$ finite but huge for sampled dates (or IOI values), or infinite (rational values).

**ex.** [sequences] see [distance-performance-score](distance-performance-score.md).

- a music performance is a sequence of timestamped events ~ unquantified MIDI / piano roll.
- a score (music sheet) is also a sequence of timestamped events (with quantified timestamped)
  - quantified ("score") MIDI
  - structured with additional markups (parentheses): XML (MEI etc)

## Distance between words over infinite alphabet

for infinte alphabet $`\Sigma`$ 
**DTW** (for temporal sequences) see [DTW](DTW.md).

**ex.** distance between a performance and a score, using the above representations.
with the possibility of missing notes (?)
If the score contains markups, it is possible to ignore them in the computation, with appropriate deletion primitive values. see [distance-performance-score](distance-performance-score.md). 

**ex.** semiring containing as components:

- cumulated time-shifts
- a tempo curve

## Distance between word languages over infinite alphabet
languages defined by automata over infinite alphabet


Register automata

> Michael Kaminski and Nissim Francez
> Finite-Memory Automata
> Theor. Comput. Sci., 134(2):329–363, 1994.

Weighted case

> Mikołaj Bojanczyk, Bartek Klin, Joshua Moerman 
> Orbit-Finite-Dimensional Vector Spaces and Weighted Register Automata
https://arxiv.org/abs/2104.02438

Symbolic Automata framework (unweighted)

> Margus Veanes
> Applications of symbolic finite automata
> International Conference on Implementation and Application of Automata, 2013.

Questions:

- $`d(L_1, L_2)`$ computable for $`L_1, L_2`$ Symbolic Automata (SA) languages?
  (ref.?)
  
- and for Symbolic Visibly Pushdown Automata ?
  
> Loris D’Antoni and Rajeev Alur 
> Symbolic visibly pushdown automata
> International Conference on Computer Aided Verification. Springer, 2014.  
https://doi.org/10.1007/978-3-319-08867-9_14

definition of $`L(A_1, A_2)`$ must take care of relationship between the label theory (Boolean closed) for SA and the cost function for E.D. / DTW ?

**ex.** 

- $`A_1`$ is an automaton for prior score language. 
  The value in $`S`$ returned by is a measure of notational complexity of a score.
  Note that for markups, the language is not regular ($`A_1`$ is a VPA then).
- $`A_2`$ is a singleton automaton for a performance given $`s_2`$.
- the distance is then $`\bigoplus_{s ∈ \Sigma^*} A_1(s_1) \otimes d(s_1, s_2)`$, i.e. the combination of 2 criteria to optimise. 
  The best $`s_1`$ is a music score inferred for $`s_2`$ (transcription of $`s_2`$).

