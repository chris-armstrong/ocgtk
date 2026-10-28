(* Unit tests for resolving what a layer 2 class type page says it inherits,
   implements or requires (gir_gen/lib/generate/class_gen_inheritance.ml). *)

open Gir_gen_lib
open Gir_gen_lib.Generate

let describe = function
  | Entity_doc.Bound { namespace; name } -> "link " ^ namespace ^ "." ^ name
  | Entity_doc.Unbound name -> "code " ^ name

let check_ancestors msg expected ancestors =
  Alcotest.(check (list string)) msg expected (List.map describe ancestors)

let actionable =
  Type_factory.make_gir_interface ~interface_name:"Actionable"
    ~c_type:"GtkActionable" ~prerequisites:[ "Widget" ] ()

let button =
  Type_factory.make_gir_class ~class_name:"Button" ~c_type:"GtkButton"
    ~parent:"Widget"
    ~implements:[ "Actionable"; "GObject.Unknown" ]
    ()

let ctx () =
  let ctx = Helpers.create_test_context () in
  {
    ctx with
    Types.classes = button :: ctx.classes;
    interfaces = actionable :: ctx.interfaces;
  }

let test_class_parent_and_interfaces () =
  let inheritance =
    Class_gen_inheritance.of_entity ~ctx:(ctx ()) ~entity_kind:Filtering.Class
      "Button"
  in
  check_ancestors "parent linked" [ "link Gtk.Widget" ]
    (Option.to_list inheritance.parent);
  check_ancestors "a bound interface linked, an unbound one as code"
    [ "link Gtk.Actionable"; "code GObject.Unknown" ]
    inheritance.implements;
  check_ancestors "a class requires nothing" [] inheritance.requires

let test_interface_prerequisites () =
  let inheritance =
    Class_gen_inheritance.of_entity ~ctx:(ctx ())
      ~entity_kind:Filtering.Interface "Actionable"
  in
  check_ancestors "no parent" [] (Option.to_list inheritance.parent);
  check_ancestors "prerequisites" [ "link Gtk.Widget" ] inheritance.requires

let test_record_has_no_inheritance () =
  let inheritance =
    Class_gen_inheritance.of_entity ~ctx:(ctx ()) ~entity_kind:Filtering.Record
      "Button"
  in
  check_ancestors "nothing at all" []
    (Option.to_list inheritance.parent
    @ inheritance.implements @ inheritance.requires)

let tests =
  [
    ( "a class's parent and interfaces resolve to links or code",
      `Quick,
      test_class_parent_and_interfaces );
    ( "an interface's prerequisites are what it requires",
      `Quick,
      test_interface_prerequisites );
    ("a record has no inheritance", `Quick, test_record_has_no_inheritance);
  ]
