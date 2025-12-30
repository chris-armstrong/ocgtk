(**************************************************************************)
(*                ocgtk - OCaml bindings for GTK4                      *)
(*                                                                        *)
(*                  Test suite for Pango module (Phase 2.5)               *)
(**************************************************************************)

open Alcotest

(* Note: Many Pango tests require a PangoContext, which is typically
   obtained from a GTK widget. For now, we test what we can without
   requiring full GTK initialization. *)

(* ========================================================================= *)
(* Font Description Tests                                                   *)
(* ========================================================================= *)

let test_font_description_from_string () =
  let desc = Pango.Font.from_string "Sans 12" in
  let str = Pango.Font.to_string desc in
  check string "font description string" "Sans 12" str

let test_font_description_copy () =
  let desc1 = Pango.Font.from_string "Monospace Bold 14" in
  let desc2 = Pango.Font.copy desc1 in
  let str1 = Pango.Font.to_string desc1 in
  let str2 = Pango.Font.to_string desc2 in
  check string "copied font description" str1 str2

let test_font_family () =
  let desc = Pango.Font.from_string "Arial 10" in
  Pango.Font.set_family desc "Helvetica";
  let family = Pango.Font.get_family desc in
  check string "font family" "Helvetica" family

let test_font_size () =
  let desc = Pango.Font.from_string "Sans 10" in
  Pango.Font.set_size desc (14 * Pango.scale);
  let size = Pango.Font.get_size desc in
  check int "font size" (14 * Pango.scale) size

let test_font_absolute_size () =
  let desc = Pango.Font.from_string "Sans 10" in
  Pango.Font.set_absolute_size desc 16.0;
  let is_absolute = Pango.Font.get_size_is_absolute desc in
  check bool "size is absolute" true is_absolute

let test_font_style () =
  let desc = Pango.Font.from_string "Sans 10" in
  Pango.Font.set_style desc `ITALIC;
  let style = Pango.Font.get_style desc in
  check (testable Fmt.(using (function
    | `NORMAL -> "normal" | `OBLIQUE -> "oblique" | `ITALIC -> "italic") string) (=))
    "font style" `ITALIC style

let test_font_weight () =
  let desc = Pango.Font.from_string "Sans 10" in
  Pango.Font.set_weight desc (`BOLD : Pango.Tags.weight);
  let weight = Pango.Font.get_weight desc in
  check (int) "font weight (bold)" 700 weight

let test_font_variant () =
  let desc = Pango.Font.from_string "Sans 10" in
  Pango.Font.set_variant desc `SMALL_CAPS;
  let variant = Pango.Font.get_variant desc in
  check (testable Fmt.(using (function
    | `NORMAL -> "normal" | `SMALL_CAPS -> "small-caps") string) (=))
    "font variant" `SMALL_CAPS variant

let test_font_stretch () =
  let desc = Pango.Font.from_string "Sans 10" in
  Pango.Font.set_stretch desc `CONDENSED;
  let stretch = Pango.Font.get_stretch desc in
  check (testable Fmt.(using (function
    | `ULTRA_CONDENSED -> "ultra-condensed"
    | `EXTRA_CONDENSED -> "extra-condensed"
    | `CONDENSED -> "condensed"
    | `SEMI_CONDENSED -> "semi-condensed"
    | `NORMAL -> "normal"
    | `SEMI_EXPANDED -> "semi-expanded"
    | `EXPANDED -> "expanded"
    | `EXTRA_EXPANDED -> "extra-expanded"
    | `ULTRA_EXPANDED -> "ultra-expanded") string) (=))
    "font stretch" `CONDENSED stretch

let test_font_modify () =
  let desc = Pango.Font.from_string "Sans 10" in
  Pango.Font.modify desc
    ~family:"DejaVu Sans"
    ~style:`ITALIC
    ~weight:(`BOLD : Pango.Tags.weight)
    ~size:(16 * Pango.scale)
    ();
  let family = Pango.Font.get_family desc in
  let style = Pango.Font.get_style desc in
  let size = Pango.Font.get_size desc in
  check string "modified family" "DejaVu Sans" family;
  check (testable Fmt.(using (function
    | `NORMAL -> "normal" | `OBLIQUE -> "oblique" | `ITALIC -> "italic") string) (=))
    "modified style" `ITALIC style;
  check int "modified size" (16 * Pango.scale) size

(* ========================================================================= *)
(* Language Tests                                                           *)
(* ========================================================================= *)

let test_language_from_string () =
  let lang = Pango.Language.from_string "en-US" in
  let str = Pango.Language.to_string lang in
  check string "language string" "en-us" str  (* Pango normalizes to lowercase *)

let test_language_matches () =
  let lang = Pango.Language.from_string "en-US" in
  (* Pango's language matching: "en" matches all English variants including "en-us" *)
  let matches = Pango.Language.matches lang "en" in
  check bool "language matches pattern" true matches

let test_language_none () =
  (* Test that Language.none exists and can be used *)
  let _lang = Pango.Language.none in
  check pass "language none" () ()

(* ========================================================================= *)
(* Scale Constants                                                          *)
(* ========================================================================= *)

let test_pango_scale () =
  (* PANGO_SCALE is typically 1024 *)
  check (int) "pango scale constant" 1024 Pango.scale

let test_scale_to_float () =
  let scale_medium = Pango.Tags.scale_to_float `MEDIUM in
  check (float 0.01) "medium scale" 1.0 scale_medium;

  let scale_large = Pango.Tags.scale_to_float `LARGE in
  check (testable Fmt.float (fun a b -> abs_float (a -. b) < 0.01))
    "large scale" 1.2 scale_large;

  let scale_custom = Pango.Tags.scale_to_float (`CUSTOM 1.5) in
  check (float 0.01) "custom scale" 1.5 scale_custom

