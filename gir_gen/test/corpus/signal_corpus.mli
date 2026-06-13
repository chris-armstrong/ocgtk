(* Signal corpus: classify every signal in a GIR file and return outcomes.
   Used by regression tests to detect unintended changes in signal
   classification behaviour. *)

type classification_outcome =
  | Supported of {
      class_or_iface : string;
      signal_name : string;
    }
  | Unsupported of {
      class_or_iface : string;
      signal_name : string;
      reason : string;
    }

type signal_coverage = {
  namespace : string;
  total_signals : int;
  supported : int;
  unsupported : int;
  by_reason : (string * int) list;
}
[@@deriving sexp]

val classify_signals_of_file : string -> classification_outcome list

val coverage_of_namespace : string -> classification_outcome list -> signal_coverage

val coverage_of_file : string -> signal_coverage

val compare_coverage :
  signal_coverage -> signal_coverage -> (unit, string list) result

val count_supported : classification_outcome list -> int

val tests : unit Alcotest.test_case list