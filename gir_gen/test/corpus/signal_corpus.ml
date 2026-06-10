(* Signal corpus: classify every signal in a GIR file and return outcomes.
   Used by regression tests to detect unintended changes in signal
   classification behaviour. *)

open Gir_gen_lib.Types
module Signal_gen = Gir_gen_lib.Generate.Signal_gen
open Sexplib.Std

(* ================================================================= *)
(* Classification outcome                                             *)
(* ================================================================= *)

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

(* ================================================================= *)
(* Build a minimal generation context from parsed entities            *)
(* ================================================================= *)

let build_context
    (namespace : gir_namespace)
    (repository : gir_repository)
    (classes : gir_class list)
    (interfaces : gir_interface list)
    (enums : gir_enum list)
    (bitfields : gir_bitfield list)
    (records : gir_record list) : generation_context =
  {
    namespace;
    repository;
    classes;
    interfaces;
    enums;
    bitfields;
    records;
    module_groups = Hashtbl.create 0;
    current_cycle_classes = [];
    cross_references = StringMap.empty;
  }

(* ================================================================= *)
(* Classify all signals in a single file                              *)
(* ================================================================= *)

let classify_signals_of_file filepath =
  let repository, namespace, classes, interfaces, enums, bitfields, records =
    Gir_gen_lib.Parse.Gir_parser.parse_gir_file filepath []
  in
  let ctx =
    build_context namespace repository classes interfaces enums bitfields records
  in
  let classify_entity class_name signal =
    match Signal_gen.classify ~ctx signal with
    | Ok _ ->
        Supported { class_or_iface = class_name; signal_name = signal.signal_name }
    | Error reason ->
        Unsupported
          {
            class_or_iface = class_name;
            signal_name = signal.signal_name;
            reason;
          }
  in
  let class_outcomes =
    List.concat_map (fun (cls : gir_class) ->
        List.map (classify_entity cls.class_name) cls.signals)
      classes
  in
  let iface_outcomes =
    List.concat_map (fun (iface : gir_interface) ->
        List.map (classify_entity iface.interface_name) iface.signals)
      interfaces
  in
  class_outcomes @ iface_outcomes

(* ================================================================= *)
(* Histogram aggregation                                              *)
(* ================================================================= *)

type histogram = {
  namespace : string;
  total_signals : int;
  supported : int;
  unsupported : int;
  by_reason : (string * int) list;  (* sorted by reason *)
}
[@@deriving sexp]

let histogram_of_namespace (ns_name : string) (outcomes : classification_outcome list)
    : histogram =
  let total_signals = List.length outcomes in
  let supported =
    List.fold_left (fun acc -> function Supported _ -> acc + 1 | _ -> acc) 0
      outcomes
  in
  let unsupported = total_signals - supported in
  let reason_counts =
    List.fold_left
      (fun acc -> function
        | Unsupported { reason; _ } ->
            let current = List.assoc_opt reason acc |> function
              | Some n -> n + 1
              | None -> 1
            in
            (reason, current) :: List.filter (fun (r, _) -> not (String.equal r reason)) acc
        | Supported _ -> acc)
      [] outcomes
  in
  let by_reason = List.sort (fun (a, _) (b, _) -> String.compare a b) reason_counts in
  { namespace = ns_name; total_signals; supported; unsupported; by_reason }

let histogram_of_file filepath =
  let _, namespace, _, _, _, _, _ =
    Gir_gen_lib.Parse.Gir_parser.parse_gir_file filepath []
  in
  let outcomes = classify_signals_of_file filepath in
  histogram_of_namespace namespace.namespace_name outcomes

