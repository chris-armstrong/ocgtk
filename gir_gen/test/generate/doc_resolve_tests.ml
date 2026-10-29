(* Unit tests for Doc_resolve (gir_gen/lib/generate/doc_resolve.ml): each
   type-level fragment linked from both layers, endpoint forms (relative,
   anchored, backticked), cross-package targets, and every miss reason. The
   index is built by Doc_index from a small Gtk namespace and a Gdk
   references file. *)

open Gir_gen_lib
open Gir_gen_lib.Generate
open Type_factory

let gdk_refs =
  Helpers.make_ncr "Gdk"
    (List.fold_left
       (fun acc (cr_name, cr_type) ->
         Types.StringMap.add cr_name
           (make_cross_reference_entity ~cr_name ~cr_type ())
           acc)
       Types.StringMap.empty
       [
         ("Texture", make_cross_reference_type `Class);
         ("PaintableFlags", make_cross_reference_type `Bitfield);
         ("KEY_a", make_cross_reference_type `Constant);
       ])

let index =
  Doc_index.build ~namespace:"Gtk"
    ~classes:
      [
        make_gir_class ~class_name:"Button" ();
        make_gir_class ~class_name:"ToggleButton" ();
      ]
    ~interfaces:[ make_gir_interface ~interface_name:"Actionable" () ]
    ~records:[ make_gir_record ~record_name:"TextIter" () ]
    ~enums:[ make_gir_enum ~enum_name:"Orientation" () ]
    ~bitfields:[ make_gir_bitfield ~bitfield_name:"StateFlags" () ]
    ~constants:
      [
        make_gir_constant ~constant_name:"ACCESSIBLE_ATTRIBUTE_OVERLINE_NONE" ();
      ]
    ~cross_references:(make_cross_reference_map [ gdk_refs ])

let env layer : Doc_resolve.env = { namespace = "Gtk"; layer; index }
let l2 = env Types.Main_library
let l1 = env Types.Raw_library

let translate refs gir =
  String.trim (Doc_emit.translate ~refs Doc_translate.Member gir)

let check_links ~refs label gir expected =
  Alcotest.(check string) label expected (translate refs gir)

let reason_testable =
  Alcotest.testable
    (Fmt.of_to_string Doc_resolve.miss_reason_name)
    Doc_resolve.equal_miss_reason

(* The miss reason of a doc's only reference; [None] when it linked. *)
let miss refs gir =
  match
    Doc_resolve.resolve refs (Doc_translate.parse Doc_translate.Member gir)
  with
  | _, [ { result = Ok (); _ } ] -> None
  | _, [ { result = Error reason; _ } ] -> Some reason
  | _, outcomes ->
      Alcotest.failf "expected one reference in %S, got %d" gir
        (List.length outcomes)

let check_miss label gir expected =
  Alcotest.(check (option reason_testable)) label (Some expected) (miss l2 gir)

(* ---------- types, from both layers ----------------------------- *)

let test_class_from_both_layers () =
  check_links ~refs:l2 "layer 2 doc links the class type"
    "[class@Gtk.ToggleButton]"
    "{{!Ocgtk.Toggle_button.class-type-toggle_button_t}[Gtk.ToggleButton]}";
  check_links ~refs:l1 "layer 1 doc links the layer 1 module"
    "[class@Gtk.ToggleButton]" "{{!Ocgtk.Raw.Toggle_button}[Gtk.ToggleButton]}"

let test_interface_from_both_layers () =
  check_links ~refs:l2 "layer 2" "[iface@Gtk.Actionable]"
    "{{!Ocgtk.Actionable.class-type-actionable_t}[Gtk.Actionable]}";
  check_links ~refs:l1 "layer 1" "[iface@Gtk.Actionable]"
    "{{!Ocgtk.Raw.Actionable}[Gtk.Actionable]}"

let test_record_links_like_a_class () =
  check_links ~refs:l2 "a record has a class type" "[struct@Gtk.TextIter]"
    "{{!Ocgtk.Text_iter.class-type-text_iter_t}[Gtk.TextIter]}";
  check_links ~refs:l1 "and a layer 1 module" "[struct@Gtk.TextIter]"
    "{{!Ocgtk.Raw.Text_iter}[Gtk.TextIter]}"

let test_enum_same_from_both_layers () =
  List.iter
    (fun refs ->
      check_links ~refs "enum type in Enums" "[enum@Gtk.Orientation]"
        "{{!Ocgtk.Enums.type-orientation}[Gtk.Orientation]}";
      check_links ~refs "bitfield list type in Enums" "[flags@Gtk.StateFlags]"
        "{{!Ocgtk.Enums.type-stateflags}[Gtk.StateFlags]}")
    [ l1; l2 ]

let test_constant_same_from_both_layers () =
  List.iter
    (fun refs ->
      check_links ~refs "constant in Constants"
        "[const@Gtk.ACCESSIBLE_ATTRIBUTE_OVERLINE_NONE]"
        "{{!Ocgtk.Constants.accessible_attribute_overline_none}[Gtk.ACCESSIBLE_ATTRIBUTE_OVERLINE_NONE]}")
    [ l1; l2 ]

let test_type_fragment_takes_kind_from_index () =
  check_links ~refs:l2 "a class" "[type@Gtk.Button]"
    "{{!Ocgtk.Button.class-type-button_t}[Gtk.Button]}";
  check_links ~refs:l2 "an enum" "[type@Gtk.Orientation]"
    "{{!Ocgtk.Enums.type-orientation}[Gtk.Orientation]}"

(* ---------- other namespaces ------------------------------------ *)

let test_cross_package_type () =
  check_links ~refs:l2 "class of a dependency" "[class@Gdk.Texture]"
    "{{!Ocgdk.Texture.class-type-texture_t}[Gdk.Texture]}";
  check_links ~refs:l1 "from layer 1" "[class@Gdk.Texture]"
    "{{!Ocgdk.Raw.Texture}[Gdk.Texture]}";
  check_links ~refs:l2 "flags type of a dependency" "[flags@Gdk.PaintableFlags]"
    "{{!Ocgdk.Enums.type-paintableflags}[Gdk.PaintableFlags]}";
  check_links ~refs:l2 "constant of a dependency" "[const@Gdk.KEY_a]"
    "{{!Ocgdk.Constants.key_a}[Gdk.KEY_a]}"

(* ---------- endpoint forms -------------------------------------- *)

let test_relative_endpoint () =
  check_links ~refs:l2 "no namespace: the current one" "[class@ToggleButton]"
    "{{!Ocgtk.Toggle_button.class-type-toggle_button_t}[ToggleButton]}"

let test_anchor_dropped () =
  check_links ~refs:l2 "the anchor is not part of the path"
    "[class@Gtk.Button#css-nodes]"
    "{{!Ocgtk.Button.class-type-button_t}[Gtk.Button]}"

let test_backticked_endpoint () =
  check_links ~refs:l2 "backticks around the endpoint are dropped"
    "[class@`Gtk.Button`]" "{{!Ocgtk.Button.class-type-button_t}[Gtk.Button]}"

(* ---------- misses ---------------------------------------------- *)

let test_namespace_not_generated () =
  check_miss "GObject" "[class@GObject.Object]" Namespace_not_generated;
  check_links ~refs:l2 "stays code" "[class@GObject.Object]" "[GObject.Object]"

let test_unknown_target () =
  check_miss "type not in the namespace" "[class@Gtk.Nope]" Unknown_target;
  check_miss "constant not in the namespace" "[const@Gdk.KEY_b]" Unknown_target;
  check_miss "a class fragment naming a member" "[class@Gtk.Button.label]"
    Unknown_target

let test_members_not_resolved_yet () =
  check_miss "method" "[method@Gtk.Button.clicked]" Not_resolved_yet;
  check_miss "signal" "[signal@Gtk.Button::clicked]" Not_resolved_yet;
  check_miss "property" "[property@Gtk.Button:label]" Not_resolved_yet;
  check_miss "constructor" "[ctor@Gtk.Button.new]" Not_resolved_yet;
  check_miss "enum member" "[enum@Gtk.Orientation.HORIZONTAL]" Not_resolved_yet;
  check_miss "C symbol" "[id@gtk_button_new]" Not_resolved_yet;
  check_miss "legacy sigil" "Use #GtkButton here." Not_resolved_yet

let test_member_in_other_namespace () =
  check_miss "method" "[method@Gdk.Texture.get_width]" Member_in_other_namespace;
  check_miss "enum member" "[flags@Gdk.PaintableFlags.SIZE]"
    Member_in_other_namespace

let test_kind_not_generated () =
  List.iter
    (fun gir -> check_miss gir gir Kind_not_generated)
    [
      "[func@Gtk.init]";
      "[callback@Gtk.TickCallback]";
      "[vfunc@Gtk.Widget.measure]";
      "[alias@Gtk.Allocation]";
      "[error@Gtk.BuilderError]";
    ]

let test_no_links () =
  check_links
    ~refs:(Doc_resolve.no_links ~namespace:"Gtk")
    "an empty index links nothing" "[class@Gtk.Button]" "[Gtk.Button]"

let test_class_member_links_nothing () =
  check_links
    ~refs:(Doc_resolve.class_member l2)
    "class type member docs keep code" "[class@Gtk.Button]" "[Gtk.Button]"

(* ---------- nesting and summary --------------------------------- *)

let test_reference_inside_markup () =
  check_links ~refs:l2 "inside bold and list items" "**see [class@Gtk.Button]**"
    "{b see {{!Ocgtk.Button.class-type-button_t}[Gtk.Button]}}"

let test_outcomes_in_document_order () =
  let _, outcomes =
    Doc_resolve.resolve l2
      (Doc_translate.parse Doc_translate.Member
         "[class@Gtk.Button] then [func@Gtk.init]\n\n- [const@Gdk.KEY_a]")
  in
  Alcotest.(check (list string))
    "one outcome per reference, in order"
    [ "Gtk.Button"; "Gtk.init"; "Gdk.KEY_a" ]
    (List.map (fun (o : Doc_resolve.outcome) -> o.endpoint) outcomes)

let test_summary () =
  let _, outcomes =
    Doc_resolve.resolve l2
      (Doc_translate.parse Doc_translate.Member
         "[class@Gtk.Button] [class@Gtk.Nope] [func@Gtk.init]")
  in
  let summary = Fmt.str "%a" Doc_resolve.pp_summary outcomes in
  List.iter
    (fun sub ->
      Alcotest.(check bool)
        sub true
        (Re.execp (Re.compile (Re.str sub)) summary))
    [
      "Doc references: 3, 1 linked";
      "class 2: linked 1, unknown-target 1";
      "func 1: kind-not-generated 1";
      "unknown targets: class@Gtk.Nope";
    ]

let tests =
  [
    ("class from both layers", `Quick, test_class_from_both_layers);
    ("interface from both layers", `Quick, test_interface_from_both_layers);
    ("record links like a class", `Quick, test_record_links_like_a_class);
    ("enum and flags from both layers", `Quick, test_enum_same_from_both_layers);
    ("constant from both layers", `Quick, test_constant_same_from_both_layers);
    ( "type fragment takes its kind from the index",
      `Quick,
      test_type_fragment_takes_kind_from_index );
    ("cross-package types and constants", `Quick, test_cross_package_type);
    ("relative endpoint", `Quick, test_relative_endpoint);
    ("anchor dropped", `Quick, test_anchor_dropped);
    ("backticked endpoint", `Quick, test_backticked_endpoint);
    ("namespace not generated", `Quick, test_namespace_not_generated);
    ("unknown target", `Quick, test_unknown_target);
    ("members not resolved yet", `Quick, test_members_not_resolved_yet);
    ("member in other namespace", `Quick, test_member_in_other_namespace);
    ("kind not generated", `Quick, test_kind_not_generated);
    ("empty index links nothing", `Quick, test_no_links);
    ("class member docs link nothing", `Quick, test_class_member_links_nothing);
    ("reference inside markup", `Quick, test_reference_inside_markup);
    ("outcomes in document order", `Quick, test_outcomes_in_document_order);
    ("summary", `Quick, test_summary);
  ]
