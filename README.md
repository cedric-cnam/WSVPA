# Weighted-Transducers-based framework of Mohri et al. and Music Transcription

notes on a model of Weighted Symbolic Visibly Pushdown Automata for Music Notation Processing (Zettelkasten)

Theoretical framework for automated music transcription and performance analysis.

More conventional than in the paper MCM'19 : based on small extensions of standard tools : 




## Approach of Mohri et al.

to the computation of (string) edit-distances between (string) languages

**principle:**
- the distance $`d(s, t)`$ between two strings $`s`$ and $`t`$ is defined by a weighted-transducer $`T`$
  (that permits to define Levenshtein edit-distance and goes well beyond)
- the distance  $`d(L_1, L_2)`$  between 2 string languages $`L_1`$ and $`L_2`$ is the min of $`d(s, t)`$ for $`s ∈ L_1`$ and $`t ∈ L_2`$
- for two weighted automata $`A_1`$ and $`A_2`$, the distance $`d(A_1, A_2)`$ is the min of $`A_1(s) + d(s, t) + A_2(t)`$
  it is computed by the composed transducer $`A_1 \circ T \circ A_2`$.


**content on distances and models**

- [distance-languages.md](distance-languages.md) : 
  - definition of edit-distance between string and string languages.
  - results (essentially Mohri et al.) on the computation of edit-distances between unweighted and weighted languages over finite alphabet 
  - comments on the generalisation to infinite alphabets

    it needs appropriate generalisation of transducers 
    - to nested words (for scores) : Visibly Pushdown Transducers [Alur, Madhusudan]
    - to infinite alphabets : Symbolic Visibly Pushdown Transducers [Alur, d'Antoni]
  
- [DTW.md](DTW.md) : generalities on Dynamic Time Warping 
  in the context of the above similarity measure definition and computation.
- [NWA.md](NWA.md) references for various extended models of automata (to be completed)
- [WSVPA.md](WSVPA.md) proposal of automaton for dealing with the performance / score representations below (preliminary).


##  Application
to the computation of distance performance-score, distance performance-score language and automated music transcription.

**principle:**

- a *performance* is a string  $`s`$  over an infinite alphabet
  = MIDI-like sequence of timestamped events

- a *score* is a tree or equivalently a [nested word](https://www.cis.upenn.edu/~alur/nw.html) (structured string) over a finite language
 see examples in  [rhythm-nested-words.md](rhythm-nested-words.md) 

- a *score language* is a Weighted Visibly Pushdown Automaton (aka "score grammar")

- a *performance-score distance* is defined by a weighted transducer $`T`$ between infinite and finite alphabet
  = Weighted Symbolic Visibly Pushdown Transducer?, see [WSVPA.md](WSVPA.md) for preliminary proposal of model...

- MIDI2score *transcription* is a *1-best parsing* problem for $` \{ s \} \circ T \circ A_2`$ where
  - $`\{ s \}`$  is the singleton language containing the performance
  - $`A_2`$ is the score language


a general picture is presented in [transcription.md](transcription.md) (with focus on MIDI2score transcription).

more details on the comparison between performances and score / score language :

- [distance-performance-score.md](distance-performance-score.md) :
  - sequential representations of performances and scores (strings over finite and infinite alphabet) 
  - automata theoretic definition of score languages
  - definition of similarity measures between these representations

  

