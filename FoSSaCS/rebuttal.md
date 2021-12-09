Thank you for your submission to FoSSaCS 2022. The rebuttal period will be between now and December 9, 2021, 23:59 AoE.

During this time, you will have access to the current state of your reviews and have the opportunity to submit a response. Please try to limit your response to 600 words or less and keep in mind the following during this process:

* The response must focus on any factual errors in the reviews and any questions posed by the reviewers. It must not provide new research results or reformulate the presentation. Try to be as concise and to the point as possible.

* The rebuttal period is an opportunity to react to the reviews, but not a requirement to do so. Thus, if you feel the reviews are accurate and the reviewers have not  asked any questions, then you do not have to respond.

* The reviews are as submitted by the PC members, without any coordination between them. Thus, there may be inconsistencies. Furthermore, these are not the final versions of the reviews. The reviews can later be updated to take into account the discussions at the program committee meeting, and we may find it necessary to solicit other outside reviews after the rebuttal period.

* The program committee will read your responses carefully and take this information into account during the discussions. On the other hand, the program committee will not directly respond to your responses, either before the program committee discussion or in the final versions of the reviews.

* Your response will be seen by all PC members who have access to the discussion of your paper, so please be polite and constructive.

The reviews on your paper are attached to this letter. To submit your response you should log on the EasyChair Web page for FoSSaCS 2022 and select your submission on the menu.

----------------------- REVIEW 1 ---------------------
SUBMISSION: 55
TITLE: Symbolic Weighted Language Models, Quantitative Parsing and Verification over Infinite Alphabets
AUTHORS: Florent Jacquemard, Lydia Rodrigez de la Nava and Philippe Rigaux

----------- Overall evaluation -----------
SCORE: -2 (reject)
----- TEXT:
The goal of the paper is to set up relevant models and constructions to solve efficiently 
the weighted parsing problem over infinite alphabets.

I especially liked the motivation example used throughout the paper: the music transcription problem.  The input is a sequence of timed events (MIDI format). Timestamps being rational numbers explains the need to consider infinite alphabets.  The goal is to produce a score which best corresponds to the input sequence.  The score has a hierarchical nested representation defining time points (grid) where notes of the score could occur.  So the timestamps of the input sequence have to be aligned with the above grid.  Several alignments are possible and a weighted transducer (wT) is used to measure the distance between the input sequence and the alignment.  The hierarchical division of the timeline defining the grid used for alignments is naturally represented as a nested word.  Several such hierarchical divisions are possible and a weighted visibly pushdown automaton (wVPA) is used to measure the complexity of the resulting score.  Finally, the best score is obtained by finding a witness of the minimization problem for a synchronized product of the wT and the wVPA. Since the input alphabet is infinite, one needs symbolic representations for wT and wVPA.

The paper introduces and study symbolic weighted automata (swA), transducers (swT) and  visibly pushdonw automata (swVPA). Some basic properties of these models are established  (Propositions 1 and 2). The notations are quite heavy and technical, but the intuition is  clear and the techniques are classic. The most interesting problem is the minimisation of  a swVPA (Proposition 3) in order to find a best parsing solution. Unfortunately, as  explained below in the detailed comments, I think the proof is wrong/incomplete and the  problems are not simple typos. Due to that I cannot recommend to accept the paper.

Major problem in the proof of Prop. 3:

On page 15, your definition of the weight function $\eta_A$ has two main problems.

1. It is not defined for edges from $Q\times Q$ to $Q\times P\times Q$.
2. On edges from $Q\times P\times Q$ to $Q\times P\times Q$, the weight you define is not an element of the semiring $S$ as it is supposed to be. You are summing $w_i$, $w_r$ and $w_c$ over the second argument $\bigoplus^{2}$ and the first argument remains free. So you are defining a function from $\Delta_c$ to the semiring and not an element of $S$.

Other detailed comments:

Fig.2: the counting semiring is not idempotent, bounded, complete.

