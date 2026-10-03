(* Unit tests for Doc_translate — the composition of Doc_parse and
   Doc_render (gir_gen/lib/generate/doc_translate.ml): the AST round-trip
   invariants (plan invariant 5: string idempotence is false by design, so
   the round-trip is asserted on the AST via Doc_translate.equal_t, never on
   strings).

   See doc_parse_tests.ml for the parse-grammar suite and
   doc_render_tests.ml for the v1 render policy table suite. The translator
   is also validated over the full bundled GIR corpus by
   doc_translate_corpus_tests.ml. *)

open Gir_gen_lib.Generate.Doc_translate

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
    ("AST round-trip plain prose", `Quick, test_roundtrip_plain_prose);
    ("AST round-trip fixed point", `Quick, test_projector_fixed_point);
    ( "string idempotence false by design",
      `Quick,
      test_idempotence_is_false_by_design );
  ]