let compare_histograms (baseline : histogram) (live : histogram) :
    (unit, string list) result =
  let mismatches = ref [] in
  let check_field label expected actual =
    if expected <> actual then
      mismatches := Printf.sprintf "%s: expected %d, got %d" label expected actual
        :: !mismatches
  in
  check_field "supported" baseline.supported live.supported;
  check_field "unsupported" baseline.unsupported live.unsupported;
  check_field "total_signals" baseline.total_signals live.total_signals;
  (* Compare by_reason lists *)
  let rec compare_reasons baseline_reasons live_reasons =
    match (baseline_reasons, live_reasons) with
    | [], [] -> ()
    | [], (reason, count) :: _ ->
        mismatches :=
          Printf.sprintf "extra reason in live: %s (%d)" reason count
          :: !mismatches
    | (reason, count) :: _, [] ->
        mismatches :=
          Printf.sprintf "missing reason in live: %s (%d)" reason count
          :: !mismatches
    | (b_reason, b_count) :: bs, (l_reason, l_count) :: ls ->
        if String.equal b_reason l_reason then begin
          if b_count <> l_count then
            mismatches :=
              Printf.sprintf "reason %s: expected %d, got %d" b_reason b_count
                l_count
              :: !mismatches;
          compare_reasons bs ls
        end
        else if String.compare b_reason l_reason < 0 then begin
          mismatches :=
            Printf.sprintf "missing reason in live: %s (%d)" b_reason b_count
            :: !mismatches;
          compare_reasons bs ((l_reason, l_count) :: ls)
        end
        else begin
          mismatches :=
            Printf.sprintf "extra reason in live: %s (%d)" l_reason l_count
            :: !mismatches;
          compare_reasons ((b_reason, b_count) :: bs) ls
        end
  in
  compare_reasons baseline.by_reason live.by_reason;
  let collected = List.rev !mismatches in
  (match collected with [] -> (Ok ()) | _ -> Error collected
    : (unit, string list) result)

(* ================================================================= *)
(* Tests                                                              *)
(* ================================================================= *)

let test_classify_real_gir_file () =
  let gir_dir = Helpers.gir_data_dir () in
  let gtk_gir = Filename.concat gir_dir "Gtk-4.0.gir" in
  let outcomes = classify_signals_of_file gtk_gir in
  let supported_count =
    List.fold_left (fun acc -> function Supported _ -> acc + 1 | _ -> acc) 0
      outcomes
  in
  Alcotest.(check bool) "outcomes non-empty" true (List.length outcomes > 0);
  Alcotest.(check bool) "has supported signals" true (supported_count > 0)

let test_synthetic_supported_signal () =
  let gir_content =
    Helpers.wrap_namespace ~namespace_name:"Test" ~version:"1.0"
      ~shared_library:"libtest.so" ~c_prefix:"Test" ~symbol_prefix:"test"
      {|<class name="TestClass"
               c:type="TestClass"
               parent="GtkWidget">
           <signal name="changed" when="last">
             <return-value transfer-ownership="none">
               <type name="gboolean" c:type="gboolean"/>
             </return-value>
           </signal>
         </class>|}
  in
  let tmp = Filename.temp_file "signal_corpus_test" ".gir" in
  Helpers.create_gir_file tmp gir_content;
  Fun.protect
    ~finally:(fun () -> Sys.remove tmp)
    (fun () ->
      let outcomes = classify_signals_of_file tmp in
      match outcomes with
      | [ Supported { class_or_iface; signal_name } ] ->
          Alcotest.(check string) "class name" "TestClass" class_or_iface;
          Alcotest.(check string) "signal name" "changed" signal_name
      | _ ->
          Alcotest.failf
            "expected exactly one Supported outcome for gboolean-return signal, \
             got %d outcomes"
            (List.length outcomes))

let test_histogram_of_namespace_counts () =
  let outcomes =
    [
      Supported { class_or_iface = "A"; signal_name = "sig1" };
      Supported { class_or_iface = "A"; signal_name = "sig2" };
      Supported { class_or_iface = "B"; signal_name = "sig3" };
      Unsupported
        { class_or_iface = "B"; signal_name = "sig4"; reason = "bad return type" };
      Unsupported
        { class_or_iface = "C"; signal_name = "sig5"; reason = "bad return type" };
    ]
  in
  let h = histogram_of_namespace "TestNS" outcomes in
  Alcotest.(check string) "namespace" "TestNS" h.namespace;
  Alcotest.(check int) "total_signals" 5 h.total_signals;
  Alcotest.(check int) "supported" 3 h.supported;
  Alcotest.(check int) "unsupported" 2 h.unsupported;
  (* by_reason is sorted alphabetically by reason *)
  Alcotest.(check int) "by_reason length" 1 (List.length h.by_reason);
  match h.by_reason with
  | [ (reason, count) ] ->
      Alcotest.(check string) "reason" "bad return type" reason;
      Alcotest.(check int) "count" 2 count
  | _ -> Alcotest.fail "expected exactly one reason bucket"