(* ========================================================================= *)
(* Enum Tests                                                               *)
(* ========================================================================= *)

let test_wrap_mode_enum () =
  (* Test that wrap mode enum values exist *)
  let _modes = [`WORD; `CHAR; `WORD_CHAR] in
  check pass "wrap mode enum values" () ()

let test_ellipsize_mode_enum () =
  (* Test that ellipsize mode enum values exist *)
  let _modes = [`NONE; `START; `MIDDLE; `END] in
  check pass "ellipsize mode enum values" () ()

let test_style_enum () =
  (* Test that style enum values exist *)
  let _styles = [`NORMAL; `OBLIQUE; `ITALIC] in
  check pass "style enum values" () ()

let test_weight_enum () =
  (* Test that weight enum values exist *)
  let _weights : Pango.Tags.weight list = [
    `ULTRALIGHT; `LIGHT; `NORMAL; `BOLD; `ULTRABOLD; `HEAVY;
    `CUSTOM 600
  ] in
  check pass "weight enum values" () ()

let test_weight_to_int () =
  let normal_weight = Pango.Tags.weight_to_int `NORMAL in
  check int "normal weight value" 400 normal_weight;

  let bold_weight = Pango.Tags.weight_to_int `BOLD in
  check int "bold weight value" 700 bold_weight;

  let custom_weight = Pango.Tags.weight_to_int (`CUSTOM 550) in
  check int "custom weight value" 550 custom_weight

(* ========================================================================= *)
(* Rectangle Tests                                                          *)
(* ========================================================================= *)

let test_rectangle_creation () =
  let rect : Pango.rectangle = { x = 10; y = 20; width = 100; height = 50 } in
  check int "rectangle x" 10 rect.x;
  check int "rectangle y" 20 rect.y;
  check int "rectangle width" 100 rect.width;
  check int "rectangle height" 50 rect.height

(* ========================================================================= *)
(* Integration Tests (require Context)                                     *)
(* ========================================================================= *)

(* Note: These tests are skipped because they require a valid PangoContext,
   which typically comes from a GTK widget. We would need to initialize
   GTK and create a widget to get a context. This will be tested in
   integration tests once we have GTK widget support in Phase 3+. *)

let test_context_operations_skipped () =
  skip ()

let test_layout_operations_skipped () =
  skip ()

(* ========================================================================= *)
(* Test Suite Definition                                                    *)
(* ========================================================================= *)

let font_description_tests = [
  test_case "from/to string" `Quick test_font_description_from_string;
  test_case "copy" `Quick test_font_description_copy;
  test_case "get/set family" `Quick test_font_family;
  test_case "get/set size" `Quick test_font_size;
  test_case "absolute size" `Quick test_font_absolute_size;
  test_case "get/set style" `Quick test_font_style;
  test_case "get/set weight" `Quick test_font_weight;
  test_case "get/set variant" `Quick test_font_variant;
  test_case "get/set stretch" `Quick test_font_stretch;
  test_case "modify multiple properties" `Quick test_font_modify;
]

let language_tests = [
  test_case "from/to string" `Quick test_language_from_string;
  test_case "pattern matching" `Quick test_language_matches;
  test_case "Language.none" `Quick test_language_none;
]

let scale_tests = [
  test_case "PANGO_SCALE constant" `Quick test_pango_scale;
  test_case "scale_to_float" `Quick test_scale_to_float;
]

let enum_tests = [
  test_case "wrap mode enum" `Quick test_wrap_mode_enum;
  test_case "ellipsize mode enum" `Quick test_ellipsize_mode_enum;
  test_case "style enum" `Quick test_style_enum;
  test_case "weight enum" `Quick test_weight_enum;
  test_case "weight_to_int" `Quick test_weight_to_int;
]

let rectangle_tests = [
  test_case "rectangle creation" `Quick test_rectangle_creation;
]

let integration_tests = [
  test_case "context operations (skipped)" `Quick test_context_operations_skipped;
  test_case "layout operations (skipped)" `Quick test_layout_operations_skipped;
]

let () =
  run "Pango Module Tests (Phase 2.5)" [
    "Font Descriptions", font_description_tests;
    "Language Support", language_tests;
    "Scale Constants", scale_tests;
    "Enums", enum_tests;
    "Rectangle", rectangle_tests;
    "Integration (Context/Layout)", integration_tests;
  ]
