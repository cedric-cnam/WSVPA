#Weighted-Transducers-based Music Transcription

study of the application of  approach of Mohri et al. to the computation of (string) edit-distances between (string) languages.

the approach a la Mohri is based on weighted-transducers

the study covers:
- sequential representations of music scores and symbolic performances (strings over finite and infinite alphabet)

  definition of similarity measures between these representations

  see [distance-performance-score.md](distance-performance-score.md).

- [DTW.md](DTW.md) : generalities on Dynamic Time Warping 

  in the context of the above similarity measure definition and computation.

- application to MIDI2score transcription: 
  see [transcription.md](transcription.md) for a general picture


- [distance-languages.md](distance-languages.md) : 

  - results (essentially Mohri et al.) on the computation of edit-distances between unweighted and weighted languages over finite alphabet 

    note: the approach supports general edit-distances defined by weighted transducers (well beyond Levenshtein)

  - comments on the generalisation to infinite alphabets
    needs appropriate generalisation of transducers.





