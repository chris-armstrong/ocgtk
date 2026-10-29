(* Unit tests for Odoc_warnings: bucket classification of odoc's messages,
   the odoc-line filter, and the summary formats. The messages and log lines
   are copied from odoc 3.x output for deliberately broken doc comments. *)

open Odoc_warnings

let bucket = Alcotest.testable (Fmt.of_to_string bucket_name) equal_bucket

let classification_cases =
  [
    ("Paragraph should begin on its own line.", Own_line);
    ("'{ul ...}' (bulleted list) should begin on its own line.", Own_line);
    ("'{[...]}' (code block) should begin on its own line.", Own_line);
    ("'@since' should begin on its own line.", Misplaced_tag);
    ("'@since' is not allowed in '{b ...}' (boldface text).", Misplaced_tag);
    ("'@raise' is not allowed in '@return'.", Misplaced_tag);
    ( "'{{:...} ...}' (external link) is not allowed in '{{:...} ...}' \
       (external link).",
      Not_allowed );
    ("'text' is not allowed in '{ul ...}' (bulleted list).", Not_allowed);
    ("'{b ...}' (boldface text) should not be empty.", Empty_markup);
    ("'@author' should not be empty.", Empty_markup);
    ("Unpaired '}' (end of markup).", Unpaired);
    ("Unpaired ']' (end of code).", Unpaired);
    ("Missing end of code block.", Unpaired);
    ("Unknown tag '@foo'.", Bad_markup);
    ("'{x}': bad markup.", Bad_markup);
    ("'9': bad heading level (0-5 allowed).", Bad_markup);
    ( "'{0': heading level should be lower than top heading level '0'.",
      Bad_markup );
    ("'@raise' expects exception constructor on the same line.", Bad_markup);
    ("Identifier in reference should not be empty.", Bad_markup);
    ( "Failed to resolve reference unresolvedroot(Nonexistent).thing Couldn't \
       find \"Nonexistent\"",
      Unresolved_reference );
    ("Something odoc says that no rule knows.", Other);
  ]

let test_classify () =
  List.iter
    (fun (message, expected) ->
      Alcotest.check bucket message expected (classify message))
    classification_cases

let warning =
  Alcotest.testable
    (fun ppf { file; line; message } ->
      Fmt.pf ppf "%s:%d: %s" file line message)
    (fun a b ->
      String.equal a.file b.file && a.line = b.line
      && String.equal a.message b.message)

let log =
  String.concat "\n"
    [
      "File \"ocgtk/generated/button.mli\", line 12, characters 4-20:";
      "Warning: Paragraph should begin on its own line.";
      "File \"../../../../ocgtk/index.mld\", line 2, characters 4-18:";
      "Warning: Failed to resolve reference unresolvedroot(nopage) Couldn't \
       find page \"nopage\"";
      "File \"ocgtk/generated/box.mli\", line 3, characters 10-11:";
      "Warning: Unpaired '}' (end of markup).";
      "Suggestion: try '\\}'.";
      (* A compiler warning on a doc comment is not odoc's. *)
      "File \"ocgtk/generated/grid.mli\", line 7, characters 0-12:";
      "Warning 50 [unexpected-docstring]: unattached documentation comment \
       (ignored)";
      (* Nor is a warning about a dune file. *)
      "File \"ocgtk/dune\", line 3, characters 1-20:";
      "Warning: this stanza is deprecated.";
      (* Nor a warning with no location. *)
      "Warning: something without a location";
      "File \"_build/default/ocgsk/generated/node.ml\", line 1, characters 0-0:";
      "Warning: '{b ...}' (boldface text) should not be empty.";
      "";
    ]

let test_parse () =
  Alcotest.(check (list warning))
    "odoc warnings on doc sources, paths from the repository root"
    [
      {
        file = "ocgtk/generated/button.mli";
        line = 12;
        message = "Paragraph should begin on its own line.";
      };
      {
        file = "ocgtk/index.mld";
        line = 2;
        message =
          "Failed to resolve reference unresolvedroot(nopage) Couldn't find \
           page \"nopage\"";
      };
      {
        file = "ocgtk/generated/box.mli";
        line = 3;
        message = "Unpaired '}' (end of markup).";
      };
      {
        file = "ocgsk/generated/node.ml";
        line = 1;
        message = "'{b ...}' (boldface text) should not be empty.";
      };
    ]
    (parse log)

let test_parse_empty_log () =
  Alcotest.(check (list warning)) "no warnings" [] (parse "")

let test_summary () =
  let summary = summarise (parse log) in
  Alcotest.(check int) "total" 4 (total summary);
  Alcotest.(check int) "own-line" 1 (count summary Own_line);
  Alcotest.(check int) "misplaced-tag" 0 (count summary Misplaced_tag);
  Alcotest.(check string)
    "line lists non-empty buckets in report order"
    "4 (own-line 1, empty-markup 1, unpaired 1, unresolved-reference 1)"
    (to_line summary)

let test_line_no_warnings () =
  Alcotest.(check string) "just the total" "0" (to_line (summarise []))

let test_markdown () =
  let markdown =
    summarise [ { file = "a.mli"; line = 4; message = "Unpaired '|' in `x`" } ]
    |> to_markdown
  in
  let rows = String.split_on_char '\n' markdown in
  Alcotest.(check (option string))
    "heading" (Some "### odoc warnings: 1") (List.nth_opt rows 0);
  Alcotest.(check int)
    "a row for every bucket, empty ones included" (List.length all_buckets)
    (List.length
       (List.filter
          (fun row ->
            List.exists
              (fun b ->
                String.starts_with ~prefix:("| " ^ bucket_name b ^ " |") row)
              all_buckets)
          rows));
  Alcotest.(check bool)
    "first warning, cell delimiters escaped" true
    (List.exists
       (String.equal
          "| unpaired | 1 | no | a.mli:4: Unpaired '\\|' in \\`x\\` |")
       rows);
  Alcotest.(check bool)
    "fixed-at-emission bucket marked" true
    (List.exists (String.equal "| own-line | 0 | yes |  |") rows)

let () =
  Alcotest.run "Odoc_warnings"
    [
      ( "classify",
        [ ("each odoc message lands in its bucket", `Quick, test_classify) ] );
      ( "parse",
        [
          ("keeps odoc warnings on doc sources only", `Quick, test_parse);
          ("empty log has no warnings", `Quick, test_parse_empty_log);
        ] );
      ( "summary",
        [
          ("counts and one-line summary", `Quick, test_summary);
          ("one-line summary of a clean log", `Quick, test_line_no_warnings);
          ("markdown table", `Quick, test_markdown);
        ] );
    ]
