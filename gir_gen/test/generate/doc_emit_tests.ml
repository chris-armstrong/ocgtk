(* Unit tests for Doc_emit (gir_gen/lib/generate/doc_emit.ml): the single
   assembly point for item doc comments. Covers the exact comment text for
   each input shape (including the constant version-only fallback, whose format is
   fixed), tags-last,
   comment safety on the assembled output, and translation being applied.

   Assertions compare exact strings where the format is the contract, and
   use substring checks where only an ordering or absence matters. *)

open Gir_gen_lib.Generate

let item_doc = Doc_emit.item_doc

let member ?since ?fallback doc =
  item_doc ~indent:"" ?since ?fallback ~context:Doc_translate.Member doc

let count_sub s sub =
  let n = String.length sub in
  let rec go i acc =
    match Str.search_forward (Str.regexp_string sub) s i with
    | j -> go (j + n) (acc + 1)
    | exception Not_found -> acc
  in
  go 0 0

let index_of s sub = Str.search_forward (Str.regexp_string sub) s 0

let check_opt msg expected actual =
  Alcotest.(check (option string)) msg expected actual

(* ---------- exact comment text ---------------------------------------- *)

let test_doc_only () =
  check_opt "prose only" (Some "(** Background color. *)")
    (member (Some "Background color."))

let test_doc_with_since () =
  check_opt "prose then @since on its own line"
    (Some "(** Background color.\n    @since 4.14 *)")
    (member ~since:"4.14" (Some "Background color."))

let test_doc_with_since_indented () =
  let got =
    item_doc ~indent:"  " ~since:"4.14" ~context:Doc_translate.Member
      (Some "Primary action.")
  in
  check_opt "@since continuation carries the member indent"
    (Some "(** Primary action.\n      @since 4.14 *)") got

(* The constant emitter's version-only fallback. The synthetic text is
   trusted odoc, so it is passed as [fallback] and not translated. *)
let test_version_only_fallback () =
  check_opt "fallback + since is single-line, as before"
    (Some "(** [GTK_BG] @since 4.14 *)")
    (member ~since:"4.14" ~fallback:"[GTK_BG]" None)

let test_fallback_without_since () =
  check_opt "fallback alone" (Some "(** [GTK_BG] *)")
    (member ~fallback:"[GTK_BG]" None)

let test_nothing_to_say () =
  check_opt "no doc, no fallback, no since" None (member None)

let test_since_only () =
  check_opt "since with no prose" (Some "(** @since 4.14 *)")
    (member ~since:"4.14" None)

let test_blank_doc_uses_fallback () =
  check_opt "doc that translates to nothing defers to the fallback"
    (Some "(** [GTK_BG] *)")
    (member ~fallback:"[GTK_BG]" (Some "   \n  "))

let test_doc_wins_over_fallback () =
  check_opt "real doc replaces the synthetic fallback"
    (Some "(** Real text. *)")
    (member ~fallback:"[GTK_BG]" (Some "Real text."))

(* ---------- translation ----------------------------------------------- *)

let test_translation_applied () =
  let got = member (Some "Some **bold** text.") in
  Helpers.expect_some "expected a comment" got (fun s ->
      Alcotest.(check bool)
        "bold markup translated to odoc" true
        (Helpers.string_contains s "{b bold}"))

let test_member_heading_policy () =
  let got = member (Some "# Title\n\nBody.") in
  Helpers.expect_some "expected a comment" got (fun s ->
      Alcotest.(check bool)
        "member heading is a bold lead-in, not a section" true
        (Helpers.string_contains s "{b Title}"))

(* ---------- tags last ------------------------------------------------- *)

(* A lowercase [@name] is a param sigil and becomes a code span; any other
   literal [@] in prose is escaped. Either way no bare upstream [@] can
   start a tag, and the real [@since] comes last. *)
