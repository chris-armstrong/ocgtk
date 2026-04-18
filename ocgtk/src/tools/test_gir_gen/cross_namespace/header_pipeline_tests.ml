(* Header pipeline tests — multi-library header generation (Stage 8).
   Tier 2 — pipeline test (see Phase 1.5 of
   docs/plans/test-suite-remediation.md): in-process, multi-module, no
   subprocess invocation of gir_gen.exe.

   Verifies that the complete cross-namespace header system works
   correctly when multiple libraries are generated:

   1. Header generation with cross-references works correctly
   2. Dependency headers are properly included
   3. C compilation patterns work with cross-namespace types
*)

open C_validation

(* ========================================================================= *)
(* Header Pipeline Test Cases *)
(* ========================================================================= *)

(* Stage 8 Test: Header generation with Gdk cross-references *)
let test_header_generation_with_gdk_cross_references () =
  (* Create context with Gdk cross-references simulating Gtk depending on Gdk *)
  let open Gir_gen_lib.Types in
  let texture_cr =
    {
      cr_name = "Texture";
      cr_type = Crt_Class { parent = None; implements = [] };
      cr_c_type = "GdkTexture";
    }
  in
  let surface_cr =
    {
      cr_name = "Surface";
      cr_type = Crt_Class { parent = None; implements = [] };
      cr_c_type = "GdkSurface";
    }
  in
  let gdk_map =
    StringMap.add "Texture" texture_cr StringMap.empty
    |> StringMap.add "Surface" surface_cr
  in
  let cross_refs =
    StringMap.add "Gdk" (snd (Helpers.make_ncr "Gdk" gdk_map)) StringMap.empty
  in

  let ctx =
    {
      namespace =
        {
          namespace_name = "Gtk";
          namespace_version = "4.0";
          namespace_shared_library = "libgtk-4.so.1";
          namespace_c_identifier_prefixes = "Gtk";
          namespace_c_symbol_prefixes = "gtk";
        };
      repository =
        {
          repository_c_includes = [];
          repository_includes = [];
          repository_packages = [];
        };
      classes = [];
      interfaces = [];
      enums = [];
      bitfields = [];
      records = [];
      module_groups = Hashtbl.create 0;
      current_cycle_classes = [];
      cross_references = cross_refs;
    }
  in

  (* Generate the Gtk header *)
  let header_content =
    Gir_gen_lib.Generate.C_stubs.generate_decls_header ~ctx ~classes:[]
      ~gtk_enums:[] ~gtk_bitfields:[] ~records:[] ~interfaces:[] ()
  in

  (* Verify header guard *)
  assert_header_guard_format header_content "_gtk_decls_h_";

  (* Critical: Verify gdk_decls.h is included *)
  assert_local_include_exists header_content "generated/gdk_decls.h"

(* Stage 8 Test: Header generation with multiple dependencies *)
let test_header_generation_with_multiple_dependencies () =
  (* Create context with multiple cross-references *)
  let open Gir_gen_lib.Types in
  let gdk_cr =
    {
      cr_name = "Texture";
      cr_type = Crt_Class { parent = None; implements = [] };
      cr_c_type = "GdkTexture";
    }
  in
  let gio_cr =
    {
      cr_name = "File";
      cr_type = Crt_Class { parent = None; implements = [] };
      cr_c_type = "GFile";
    }
  in
  let gdk_map = StringMap.add "Texture" gdk_cr StringMap.empty in
  let gio_map = StringMap.add "File" gio_cr StringMap.empty in
  let cross_refs =
    StringMap.add "Gdk" (snd (Helpers.make_ncr "Gdk" gdk_map)) StringMap.empty
    |> StringMap.add "Gio" (snd (Helpers.make_ncr "Gio" gio_map))
  in

  let ctx =
    {
      namespace =
        {
          namespace_name = "Gtk";
          namespace_version = "4.0";
          namespace_shared_library = "libgtk-4.so.1";
          namespace_c_identifier_prefixes = "Gtk";
          namespace_c_symbol_prefixes = "gtk";
        };
      repository =
        {
          repository_c_includes = [];
          repository_includes = [];
          repository_packages = [];
        };
      classes = [];
      interfaces = [];
      enums = [];
      bitfields = [];
      records = [];
      module_groups = Hashtbl.create 0;
      current_cycle_classes = [];
      cross_references = cross_refs;
    }
  in

  (* Generate the header *)
  let header_content =
    Gir_gen_lib.Generate.C_stubs.generate_decls_header ~ctx ~classes:[]
      ~gtk_enums:[] ~gtk_bitfields:[] ~records:[] ~interfaces:[] ()
  in

  (* Verify both dependencies are included *)
  assert_local_include_exists header_content "generated/gdk_decls.h";
  assert_local_include_exists header_content "generated/gio_decls.h"

