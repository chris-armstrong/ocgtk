(* Doc_ast -> odoc markup renderer; see the .mli for the design. *)

open Doc_ast

(* --------------------------------------------------------------------- *)
(* Character helpers                                                       *)
(* --------------------------------------------------------------------- *)

let contains_char s c =
  let n = String.length s in
  let rec go i = i < n && (String.get s i = c || go (i + 1)) in
  go 0

let contains_sub s sub =
  let n = String.length s in
  let m = String.length sub in
  let starts_with pos =
    pos + m <= n
    &&
    let rec go i = i >= m || (s.[pos + i] = sub.[i] && go (i + 1)) in
    go 0
  in
  let rec find i = i + m <= n && (starts_with i || find (i + 1)) in
  find 0

(* odoc-special escaping in prose contexts: \{ \} \[ \@ (plan invariant 2).
   A stray ] is left bare: odoc treats it as literal text (at worst a
   benign warning, never a misparse), and code spans manage their own ]
   via the balance fallback. *)
let escape_prose buf s =
  let n = String.length s in
  let rec go i =
    if i >= n then ()
    else
      match s.[i] with
      | '{' | '}' | '[' | '@' ->
          Buffer.add_char buf '\\';
          Buffer.add_char buf s.[i];
          go (i + 1)
      | _ ->
          Buffer.add_char buf s.[i];
          go (i + 1)
  in
  go 0

(** [emit_code_span buf content] — the [[content]] odoc code span, shared by
    every inline node that degrades or renders to one ([Code]'s balanced case,
    [Sym_ref], [Param_ref]). *)
let emit_code_span buf content =
  Buffer.add_char buf '[';
  Buffer.add_string buf content;
  Buffer.add_char buf ']'

let rec render_inline ins buf fbs =
  List.fold_left
    (fun fbs' inl ->
      match inl with
      | Text s ->
          escape_prose buf s;
          fbs'
      | Code s ->
          if contains_char s ']' then (
            (* balance fallback (plan invariant 3): escaped plain prose *)
            escape_prose buf s;
            Inline_code_unbalanced s :: fbs')
          else (
            emit_code_span buf s;
            fbs')
      | Bold inner -> wrap buf "{b " "}" inner fbs'
      | Italic inner -> wrap buf "{i " "}" inner fbs'
      | Link { text; url } -> wrap buf ("{{:" ^ url ^ "}") "}" text fbs'
      | Page_ref { text; path; anchor = _ } ->
          (* v1: degraded to bare text (upstream-URL leg is a pure rewrite) *)
          let f = render_inline text buf fbs' in
          Page_ref_degraded path :: f
      | Sym_ref { endpoint; kind = _; anchor = _ } ->
          (* v1: degraded to a code span (the §7 resolver leg is a pure
             rewrite to [Ref]) *)
          emit_code_span buf endpoint;
          Sym_ref_degraded endpoint :: fbs'
      | Param_ref name ->
          (* always a code span: a bare @ would start an odoc tag *)
          emit_code_span buf name;
          fbs'
      | Ref path ->
          Buffer.add_string buf "{!";
          Buffer.add_string buf path;
          Buffer.add_char buf '}';
          fbs')
    fbs ins

(* [prefix ... suffix], with [inner] rendered (recursively) in between —
   shared by every "markup wrapped around nested inline content" case:
   [Bold], [Italic] and [Link] here, and the heading policy in
   [render_with_fallbacks] below. *)
and wrap buf prefix suffix inner fbs =
  Buffer.add_string buf prefix;
  let f = render_inline inner buf fbs in
  Buffer.add_string buf suffix;
  f

(* The comment-hazard pass (plan invariant 1): insert a backslash between
   the two characters of a star-paren / paren-star sequence, over the whole
   final output — inside code spans and verbatim blocks included. *)
let neutralise_comment_hazards s =
  let buf = Buffer.create (String.length s + 8) in
  let n = String.length s in
  let rec go i =
    if i >= n then ()
    else
      let pair =
        i + 1 < n
        && ((s.[i] = '*' && s.[i + 1] = ')') || (s.[i] = '(' && s.[i + 1] = '*'))
      in
      if pair then (
        Buffer.add_char buf s.[i];
        Buffer.add_char buf '\\';
        Buffer.add_char buf s.[i + 1];
        go (i + 2))
      else (
        Buffer.add_char buf s.[i];
        go (i + 1))
  in
  go 0;
  Buffer.contents buf

let render_with_fallbacks ctx (t : t) : string * fallback list =
  (* Entity heading normalisation: the doc's shallowest markdown level maps
     to {1}, deeper levels keep their offsets, capped at {5}. *)
  let shallowest =
    List.fold_left
      (fun acc blk ->
        match blk with Heading (l, _) -> Int.min acc l | _ -> acc)
      7 t.blocks
  in
  let shift = shallowest - 1 in
  let render_block blk : string * fallback list =
    let buf = Buffer.create 64 in
    let fbs =
      match blk with
      | Para ins -> render_inline ins buf []
      | Heading (lvl, ins) -> (
          match ctx with
          | Entity ->
              let level = Int.min (lvl - shift) 5 in
              wrap buf (Printf.sprintf "{%d " level) "}" ins []
          | Member -> wrap buf "{b " "}" ins [])
      | List (ordered, items) ->
          let prefix = if ordered then "+ " else "- " in
          let fbs =
            List.fold_left
              (fun fbs item ->
                Buffer.add_string buf prefix;
                let f = render_inline item buf fbs in
                Buffer.add_char buf '\n';
                f)
              [] items
          in
          let len = Buffer.length buf in
          if len > 0 && Buffer.nth buf (len - 1) = '\n' then
            Buffer.truncate buf (len - 1);
          fbs
      | Code_block content ->
          if contains_sub content "]}" then
            if contains_sub content "v}" then
              (* neither {[ ... ]} nor {v ... v} can carry this content *)
              Code_block_stripped content :: []
            else (
              Buffer.add_string buf "{v\n";
              Buffer.add_string buf content;
              Buffer.add_string buf "\nv}";
              Code_block_verbatim content :: [])
          else (
            if String.equal content "" then Buffer.add_string buf "{[]}"
            else (
              Buffer.add_string buf "{[\n";
              Buffer.add_string buf content;
              Buffer.add_string buf "\n]}");
            [])
    in
    (Buffer.contents buf, fbs)
  in
  let rendered, fbs =
    List.fold_left
      (fun (acc, fbs) blk ->
        let s, blk_fbs = render_block blk in
        (s :: acc, List.rev_append blk_fbs fbs))
      ([], []) t.blocks
  in
  let output =
    List.rev rendered
    |> List.filter (fun s -> not (String.equal s ""))
    |> String.concat "\n\n"
  in
  (neutralise_comment_hazards output, fbs)

let render_as ctx t = fst (render_with_fallbacks ctx t)

(* [render] is the [Entity] policy: module comments are the canonical
   attachment point in the emission inventory. *)
let render t = render_as Entity t