Lemma 4 (ii) 'and similarly for $\oplus$': This is not clear.
It is probably wrong if the semiring is not idempotent (complete does not imply 
idempotent) and even when idempotent this is not clear. You need that $\alpha=\bigoplus_i 
\alpha$ and without some continuity asumption this may not hold.
Same remark for (v) and (vi).

Lemma 4 (iii) second equality: I don't see why this should hold. This would imply 
$(a+b)\times(a'+b')=aa'+bb'$. Why should this hold?
Same remark for (iv)

Lemma 4 (v) and (vi): exponents ^{2} or ^{1} are missing on some \bigoplus

Def 1: How do you represent $\phi$ or $\eta$? What do you mean by 'effectively computed'? 
Turing machine?

Proposition 1: the PTIME claim is strange. This seems to assume that all operations on functions from the label theory are done in constant time, but def 1 only says they are effectively computable, without complexity bounds.
Same remark for Prop. 3

Proof of Prop 1: 
- I think it would be better (easier to understand) to construct a product with
  $\epsilon$-transitions, and to separately state and prove that $\epsilon$-transitions can be removed from swA.
- in input -> an input (many occurrences)

page 12: 

- p -> p' in w_c^{e}(q,p,q')
- what is the meaning/usefulness of $w_r^{e}$? Why should you (do you need to) 
  allow a return with an empty stack when dealing with VPAs?

page 13:

- Due to the base case, all $weight_A(q[\gamma],...)$ equal 0 when $\gamma\neq\bot$.
  So why do you add $\gamma$ to the definitions?
- Remove $p'\in P$ and $p\in P$ form the \bigoplus of the w_c cases
- Add c,p to the \bigoplus of the w_r case
- Remove the w_r^{e} case.
  If you choose to keep the w_r^{e} case then your definition is not coherent as you may have $\gamma'=\bot$ in the w_r case.

Example 5: 

- I don't understand starting from the last 4 lines of page 13.
  $q_{\frac{j+1}{c}}$? $\lceil_d[\tau,\tau+\ell]$?
- line 3, page 14: measeures are not nested?

Proof of Prop 2:

- the case $\oplus$ is similar: No, this is simply a disjoint union of the  automata
- line 4 of the proof: $in_1 ∈\to in$

page 15, equation (14): the value is 0 according to your def.

Section 5, first para: $\phi_{cc}$ and $\phi_{ci}$ are missing
----------- Reviewer's confidence -----------
SCORE: 5 ((expert))

----------------------- REVIEW 2 ---------------------
SUBMISSION: 55
TITLE: Symbolic Weighted Language Models, Quantitative Parsing and Verification over Infinite Alphabets
AUTHORS: Florent Jacquemard, Lydia Rodrigez de la Nava and Philippe Rigaux

----------- Overall evaluation -----------
SCORE: 1 (weak accept)
----- TEXT:
The authors study symbolic variants of weighted automata (sWA), weighted transducers (sWT), and weighted visibly pushdown automata (sWVPA). The term "symbolic" here signifies that the input alphabet can be large or even infinite. For this reason, the automata transitions cannot enumerate the alphabet symbols. Instead, each transition carries a function from the alphabet to the weight semiring.

The idea of extending automata from small finite alphabets to large or infinite alphabets using predicates is rather straightforward and does not give rise to significant complications for many (but not all) problems about them. In fact, this idea can be found in papers much earlier than the cited works [9, 10, 36], for example, in (Noord & Gerdemann, 2001) and guarded automata for Kleene Algebra with Tests (Kozen, 2001).

>  Finite State Transducers with Predicates and Identities, by G. van Noord & D. Gerdemann (2001)

> Automata on Guarded Strings and Applications, by D. Kozen (2001)