(* Stage 8 Test: Header with no dependencies has no includes *)
let test_header_no_dependencies_no_includes () =
  (* Create context with no cross-references *)
  let open Gir_gen_lib.Types in
  let ctx =
    {
      namespace =
        {
          namespace_name = "Gdk";
          namespace_version = "4.0";
          namespace_shared_library = "libgdk-4.so.1";
          namespace_c_identifier_prefixes = "Gdk";
          namespace_c_symbol_prefixes = "gdk";
        };
      repository =
        {
          repository_c_includes = [];
          repository_includes = [];
          repository_packages = [];
        };
      classes = [];
      interfaces = [];
      enums = [];
      bitfields = [];
      records = [];
      module_groups = Hashtbl.create 0;
      current_cycle_classes = [];
      cross_references = StringMap.empty;
    }
  in

  (* Generate the header *)
  let header_content =
    Gir_gen_lib.Generate.C_stubs.generate_decls_header ~ctx ~classes:[]
      ~gtk_enums:[] ~gtk_bitfields:[] ~records:[] ~interfaces:[] ()
  in

  (* Verify no cross-namespace dependency includes are present.
     We check specifically that no generated/<ns>_decls.h includes appear,
     since that is the form all dependency includes take. The core header
     (#include "../core/<ns>_core.h") is a structural include, not a dependency,
     so its presence is expected and not checked here. *)
  assert_local_include_not_exists header_content "generated/gtk_decls.h";
  assert_local_include_not_exists header_content "generated/gdk_decls.h";
  assert_local_include_not_exists header_content "generated/gio_decls.h";
  assert_local_include_not_exists header_content "generated/gsk_decls.h"

(* Stage 8 Test: Base namespaces are filtered from dependencies *)
let test_base_namespaces_filtered () =
  (* Create context with base namespace cross-references *)
  let open Gir_gen_lib.Types in
  let glib_cr =
    {
      cr_name = "Object";
      cr_type = Crt_Class { parent = None; implements = [] };
      cr_c_type = "GObject";
    }
  in
  let glib_map = StringMap.add "Object" glib_cr StringMap.empty in
  let cross_refs =
    StringMap.add "GLib"
      (snd (Helpers.make_ncr "GLib" glib_map))
      StringMap.empty
  in

  let ctx =
    {
      namespace =
        {
          namespace_name = "Gtk";
          namespace_version = "4.0";
          namespace_shared_library = "libgtk-4.so.1";
          namespace_c_identifier_prefixes = "Gtk";
          namespace_c_symbol_prefixes = "gtk";
        };
      repository =
        {
          repository_c_includes = [];
          repository_includes = [];
          repository_packages = [];
        };
      classes = [];
      interfaces = [];
      enums = [];
      bitfields = [];
      records = [];
      module_groups = Hashtbl.create 0;
      current_cycle_classes = [];
      cross_references = cross_refs;
    }
  in

  (* Generate the header *)
  let header_content =
    Gir_gen_lib.Generate.C_stubs.generate_decls_header ~ctx ~classes:[]
      ~gtk_enums:[] ~gtk_bitfields:[] ~records:[] ~interfaces:[] ()
  in

  (* Verify GLib is NOT included (it's a base namespace) *)
  assert_local_include_not_exists header_content "generated/glib_decls.h"

(* Stage 8 Test: Gsk with Gdk dependency header structure *)
let test_gsk_with_gdk_dependency () =
  (* Create context simulating Gsk with Gdk dependency *)
  let open Gir_gen_lib.Types in
  let renderer_cr =
    {
      cr_name = "Renderer";
      cr_type = Crt_Class { parent = None; implements = [] };
      cr_c_type = "GdkSurface";
    }
  in
  let gdk_map = StringMap.add "Surface" renderer_cr StringMap.empty in
  let cross_refs =
    StringMap.add "Gdk" (snd (Helpers.make_ncr "Gdk" gdk_map)) StringMap.empty
  in

  let ctx =
    {
      namespace =
        {
          namespace_name = "Gsk";
          namespace_version = "4.0";
          namespace_shared_library = "libgsk-4.so.1";
          namespace_c_identifier_prefixes = "Gsk";
          namespace_c_symbol_prefixes = "gsk";
        };
      repository =
        {
          repository_c_includes = [];
          repository_includes = [];
          repository_packages = [];
        };
      classes = [];
      interfaces = [];
      enums = [];
      bitfields = [];
      records = [];
      module_groups = Hashtbl.create 0;
      current_cycle_classes = [];
      cross_references = cross_refs;
    }
  in

  (* Generate the header *)
  let header_content =
    Gir_gen_lib.Generate.C_stubs.generate_decls_header ~ctx ~classes:[]
      ~gtk_enums:[] ~gtk_bitfields:[] ~records:[] ~interfaces:[] ()
  in

  (* Verify header structure *)
  assert_header_guard_format header_content "_gsk_decls_h_";
  assert_local_include_exists header_content "generated/gdk_decls.h"

(* Stage 8 Test: Complete dependency chain Gtk -> Gsk -> Gdk *)
let test_complete_dependency_chain () =
  (* Create context with complete Gtk dependency chain *)
  let open Gir_gen_lib.Types in
  let gsk_renderer_cr =
    {
      cr_name = "Renderer";
      cr_type = Crt_Class { parent = None; implements = [] };
      cr_c_type = "GskRenderer";
    }
  in
  let gdk_texture_cr =
    {
      cr_name = "Texture";
      cr_type = Crt_Class { parent = None; implements = [] };
      cr_c_type = "GdkTexture";
    }
  in
  let gsk_map = StringMap.add "Renderer" gsk_renderer_cr StringMap.empty in
  let gdk_map = StringMap.add "Texture" gdk_texture_cr StringMap.empty in
  let cross_refs =
    StringMap.add "Gsk" (snd (Helpers.make_ncr "Gsk" gsk_map)) StringMap.empty
    |> StringMap.add "Gdk" (snd (Helpers.make_ncr "Gdk" gdk_map))
  in

  let ctx =
    {
      namespace =
        {
          namespace_name = "Gtk";
          namespace_version = "4.0";
          namespace_shared_library = "libgtk-4.so.1";
          namespace_c_identifier_prefixes = "Gtk";
          namespace_c_symbol_prefixes = "gtk";
        };
      repository =
        {
          repository_c_includes = [];
          repository_includes = [];
          repository_packages = [];
        };
      classes = [];
      interfaces = [];
      enums = [];
      bitfields = [];
      records = [];
      module_groups = Hashtbl.create 0;
      current_cycle_classes = [];
      cross_references = cross_refs;
    }
  in

  (* Generate the header *)
  let header_content =
    Gir_gen_lib.Generate.C_stubs.generate_decls_header ~ctx ~classes:[]
      ~gtk_enums:[] ~gtk_bitfields:[] ~records:[] ~interfaces:[] ()
  in

  (* Verify all dependencies are included *)
  assert_local_include_exists header_content "generated/gdk_decls.h";
  assert_local_include_exists header_content "generated/gsk_decls.h"

(* ========================================================================= *)
(* Test Suite *)
(* ========================================================================= *)

let tests =
  [
    Alcotest.test_case "Header generation with Gdk cross-references (Stage 8)"
      `Quick test_header_generation_with_gdk_cross_references;
    Alcotest.test_case "Header generation with multiple dependencies (Stage 8)"
      `Quick test_header_generation_with_multiple_dependencies;
    Alcotest.test_case "Header with no dependencies has no includes (Stage 8)"
      `Quick test_header_no_dependencies_no_includes;
    Alcotest.test_case "Base namespaces filtered from dependencies (Stage 8)"
      `Quick test_base_namespaces_filtered;
    Alcotest.test_case "Gsk with Gdk dependency header structure (Stage 8)"
      `Quick test_gsk_with_gdk_dependency;
    Alcotest.test_case "Complete dependency chain Gtk -> Gsk -> Gdk (Stage 8)"
      `Quick test_complete_dependency_chain;
  ]
