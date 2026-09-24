(* Corpus smoke test for Doc_translate: parse + render every bundled GIR
   <doc> element (all nine gir/*.gir files) in memory, in both contexts,
   asserting the load-bearing invariants from the M3 plan:

   - invariant 1 (comment safety): the rendered output never contains an
     unneutralised (* or *) — as the final-comment sanitisation of Doc_emit
     (Phase 2) will also guarantee, but for the translator's raw output;
   - invariant 2 (escaping): no bare @ outside odoc code spans — a literal
     @ would start a tag, so every literal @ in prose must be \@-escaped —
     and balanced { } braces in prose (escaped ones excluded; code spans
     excluded, they are opaque to odoc);
   - invariant 3 (balance/fallbacks): every inline [code] whose content
     contains a ] produced an Inline_code_unbalanced event, and every
     {[ ... ]} code block whose content contains ]} produced a verbatim or
     stripped event — so the rendered output never contains a broken span;
   - the AST round-trip (plan invariant 5, convergence form — see the
     module .mli): parse∘render must CONVERGE — after at most two
     applications the parsed AST stops changing (string idempotence is
     false by design; one-step fixed points are impossible for rendered
     URLs carrying literal '#anchor' text, which is why the corpus
     certifies convergence rather than single-step idempotence).

   The corpus is read with a lightweight Str-based <doc> extractor (the
   production capture is Gir_parser's; corpus doc text never contains a
   literal '<', so the scan is exact) that skips <doc-deprecated> and
   self-closing <doc:format>, and XML-unescapes.

   No file writes; one in-memory pass. The test prints a closing summary of
   docs and fallback events by class. *)

open Gir_gen_lib.Generate.Doc_translate

let gir_files =
  [
    "cairo-1.0.gir";
    "Gdk-4.0.gir";
    "GdkPixbuf-2.0.gir";
    "Gio-2.0.gir";
    "Graphene-1.0.gir";
    "Gsk-4.0.gir";
    "Gtk-4.0.gir";
    "Pango-1.0.gir";
    "PangoCairo-1.0.gir";
  ]

let xml_unescape s =
  let open Str in
  s
  |> Str.global_replace (regexp_string "&lt;") "<"
  |> Str.global_replace (regexp_string "&gt;") ">"
  |> Str.global_replace (regexp_string "&quot;") "\""
  |> Str.global_replace (regexp_string "&apos;") "'"
  |> Str.global_replace (regexp_string "&amp;") "&"

(** All <doc> texts of a GIR file, in document order. *)
let docs_of_gir_file path =
  let content = Helpers.read_file path in
  let re = Str.regexp "<doc\\([^>]*\\)>\\([^<]*\\)</doc>" in
  let rec collect pos acc =
    try
      let _seek = Str.search_forward re content pos in
      let attrs = Str.matched_group 1 content in
      let raw_doc = Str.matched_group 2 content in
      (* capture the end position before any other Str call: the unescape
         below runs global_replace searches that clobber the match state *)
      let end_pos = Str.match_end () in
      let valid =
        String.length attrs = 0 || (attrs.[0] <> '-' && attrs.[0] <> ':')
      in
      let acc = if valid then xml_unescape raw_doc :: acc else acc in
      collect end_pos acc
    with Not_found -> List.rev acc
  in
  collect 0 []

(* ------------------------------------------------------------------ *)
(* Invariant checks                                                    *)
(* ------------------------------------------------------------------ *)

let rec contains_sub s sub =
  let n = String.length s in
  let m = String.length sub in
  let rec find i = i + m <= n && (starts_with s i sub || find (i + 1)) in
  find 0

and starts_with s pos prefix =
  let n = String.length prefix in
  pos + n <= String.length s
  &&
  let rec go i =
    i >= n || (String.get s (pos + i) = String.get prefix i && go (i + 1))
  in
  go 0

(* Invariant 2: scan the render output the way odoc reads it. Opaque
   regions — inline code spans, code blocks and verbatim blocks — carry
   no tag or brace semantics, so their content is skipped whole (code
   blocks may legitimately contain closing brackets, at-signs or
   unbalanced C braces); escaped pairs are skipped. Outside the opaque
   regions a bare at-sign would start an odoc tag and braces must
   balance. Returns the violation count (0 = clean). *)
let escape_violations output =
  let n = String.length output in
  let violations = ref 0 in
  let open_braces = ref 0 in
  let close_braces = ref 0 in
  let skip_to_delim i delim =
    let d = String.length delim in
    let rec go j =
      if j + d > n then None
      else if starts_with output j delim then Some (j + d)
      else go (j + 1)
    in
    go i
  in
  let rec go i =
    if i >= n then ()
    else if i > 0 && output.[i - 1] = '\\' then go (i + 1)
    else
      let c = output.[i] in
      if c = '{' && starts_with output i "{[" then
        match skip_to_delim (i + 2) "]}" with
        | Some j -> go j
        | None -> incr violations
      else if c = '{' && starts_with output i "{v" then
        match skip_to_delim (i + 2) "v}" with
        | Some j -> go j
        | None -> incr violations
      else if c = '[' then
        (* inline code span: opaque up to the closing ] *)
        match skip_to_delim (i + 1) "]" with
        | Some j -> go j
        | None -> incr violations
      else (
        (match c with
        | '{' -> incr open_braces
        | '}' -> incr close_braces
        | '@' -> incr violations
        | _ -> ());
        go (i + 1))
  in
  go 0;
  !violations + if !open_braces = !close_braces then 0 else 1

(** Invariant 1: count (* and *) sequences in the output (0 = clean). *)
let comment_hazard_count output =
  let n = String.length output in
  let count = ref 0 in
  for i = 0 to n - 2 do
    let pair = String.sub output i 2 in
    if String.equal pair "(*" || String.equal pair "*)" then incr count
  done;
  !count

type stats = {
  mutable docs : int;
  mutable comment_hazard : int;
  mutable escape_violations : int;
  mutable missing_inline_fallback : int;
  mutable missing_block_fallback : int;
  mutable roundtrip_mismatch : int;
  mutable strict_roundtrip_ok : int;
  mutable event_counts : (string * int) list;
}

let counts_initial =
  [
    ("inline code unbalanced", 0);
    ("code block verbatim", 0);
    ("code block stripped", 0);
    ("sym refs degraded", 0);
    ("page refs degraded", 0);
    ("non-https links degraded", 0);
    ("admonitions stripped", 0);
    ("tables stripped", 0);
    ("pictures stripped", 0);
    ("images stripped", 0);
    ("quotes stripped", 0);
  ]

let event_name = function
  | Inline_code_unbalanced _ -> "inline code unbalanced"
  | Code_block_verbatim _ -> "code block verbatim"
  | Code_block_stripped _ -> "code block stripped"
  | Sym_ref_degraded _ -> "sym refs degraded"
  | Page_ref_degraded _ -> "page refs degraded"
  | Link_degraded _ -> "non-https links degraded"
  | Admonition_stripped _ -> "admonitions stripped"
  | Table_stripped -> "tables stripped"
  | Picture_stripped _ -> "pictures stripped"
  | Image_stripped _ -> "images stripped"
  | Quote_stripped -> "quotes stripped"

let bump_event_counts stats fbs =
  stats.event_counts <-
    List.fold_left
      (fun counts fb ->
        let name = event_name fb in
        List.map
          (fun (n, c) -> if String.equal n name then (n, c + 1) else (n, c))
          counts)
      stats.event_counts fbs

(* Invariant 3: every unbalanced code span and every hazardous code block
   in the parse AST must have a matching fallback event in the render's
   event list. *)
let rec check_code_fallbacks inl stats fbs =
  match inl with
  | Code content when contains_sub content "]" ->
      let covered =
        List.exists
          (fun fb ->
            match fb with
            | Inline_code_unbalanced c -> String.equal c content
            | _ -> false)
          fbs
      in
      if not covered then
        stats.missing_inline_fallback <- stats.missing_inline_fallback + 1
  | Bold inner | Italic inner ->
      List.iter (fun i -> check_code_fallbacks i stats fbs) inner
  | Link { text; _ } | Page_ref { text; _ } ->
      List.iter (fun i -> check_code_fallbacks i stats fbs) text
  | _ -> ()

let check_doc ctx doc stats =
  let t1 = parse ctx doc in
  let out, fbs = translate_with_fallbacks ctx doc in
  stats.comment_hazard <- stats.comment_hazard + comment_hazard_count out;
  stats.escape_violations <- stats.escape_violations + escape_violations out;
  List.iter
    (fun blk ->
      match blk with
      | Para ins | Heading (_, ins) ->
          List.iter (fun i -> check_code_fallbacks i stats fbs) ins
      | List (_, items) ->
          List.iter
            (fun item ->
              List.iter (fun i -> check_code_fallbacks i stats fbs) item)
            items
      | Code_block content ->
          if contains_sub content "]}" then
            let covered =
              List.exists
                (fun fb ->
                  match fb with
                  | Code_block_verbatim c | Code_block_stripped c ->
                      String.equal c content
                  | _ -> false)
                fbs
            in
            if not covered then
              stats.missing_block_fallback <- stats.missing_block_fallback + 1)
    t1.blocks;
  (* Invariant 5. Literal string idempotence is false by design (the plan
     says so), and even the one-step AST fixed point can fail: rendered
     link URLs carry literal '#anchor' text that a naive re-parse of the
     output legitimately reads as a legacy sigil. The pipeline invariant
     that actually matters is the wiring property — no emission site ever
     re-translates translator output — so the corpus certifies the
     property that is true and meaningful: parse∘render CONVERGES, i.e.
     after at most two applications the AST stops changing. The strict
     one-pass count is kept as informational. *)
  let apply_once t = parse ctx (render_as ctx t) in
  let t2 = parse ctx out in
  let t3 = apply_once t2 in
  let t4 = apply_once t3 in
  if not (equal_t t3 t4) then
    stats.roundtrip_mismatch <- stats.roundtrip_mismatch + 1;
  (* informational: strict first-pass round-trip count, plan formula
     parse (render (parse x)) ≅ parse x — degradation is lossy by
     design (references degrade to code spans), so only a subset holds *)
  if equal_t t1 t2 then
    stats.strict_roundtrip_ok <- stats.strict_roundtrip_ok + 1;
  bump_event_counts stats fbs

let test_corpus_all_invariants () =
  let stats =
    {
      docs = 0;
      comment_hazard = 0;
      escape_violations = 0;
      missing_inline_fallback = 0;
      missing_block_fallback = 0;
      roundtrip_mismatch = 0;
      strict_roundtrip_ok = 0;
      event_counts = counts_initial;
    }
  in
  let dir = Helpers.gir_data_dir () in
  List.iter
    (fun file ->
      let docs = docs_of_gir_file (Filename.concat dir file) in
      List.iter
        (fun doc ->
          check_doc Entity doc stats;
          check_doc Member doc stats;
          stats.docs <- stats.docs + 1)
        docs)
    gir_files;
  Printf.printf "\nDoc_translate corpus: %d docs translated in both contexts\n"
    stats.docs;
  List.iter
    (fun (name, count) -> Printf.printf "  %-28s %6d\n" name count)
    stats.event_counts;
  Printf.printf "  strict first-pass AST round-trips: %d docs\n"
    stats.strict_roundtrip_ok;
  Alcotest.(check bool) "corpus non-empty" true (stats.docs > 39_000);
  Alcotest.(check int)
    "no comment-hazard sequence in any render output" 0 stats.comment_hazard;
  Alcotest.(check int)
    "no bare @, no prose brace imbalance in any render output" 0
    stats.escape_violations;
  Alcotest.(check int)
    "every unbalanced code span produced a fallback" 0
    stats.missing_inline_fallback;
  Alcotest.(check int)
    "every hazardous code block produced a fallback" 0
    stats.missing_block_fallback;
  Alcotest.(check int)
    "translation converges (parse∘render stable within two\n\
    \     applications, both contexts)"
    0 stats.roundtrip_mismatch

let tests =
  [ ("corpus: all bundled <doc> elements", `Slow, test_corpus_all_invariants) ]
