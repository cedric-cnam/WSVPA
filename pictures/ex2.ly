%{
example transcription 2
=======================


  1. Save this file

  2. Select

       Compile > Typeset file

  from the menu.

  The file is processed, and

  3.  The PDF viewer will pop up. Click one of the noteheads.


That's it.  For more information, visit http://lilypond.org .

%}

\version "2.20.0"  % necessary for upgrading to future LilyPond versions.

\header{ }

\relative c'' {
  \time 1/4
  a8. b16  \acciaccatura cis \tuplet 3/2 { d8 e f } 
}