The authors claim the following contributions for the symbolic weighted machines that they investigate:
(1) **Proposition 1**: A construction for an sWA that computes distance of a string, where the notion of distance is given by a sWT, from a weighted language given by a sWA.
(2) **Proposition 2**: The transductions that are computed by sWVPA are closed under semiring addition and semiring multiplication.
(3) **Proposition 3**: An algorithm for finding an input nested word with minimal weight, where the word/weight association is given by a sWVPA.
(4) **Proposition 5**: An application of the previous results to a variant of weighted parsing.

The paper is well-written and the technical ideas are communicated clearly. Several related works are discussed in the introduction. In particular, the authors mention some works on register automata and other quantitative automata models. There is also a relevant and large line of work on **Cost Register Automata** and related notions of regular expressions and domain-specific languages for quantitative properties. Some representative references:

>  Streamable Regular Transductions, by R. Alur et al. (2020) [TCS]

> StreamQRE: Modular Specification and Efficient Evaluation of Quantitative Queries over Streaming Data, by K. Mamouras et al. (2017) [PLDI]

> Regular Functions and Cost Register Automata, by R. Alur et al. (2013) [LICS]

While I find the content of the paper interesting and relevant, I have some reservations regarding how novel the main contributions are. For example, I am wondering whether Proposition 1 is essentially the composition of two well-known constructions. First, the product automaton (A x T) can be constructed using essentially the same idea as the composition of weighted transducers (see Mohri's papers). One would need to allow epsilon-transitions, but these can be eliminated as a second step, given that the authors consider a class of semirings that allows epsilon-elimination. Similarly, Proposition 2 seems to rely on a straightforward adaptation of product constructions.

It is nice that the authors consider a motivating parsing application, namely music transcription that introduces hierchical structure into the musical notation. This application seems a bit niche, so it would be interesting to have a discussion of other more impactful applications as well.

To summarize, this is overall an interesting paper, but I am only marginally leaning towards acceptance because of questions regarding the novelty of the technical results.

More remarks:

The authors seem to be referencing a result by Bar-Hillel, Perles and Shamir, but no citation is given. Please provide a citation and clarify the relationship with the reference.

It would help the reader if you restructure the end of Section 4 so that you can give an explicit proof for Proposition 3, instead of integrating the proof in the prose of the section.

----------- Reviewer's confidence -----------
SCORE: 3 ((medium))

----------------------- REVIEW 3 ---------------------
SUBMISSION: 55
TITLE: Symbolic Weighted Language Models, Quantitative Parsing and Verification over Infinite Alphabets
AUTHORS: Florent Jacquemard, Lydia Rodrigez de la Nava and Philippe Rigaux

----------- Overall evaluation -----------
SCORE: 2 (accept)
----- TEXT:
The paper "Symbolic Weighted Language Models, Quantitative Parsing and Verification over Infinite Alphabets" by Jacquemard et al studies quantitative language models over infinite input alphabets: 

- Symbolic Weighted Automata (swA)
- Transducers (swT)
- Visibly Pushdown (sw-VPA) 

This is achieved by generalizing the Boolean guards of symbolic automata to functions into a commutative semiring.

The main contribution is to show how these automata can be used to parse strings with infinitely many possible input symbols (such as timed events). The running example is that of transcribing music as a parsing problem. This example is developed to illustrate all aspects of the work, including the symbolic weighted parsing algorithm in Section 5. 

The authors advertise their parsing algorithm saying that "The SW-parsing framework, applied to the transcription problem, allows to find an optimal solution that considers both the fitness of the result, and its structural complexity." There is an implementation at https://qparse.gitlabpages.inria.fr/ but I didn't have time to test it.

I very much like this work. It brings together the classical topic of parsing with cutting edge quantitative methods and the practical application of transcribing music from midi to scores.

Typos:

"(Proposition th:best-search."

"languages models"

"constructions are performed on the on-the-fly"

----------- Reviewer's confidence -----------
SCORE: 3 ((medium))

------------------------------------------------------

Best wishes,

Patricia and Lutz 