let test_tags_come_last () =
  let got = member ~since:"4.14" (Some "Uses @self and @Widget here.") in
  Helpers.expect_some "expected a comment" got (fun s ->
      Alcotest.(check bool)
        "param sigil becomes a code span" true
        (Helpers.string_contains s "[self]");
      Alcotest.(check bool)
        "non-param @ is escaped in prose" true
        (Helpers.string_contains s "\\@Widget");
      Alcotest.(check int) "no bare upstream @self tag" 0 (count_sub s "@self");
      Alcotest.(check bool)
        "escaped prose precedes the real tag" true
        (index_of s "\\@Widget" < index_of s "@since");
      Alcotest.(check int)
        "exactly one real @since tag" 1 (count_sub s "@since"))

(* ---------- comment safety -------------------------------------------- *)

(* A comment terminator inside the output would end the doc comment early
   and break compilation of the generated binding. Exactly one terminator,
   the closing one, may remain in the output. *)
let assert_single_terminator msg s =
  Alcotest.(check int) msg 1 (count_sub s "*)")

let test_terminator_in_prose () =
  Helpers.expect_some "expected a comment"
    (member (Some "Ends with *) and opens (* here."))
    (assert_single_terminator "prose terminator neutralised")

let test_terminator_in_code_span () =
  Helpers.expect_some "expected a comment"
    (member (Some "Use [a *) b] here."))
    (assert_single_terminator "terminator in a code span neutralised")

let test_terminator_in_fallback () =
  Helpers.expect_some "expected a comment"
    (member ~fallback:"[*)]" None)
    (assert_single_terminator "fallback neutralised")

let test_terminator_in_code_block () =
  Helpers.expect_some "expected a comment"
    (member (Some "Example:\n\n```\nlet x = (* a *) 1 *)\n```"))
    (assert_single_terminator "code block terminator neutralised")

(* ---------- quotes ---------------------------------------------------- *)

(* OCaml lexes string literals inside comments, so any ASCII double quote in
   emitted prose could open a string. Every quote becomes typographic. *)
let test_quotes_typographic () =
  check_opt "quotes replaced, not left as ASCII"
    (Some "(** Says \u{201C}hi\u{201D} here. *)")
    (member (Some "Says \"hi\" here."))

let test_no_ascii_quote_survives () =
  (* An even count of quotes can still leave a string open for the lexer
     (backslash-quoted words in GIR examples), so no ASCII quote may survive. *)
  Helpers.expect_some "expected a comment"
    (member (Some "Example \\\"\"$(dir)/x\"\\ end.")) (fun s ->
      Alcotest.(check int) "no ASCII quote left" 0 (count_sub s "\""))

(* ---------- suite ----------------------------------------------------- *)

let tests =
  [
    ("doc only", `Quick, test_doc_only);
    ("doc with since", `Quick, test_doc_with_since);
    ("doc with since, indented", `Quick, test_doc_with_since_indented);
    ("version-only fallback", `Quick, test_version_only_fallback);
    ("fallback without since", `Quick, test_fallback_without_since);
    ("nothing to say", `Quick, test_nothing_to_say);
    ("since with no prose", `Quick, test_since_only);
    ("blank doc uses fallback", `Quick, test_blank_doc_uses_fallback);
    ("doc wins over fallback", `Quick, test_doc_wins_over_fallback);
    ("translation applied", `Quick, test_translation_applied);
    ("member heading policy", `Quick, test_member_heading_policy);
    ("tags come last", `Quick, test_tags_come_last);
    ("terminator in prose", `Quick, test_terminator_in_prose);
    ("terminator in code span", `Quick, test_terminator_in_code_span);
    ("terminator in fallback", `Quick, test_terminator_in_fallback);
    ("terminator in code block", `Quick, test_terminator_in_code_block);
    ("quotes typographic", `Quick, test_quotes_typographic);
    ("no ASCII quote survives", `Quick, test_no_ascii_quote_survives);
  ]
