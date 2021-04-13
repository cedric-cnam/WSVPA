# Perceptive Tempo Model

online approach to tempo estimation using the theory of coupled oscillators.

> Edward W. Large, John F. Kolen
> Resonnance and the Perception of musical meter
> Connection Science, 6 (1) 177-208



principle: we assume states $`\bar{x}`$ embedding the current (estimated) tempo value.
e.g. in [Large Jones 1994],  $`\bar{x}`$ = phase and period.

- Initially $`\bar{x} = \Omega_0`$ (expected initial tempo, fixed or estimated from first bar).   
- for every new performance event read at RTU time $`t`$, aligned with an event of MTU duration $`q`$ in score, evaluate a new $`\bar{x}'`$  (hence a new tempo value) using the difference between the onset time $`t`$ and the expected onset time $`t'`$ computed with $`\bar{x}`$ and the onset of previous (performance) event.


## The auditory dynamic attending theory

> Large, E. W., & Jones, M. R.  
> The dynamics of attending: how people track time-varying events
> Psychological review, 106(1), 119–159, 1999
> https://doi.org/10.1037/0033-295X.106.1.119

**abstract**

A theory of attentional dynamics is proposed and aimed at explaining how listeners respond to systematic change in everyday events while retaining a general sense of their rhythmic structure. 

The approach describes attending as the behavior of internal oscillations, called attending rhythms, that are capable of entraining to external events and targeting attentional energy to expected points in time. A mathematical formulation of the theory describes internal oscillations that focus pulses of attending energy and interact in various ways to enable attentional tracking of events with complex rhythms. 

This approach provides reliable predictions about the role of attending to event time structure in rhythmical events that modulate in rate, as demonstrated in 3 listening experiments.

---
**equations**

Extended Kalman Filter predictive/corrective oscillator for tempo adaptation

A formal model of the expectations of a music listener in term of rhythm / beat tracking

It is based on the notion of *entrainment* in coupled oscillators: 

- 2 oscillators tend to synchronise when there is a possible energy transfer between both. (see image and movies below);
- In our case, 
  - one oscillator is the listener's beat expectation function (*internal or attentional beat / rhythm*) 
  - and the other oscillator is the musician (playing with temporal fluctuation) (*external beat / rhythm*).


First we consider the case of a listener expecting 1 event every beat.

Let $`t_x`$ be the time at which an event is expected to occur.

The phase $`\phi(t)`$ is the delay between the onset $`t`$ and its expectation $`t_x`$ :

```math
\phi(t) = \frac{t - t_x}{p} \qquad    t_x - \frac{p}{2} ≤ t < t_x + \frac{p}{2} \qquad (1)
```

where $`p`$ is the period (inverse of tempo, *i.e.* number of seconds per beat).

Hence the phase is negative when onset at $`t`$ arrives early to expectation $`t_x`$ and positive when it arrives late.

[TBC] about the definition interval $`[t_x - \frac{p}{2}, t_x + \frac{p}{2}[`$ : should the events outside this time window be discarded (**parse error**)?

Expressing the eternal events as a sequence of onset times $`t_0, t_1,...`$  at (expected) period $`p`$, we can determine the phase $`\phi_{n+1}`$ from next event from the phase $`\phi_n`$ for event $`n`$ :

```math
\phi_{n+1} = \phi_n + \frac{t_{n+1} - t_n}{p} \qquad (\mod_{-\frac{1}{2},\frac{1}{2}}1) \qquad (2)
```

where $`(\mod_{-\frac{1}{2},\frac{1}{2}}1)`$ is the decimal part of the value, centered  at 0 
(*i.e.* $`[\frac{1}{2}, 1]`$ is remapped to  $`[-\frac{1}{2}, 0]`$).

```math
z \mapsto \frac{\delta_{z>0}}{2} . ( | 2 z | -2 . (\lceil \frac{| 2z |-1}{2} \rceil )
```

In the next equation (called *phase attractive circle map*) , a coupling term is added in order to model the force exerted by the external rhythm to the attentional rhythm.

