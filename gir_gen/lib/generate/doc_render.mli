(* Doc_render — walks the [Doc_ast.t] built by [Doc_parse] to odoc markup.
   Pure: no I/O, no global state, deterministic. See [Doc_ast] for the
   parse/render split invariant this module must hold: no parse-time policy
   decisions here, only the render-time ones (the heading policy below).

   {2 Heading policy}

   [Entity] docs (module comments) render headings as odoc page sections: the
   doc's shallowest markdown level is normalised to [{1}], deeper levels
   keep their relative offsets, capped at [{5}] (GIR plan §6.6). [Member]
   docs (item comments) render headings as [{b ...}] bold lead-in
   paragraphs — odoc silently demotes headings inside item docs to plain
   paragraphs, so the bold lead-in is the rendering ceiling odoc actually
   supports. [render] is the [Entity] policy (module comments are the
   canonical doc attachment in the emission inventory); [render_as] selects
   the policy explicitly and is what [Doc_translate.translate] uses.

   {2 v1 render policy}

   | AST node            | v1 rendering                              | counted |
   |---------------------|-------------------------------------------|---------|
   | [Text]              | odoc-escaped prose: [\{] [\}] [\[] [\@]   | —       |
   | [Code]              | [[code]] ([Inline_code_unbalanced] when the content contains []] | yes |
   | [Bold] / [Italic]   | [{b ...}] / [{i ...}]                     | —       |
   | [Link] (https only) | [{{:url}text}]                            | —       |
   | [Page_ref]          | bare text (link dropped)                  | yes     |
   | [Sym_ref]           | [[endpoint]] code span                    | yes     |
   | [Param_ref]         | [[name]] code span (GIR plan §6.5)        | —       |
   | [Ref]               | [{!path}] (unreachable in v1)              | —       |
   | [Para]              | paragraph (blank line separated)          | —       |
   | [Heading]           | per [context] above                        | —       |
   | [List]              | odoc shortcut lists ([{- item}] / [{+ item}]) | —    |
   | [Code_block]        | [{[ ... ]}] ([Code_block_verbatim] / [Code_block_stripped] on [}]]) | yes |

   Text escaping is exactly the four odoc specials [\{] [\}] [\[] [\@]
   (plan invariant 2). A stray [] in prose is left bare — odoc treats it as
   literal text (it emits a benign warning at worst, never a misparse), and
   code spans manage their own []] via the balance fallback.

   Non-https markdown links ([http://...]) are not in the v1 [Link] row
   (https only): they degrade to bare text, counted as [Link_degraded].

   Tables are dropped entirely (not rendered as prose): cell text is not
   meaningful prose, and the GIR-PRD table mapping is a structural `{t ...}`
   rewrite that a later leg runs from the raw text anyway; the
   [Table_stripped] event marks where the construct was.

   {2 Comment-safety pass}

   The final rendered string is passed through the comment-hazard pass:
   the star-paren / paren-star sequences (the two sequences that would
   terminate or nest an OCaml comment) get a backslash inserted between
   their two characters, exactly like the established [Utils.sanitize_doc].
   This runs once over the whole render output — after every span/block
   transformation — so no fallback can reintroduce a hazard, inside code
   spans and verbatim blocks included (plan invariant 1). The final
   assembled-comment sanitisation that Doc_emit will own in Phase 2 is
   then a second, idempotent pass over the same sequences. A hazard
   sequence in the source is *not* reported as a fallback: the
   neutralisation loses no content and involves no policy trade-off, so it
   stays silent. *)

open Doc_ast

val render : t -> string
(** Renders with the [Entity] heading policy (module comments are the canonical
    attachment). Output is comment-hazard neutralised and contains no unescaped
    [@] in prose. *)

val render_as : context -> t -> string
(** [render] with the heading policy selected explicitly. *)

val render_with_fallbacks : context -> t -> string * fallback list
(** [render_as] plus the render-time fallback events ([Page_ref], [Sym_ref],
    unbalanced inline code, code-block fallbacks, non-https links — plan
    invariant 3 and the v1 policy table above). *)
