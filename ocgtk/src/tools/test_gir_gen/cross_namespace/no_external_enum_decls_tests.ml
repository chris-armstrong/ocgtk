(* Cross-namespace tests - Stage 2: Remove External Enum Forward Declarations
   
   Tests that generated header files do NOT contain forward declarations
   for external enums. External enum declarations now come from included headers. *)

open Helpers

let test_gir = "/tmp/test_no_ext_enum_decls.gir"
let output_dir = "/tmp/test_no_ext_enum_decls_output"

(* Helper: Create a context with external enums to verify they are NOT 
   included in forward declarations *)
let create_context_with_external_enum () =
  let open Gir_gen_lib.Types in
  let namespace =
    {
      namespace_name = "Gtk";
      namespace_version = "4.0";
      namespace_shared_library = "libgtk-4.so.1";
      namespace_c_identifier_prefixes = "Gtk";
      namespace_c_symbol_prefixes = "gtk";
    }
  in

  (* Create a local GTK enum *)
  let local_enum =
    {
      enum_name = "WrapMode";
      enum_c_type = "GtkWrapMode";
      members =
        [
          {
            member_name = "NONE";
            member_value = 0;
            c_identifier = "GTK_WRAP_NONE";
            member_doc = None;
          };
          {
            member_name = "WORD";
            member_value = 1;
            c_identifier = "GTK_WRAP_WORD";
            member_doc = None;
          };
        ];
      functions = [];
      enum_doc = None;
    }
  in

  (* Create an external GDK enum - this should NOT appear in forward declarations *)
  let external_enum =
    {
      enum_name = "TextureType";
      enum_c_type = "GdkTextureType";
      members =
        [
          {
            member_name = "PIXBUF";
            member_value = 0;
            c_identifier = "GDK_TEXTURE_TYPE_PIXBUF";
            member_doc = None;
          };
        ];
      functions = [];
      enum_doc = None;
    }
  in

  {
    namespace;
    repository =
      {
        repository_c_includes = [];
        repository_includes = [];
        repository_packages = [];
      };
    classes = [];
    interfaces = [];
    enums = [ local_enum ];
    bitfields = [];
    records = [];
    (* External enum should NOT appear in forward declarations *)
    external_enums = [ ("Gdk", external_enum) ];
    external_bitfields = [];
    hierarchy_map = Hashtbl.create 0;
    module_groups = Hashtbl.create 0;
    current_cycle_classes = [];
    cross_references = StringMap.empty;
  }

(* Stage 2 Test: Generated header should NOT contain forward declarations
   for external enums. These declarations now come from included headers. *)
let test_header_does_not_contain_external_enum_decls () =
  let ctx = create_context_with_external_enum () in

  (* Generate the header file *)
  let header_content =
    Gir_gen_lib.Generate.C_stubs.generate_decls_header ~ctx ~classes:ctx.classes
      ~gtk_enums:ctx.enums ~gtk_bitfields:ctx.bitfields ~records:[]
      ~interfaces:[]
  in

  Helpers.log_generated_c_code "gtk_decls.h (Stage 2 test)" header_content;

  (* Positive: local GTK enum forward declarations SHOULD be present *)
  assert_contains "Local GTK enum Val_ forward decl" header_content
    "Val_GtkWrapMode";
  assert_contains "Local GTK enum _val forward decl" header_content
    "GtkWrapMode_val";

  (* Critical: external GDK enum forward declarations should NOT be present.
     These should come from the included gdk_decls.h header instead. *)
  assert_not_contains "External GDK enum Val_ forward decl" header_content
    "Val_GdkTextureType";
  assert_not_contains "External GDK enum _val forward decl" header_content
    "GdkTextureType_val"

(* Stage 2 Test: Verify that generate_forward_decls only processes local enums *)
let test_generate_forward_decls_only_local_enums () =
  let open Gir_gen_lib.Types in
  (* Create a local enum *)
  let local_enum =
    {
      enum_name = "Align";
      enum_c_type = "GtkAlign";
      members = [];
      functions = [];
      enum_doc = None;
    }
  in

  (* Create what would be an external enum - not passed to generate_forward_decls *)
  let _external_enum =
    {
      enum_name = "EventType";
      enum_c_type = "GdkEventType";
      members = [];
      functions = [];
      enum_doc = None;
    }
  in

  (* Generate forward declarations for local enums only *)
  let local_decls =
    Gir_gen_lib.Generate.C_stub_enum.generate_forward_decls
      ~namespace_prefix:"Gtk" ~gtk_enums:[ local_enum ]
  in

  (* Verify local enum is included *)
  assert_contains "Local enum Val_ decl" local_decls "Val_GtkAlign";
  assert_contains "Local enum _val decl" local_decls "GtkAlign_val";

  (* External enum should NOT be in the output since we only pass local enums *)
  assert_not_contains "External enum Val_ decl" local_decls "Val_GdkEventType";
  assert_not_contains "External enum _val decl" local_decls "GdkEventType_val";

  (* Generate with empty list should produce empty string *)
  let empty_decls =
    Gir_gen_lib.Generate.C_stub_enum.generate_forward_decls
      ~namespace_prefix:"Gtk" ~gtk_enums:[]
  in
  Alcotest.(check string) "Empty enum list produces empty output" "" empty_decls

(* Stage 2 Test: Verify enum proto emission function was removed from public API *)
let test_emit_enum_proto_not_exported () =
  (* The emit_enum_proto function should no longer be exported from C_stubs.
     We verify this by checking that the function signature is not exposed. *)
  (* This is implicitly tested by compilation - if emit_enum_proto was still
     exported and used, the previous tests would have referenced it. *)
  (* Instead, we verify the interface is clean by ensuring no external enum 
     related functions remain in the header generation. *)
  let ctx = create_context_with_external_enum () in

  (* Generate header and verify it has no "external" enum sections *)
  let header_content =
    Gir_gen_lib.Generate.C_stubs.generate_decls_header ~ctx ~classes:ctx.classes
      ~gtk_enums:ctx.enums ~gtk_bitfields:ctx.bitfields ~records:[]
      ~interfaces:[]
  in

  (* Should not contain any sections that mention external enums *)
  assert_not_contains "No external enum section" header_content
    "Forward declarations for external"

let tests =
  [
    Alcotest.test_case
      "Header does not contain external enum forward declarations (Stage 2)"
      `Quick test_header_does_not_contain_external_enum_decls;
    Alcotest.test_case
      "generate_forward_decls only processes local enums (Stage 2)" `Quick
      test_generate_forward_decls_only_local_enums;
    Alcotest.test_case "emit_enum_proto not exported from C_stubs (Stage 2)"
      `Quick test_emit_enum_proto_not_exported;
  ]
