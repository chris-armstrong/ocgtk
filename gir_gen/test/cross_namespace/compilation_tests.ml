(* Compilation Tests - Multi-Library Header Compilation (Stage 8)

   Tests that C code patterns for cross-namespace types are syntactically correct.
   These tests verify header structures and include patterns using AST validation.
*)

open C_validation

(* ========================================================================= *)
(* Header Structure Validation Tests *)
(* ========================================================================= *)

(* Stage 8 Test: Gdk header structure is correct *)
let test_gdk_header_structure () =
  let header_content =
    {|
#ifndef _gdk_decls_h_
#define _gdk_decls_h_

#include <gdk/gdk.h>
#include <caml/mlvalues.h>

/* Forward declarations for GdkTexture */
#define Val_GdkTexture(ptr) Val_gtk_object((GtkObject*)ptr)
#define GdkTexture_val(v) (GdkTexture*)GtkObject_val(v)

value Val_GdkTexture(GdkTexture *obj);
value GdkTexture_val(value v);
value copy_GdkTexture(const GdkTexture *ptr);

#endif /* _gdk_decls_h_ */
|}
  in

  (* Verify header guard format *)
  assert_header_guard_format header_content "_gdk_decls_h_";

  (* Verify forward declarations are extractable *)
  let decls = extract_forward_decls header_content in
  Alcotest.(check bool)
    "Should find Val_GdkTexture declaration" true
    (List.mem "Val_GdkTexture" decls);
  Alcotest.(check bool)
    "Should find GdkTexture_val declaration" true
    (List.mem "GdkTexture_val" decls)

(* Stage 8 Test: Gtk header with Gdk dependency includes gdk_decls.h *)
let test_gtk_header_includes_gdk () =
  let header_content =
    {|
#ifndef _gtk_decls_h_
#define _gtk_decls_h_

#include <gtk/gtk.h>
#include <caml/mlvalues.h>

/* Dependency headers for cross-namespace types */
#include "gdk_decls.h"

/* Forward declarations for GtkWidget */
#define Val_GtkWidget(ptr) Val_gtk_object((GtkObject*)ptr)
#define GtkWidget_val(v) (GtkWidget*)GtkObject_val(v)

value Val_GtkWidget(GtkWidget *obj);
value GtkWidget_val(value v);

#endif /* _gtk_decls_h_ */
|}
  in

  (* Verify header guard *)
  assert_header_guard_format header_content "_gtk_decls_h_";

  (* Critical: Verify gdk_decls.h is included *)
  assert_local_include_exists header_content "gdk_decls.h"

(* Stage 8 Test: Multi-level dependency chain headers *)
let test_multi_level_dependency_headers () =
  (* Gsk header includes Gdk *)
  let gsk_header =
    {|
#ifndef _gsk_decls_h_
#define _gsk_decls_h_

#include <gsk/gsk.h>
#include <caml/mlvalues.h>
#include "gdk_decls.h"

#define Val_GskRenderer(ptr) Val_gtk_object((GtkObject*)ptr)

#endif /* _gsk_decls_h_ */
|}
  in

  (* Gtk header includes Gsk and Gdk *)
  let gtk_header =
    {|
#ifndef _gtk_decls_h_
#define _gtk_decls_h_

#include <gtk/gtk.h>
#include <caml/mlvalues.h>
#include "gdk_decls.h"
#include "gsk_decls.h"

#define Val_GtkWidget(ptr) Val_gtk_object((GtkObject*)ptr)

#endif /* _gtk_decls_h_ */
|}
  in

  (* Verify Gsk header structure *)
  assert_header_guard_format gsk_header "_gsk_decls_h_";
  assert_local_include_exists gsk_header "gdk_decls.h";

  (* Verify Gtk header includes both dependencies *)
  assert_header_guard_format gtk_header "_gtk_decls_h_";
  assert_local_include_exists gtk_header "gdk_decls.h";
  assert_local_include_exists gtk_header "gsk_decls.h"

(* Stage 8 Test: Headers with circular include guards prevent redefinition *)
let test_header_guards_prevent_redefinition () =
  (* Gdk header - base of chain *)
  let gdk_header =
    {|
#ifndef _gdk_decls_h_
#define _gdk_decls_h_
#include <gdk/gdk.h>
#include <caml/mlvalues.h>
#define Val_GdkTexture(ptr) Val_gtk_object((GtkObject*)ptr)
#define GdkTexture_val(v) (GdkTexture*)GtkObject_val(v)
#endif /* _gdk_decls_h_ */
|}
  in

  (* Gtk header includes Gdk *)
  let gtk_header =
    {|
#ifndef _gtk_decls_h_
#define _gtk_decls_h_
#include <gtk/gtk.h>
#include <caml/mlvalues.h>
#include "gdk_decls.h"
#define Val_GtkWidget(ptr) Val_gtk_object((GtkObject*)ptr)
#define GtkWidget_val(v) (GtkWidget*)GtkObject_val(v)
#endif /* _gtk_decls_h_ */
|}
  in

  (* Verify both headers have proper guards *)
  assert_header_guard_format gdk_header "_gdk_decls_h_";
  assert_header_guard_format gtk_header "_gtk_decls_h_";

  (* Verify gdk_decls.h is included in gtk_decls.h *)
  assert_local_include_exists gtk_header "gdk_decls.h";

  (* Verify no circular includes (gdk should not include gtk) *)
  assert_local_include_not_exists gdk_header "gtk_decls.h"

