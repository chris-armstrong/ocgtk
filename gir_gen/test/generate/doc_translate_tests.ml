(* Unit tests for Doc_translate — the pure GIR <doc> markdown → odoc markup
   translator (gir_gen/lib/generate/doc_translate.ml).

   Covers, per the Phase-1 plan: every row of the v1 render policy table;
   the four prose escapes; the comment-hazard pass; the span/block balance
   fallbacks; heading policy in both contexts (entity normalisation incl.
   the {5} cap, member {b ...} lead-in); bullet and ordered lists; https
   links; gi-docgen [frag@endpoint] fragments and legacy #/% sigils degraded
   to [endpoint] code; relative .html links degraded to bare text; @param
   sigils rendered as [name] code; the parse-time strips (admonitions,
   tables, pictures, quotes); and the AST round-trip invariants (plan
   invariant 5: string idempotence is false by design, so the round-trip is
   asserted on the AST via Doc_translate.equal_t, never on strings).

   Rendered output is checked with substring assertions (Helpers.string_contains)
   because it is odoc markup text with no in-repo parser — the established
   convention for generator-output tests (see constant_code_tests.ml). AST
   structure is checked structurally via the module's own equal functions.

   The translator is also validated over the full bundled GIR corpus by
   doc_translate_corpus_tests.ml. *)

open Gir_gen_lib.Generate.Doc_translate

module E = struct
  let entity s = parse Entity s |> render_as Entity
  let member s = parse Member s |> render_as Member
  let translate s = translate Entity s
  let parse_entity = parse Entity
end

let has msg s sub =
  Alcotest.(check bool) msg true (Helpers.string_contains s sub)

let lacks msg s sub =
  Alcotest.(check bool) msg false (Helpers.string_contains s sub)