let test_compare_identical_histograms () =
  let h =
    {
      namespace = "Gtk";
      total_signals = 10;
      supported = 7;
      unsupported = 3;
      by_reason = [ ("bad param", 2); ("bad return", 1) ];
    }
  in
  match compare_histograms h h with
  | Ok () -> ()
  | Error reasons ->
      Alcotest.failf "identical histograms should match, but got: %s"
        (String.concat "; " reasons)

let test_compare_histograms_detects_mismatch () =
  let baseline =
    {
      namespace = "Gtk";
      total_signals = 10;
      supported = 7;
      unsupported = 3;
      by_reason = [ ("bad param", 2); ("bad return", 1) ];
    }
  in
  let live =
    {
      namespace = "Gtk";
      total_signals = 10;
      supported = 6;
      unsupported = 4;
      by_reason = [ ("bad param", 1); ("bad return", 2); ("new reason", 1) ];
    }
  in
  match compare_histograms baseline live with
  | Ok () -> Alcotest.fail "different histograms should not match"
  | Error reasons ->
      let msg = String.concat "; " reasons in
      Alcotest.(check bool) "mentions supported mismatch"
        true (String.contains msg 's');
      Alcotest.(check bool) "mentions unsupported mismatch"
        true (String.contains msg 'u')

let test_histogram_of_file_returns_nontrivial () =
  let gir_dir = Helpers.gir_data_dir () in
  let gtk_gir = Filename.concat gir_dir "Gtk-4.0.gir" in
  let h = histogram_of_file gtk_gir in
  Alcotest.(check bool) "total_signals > 0" true (h.total_signals > 0);
  Alcotest.(check bool) "supported > 0" true (h.supported > 0);
  Alcotest.(check string) "namespace is Gtk" "Gtk" h.namespace

let test_sexp_roundtrip () =
  let h : histogram =
    {
      namespace = "TestNS";
      total_signals = 5;
      supported = 3;
      unsupported = 2;
      by_reason = [ ("bad return type", 2 ) ];
    }
  in
  let sexp_str = Sexplib.Sexp.to_string_hum (sexp_of_histogram h) in
  let parsed = histogram_of_sexp (Sexplib.Sexp.of_string sexp_str) in
  Alcotest.(check string) "namespace" h.namespace parsed.namespace;
  Alcotest.(check int) "total_signals" h.total_signals parsed.total_signals;
  Alcotest.(check int) "supported" h.supported parsed.supported;
  Alcotest.(check int) "unsupported" h.unsupported parsed.unsupported;
  Alcotest.(check int) "by_reason length" (List.length h.by_reason)
    (List.length parsed.by_reason)

let test_baseline_file_readable () =
  let baseline_path =
    Filename.concat (Filename.dirname Sys.executable_name)
      "corpus/signal_corpus_baseline.sexp"
  in
  let sexp = Sexplib.Sexp.load_sexp baseline_path in
  let histograms = Sexplib.Conv.list_of_sexp histogram_of_sexp sexp in
  Alcotest.(check int) "7 histogram entries" 7 (List.length histograms);
  let gtk_hist = List.find (fun h -> String.equal h.namespace "Gtk") histograms in
  Alcotest.(check bool) "Gtk total_signals > 100" true (gtk_hist.total_signals > 100);
  Alcotest.(check bool) "Gtk supported > 0" true (gtk_hist.supported > 0)

let tests =
  [
    Alcotest.test_case "classify real Gtk GIR file returns non-empty outcomes"
      `Slow test_classify_real_gir_file;
    Alcotest.test_case
      "synthetic gboolean-return signal is classified as Supported" `Quick
      test_synthetic_supported_signal;
    Alcotest.test_case
      "histogram_of_namespace produces correct counts from outcomes" `Quick
      test_histogram_of_namespace_counts;
    Alcotest.test_case
      "compare_histograms returns Ok for identical histograms" `Quick
      test_compare_identical_histograms;
    Alcotest.test_case
      "compare_histograms detects supported/unsupported count mismatches" `Quick
      test_compare_histograms_detects_mismatch;
    Alcotest.test_case
      "histogram_of_file on Gtk-4.0.gir returns non-trivial histogram" `Slow
      test_histogram_of_file_returns_nontrivial;
    Alcotest.test_case
      "histogram sexp roundtrip preserves all fields" `Quick
      test_sexp_roundtrip;
    Alcotest.test_case
      "baseline sexp file is readable and contains 7 histograms" `Slow
      test_baseline_file_readable;
  ]