# Rhythm Nested Words

- Alur & Madhusudan's [nested words](https://www.cis.upenn.edu/~alur/nw.html) (NW) can be used instead of trees to represent rhythm notation
- and hence weighted NW-automata (or weighted-VPDA) instead of WTA (with attributes)

advantage: attribute propagation is simpler with W-VPDA:
push attributes values to the stack


---
**Nested Words**

- sequence in $`[1..n]`$ and
- matching relation $`\to`$ in $`\{ -\infty, 1,...,n \} \times \{ 1,...,n, +\infty \}`$

such that:
- match always forward: 
  if  $`i ⇢ j`$  then $`i < j`$
- match do not share position: 
  $`|\{ i \mid i ⇢ j \}| \leq 1`$ and $`|\{ j \mid i ⇢ j\} | \leq 1`$ 
- match do not cross: 
  no $`i ⇢ j`$ and $`i' ⇢ j'`$ and $`i < i' \leq j < j'`$

ALT
Gurevitch, Blass definition (see [Motley-word automata](:/2a025f6bf11a406785ee5f1c3bb1ce10)) drops second condition:
- if $`i ⇢ j`$ and $`i' ⇢ j'`$  and $`i \leq  i'`$
  then either $`i < j < i' < j'`$  or $`i < i' < j' < j`$

![](nw1.png)

---
**applications**:

- Executions of sequential structured programs: 
  matchs =  *calls* and *returns*

![](nw3.png)
*program execution. `en` = new scope = call, `ex` = exit scope = return, `rd` = read, `wr` = write, `sk` = other.* 

- XML docs:
  matchs = *open-* and *close- tags*

- Annotated linguistic data: 
  tree bank = repository (corpora) with 
  sentences (linear order) + anotation (hierarchical structure)

![](nw4.png)
*parsed sentence as nested word: I saw the old man with a dog today.* 

---
**usefulness**:

- queries that refer to both hierarchical and linear structure
(not solely on word or tree)
- automata model (*Nested Word Automata*) for reading linear & hierarchical structure in the same time.

---
## Example 1
from paper MCM'19

see [example MCM'19](:/6d3f9d44c06c4b0eaee6ea0140a5ffa6)

![](MCM19-1.png)

MTU timestamps: 0 3/4 7/8 | 1 4/3 5/3

**rhythm-tree**

```mermaid
graph TD;
  Score --> B1;
  Score --> B2;
  B1 --> T2;
  T2 --> E1;
  T2 --> T2.;
  T2. --> D;
  T2. --> T2..;
  T2.. --> E1.;
  T2.. --> E1..;
  B2 --> T3;
  T3 --> E1...;
  T3 --> E1....;
  T3 --> E1.....;
```

**nested-word** 
with explicit symbols for begin and end of match

representation of leaves with 2 symbols (too much nesting)
(not exactly original def. of Alur Madhusudan, similar to VPDA)

```
●...........................S...........................●
|                                                       |
●...............B1...............●-●.........B2.........●
|                                | |                    |
●...............T2...............● ●.........T3.........●
|                                | |                    |
●------E1------●........T2.......● ●--E1--●--E1--●--E1--●
               |                 |
               ●---D---●...T2....●
                       |         |  
                       ●-E1-●-E1-●
```

**nested-word** with leaves as internals. the word becomes

`[S  [B1  [T2  E1  [T2  D  [T2  E1  E1  T2]  T2]  B1]  [B2  [T3  E1  E1  E1  T3]  B2]  S]`

nested presentation:

- the edges `--` and `|` are `next-symbol` relationship in word
- the edges `..` are matching relationship  

```
[S..............................................................S]
 |                                                              |
[B1................................B1]--[B2....................B2]
 |                                  |    |                      |
[T2................................T2]  [T3....................T3]
 |                                  |    |                      |
 E1-------------[T2................T2]   E1---------E1---------E1
                 |                  |
                 D------[T2........T2]
                         |          |  
                         E1--------E1
```

ALT: dropping the requirement that match do not share positions (see Blass, Gurevitch 2006), 

```
|..............s.............|
|....t2,b1....|
     |...t2...|
         |.t2.|    |..t3,b2..|
e1   d   e1   e1   e1   e1   e1
1        2    3    4    5    6   (note number in notation)
```



---
## Example 2

also from paper MCM'19

![](MCM-19-2.png)

MTU timestamps: 0 3/4 | 1 1 4/3 5/3

**rhythm-tree**

```mermaid
graph TD;
  Score --> B1;
  Score --> B2;
  B1 --> T2;
  T2 --> E1;
  T2 --> T2.;
  T2. --> D;
  T2. --> E1.;
  B2 --> T3;
  T3 --> E2;
  T3 --> E1..;
  T3 --> E1...;
```

**nested-word** with too much nesting
```
●.........................S........................●
|                                                  |
●.............B1............●-●.........B2.........●
|                           | |                    |
●.............T2............● ●.........T3.........●
|                           |                    |
●------E1------●......T2....● ●--E2--●--E1--●--E1--●
               |            |
               ●--D--●--E1--●
```

**nested-word** with leaves internal

`[S  [B1  [T2  E1  [T2  D  E1  T2]  T2]  B1]  [B2  [T3  E2  E1  E1  T3]  B2]  S]`

nested presentation: 

```
[S......................................................S]
 |                                                      |
[B1........................B1]--[B2....................B2]
 |                          |    |                      |
[T2........................T2]  [T3....................T3]
 |                          |    |                      |
 E1-------------[T2........T2]   E2---------E1---------E1
                 |          |
                 D---------E1
```

**ALT**

```
|............s............|
|..t2,b1..|     |..t3,b2..|
     |.t2.| 
e1   d    e1    e2   e1   e1
1         2    3,4   5    6
```