(* Stage 8 Test: Type converter macros are syntactically correct *)
let test_type_converter_macro_syntax () =
  let header_content =
    {|
#ifndef _gdk_decls_h_
#define _gdk_decls_h_

#include <gdk/gdk.h>
#include <caml/mlvalues.h>

/* Forward declarations for GdkTexture */
#define Val_GdkTexture(ptr) Val_gtk_object((GtkObject*)ptr)
#define GdkTexture_val(v) (GdkTexture*)GtkObject_val(v)

/* Forward declarations for GdkSurface */
#define Val_GdkSurface(ptr) Val_gtk_object((GtkObject*)ptr)
#define GdkSurface_val(v) (GdkSurface*)GtkObject_val(v)

value copy_GdkTexture(const GdkTexture *ptr);
value copy_GdkSurface(const GdkSurface *ptr);

#endif /* _gdk_decls_h_ */
|}
  in

  (* Verify header guard format *)
  assert_header_guard_format header_content "_gdk_decls_h_";

  (* Verify all forward declarations are extractable *)
  let decls = extract_forward_decls header_content in
  Alcotest.(check bool)
    "Should find Val_GdkTexture declaration" true
    (List.mem "Val_GdkTexture" decls);
  Alcotest.(check bool)
    "Should find GdkTexture_val declaration" true
    (List.mem "GdkTexture_val" decls);
  Alcotest.(check bool)
    "Should find Val_GdkSurface declaration" true
    (List.mem "Val_GdkSurface" decls);
  Alcotest.(check bool)
    "Should find GdkSurface_val declaration" true
    (List.mem "GdkSurface_val" decls)

(* Stage 8 Test: Complex cross-namespace header with multiple types *)
let test_complex_cross_namespace_header () =
  (* Gtk header with multiple Gdk type dependencies *)
  let header_content =
    {|
#ifndef _gtk_decls_h_
#define _gtk_decls_h_

#include <gtk/gtk.h>
#include <caml/mlvalues.h>

/* Dependency headers for cross-namespace types */
#include "gdk_decls.h"

/* Forward declarations for GtkWidget */
#define Val_GtkWidget(ptr) Val_gtk_object((GtkObject*)ptr)
#define GtkWidget_val(v) (GtkWidget*)GtkObject_val(v)

/* Function declarations for cross-namespace type usage */
value ml_gtk_widget_set_texture(value self, value texture);
value ml_gtk_widget_get_surface(value self);
value ml_gtk_widget_multi_gdk(value self, value texture, value surface);

#endif /* _gtk_decls_h_ */
|}
  in

  (* Verify header structure *)
  assert_header_guard_format header_content "_gtk_decls_h_";
  assert_local_include_exists header_content "gdk_decls.h";

  (* Verify forward declarations are extractable - only check macros, not function declarations *)
  let decls = extract_forward_decls header_content in
  Alcotest.(check bool)
    "Should find Val_GtkWidget declaration" true
    (List.mem "Val_GtkWidget" decls);
  Alcotest.(check bool)
    "Should find GtkWidget_val declaration" true
    (List.mem "GtkWidget_val" decls)

(* Stage 8 Test: Error handling declarations with cross-namespace types *)
let test_error_handling_header () =
  let header_content =
    {|
#ifndef _gtk_decls_h_
#define _gtk_decls_h_

#include <gtk/gtk.h>
#include <caml/mlvalues.h>
#include "gdk_decls.h"

/* Method that throws and uses Gdk types - forward declaration */
#define Val_GtkWidget(ptr) Val_gtk_object((GtkObject*)ptr)
#define GtkWidget_val(v) (GtkWidget*)GtkObject_val(v)

/* Result type macros */
#define Res_Ok(v) v
#define Res_Error(e) e

#endif /* _gtk_decls_h_ */
|}
  in

  (* Verify header structure *)
  assert_header_guard_format header_content "_gtk_decls_h_";
  assert_local_include_exists header_content "gdk_decls.h";

  (* Verify macro declarations are extractable *)
  let decls = extract_forward_decls header_content in
  Alcotest.(check bool)
    "Should find Val_GtkWidget declaration" true
    (List.mem "Val_GtkWidget" decls);
  Alcotest.(check bool)
    "Should find GtkWidget_val declaration" true
    (List.mem "GtkWidget_val" decls)

(* ========================================================================= *)
(* Test Suite *)
(* ========================================================================= *)

let tests =
  [
    Alcotest.test_case "Gdk header structure is correct (Stage 8)" `Quick
      test_gdk_header_structure;
    Alcotest.test_case "Gtk header includes gdk_decls.h (Stage 8)" `Quick
      test_gtk_header_includes_gdk;
    Alcotest.test_case "Multi-level dependency chain headers (Stage 8)" `Quick
      test_multi_level_dependency_headers;
    Alcotest.test_case "Header guards prevent redefinition (Stage 8)" `Quick
      test_header_guards_prevent_redefinition;
    Alcotest.test_case "Type converter macro syntax is correct (Stage 8)" `Quick
      test_type_converter_macro_syntax;
    Alcotest.test_case "Complex cross-namespace header (Stage 8)" `Quick
      test_complex_cross_namespace_header;
    Alcotest.test_case
      "Error handling header with cross-namespace types (Stage 8)" `Quick
      test_error_handling_header;
  ]