```math
\phi_{n+1} = \phi_n + \frac{t_{n+1} - t_n}{p} - \eta_\phi . \frac{1}{2\pi} \sin(2\pi\phi_n) \qquad (\mod_{-\frac{1}{2},\frac{1}{2}}1) \qquad (3)
```

where the parameter $`\eta_\phi`$ is a coupling strength ($`0 < \eta_\phi \leq 2`$).

The period is also adjusted at each event:

```math
p_{n+1} = p_n \bigl(1 + \eta_p . \frac{1}{2\pi} \sin(2\pi\phi_n)\bigr) \qquad (4)
```

Introduction of a new state variable $`\kappa`$ which represents *attentional focus* : the bigger $`\kappa`$ is, the narrower is the listener's temporal expectation, and small $\kappa$ reflects greater uncertainty about external happenings. 

It is used in the following equation which models of a pulse of attentional energy, replacing the above parameter $`\eta_\phi`$:

```math
f(\phi, \kappa) = \frac{1}{I_0(\kappa)} . \exp(\kappa . \cos(2 \pi . \phi))  \qquad (5)
```

$`I_0`$ is the modified Bessel function (first kind) of order 0.

An asymptotic development shows that for a large $`x`$, it holds that $`I_0(x) \sim \frac{\exp(x)}{\sqrt{2\pi x}}`$.

The adaptation of $\kappa$ to events is designed similarly to a maximal likelihood estimate, given by the resolution of

```math
A(\kappa) = r  \qquad (6)
```

where $`0 \leq r \leq 1`$  , called *mean vector length* is a statistic that measure the degree of synchronisation, as variability in relative phase ) and $`A(\kappa) = \frac{I_1(\kappa)}{I_0(\kappa)}`$.

An incremental approximation of $`r`$ is computed as the following *synchronised strength* value $`s_n`$:

```math
s_{n+1} = s_n - \eta_s (s_n - \cos(2\pi . \phi_n)) \qquad (7a)
```

where parameter $`0 \leq \eta_s \leq 1`$, determines how quickly $`r`$ is approximated, *i.e.* how quickly attention rate changes.

and the realtime adaptation of attentional focus is then described by:

```math
\kappa_{n+1} = A^{-1} \bigl[ H(b, s_{n+1}) \bigr]   \qquad (7b)
```

there $`H`$ is a hard limit function ($`A^{-1}(1) = +\infty`$) and parameter $`0 < b < 1`$ is a maximal value for $`s_n`$, fixing a upper limit $`A^{-1}(b)`$ on the attention focus $`\kappa`$  ($`H(b, s) = s`$ when $`s < b`$ and $`H(b, s) = b`$ otherwise).

The monotonic function $`A`$ cannot be inverted analytically, and hence $`\kappa_{n+1}`$ is estimated with (7b) numerically or by table lookup ($`A`$ varies in $`[0, 1]`$ when $`\kappa`$ goes from $`0`$ to $`+\infty`$).

To summarise, we have altogether ($`t_n`$ and $`t_{n+1}`$ are two successive RTU onsets of events):

```math
\phi_{n+1} = \phi_n + \frac{t_{n+1} - t_n}{p_n} - \frac{\exp(\kappa_{n+1} . \cos(2 \pi . \phi_n))}{I_0(\kappa_{n+1})} .  \frac{1}{2\pi} \sin(2\pi.\phi_n) \qquad (\mod_{-\frac{1}{2},\frac{1}{2}}1)
```

```math
p_{n+1} = p_n . \bigl(1 + \frac{\exp(\kappa_{n+1} . \cos(2 \pi . \phi_n))}{I_0(\kappa_{n+1})} .\frac{1}{2\pi} \sin(2\pi . \phi_n)\bigr)
```

```math
\kappa_{n+1} = A^{-1} \bigl[ H(b, s_{n+1}) \bigr]
```

```math
s_{n+1} = s_n - \eta_s . (s_n - \cos(2\pi . \phi_n))
```

