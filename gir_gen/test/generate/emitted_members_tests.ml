(* Unit tests for Emitted_members (gir_gen/lib/generate/emitted_members.ml):
   each drop and rename of the inventory, at the layer it applies to, and the
   four cases of the property target rule. The fixture is Member_fixture. *)

open Gir_gen_lib
open Gir_gen_lib.Generate

let names name =
  Emitted_members.names ~ctx:(Member_fixture.ctx ())
    (Member_fixture.entity name)

let layer_names layer (members : Types.doc_type_members) =
  match layer with `L1 -> members.dm_l1 | `L2 -> members.dm_l2

let find ~table layer type_name member =
  Types.StringMap.find_opt member (table (layer_names layer (names type_name)))

let check ~table label layer type_name member expected =
  Alcotest.(check (option string))
    label expected
    (find ~table layer type_name member)

let check_method =
  check ~table:(fun (n : Types.doc_member_names) -> n.dm_methods)

let check_ctor =
  check ~table:(fun (n : Types.doc_member_names) -> n.dm_constructors)

let check_signal =
  check ~table:(fun (n : Types.doc_member_names) -> n.dm_signals)

let check_property =
  check ~table:(fun (n : Types.doc_member_names) -> n.dm_properties)

let both f label type_name member expected =
  f (label ^ " (layer 1)") `L1 type_name member expected;
  f (label ^ " (layer 2)") `L2 type_name member expected

(* ---------- methods --------------------------------------------- *)

let test_emitted_method () =
  both check_method "a plain method" "Button" "set_label" (Some "set_label")

let test_filtered_method () =
  both check_method "not introspectable" "Button" "get_private" None

let test_out_parameter () =
  check_method "layer 1 has the external" `L1 "Button" "get_size"
    (Some "get_size");
  check_method "layer 2 drops it" `L2 "Button" "get_size" None

let test_inherited_name () =
  check_method "layer 1 keeps it" `L1 "Button" "show" (Some "show");
  check_method "layer 2 inherits the ancestor's" `L2 "Button" "show" None

(* A method whose name an ancestor declares with another signature is dropped
   as an inherited name, before the conflict check that would comment it out:
   both look at the same ancestors. *)
let test_conflict () =
  check_method "layer 1 keeps it" `L1 "MenuButton" "get_direction"
    (Some "get_direction");
  check_method "layer 2 drops it" `L2 "MenuButton" "get_direction" None;
  let { Emitted_members.l2_methods; _ } =
    Emitted_members.l2 ~ctx:(Member_fixture.ctx ()) ~class_name:"MenuButton"
      ~c_type:"GtkMenuButton" ~entity_kind:Class
      ~methods:Member_fixture.menu_button.methods
      ~properties:Member_fixture.menu_button.properties
  in
  Alcotest.(check (list string))
    "no method, not even a conflict comment" []
    (List.map (fun (m : Emitted_members.l2_method) -> m.name) l2_methods)

let test_renamed_method () =
  both check_method "a keyword" "Button" "open" (Some "open_")

(* ---------- constructors and signals ---------------------------- *)

let test_constructors () =
  both check_ctor "a keyword" "Button" "new" (Some "new_");
  both check_ctor "with parameters" "Button" "new_with_label"
    (Some "new_with_label");
  both check_ctor "varargs" "Button" "new_with_items" None

let test_signals () =
  both check_signal "on_ prefix" "Button" "clicked" (Some "on_clicked");
  both check_signal "hyphens" "Button" "activate-link" (Some "on_activate_link");
  both check_signal "an out parameter" "Button" "get-size" None

(* ---------- the property target rule ---------------------------- *)

let test_claimed_getter () =
  both check_property "the claiming method" "Button" "label" (Some "get_label")

let test_generated_getter () =
  check_property "layer 1 getter" `L1 "Button" "use-underline"
    (Some "get_use_underline");
  check_property "layer 2 method" `L2 "Button" "use-underline"
    (Some "use_underline")

let test_setter_only () =
  both check_property "the generated setter" "Button" "secret"
    (Some "set_secret")

let test_no_accessor () =
  both check_property "construct-only, not readable" "Button" "seed" None

let test_accessors_at_one_layer () =
  check_property "layer 1 has the getter" `L1 "MenuButton" "direction"
    (Some "get_direction");
  check_property "layer 2 has neither" `L2 "MenuButton" "direction" None

let tests =
  [
    ("emitted method", `Quick, test_emitted_method);
    ("filtered method", `Quick, test_filtered_method);
    ("out parameter: layer 1 only", `Quick, test_out_parameter);
    ("inherited name: layer 1 only", `Quick, test_inherited_name);
    ("ancestor signature differs: layer 1 only", `Quick, test_conflict);
    ("renamed method", `Quick, test_renamed_method);
    ("constructors", `Quick, test_constructors);
    ("signals", `Quick, test_signals);
    ("property: claimed getter", `Quick, test_claimed_getter);
    ("property: generated getter", `Quick, test_generated_getter);
    ("property: setter only", `Quick, test_setter_only);
    ("property: no accessor", `Quick, test_no_accessor);
    ("property: accessors at one layer", `Quick, test_accessors_at_one_layer);
  ]
