# scmSpillover 0.1.2

* Removed the dependency on **limSolve** (scheduled for CRAN archival). The
  constrained least-squares solve in `scm()` is now implemented with
  `quadprog::solve.QP()`. The optimization problem (weights summing to one and
  non-negative) and the resulting estimates are unchanged; the previously
  unused `lambda` argument now serves as a ridge term for numerical stability.
* Added package-level, dataset, and S3-method documentation, plus runnable
  examples.
* Moved the raw `cigs.xls` data file to `inst/extdata/` and dropped a stray
  workspace file from `data/`.
