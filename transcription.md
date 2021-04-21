# Diagram of transcription



```    
                               rhythmic 
                              quantization
  .---------------------.  <------------------   .----------------------.
  | Symbolic Quantified |                        | Symbolic Performance |
  .---------------------.  ------------------>   .----------------------.
           ^  |              alignment/DTW                |  ^
           |  |             artificial perf.              |  |
           |  |                                           |  |
projection |  | structuring                       MIDI    |  | A2M transcription:
           |  |                                 synthesis |  | pitch quantization
           |  |                                           |  | onset/offset detection
           |  |                                           |  |
           |  v            human performance              v  |
        .-------.  --------------------------------->  .-------.
        | Score |                                      | Audio |
        .-------.  <---------------------------------  .-------.
                           E2E transcription
```

In the setting of [distance-performance-score](distance-performance-score.md), 
- `Symbolic Performance` = piano roll
  = sequence of (RTU time, pitch, ON | OFF, velocity)
- `Symbolic Quantified` = quantified piano roll
  = sequence of (MTU time, pitch, ON | OFF, velocity)
- `Score` = nested/structured word
  = sequence of internal events (dur, tag) and call/return markups.

The projection/structuring between `Score` and `Symbolic Quantified` correspond resp. to the deletion and insertion of markups.

Our objective is the diagonal `Symbolic Performance` - `Score` = MIDI2score transcription
- def. of alignement - dist. (DTW) between `Score` and a `Symbolic Performance`
  see [distance-performance-score](distance-performance-score.md), 
- an algo. for computing the distance between 
  - one `Symbolic Performance`
  - one language of `Score` s.
  see [distance-languages](distance-languages.md). 


