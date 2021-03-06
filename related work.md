# SW-VPA: related work

## models



- SA:

https://pages.cs.wisc.edu/~loris/symbolicautomata.html



- VPA: 

  

>  Adding Nesting Structure to Words
> Alur and Madhusudan
> JACM 56(3), 2009.
> https://dl.acm.org/doi/abs/10.1145/1516512.1516518



> Kurt Mehlhorn
> Pebbling Mountain Ranges and its Application to DCFL-Recognition
> ICALP 1980.
> https://dx.doi.org/10.1007/3-540-10003-2_89
> https://pdfs.semanticscholar.org/1c9b/c1ae6b2484b236bf9d674b8d10bdaad95eb1.pdf



- S-VPA: 

  

> Loris D’Antoni and Rajeev Alur
> Symbolic Visibly Pushdown Automata
> CAV 2014
> https://link.springer.com/content/pdf/10.1007/978-3-319-08867-9_14.pdf



- W-VPA:



> Christian Mathissen
> Weighted Logics for Nested Words and Algebraic Formal Power Series
> International Colloquium on Automata, Languages, and Programming (ICALP), 
> LNCS, volume 5126, pages 221-232, 2008, Springer, 2008
> https://link.springer.com/chapter/10.1007/978-3-540-70583-3_19
> https://arxiv.org/abs/1001.2175

a logical characterization of WNWA functions using a modification of WMSOL



>  S. Kiefer, A. S. Murawski, J. Ouaknine, B. Wachter, and J. Worrell
> On the complexity of equivalence and minimisation for Q-weighted automata
> Logical Methods in Computer Science (LMCS), 9(1:8):1–22, 2013.

the equivalence problem for WVPA is showed to be logspace reducible to polynomial identity testing



>  Mathieu Caralp, Pierre-Alain Reynier, and Jean-Marc Talbot
> Visibly Pushdown Automata with Multiplicities: Finiteness and K-Boundedness
> International Conference on Developments in Language Theory 2012
> https://hal.archives-ouvertes.fr/hal-00697091



- SWVPA: 

  

>  Luisa Herrmann, Heiko Vogler
> Weighted Symbolic Automata with Data Storage
> DLT 2016: 203-215
> https://link.springer.com/chapter/10.1007/978-3-662-53132-7_17
> https://dl.acm.org/citation.cfm?id=3081476.3081493
> doi: [10.1007/978-3-662-53132-7_17](https://doi.org/10.1007/978-3-662-53132-7_17)



- transducers
  - Visibly Pushdown Transducers
    Frédéric Servais
    no composition
    functionality dec. in PTIME
    equivalence undec.
    equivalence of functional EXPTIME-complete
    wnVPT (well nested): closure & dec.
    decision streamability VPT:
    par condition suff. "twinning property"
    
    

> E. Filiot, J.-F. Raskin, P.-A. Reynier, F. Servais, and J.-M. Talbot
> Properties of visibly pushdown transducers.
> In MFCS, pages 355–367, 2010.



> Emmanuel Filiot, Frederic Servais
> Visibly Pushdown Transducers with Look-Ahead



- grammars
  - [Visibly Grammars](:/4caa030dcd534eaa8e9d69a0bb9e5e29)

  
  
- others
  
  
  
  - [WATA: related](:/3c68d9719f1e46268996dbed06f615ae)
  - [input-driven pushdown automata](:/39c5e6e7f60a462399337cf51688cc00)  (ancêtre VPA)



## results

- [Visibly Pushdown Automata with Multiplicities: Finiteness and K-Boundedness](:/377fa6e733d945b38673dc6f01b25eee)

- [Reactive Synthesis from Visibly Register Pushdown Automata](:/30a9572f62974cadb295196a34693169)

- Generalized Pushdown Predecessor (**GPP**)
  [PDA emptiness & MC](:/247b595e2daf48039dc30e1da42b9281)

- Model Checking
  [PDA Model Checking](:/eb658ad4e547477c8c0e1916e3e4c012)

- [A First-Order Complete Temporal Logic for Structured Context-Free Languages](:/57a27b43d69b414ca62ada9b7e6f97b0)



## learning

- [Hankel Matrices for Weighted Visibly Pushdown Automata](:/6059758f9b0c471cae1fa11e602b90e5)

> Labai N., Makowsky J.A.
> Hankel Matrices for Weighted Visibly Pushdown Automata
> In Language and Automata Theory and Applications (LATA). Lecture Notes in Computer Science, vol 9618. Springer, 2016.
> https://link.springer.com/chapter/10.1007/978-3-319-30000-9_36



## applis

- WA: model for probabilistic systems 

> C. Baier, F. Ciesinski, and M. Größer. 
> Model checking linear-time properties of probabilistic systems.
> In Droste et al. [13], chapter 13.

- VPA: [Alur M.] model for 
  - recursive programs
  - linguistic data
  - semi structured data (XML doc., web services)

- W-VPA: [Mathissen]
  quantitative extension of VPA. quantitative model for 
  - sequential programs with recursive procedure calls
  - probabilistic or stochastic recursive programs
  - quantitative database queries
  - data flow analysis [Schwoon et al]
    (weighted configuration graph of the system = state space of a program)
    -> weighted versions of reachability problems

> S. Jha, D. Melski, T.W. Reps, and S. Schwoon. 
> Weighted pushdown systems and their application to interprocedural dataflow analysis. 
> Science of Computer Programming, 58(1–2):206–263, 2005.

> N. Kidd, A. Lal, and T.W. Reps. 
> Program analysis using weighted pushdown systems. 
> In Proc. of the 27th FSTTCS 2007, New Delhi, volume 4855 of Lecture Notes in Computer Science, pages 23–51, 2007


- S-VPA [Alur & d'Antoni]
  - XML processing: validation against schema (with data), filtering (XSS attacks)
  - runtime monitoring of recursive programs (over infinite domains)



modeling 
- probabilistic or stochastic recursive programs, 
- quantitative database queries
- semi structured data (in infinite domains)

for the verification of quantitative properties concerned with/about 
- quality measures, 
- resource-consumption, 
- distance metrics,
- probabilistic guaranties,
- optimality
- ...
