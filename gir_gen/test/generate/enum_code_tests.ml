(* Unit tests for the type-level docs of the generated enumeration and
   bitfield types (gir_gen/lib/generate/enum_code.ml). Each case parses the
   generated interface and reads the doc back from the type declaration, so a
   doc comment and an [ocaml.doc] attribute are checked the same way. *)

open Gir_gen_lib.Generate

let enum ?enum_doc ?enum_version () =
  Type_factory.make_gir_enum ~enum_name:"Mode" ~enum_c_type:"GtkMode"
    ~members:
      [ Type_factory.make_gir_enum_member ~member_name:"on" ~member_value:0 () ]
    ?enum_doc ?enum_version ()

let bitfield ?bitfield_doc () =
  Type_factory.make_gir_bitfield ~bitfield_name:"Flags"
    ~bitfield_c_type:"GtkFlags"
    ~flags:[ Type_factory.make_gir_bitfield_member ~flag_name:"a" () ]
    ?bitfield_doc ()

let type_doc ~type_name text =
  let ast = Ml_ast_helpers.parse_interface text in
  Helpers.expect_some ("type " ^ type_name)
    (Ml_ast_helpers.find_type_declaration_sig ast type_name)
    Ml_ast_helpers.type_declaration_doc

let check_doc msg expected actual =
  Alcotest.(check (option string)) msg expected actual

let test_enum_type_doc () =
  check_doc "translated doc on the type" (Some " The mode. ")
    (type_doc ~type_name:"mode"
       (Enum_code.generate_ocaml_enum (enum ~enum_doc:"The mode." ())))

let test_enum_type_doc_with_since () =
  check_doc "@since after the prose" (Some " The mode.\n    @since 4.10 ")
    (type_doc ~type_name:"mode"
       (Enum_code.generate_ocaml_enum
          (enum ~enum_doc:"The mode." ~enum_version:"4.10" ())))

let test_enum_type_doc_with_quote_is_attribute () =
  let text =
    Enum_code.generate_ocaml_enum (enum ~enum_doc:"Shows \"on\" or off." ())
  in
  Alcotest.(check bool)
    "carried as an attribute" true
    (Helpers.string_contains text "[@@ocaml.doc");
  Alcotest.(check bool)
    "the type has the doc" true
    (Option.is_some (type_doc ~type_name:"mode" text))

let test_enum_without_doc () =
  check_doc "no doc" None
    (type_doc ~type_name:"mode" (Enum_code.generate_ocaml_enum (enum ())))

let test_bitfield_doc_on_flag_type () =
  let text =
    Enum_code.generate_ocaml_bitfield (bitfield ~bitfield_doc:"Some flags." ())
  in
  check_doc "on the flag type" (Some " Some flags. ")
    (type_doc ~type_name:"flags_flag" text);
  check_doc "not on the list type" None (type_doc ~type_name:"flags" text)

let tests =
  [
    ("enum type doc", `Quick, test_enum_type_doc);
    ("enum type doc with @since", `Quick, test_enum_type_doc_with_since);
    ( "enum type doc with a quote is an attribute",
      `Quick,
      test_enum_type_doc_with_quote_is_attribute );
    ("enum without doc has none", `Quick, test_enum_without_doc);
    ("bitfield doc on the flag type", `Quick, test_bitfield_doc_on_flag_type);
  ]
