open Sexplib.Std
module Types = Gir_gen_lib.Types
module Signal_gen = Gir_gen_lib.Generate.Signal_gen

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

let build_context
    (namespace : Types.gir_namespace)
    (repository : Types.gir_repository)
    (classes : Types.gir_class list)
    (interfaces : Types.gir_interface list)
    (enums : Types.gir_enum list)
    (bitfields : Types.gir_bitfield list)
    (records : Types.gir_record list) : Types.generation_context =
  {
    Types.namespace;
    repository;
    classes;
    interfaces;
    enums;
    bitfields;
    records;
    module_groups = Hashtbl.create 0;
    current_cycle_classes = [];
    cross_references = Types.StringMap.empty;
  }

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
    List.concat_map (fun (cls : Types.gir_class) ->
        List.map (classify_entity cls.Types.class_name) cls.Types.signals)
      classes
  in
  let iface_outcomes =
    List.concat_map (fun (iface : Types.gir_interface) ->
        List.map (classify_entity iface.Types.interface_name) iface.Types.signals)
      interfaces
  in
  class_outcomes @ iface_outcomes

type histogram = {
  namespace : string;
  total_signals : int;
  supported : int;
  unsupported : int;
  by_reason : (string * int) list;
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
  histogram_of_namespace namespace.Types.namespace_name outcomes

let gir_files =
  [
    ("Gtk", "Gtk-4.0.gir");
    ("Gdk", "Gdk-4.0.gir");
    ("Gio", "Gio-2.0.gir");
    ("Pango", "Pango-1.0.gir");
    ("Gsk", "Gsk-4.0.gir");
    ("GdkPixbuf", "GdkPixbuf-2.0.gir");
    ("Graphene", "Graphene-1.0.gir");
  ]

let () =
  let gir_dir =
    match Array.to_list Sys.argv with
    | [_; dir] -> dir
    | _ -> Filename.concat (Sys.getcwd ()) "gir"
  in
  let histograms =
    List.map (fun (_ns, filename) ->
        let filepath = Filename.concat gir_dir filename in
        Printf.eprintf "Processing %s...\n" filepath;
        histogram_of_file filepath)
      gir_files
  in
  let sexp_items = List.map sexp_of_histogram histograms in
  let sexp = Sexplib.Sexp.List sexp_items in
  let output_path =
    Filename.concat (Sys.getcwd ())
      "gir_gen/test/corpus/signal_corpus_baseline.sexp"
  in
  let oc = open_out output_path in
  output_string oc (Sexplib.Sexp.to_string_hum sexp);
  output_char oc '\n';
  close_out oc;
  Printf.eprintf "Baseline written to %s\n" output_path