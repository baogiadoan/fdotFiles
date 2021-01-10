(TeX-add-style-hook
 "cole"
 (lambda ()
   (TeX-add-to-alist 'LaTeX-provided-package-options
                     '(("hyperref" "colorlinks=true") ("cleveref" "nameinlink") ("forest" "linguistics") ("mdframed" "framemethod=TikZ") ("tocstyle" "tocindentauto") ("enumitem" "shortlabels") ("todonotes" "obeyFinal" "textsize=scriptsize" "shadow") ("scrlayer-scrpage" "headsepline")))
   (add-to-list 'LaTeX-verbatim-environments-local "lstlisting")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "lstinline")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "href")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperref")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperimage")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "hyperbaseurl")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "nolinkurl")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "url")
   (add-to-list 'LaTeX-verbatim-macros-with-braces-local "path")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "lstinline")
   (add-to-list 'LaTeX-verbatim-macros-with-delims-local "path")
   (TeX-run-style-hooks
    "xcolor"
    "amsmath"
    "amssymb"
    "amsthm"
    "stmaryrd"
    "hyperref"
    "cleveref"
    "array"
    "tikz"
    "forest"
    "graphicx"
    "nicematrix"
    "listofitems"
    "xlop"
    "pgfplots"
    ""
    "wasysym"
    "thmtools"
    "mdframed"
    "tocstyle"
    "listings"
    "mathrsfs"
    "textcomp"
    "enumitem"
    "todonotes"
    "mathtools"
    "microtype"
    "fancyhdr"
    "scrlayer-scrpage")
   (TeX-add-symbols
    '("cycle" ["argument"] 1)
    '("norm" 1)
    '("abs" 1)
    '("mailto" 1)
    '("ceil" 1)
    '("floor" 1)
    '("cbrt" 1)
    "cmark"
    "xmark"
    "ii"
    "imply"
    "ol"
    "ul"
    "wt"
    "wh"
    "eps"
    "CC"
    "FF"
    "NN"
    "QQ"
    "RR"
    "PP"
    "ZZ"
    "EE"
    "charin"
    "surjto"
    "injto")
   (LaTeX-add-environments
    "soln")
   (LaTeX-add-amsthm-newtheorems
    "claim"
    "conjecture"
    "definition"
    "fact"
    "answer"
    "case"
    "ques"
    "exercise"
    "hwexercise"
    "problem"
    "hwproblem"
    "recall"
    "note"
    "remark"
    "abuse")
   (LaTeX-add-thmtools-declaretheoremstyles
    "thmbluebox"
    "thmrecbox"
    "thminlinebox")
   (LaTeX-add-thmtools-declaretheorems
    "theorem"
    "lemma"
    "proposition"
    "corollary"
    "theorem*"
    "lemma*"
    "proposition*"
    "corollary*"
    "example"
    "example*")
   (LaTeX-add-mdframed-mdfdefinestyles
    "mdbluebox"
    "mdrecbox"
    "mdinlinebox")
   (LaTeX-add-enumitem-newlists
    '("walk" "enumerate")))
 :latex)

