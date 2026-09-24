(* Unit tests for the Doc_render policy (gir_gen/lib/generate/doc_render.ml):
   every row of the v1 render policy table; the four prose escapes; the
   comment-hazard pass; the span/block balance fallbacks; heading policy in
   both contexts (entity normalisation incl. the {5} cap, member {b ...}
   lead-in); bullet and ordered lists; https links; relative .html links
   degraded to bare text.

   See doc_parse_tests.ml for fragment/sigil grammar coverage and
   doc_translate_tests.ml for the composed round-trip invariants. *)

open Gir_gen_lib.Generate.Doc_translate
open Doc_translate_test_helpers

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
    ("relative .html link degraded", `Quick, test_relative_html_link_degraded);
    ("http link degraded", `Quick, test_http_link_degraded);
    ("unbalanced inline code fallback", `Quick, test_unbalanced_inline_code);
    ( "code block ]} verbatim fallback",
      `Quick,
      test_code_block_close_hazard_verbatim );
    ("code block ]}+v} stripped", `Quick, test_code_block_close_hazard_strip);
  ]
