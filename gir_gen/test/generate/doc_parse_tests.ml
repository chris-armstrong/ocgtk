(* Unit tests for the Doc_parse grammar (gir_gen/lib/generate/doc_parse.ml):
   gi-docgen [frag@endpoint] fragments and legacy #/% sigils (incl. the
   GIR-PRD §3.5 guard rules), @param sigils, and the parse-time strips
   (admonitions, tables, pictures, quotes, images).

   Sigil/fragment recognition is asserted through the full [E.translate]
   pipeline (Doc_render degrades every reference to a [[endpoint]] code
   span — see doc_render_tests.ml for the render policy itself), except
   where the test needs the raw AST shape, which is asserted structurally
   via [parse] and [equal_*].

   See doc_translate_tests.ml for the shared corpus smoke test pointer and
   doc_render_tests.ml for the v1 render policy table coverage. *)

open Gir_gen_lib.Generate.Doc_translate
open Doc_translate_test_helpers

(* ---------- fragments and legacy sigils ------------------------- *)

let test_fragment () =
  let out, fbs =
    translate_with_fallbacks Entity "[method@Gtk.Widget.show] here"
  in
  has "fragment degrades to [endpoint]" out "[Gtk.Widget.show]";
  has_fallback "fragment counted as degraded" `Sym_ref_degraded fbs

let test_fragment_kind_parsed () =
  let t = parse Entity "[class@Foo]" in
  match t.blocks with
  | [ Para [ Sym_ref { kind; endpoint; anchor } ] ] ->
      Alcotest.(check bool)
        "class fragment kind" true
        (match kind with Some Class -> true | _ -> false);
      Alcotest.(check string) "endpoint" "Foo" endpoint;
      Alcotest.(check (option string)) "no anchor" None anchor
  | _ -> Alcotest.fail "expected a single Sym_ref paragraph"

let test_fragment_anchor_and_backticks () =
  let t =
    parse Entity "[class@Foo#bar] and [class@`Baz`] and [`ctor@Gtk.Box.new`]"
  in
  match t.blocks with
  | [ Para [ Sym_ref a; Text _; Sym_ref b; Text _; Sym_ref c ] ] ->
      Alcotest.(check (option string))
        "anchor kept on node" (Some "bar") a.anchor;
      Alcotest.(check string) "backticked endpoint stripped" "Baz" b.endpoint;
      Alcotest.(check string)
        "whole-fragment backticks stripped" "Gtk.Box.new" c.endpoint;
      Alcotest.(check bool)
        "whole-fragment kind kept" true
        (match c.kind with Some Ctor -> true | _ -> false)
  | _ -> Alcotest.fail "expected three Sym_ref nodes"

let test_whole_backtick_fragment_renders_stable () =
  (* the [`ctor@X`] corpus form renders to the same degraded code span as
     the unwrapped [ctor@X] — a backtick-wrapped fragment must not
     re-trigger as a different construct on a re-parse of the output *)
  has "whole-wrapped fragment renders like the plain form"
    (E.translate "see [`ctor@Gtk.Box.new`] here")
    "see [Gtk.Box.new] here"

let test_legacy_sigils () =
  let out, fbs =
    translate_with_fallbacks Entity "#GtkWidget and %GDK_KEY_a and %TRUE."
  in
  has "#Type degrades to [Type]" out "[GtkWidget]";
  has "%CONST degrades to [CONST]" out "[GDK_KEY_a]";
  has "%TRUE kept" out "[TRUE]";
  has_fallback "sigils counted as degraded" `Sym_ref_degraded fbs

let test_sigil_guards () =
  (* GIR plan §3.5 guard rules: no false positives on URL fragments,
     headings, hex colours, spacing, or a hash preceded by a slash *)
  let out =
    E.translate "# plain hashtag, https://x/#bar, #ff0000, 100%, a * b"
  in
  lacks "URL fragment not a sigil" out "[bar]";
  lacks "hex not a sigil" out "[ff0000]";
  lacks "percent with space not a sigil" out "[b]"

let test_param_sigil () =
  let out = E.translate "Set by @amount." in
  has "param sigil becomes [name]" out "[amount]."
(* a bare @ is gone — no tag hazard *)

let test_param_email_guard () =
  (* "some@body" is an email/namespaced form, not a param reference *)
  let out = E.translate "mail some@body to us." in
  lacks "email @ not a param" out "[body]"

(* ---------- stripped-at-parse constructs ----------------------- *)

let test_admonition_stripped () =
  let out, fbs =
    translate_with_fallbacks Entity
      "::: warning\n    Careful with `GdkTexture`.\n\nNext."
  in
  has "content kept as prose" out "Careful with";
  has "content markup still inline" out "[GdkTexture]";
  lacks "no admonition marker" out ":::";
  has_fallback "admonition counted" `Admonition_stripped fbs

let test_table_stripped () =
  let out, fbs =
    translate_with_fallbacks Entity
      "| a | b |\n| --- | --- |\n| 1 | 2 |\n\nText."
  in
  lacks "table dropped" out "---";
  has "following paragraph kept" out "Text.";
  has_fallback "table counted" `Table_stripped fbs

let test_picture_stripped () =
  let out, fbs =
    translate_with_fallbacks Entity
      "<picture>\n\
      \  <source srcset=\"x.svg\">\n\
      \  <img src=\"x.png\" alt=\"An example\">\n\
       </picture>\n\n\
       Text."
  in
  has "img alt kept as prose" out "An example";
  lacks "no picture markup" out "<picture>";
  has_fallback "picture counted" `Picture_stripped fbs

let test_markdown_image_stripped () =
  let out, fbs =
    translate_with_fallbacks Entity "See ![the logo](logo.png) here."
  in
  has "alt kept as prose" out "the logo";
  lacks "no image link markup" out "![";
  has_fallback "image counted" `Image_stripped fbs

let test_quote_stripped () =
  let out, fbs =
    translate_with_fallbacks Entity "> quoted prose\n> more prose"
  in
  has "quote content kept" out "quoted prose\nmore prose";
  lacks "no quote markers" out ">";
  has_fallback "quote counted" `Quote_stripped fbs

(* ---------- suite ---------------------------------------------- *)

let tests =
  [
    ("fragment degradation", `Quick, test_fragment);
    ("fragment kind parsed", `Quick, test_fragment_kind_parsed);
    ( "fragment anchors and backticks",
      `Quick,
      test_fragment_anchor_and_backticks );
    ( "whole-backtick fragment renders stable",
      `Quick,
      test_whole_backtick_fragment_renders_stable );
    ("legacy sigil degradation", `Quick, test_legacy_sigils);
    ("sigil guard rules", `Quick, test_sigil_guards);
    ("param sigil -> [name]", `Quick, test_param_sigil);
    ("param email guard", `Quick, test_param_email_guard);
    ("admonition stripped", `Quick, test_admonition_stripped);
    ("table stripped", `Quick, test_table_stripped);
    ("picture stripped", `Quick, test_picture_stripped);
    ("markdown image stripped", `Quick, test_markdown_image_stripped);
    ("quote stripped", `Quick, test_quote_stripped);
  ]
