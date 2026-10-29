(* Unit tests for Doc_index (gir_gen/lib/generate/doc_index.ml): the index
   lists what the emitters generate, so the resolver never links to a type or
   constant the generator filters out. Checked through Doc_resolve, the
   index's only reader. *)

open Gir_gen_lib
open Gir_gen_lib.Generate
open Type_factory

let string_type = make_gir_type ~name:"utf8" ~c_type:"gchar*" ()
let variant_type = make_gir_type ~name:"GLib.Variant" ~c_type:"GVariant*" ()

let index =
  Doc_index.build ~namespace:"Gtk"
    ~classes:
      [
        make_gir_class ~class_name:"Button" ();
        make_gir_class ~class_name:"Hidden" ~introspectable:false ();
      ]
    ~interfaces:[]
    ~records:
      [
        make_gir_record ~record_name:"TextIter" ();
        make_gir_record ~record_name:"ButtonClass" ~is_gtype_struct_for:"Button"
          ();
        make_gir_record ~record_name:"ButtonPrivate" ();
      ]
    ~enums:[] ~bitfields:[]
    ~constants:
      [
        make_gir_constant ~constant_name:"PRIORITY_RESIZE" ();
        make_gir_constant ~constant_name:"NAME" ~value_type:string_type ();
        make_gir_constant ~constant_name:"DEFAULT_STATE"
          ~value_type:variant_type ();
      ]
    ~cross_references:Types.StringMap.empty

let links gir =
  let refs : Doc_resolve.env =
    { namespace = "Gtk"; layer = Types.Main_library; index }
  in
  match
    Doc_resolve.resolve refs (Doc_translate.parse Doc_translate.Member gir)
  with
  | _, [ { result; _ } ] -> Result.is_ok result
  | _, outcomes ->
      Alcotest.failf "expected one reference in %S, got %d" gir
        (List.length outcomes)

let check label gir expected = Alcotest.(check bool) label expected (links gir)

let test_classes () =
  check "an introspectable class" "[class@Gtk.Button]" true;
  check "a class the emitters skip" "[class@Gtk.Hidden]" false

let test_records () =
  check "a generated record" "[struct@Gtk.TextIter]" true;
  check "a class struct" "[struct@Gtk.ButtonClass]" false;
  check "a private record" "[struct@Gtk.ButtonPrivate]" false

let test_constants () =
  check "an integer constant" "[const@Gtk.PRIORITY_RESIZE]" true;
  check "a string constant" "[const@Gtk.NAME]" true;
  check "a constant with no OCaml literal form" "[const@Gtk.DEFAULT_STATE]"
    false

let test_empty () =
  let refs : Doc_resolve.env =
    { namespace = "Gtk"; layer = Types.Main_library; index = Doc_index.empty }
  in
  match
    Doc_resolve.resolve refs
      (Doc_translate.parse Doc_translate.Member "[class@Gtk.Button]")
  with
  | _, [ { result = Error Namespace_not_generated; _ } ] -> ()
  | _ -> Alcotest.fail "an empty index knows no namespace"

let tests =
  [
    ("classes: generated only", `Quick, test_classes);
    ("records: no class or private structs", `Quick, test_records);
    ("constants: mappable types only", `Quick, test_constants);
    ("empty index", `Quick, test_empty);
  ]
