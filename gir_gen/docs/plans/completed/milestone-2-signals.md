# Milestone 2: Signal Handling with Parameters

**Status: COMPLETED**
**Created: 2026-04-27**
**Updated: 2026-06-14**

Signal connectors with typed parameters and non-void returns are now generated as
free functions in per-class L1 modules, with L2 method forwarders. Coverage: 413 of
466 signals across 7 namespaces (≈89%).

See [architecture/closures_and_signals.md](../../../architecture/closures_and_signals.md)
for the current signal architecture, marshalling, and generation details.

The signal-corpus regression baseline is at
`gir_gen/test/corpus/signal_corpus_baseline.sexp`.