let has_fallback msg kind fbs =
  Alcotest.(check bool)
    msg true
    (List.exists
       (fun fb ->
         match (fb, kind) with
         | Inline_code_unbalanced _, `Inline_code_unbalanced
         | Code_block_verbatim _, `Code_block_verbatim
         | Code_block_stripped _, `Code_block_stripped
         | Sym_ref_degraded _, `Sym_ref_degraded
         | Page_ref_degraded _, `Page_ref_degraded
         | Link_degraded _, `Link_degraded
         | Admonition_stripped _, `Admonition_stripped
         | Picture_stripped _, `Picture_stripped
         | Image_stripped _, `Image_stripped
         | Quote_stripped, `Quote_stripped
         | Table_stripped, `Table_stripped ->
             true
         | _ -> false)
       fbs)

(* ---------- v1 render policy table ------------------------------ *)

let test_code_span () =
  has "backtick span becomes [code]"
    (E.translate "Use `gtk_widget_show ()` here.")
    "[gtk_widget_show ()]"

let test_bold_italic () =
  let out = E.translate "**bold** and *italic* and **bold `code`**" in
  has "bold" out "{b bold}";
  has "italic" out "{i italic}";
  has "bold containing code" out "{b bold [code]}"

let test_https_link () =
  has "https link renders {{:url}text}"
    (E.translate "[the docs](https://example.com/some/page)")
    "{{:https://example.com/some/page}the docs}"

let test_paragraph_separation () =
  let out = E.translate "First paragraph.\n\nSecond paragraph." in
  has "blank line kept" out "First paragraph.\n\nSecond paragraph."

let test_heading_entity_normalisation () =
  (* the doc's shallowest markdown heading level maps to {1}; deeper
     levels keep their offset from that shift; anything past {5} is
     capped there *)
  has "entity heading normalised to {1}"
    (E.entity "# CSS nodes\n\nProse.")
    "{1 CSS nodes}";
  let capped = E.entity "# A\n\n###### Six\n\n##### Five" in
  has "level 6 capped at 5" capped "{5 Six}";
  has "level 5 stays at 5" capped "{5 Five}";
  (* a doc whose shallowest heading is H2 maps to {1}, not H1 *)
  let shifted = E.entity "## Sub\n\n### Deeper" in
  has "H2 -> {1}" shifted "{1 Sub}";
  has "H3 -> {2}" shifted "{2 Deeper}"

let test_heading_member_leadin () =
  has "member heading becomes {b ...} lead-in"
    (E.member "# CSS nodes\n\nProse.")
    "{b CSS nodes}"

let test_bullet_list () =
  has "bullet shortcut list"
    (E.translate "- item one\n- item two")
    "- item one\n- item two"

let test_ordered_list () =
  has "ordered shortcut list with + markers"
    (E.translate "1. first\n2. second")
    "+ first\n+ second"

let test_list_items_preserve_markup () =
  has "list item inline markup"
    (E.translate "- a `code` item")
    "- a [code] item"

let test_code_block () =
  has "fenced block becomes {[ ... ]}"
    (E.translate "```\nsome code\n```")
    "some code"

let test_code_block_leading_brace () =
  (* a corpus-shaped C snippet whose content starts with { — verified
     against odoc: {[ { ... } ]} renders, the brace is verbatim content *)
  let out = E.translate "```c\n{\n  GtkWidget *w;\n}\n```" in
  has "content kept verbatim" out "{[\n{\n  GtkWidget *w;\n}\n]}"

let test_empty_blocks () =
  Alcotest.(check string) "empty doc renders empty" "" (E.translate "")

(* ---------- escapes and comment safety -------------------------- *)

let test_four_prose_escapes () =
  (* invariant 2 escapes exactly \{ \} \[ \@ at render — a stray ] is left
     bare (odoc treats it as literal text), and a lowercase [@word] is a
     param sigil, rendered as [word] — not an escape case, so the fixture
     uses uppercase [@F] to exercise the literal-@ escape *)
  let out = E.translate "a {b} c [d] e @F g" in
  has "escaped { and } at render" out "\\{b\\}";
  has "escaped [ at render" out "\\[d]";
  has "escaped @ at render" out "\\@F"

let test_stray_bracket_not_escaped () =
  (* invariant 2 escapes exactly \{ \} \[ \@; a stray ] stays bare (odoc
     treats it as literal text — verified against odoc 3.2.1) *)
  has "stray ] left bare" (E.translate "text ] here") "text ] here"

let test_comment_hazard () =
  let out = E.translate "A (* note *) here." in
  lacks "no open-paren-star" out "(*";
  lacks "no star-close-paren" out "*)";
  (* the hazard is neutralised, not dropped *)
  has "content preserved" out "note"

let test_comment_hazard_inside_code () =
  (* corpus reality: "`(*ranges)[2*n]`" — hazards apply inside code spans too *)
  let out = E.translate "Start `(*ranges)` end." in
  lacks "no (* inside code" out "(*";
  lacks "no *) inside code" out "*)"

let test_literal_at_never_a_tag () =
  (* decision 6: any literal @ in prose is escaped, so a bare @word can
     never start an odoc tag; and @param sigils become code spans *)
  let out = E.translate "The @self value is like @amount but also plain @x." in
  has "param ref becomes [name]" out "[amount]";
  has "param ref becomes [name]" out "[self]";
  lacks "no bare @" out " @x"

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

(* ---------- relative page links -------------------------------- *)

let test_relative_html_link_degraded () =
  let out, fbs =
    translate_with_fallbacks Entity
      "See [the section](class.Application.html#automatic-resources) here."
  in
  has "text kept" out "the section";
  lacks "no link markup" out "{{:";
  has_fallback "page ref counted" `Page_ref_degraded fbs

let test_http_link_degraded () =
  (* v1 Link is https-only (plan policy table); http links keep their text *)
  let out, fbs =
    translate_with_fallbacks Entity "[the spec](http://example.com/x)"
  in
  has "text kept" out "the spec";
  lacks "no https link emitted" out "{{:http";
  has_fallback "http link counted" `Link_degraded fbs

(* ---------- balance / fallback invariants (plan invariant 3) --- *)

let test_unbalanced_inline_code () =
  let out, fbs = translate_with_fallbacks Entity "Use `a]b` here." in
  lacks "broken [code] not emitted" out "[a]b]";
  has "balance fallback: escaped plain prose, ] left bare" out "a]b";
  has_fallback "unbalanced code counted" `Inline_code_unbalanced fbs

let test_code_block_close_hazard_verbatim () =
  let out, fbs = translate_with_fallbacks Entity "```\narr[i]} = x\n```" in
  lacks "broken {[ not emitted" out "{[arr";
  has "verbatim fallback used" out "arr[i]} = x";
  has_fallback "verbatim fallback counted" `Code_block_verbatim fbs

let test_code_block_close_hazard_strip () =
  (* content also contains v} — neither {[ ... ]} nor {v ... v} can carry
     it, so the block is stripped and counted *)
  let content = "arr[i]} and v} here\n" in
  let out, fbs = translate_with_fallbacks Entity ("```\n" ^ content ^ "```") in
  lacks "hazardous content dropped" out "arr[i]}";
  has_fallback "stripped block counted" `Code_block_stripped fbs

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

(* ---------- AST round-trip (plan invariant 5) ------------------- *)

let roundtrip_strict ctx s =
  let t1 = parse ctx s in
  let rendered =
    match ctx with Entity -> render t1 | Member -> render_as Member t1
  in
  let t2 = parse ctx rendered in
  equal_t t1 t2

let test_roundtrip_plain_prose () =
  (* strict first-pass round-trip holds for escape-free prose *)
  Alcotest.(check bool)
    "single paragraph" true
    (roundtrip_strict Entity "Plain prose.");
  Alcotest.(check bool)
    "multi-line paragraph" true
    (roundtrip_strict Entity "Two lines\nin one paragraph.");
  Alcotest.(check bool)
    "two paragraphs" true
    (roundtrip_strict Entity "First.\n\nSecond.");
  Alcotest.(check bool)
    "member context" true
    (roundtrip_strict Member "Plain prose.")

let projector ctx s =
  (* parse∘render is a fixed point after one application (the form of the
     AST round-trip that holds over markup; see the module .mli) *)
  let once =
    parse ctx
      (match ctx with
      | Entity -> translate Entity s
      | Member -> translate Member s)
  in
  let twice =
    parse ctx
      (match ctx with
      | Entity -> translate Entity (translate Entity s)
      | Member -> translate Member (translate Member s))
  in
  equal_t once twice

let test_projector_fixed_point () =
  let cases =
    [
      "The `GtkButton` widget can hold any valid child widget.";
      "**bold** and *italic* and [[class@Gtk.Widget]].";
      "# Heading\n\nText with @amount and [func@Gtk.init].";
      "- one\n- two\n\n1. three\n2. four";
      "```\ncode here\n```\n\nTail.";
      "A `code` span with `a]b` inside.";
    ]
  in
  List.iter
    (fun s ->
      Alcotest.(check bool)
        ("entity fixed point: " ^ s)
        true (projector Entity s);
      Alcotest.(check bool)
        ("member fixed point: " ^ s)
        true (projector Member s))
    cases

let test_idempotence_is_false_by_design () =
  (* plan invariant 5: translate (translate x) <> translate x, because the
     odoc output of the first pass re-parses differently (e.g. {b ...} is
     not markdown). The wiring property that actually holds is "no emission
     site feeds translator output back through the translator", which is a
     code-inspection property, not a string one. *)
  let s = "The `GtkButton` widget." in
  let once = translate Entity s in
  let twice = translate Entity once in
  Alcotest.(check bool)
    "string idempotence is false" true
    (not (String.equal once twice))

(* ---------- suite ---------------------------------------------- *)

let tests =
  [
    ("code span -> [code]", `Quick, test_code_span);
    ("bold and italic", `Quick, test_bold_italic);
    ("https link", `Quick, test_https_link);
    ("paragraph separation", `Quick, test_paragraph_separation);
    ("entity heading normalisation", `Quick, test_heading_entity_normalisation);
    ("member heading {b} lead-in", `Quick, test_heading_member_leadin);
    ("bullet list", `Quick, test_bullet_list);
    ("ordered list", `Quick, test_ordered_list);
    ("list items preserve markup", `Quick, test_list_items_preserve_markup);
    ("fenced code block", `Quick, test_code_block);
    ("code block leading brace", `Quick, test_code_block_leading_brace);
    ("empty doc", `Quick, test_empty_blocks);
    ("four prose escapes", `Quick, test_four_prose_escapes);
    ("stray ] not escaped", `Quick, test_stray_bracket_not_escaped);
    ("comment hazard neutralisation", `Quick, test_comment_hazard);
    ("comment hazard inside code", `Quick, test_comment_hazard_inside_code);
    ("literal @ never a tag", `Quick, test_literal_at_never_a_tag);
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
    ("relative .html link degraded", `Quick, test_relative_html_link_degraded);
    ("http link degraded", `Quick, test_http_link_degraded);
    ("unbalanced inline code fallback", `Quick, test_unbalanced_inline_code);
    ( "code block ]} verbatim fallback",
      `Quick,
      test_code_block_close_hazard_verbatim );
    ("code block ]}+v} stripped", `Quick, test_code_block_close_hazard_strip);
    ("admonition stripped", `Quick, test_admonition_stripped);
    ("table stripped", `Quick, test_table_stripped);
    ("picture stripped", `Quick, test_picture_stripped);
    ("markdown image stripped", `Quick, test_markdown_image_stripped);
    ("quote stripped", `Quick, test_quote_stripped);
    ("AST round-trip plain prose", `Quick, test_roundtrip_plain_prose);
    ("AST round-trip fixed point", `Quick, test_projector_fixed_point);
    ( "string idempotence false by design",
      `Quick,
      test_idempotence_is_false_by_design );
  ]
