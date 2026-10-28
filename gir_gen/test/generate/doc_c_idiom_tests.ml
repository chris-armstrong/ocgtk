(* Unit tests for the C-idiom rewrites (gir_gen/lib/generate/doc_c_idiom.ml and
   their parse and render rows): the literals [TRUE], [FALSE] and [NULL] in
   both source forms, the null phrases ("-terminated", "on error") and the
   [ret_shape] they depend on, the [#gint]-style primitive type sigils, and
   the sentence-level ownership filter.

   Recognition is asserted on the parsed AST; rendering on the translated
   output, as in doc_parse_tests.ml and doc_render_tests.ml. *)

open Gir_gen_lib.Generate.Doc_translate
open Doc_translate_test_helpers

let paragraph_of msg s =
  match (parse Member s).blocks with
  | [ Para ins ] -> ins
  | _ -> Alcotest.failf "%s: expected one paragraph" msg

let check_inlines msg expected actual =
  Alcotest.(check bool) msg true (List.equal equal_inline expected actual)

let throws s = translate ~ret_shape:Throws Member s

(* ---------- literals --------------------------------------------- *)

let test_percent_literals_parsed () =
  check_inlines "sigils become C literals"
    [ C_lit True; Text ", "; C_lit False; Text ", "; C_lit Null ]
    (paragraph_of "sigils" "%TRUE, %FALSE, %NULL")

let test_backticked_literals_parsed () =
  check_inlines "bare-literal code spans become C literals"
    [ C_lit True; Text " or "; C_lit Null ]
    (paragraph_of "code spans" "`TRUE` or `NULL`")

let test_literal_guards () =
  (* a code span holding more than the literal is C code, and a longer
     constant name is a constant, not a literal *)
  check_inlines "code span with more than the literal stays code"
    [ Code "@sibling == %NULL" ]
    (paragraph_of "expression" "`@sibling == %NULL`");
  check_inlines "constant whose name starts with a literal stays a sigil"
    [ Sym_ref { kind = None; endpoint = "NULL_HANDLE"; anchor = None } ]
    (paragraph_of "constant" "%NULL_HANDLE")

let test_literals_rendered () =
  let out = E.translate "Returns %TRUE or `FALSE`, or %NULL if unset." in
  has "true" out "[true]";
  has "false" out "[false]";
  has "null is None" out "[None] if unset";
  lacks "no C spelling left" out "TRUE"

(* ---------- null phrases ----------------------------------------- *)

let test_null_terminated_is_prose () =
  check_inlines "%NULL-terminated folds into the prose"
    [ Text "a null-terminated array" ]
    (paragraph_of "terminated" "a %NULL-terminated array");
  has "backticked form too"
    (E.translate "a `NULL`-terminated list")
    "a null-terminated list";
  has "spaced form too"
    (E.translate "a %NULL terminated list")
    "a null terminated list"

let test_null_on_error_parsed () =
  check_inlines "error phrase attached to the literal"
    [ Text "the object, or "; C_lit (Null_on_error " on error"); Text "." ]
    (paragraph_of "on error" "the object, or %NULL on error.")

let test_null_on_error_word_boundary () =
  check_inlines "a longer word is not the phrase"
    [ C_lit Null; Text " on errorless input" ]
    (paragraph_of "boundary" "%NULL on errorless input")

let test_null_on_error_throws () =
  let doc = "Returns the settings, or %NULL if an error occurred. See below." in
  let out = throws doc in
  has "throwing item reads as an Error result" out
    "Returns the settings, or an [Error] result. See below.";
  lacks "no None for the error case" out "[None]"

let test_null_on_error_plain () =
  has "non-throwing item keeps the phrase"
    (E.translate "the object, or %NULL on error.")
    "the object, or [None] on error."

let test_plain_null_unaffected_by_throws () =
  has "a null outside an error phrase is None either way"
    (throws "Pass %NULL to unset.")
    "Pass [None] to unset."

(* ---------- primitive types -------------------------------------- *)

let test_c_prim_parsed () =
  check_inlines "known primitive becomes C_prim"
    [ Text "a "; C_prim "gboolean"; Text "." ]
    (paragraph_of "prim" "a #gboolean.")

let test_c_prim_rendered () =
  let out = E.translate "a #gboolean, a #gint, a #gdouble and a #gsize" in
  has "gboolean" out "a [bool]";
  has "gint" out "a [int]";
  has "gdouble" out "a [float]";
  (* the type the bindings use, from the generator's own table *)
  has "gsize" out "a [Gsize.t]"

let test_c_prim_pointer () =
  has "gpointer reads as the word pointer"
    (E.translate "The @user_data #gpointer passed in.")
    "The [user_data] pointer passed in."

let test_c_prim_unknown_stays_text () =
  check_inlines "unknown lowercase sigil is literal text"
    [ Text "a #gunknown value" ]
    (paragraph_of "unknown" "a #gunknown value");
  check_inlines "a slash before the hash is not a sigil"
    [ Text "see page/#gint" ]
    (paragraph_of "slash" "see page/#gint")

(* ---------- ownership -------------------------------------------- *)

let test_ownership_sentence_dropped () =
  let out, fbs =
    translate_with_fallbacks Member
      "Gets the child. Free the returned object with g_object_unref(). It may \
       be unset."
  in
  Alcotest.(check string)
    "neighbouring sentences kept, spacing intact"
    "Gets the child. It may be unset." out;
  has_fallback "strip counted" `Ownership_stripped fbs

let test_ownership_patterns () =
  let stripped s =
    let _, fbs = translate_with_fallbacks Member ("Keep. " ^ s) in
    List.filter_map
      (function Ownership_stripped name -> Some name | _ -> None)
      fbs
  in
  let check name s =
    Alcotest.(check (list string)) name [ name ] (stripped s)
  in
  check "free ... with g_*" "Must be freed with g_variant_unref().";
  check "free ... with g_*" "Release it using g_list_free_full().";
  check "free ... with g_*"
    "The array must be suitable for freeing with g_strfreev().";
  check "use g_*free/unref" "Use g_object_unref() to release it.";
  check "use g_*free/unref" "The caller owns the string; use g_free().";
  check "unref ... with" "The result should be unreffed with the matching call.";
  let kept name s = Alcotest.(check (list string)) name [] (stripped s) in
  kept "a sentence about something else is kept"
    "Freed resources are reported here.";
  (* naming a free function is not an instruction to call it *)
  kept "a mention of g_object_unref is kept"
    "All operations except g_object_ref() and g_object_unref() are invalid.";
  kept "a mention of g_free is kept"
    "Creates a stream, using g_realloc() and g_free() for memory allocation."

let test_ownership_matches_inside_code_and_refs () =
  let out =
    translate Member
      "Returns a list. The list should be freed with `g_list_free()`."
  in
  Alcotest.(check string) "code span text is matched" "Returns a list." out

let test_ownership_empty_paragraph_removed () =
  let out =
    translate Member
      "Gets the child.\n\nFree the returned object with g_object_unref()."
  in
  Alcotest.(check string) "only the first paragraph left" "Gets the child." out

let test_ownership_list_item_removed () =
  let out =
    translate Member "- keep this\n- free it with g_free()\n- and this"
  in
  has "first item" out "- keep this";
  has "last item" out "- and this";
  lacks "ownership item gone" out "g_free"

let test_ownership_abbreviation_not_a_boundary () =
  (* "e.g. pass" does not end a sentence: a lowercase word follows *)
  let out =
    translate Member
      "Set a hint, e.g. pass the value. Free it with g_free(). Then go."
  in
  Alcotest.(check string)
    "sentence with the abbreviation kept whole"
    "Set a hint, e.g. pass the value. Then go." out

let test_ownership_code_block_untouched () =
  let out = translate Member "Example.\n\n```\ng_object_unref (task);\n```" in
  has "code block keeps the call" out "g_object_unref (task);"

let test_ownership_block_without_match_unchanged () =
  let doc = "Gets the child. It may be unset." in
  Alcotest.(check bool)
    "AST unchanged" true
    (equal_t (parse Member doc)
       { blocks = [ Para [ Text "Gets the child. It may be unset." ] ] })

(* ---------- suite ------------------------------------------------ *)

let tests =
  [
    ("% literals parsed", `Quick, test_percent_literals_parsed);
    ("backticked literals parsed", `Quick, test_backticked_literals_parsed);
    ("literal guards", `Quick, test_literal_guards);
    ("literals rendered", `Quick, test_literals_rendered);
    ("null-terminated is prose", `Quick, test_null_terminated_is_prose);
    ("null on error parsed", `Quick, test_null_on_error_parsed);
    ("null on error word boundary", `Quick, test_null_on_error_word_boundary);
    ("null on error, throwing item", `Quick, test_null_on_error_throws);
    ("null on error, plain item", `Quick, test_null_on_error_plain);
    ( "plain null unaffected by throws",
      `Quick,
      test_plain_null_unaffected_by_throws );
    ("primitive parsed", `Quick, test_c_prim_parsed);
    ("primitives rendered", `Quick, test_c_prim_rendered);
    ("gpointer as pointer", `Quick, test_c_prim_pointer);
    ("unknown primitive stays text", `Quick, test_c_prim_unknown_stays_text);
    ("ownership sentence dropped", `Quick, test_ownership_sentence_dropped);
    ("ownership patterns", `Quick, test_ownership_patterns);
    ( "ownership matches code spans",
      `Quick,
      test_ownership_matches_inside_code_and_refs );
    ( "ownership empty paragraph removed",
      `Quick,
      test_ownership_empty_paragraph_removed );
    ("ownership list item removed", `Quick, test_ownership_list_item_removed);
    ( "ownership abbreviation not a boundary",
      `Quick,
      test_ownership_abbreviation_not_a_boundary );
    ( "ownership code block untouched",
      `Quick,
      test_ownership_code_block_untouched );
    ( "ownership block without match unchanged",
      `Quick,
      test_ownership_block_without_match_unchanged );
  ]
