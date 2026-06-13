(* Regression test: recompute signal coverage from live GIR files and compare
   against the checked-in baseline. Any classification change that alters the
   coverage counts will be caught here.

   To update the baseline after a legitimate classification change:
   1. Run the coverage generator (see Signal_corpus module)
   2. Overwrite signal_corpus_baseline.sexp with the new output
   3. Commit the updated baseline alongside the classification change *)

let namespace_files =
  [
    ("Gtk", "Gtk-4.0.gir");
    ("Gdk", "Gdk-4.0.gir");
    ("Gio", "Gio-2.0.gir");
    ("Pango", "Pango-1.0.gir");
    ("Gsk", "Gsk-4.0.gir");
    ("GdkPixbuf", "GdkPixbuf-2.0.gir");
    ("Graphene", "Graphene-1.0.gir");
  ]

let load_baseline () : Signal_corpus.signal_coverage list =
  let baseline_path =
    Filename.concat (Filename.dirname Sys.executable_name)
      "corpus/signal_corpus_baseline.sexp"
  in
  let sexp = Sexplib.Sexp.load_sexp baseline_path in
  Sexplib.Conv.list_of_sexp Signal_corpus.signal_coverage_of_sexp sexp

let compare_namespace baseline_coverages gir_dir (namespace_name, gir_file) =
  let live_cov =
    Signal_corpus.coverage_of_file (Filename.concat gir_dir gir_file)
  in
  let baseline_cov =
    List.find_opt
      (fun (cov : Signal_corpus.signal_coverage) -> String.equal cov.namespace namespace_name)
      baseline_coverages
  in
  match baseline_cov with
  | None ->
      [ Printf.sprintf "%s: no baseline coverage found" namespace_name ]
  | Some baseline_coverage -> (
      match Signal_corpus.compare_coverage baseline_coverage live_cov with
      | Ok () -> []
      | Error reasons ->
          List.map
            (fun r -> Printf.sprintf "%s: %s" namespace_name r)
            reasons)

let test_baseline_regression () =
  let baseline_coverages = load_baseline () in
  let gir_dir = Helpers.gir_data_dir () in
  let mismatches =
    List.concat_map
      (compare_namespace baseline_coverages gir_dir)
      namespace_files
  in
  match mismatches with
  | [] -> ()
  | _ ->
      Alcotest.failf "live coverage differs from baseline:\n%s"
        (String.concat "\n" mismatches)

let tests =
  [
    Alcotest.test_case
      "live coverage matches baseline for all 7 namespaces" `Slow
      test_baseline_regression;
  ]