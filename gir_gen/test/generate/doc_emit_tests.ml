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
  Option.map
    (function Doc_emit.Comment c -> c | Doc_emit.Attribute _ -> "<attribute>")
    (item_doc ~indent:"" ?since ?fallback ~context:Doc_translate.Member doc)

let count_sub s sub =
  let n = String.length sub in
  let rec go i acc =
    match Str.search_forward (Str.regexp_string sub) s i with
    | j -> go (j + n) (acc + 1)
    | exception Not_found -> acc
  in
  go 0 0

(* Raises [Not_found] when [sub] is absent. *)
let index_of_exn s sub = Str.search_forward (Str.regexp_string sub) s 0

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
    |> Option.map (function
      | Doc_emit.Comment c -> c
      | Doc_emit.Attribute _ -> "<attribute>")
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
        (index_of_exn s "\\@Widget" < index_of_exn s "@since");
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
let attribute_of ?since ?fallback doc =
  match
    item_doc ~indent:"" ?since ?fallback ~context:Doc_translate.Member doc
  with
  | Some (Doc_emit.Attribute a) -> Some a
  | Some (Doc_emit.Comment _) | None -> None

let is_comment ?since ?fallback doc =
  match
    item_doc ~indent:"" ?since ?fallback ~context:Doc_translate.Member doc
  with
  | Some (Doc_emit.Comment _) -> true
  | Some (Doc_emit.Attribute _) | None -> false

let test_quotes_use_attribute () =
  check_opt "a double quote moves the body into an attribute payload"
    (Some "Says \"hi\" here.")
    (attribute_of (Some "Says \"hi\" here."))

(* The translator escapes the brace for odoc, but the lexer still sees a
   quoted-string opener in that text, so the form is chosen on the escaped
   body. *)
let test_quoted_string_opener_uses_attribute () =
  Alcotest.(check bool)
    "a bare {| would open a quoted string in a comment" true
    (Option.is_some (attribute_of (Some "Use {| here.")));
  Alcotest.(check bool)
    "a named {doc| opener is caught too" true
    (Option.is_some (attribute_of (Some "Use {doc| here.")))

let test_plain_braces_stay_comment () =
  Alcotest.(check bool)
    "markup braces without a pipe stay a comment" true
    (is_comment (Some "Use {b bold} and {[x]}."))

let test_apostrophe_stays_comment () =
  Alcotest.(check bool)
    "an apostrophe alone does not open a string" true
    (is_comment (Some "Don't stop."))

let test_attribute_payload_escaped () =
  let rendered =
    Doc_emit.after_item
      (item_doc ~indent:"" ~context:Doc_translate.Member (Some "a\\b \"c\""))
  in
  Alcotest.(check string)
    "backslash and quote are escaped in the string literal"
    "[@@ocaml.doc \"a\\\\b \\\"c\\\"\"]\n\n" rendered

let test_placement_by_form () =
  let comment =
    item_doc ~indent:"" ~context:Doc_translate.Member (Some "Plain.")
  in
  let attr =
    item_doc ~indent:"" ~context:Doc_translate.Member (Some "Say \"hi\".")
  in
  Alcotest.(check string)
    "comment goes before" "(** Plain. *)\n"
    (Doc_emit.before_item comment);
  Alcotest.(check string)
    "comment has no after part" ""
    (Doc_emit.after_item comment);
  Alcotest.(check string)
    "attribute has no before part" ""
    (Doc_emit.before_item attr);
  Alcotest.(check string)
    "attribute goes after" "[@@ocaml.doc \"Say \\\"hi\\\".\"]\n\n"
    (Doc_emit.after_item attr);
  Alcotest.(check string)
    "member comment is space-prefixed" " (** Plain. *)"
    (Doc_emit.member_suffix comment);
  Alcotest.(check string)
    "member attribute sits on the tag" " [@ocaml.doc \"Say \\\"hi\\\".\"]"
    (Doc_emit.member_suffix attr);
  Alcotest.(check string)
    "floating attribute is ocaml.text" "[@@@ocaml.text \"Say \\\"hi\\\".\"]"
    (match attr with Some d -> Doc_emit.floating d | None -> "")

let test_no_ascii_quote_in_comment () =
  (* A comment never carries an ASCII quote: that is what keeps the lexer out of
     string mode. Any body with one takes the attribute form instead. *)
  match member (Some "Plain.") with
  | Some c ->
      Alcotest.(check int) "no ASCII quote in comment" 0 (count_sub c "\"")
  | None -> Alcotest.fail "expected a comment"

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
    ("quotes use attribute", `Quick, test_quotes_use_attribute);
    ( "quoted-string opener uses attribute",
      `Quick,
      test_quoted_string_opener_uses_attribute );
    ("plain braces stay comment", `Quick, test_plain_braces_stay_comment);
    ("apostrophe stays comment", `Quick, test_apostrophe_stays_comment);
    ("attribute payload escaped", `Quick, test_attribute_payload_escaped);
    ("placement by form", `Quick, test_placement_by_form);
    ("comment has no ASCII quote", `Quick, test_no_ascii_quote_in_comment);
  ]
