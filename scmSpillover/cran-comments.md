## Update reason

This update (0.1.2) removes the dependency on **limSolve**, which CRAN has
scheduled for archival. The single use of `limSolve::lsei()` has been
re-implemented with `quadprog::solve.QP()`. There is no change to the
package's user-facing API or to the estimates it produces. This resolves the
pending archival of scmSpillover as a strong reverse dependency of limSolve.

## Test environments

* Local: Windows 11, R 4.5.2

## R CMD check results

0 errors | 0 warnings | 1 note

The single NOTE is local only:

* "Files 'README.md' or 'NEWS.md' cannot be checked without 'pandoc' being
  installed." — pandoc is not installed on the local check machine; this NOTE
  does not occur on CRAN's build infrastructure.
