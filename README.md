#Weighted-Transducers-based Music Transcription

study of the application of approach of Mohri et al. to the computation of (string) edit-distances between (string) languages.

the study covers:
- sequential representations (strings over finite and infinite alphabet) of
  - symbolic performances = MIDI-like sequences of timed events
  - music scores = structured strings ~ [nested words](https://www.cis.upenn.edu/~alur/nw.html)

  definition of similarity measures between these representations

  see [distance-performance-score.md](distance-performance-score.md).

- [DTW.md](DTW.md) : generalities on Dynamic Time Warping 

  in the context of the above similarity measure definition and computation.

- application to MIDI2score transcription: 
  see [transcription.md](transcription.md) for a general picture


- [distance-languages.md](distance-languages.md) : 

  - results (essentially Mohri et al.) on the computation of edit-distances between unweighted and weighted languages over finite alphabet 

    the approach a la Mohri is based on weighted-transducers
    
    it supports general edit-distances defined by weighted transducers (well beyond Levenshtein)

  - comments on the generalisation to infinite alphabets

    it needs appropriate generalisation of transducers 
    - to nested words (for scores) : Visibly Pushdown Transducers [Alur, Madhusudan]
    - to infinite alphabets : Symbolic Visibly Pushdown Transducers [Alur, d'Antoni]