For a rhythm value inside-the-beat: when the onset of the next expected event is not 1 beat after the previous event but $`q`$ beats (with $`q`$ rational), we replace $`p_n`$ by $`\frac{p_n}{q}`$ in the first above equation.

Some parameter values (and approx.) taken from an implementation of the model:

- $`b = 0.94`$
- $`\eta_s = 0.9`$
- $`I_0(\kappa) \sim \exp(\kappa)`$
- a table for $`A`$ for $`\kappa \in [1.0, 10.0 ]`$ (step = $`0.001`$) - lookup with stl [`lower_bound`](http://www.cplusplus.com/reference/algorithm/lower_bound/).



---
## window of expectation

In CFG model, the new values of tempo *etc* are estimated  in leaves (terminal productions), using the MTU time interval $`[x, x'[`$ associated to non-terminals ($`q = x' - x`$) and the real-time onset $`t_{n+1}`$ in the input timeline.

In order to discard meaningless parse trees, and reduce search space, we restrict this $`t_{n+1}`$ to a window of expectation:

```math
t_{n} - \frac{p}{2q} ≤ t_{n+1} < t_n + \frac{p}{2q}   
```

When $`t_{n+1}`$ is out of this window, the application of the terminal production is discarded.

Q: narrower window?

[Large 94], pages 14-15, defines a region of temporal expectancy, using an output pulse 

```math
o(t) = 1 + \tanh(\gamma.a(t) )
```

where parameter $`\gamma`$ is the output gain, and $`a(t) = cos(2\pi. \phi(t)) - 1`$ is an activation function (the phase $`\phi(t) = \frac{t - t_0}{p}`$). The more $`\gamma`$ increases, the more the temporal receptive field shrinks. 

Q2: shall we consider the attentional focus $`\kappa_{n+1}`$ to define the window? 



---
**listening experiments**

for validation of these equations and the coupled oscillators model of listener / player.



> Jones, M.R., Moynihan, H., MacKenzie, N., Puente, J.
> Temporal aspects of stimulus-driven attending in dynamic arrays 
> Psychol. Sci. 13 (4), 313–319. 2002.
> https://doi.org/10.1111/1467-9280.00458




> Anna-Katharina R. Bauer, Manuela Jaeger, Jeremy D. Thorne, Alexandra Bendixen, Stefan Debener,
> The auditory dynamic attending theory revisited: A closer look at the pitch comparison task
> Brain Research, Volume 1626, 2015, Pages 198-210, ISSN 0006-8993
> https://doi.org/10.1016/j.brainres.2015.04.032




---
**appendix: coupled oscillators**

see *e.g. http://www.math.pitt.edu/~bard/classes/mth3380/syncpapers/metronome.pdf

> Synchronization of metronomes
> James Pantaleone
> Am. J. Phys **70**(10), 992-1000. 2002.



There are many youtube videos presenting similar experiments.

*e.g. https://sciencedemonstrations.fas.harvard.edu/presentations/synchronization-metronomes			 	



---

see also

> Physics of Oscillations and Waves
> With use of Matlab and Python
> Arnt Inge Vistnes
> Springer, Undergraduate Texts in Physics, 2018.
> https://link.springer.com/book/10.1007%2F978-3-319-72314-3



---

recherche de pulsation / tempo

considére dans la séquence musicale la seule suite d’inter-onsets (durées séparant deux attaques successives).

considère un oscillateur isolé, ayant une période d’oscillation par défaut, qu’il couple à un autre oscillateur représentant le train d’impulsions de la séquence à analyser.

L’oscillateur corrige alors sa période selon la méthode du gradient descendant, de manière à minimiser l’écart entre sa pulsation et la période déduite de la nouvelle impulsion.

Si cet écart est trop important il ne tient pas compte de la dernière impulsion.

Plusieurs valeurs de couplage sont testées puis les résultats sont analysés par des "diagrammes régime" qui représentent la force de couplage des deux oscillateurs en fonction du rapport de couplage qui les unit

(nombre de périodes d’un oscillateur pour une période de l’autre oscillateur couplé).

> 
