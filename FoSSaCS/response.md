We would like to thank the reviewers for their careful reading of the paper and their remarks, 
and in particular the suggestion of reviewer 2 to consider the related model of Cost Register Automata.

Regarding the two first comments in review 1, presented as "major problems in the proof of Prop.3", they are actually simple typos:

1. indeed, there are no edges from $Q\times Q$ to $Q\times P\times Q$.
   It means that the weight, by $\eta_A$, of every such edge is 0 (of the semiring).
   It is generally the convention for missing edges in weighted graphs or missing transitions in weighted automata. However, we could have stated it explicitly...

2. there is a misplaced parenthesis in the expression for the weight of the edges from $Q\times P\times Q$ to $Q\times P\times Q$:
   It should be: $\bigoplus_{\Delta_c} ( \bigoplus_{\Delta_i} w_i(...) \oplus w_c(...) \otimes_2 \bigoplus_{\Delta_r} w_r(...))$
   (which is an element of the semiring), 
   and not $\bigoplus_{\Delta_i} w_i(...) \oplus  \bigoplus_{\Delta_c} ( w_c(...) \otimes_2 \bigoplus_{\Delta_r} w_r(...))$.
   The proofs of Prop.3 (in appendix) actually use the first (correct) formulation.

We agree with reviewer 1 that statements iii and iv of Lemma 4 are incorrect.
This lemma is only used in an informal remark following Def. 1, and is not used in the proofs of the main results of the paper. Hence it could be removed without harming these results.

Regarding other comments : 

- w^e_r (page 12) allows dealing with unmatched return symbols, following the original definitions of visibly PDA and symbolic VPDA [8], where the input words are not assumed to be well parenthesized.
- also, following the original definitions of symbolic automata and VPDA, the functions of the label theory are supposed to be oracles, and the PTIME complexity assumes a constant time computation for these oracles. 

Considering the above problems identified by reviewers, we prefer to withdraw our submission.
However, we would be grateful if you could transmit this answer to the reviewers.

Thank you
Best Regards





The typing is as follows:   
on the one hand, 

- $w_i(...) \in \Phi_{ci}$
- $\oplus_{\Delta_i} w_i \in \Phi_{c}$

on the other hand, 

- $w_c(...) \in \Phi_{cc}$   
- $w_r(...) \in \Phi_{cr}$   
- $\oplus_{\Delta_r} w_r \in \Phi_{c}$
- $w_c(...) \otimes_2 \oplus_{\Delta_r} w_r \in \Phi_{c}$

Hence $\oplus_{\Delta_r}$ of the sum of the two above terms (i.e. $\eta_A$ of the edge) is in $S$.
