(* Doc_render — renders a [Doc_ast.t] to odoc markup.

   Pure: no I/O, no global state, deterministic. The parse/render split means
   this module makes only render-time decisions; the heading policy below is
   the one that depends on where the comment is attached.

   {2 Heading policy}

   [Entity] docs (module comments) render headings as odoc page sections: the
   shallowest markdown level becomes [{1}], deeper levels keep their relative
   offsets, capped at [{5}]. [Member] docs (item comments) render headings as
   [{b ...}] bold lead-ins, because odoc demotes headings inside item docs to
   plain paragraphs. [render] uses the [Entity] policy; [render_as] selects
   the policy explicitly and is what [Doc_translate.translate] uses.

   {2 Render policy}

   | AST node            | rendering                                         | fallback event |
   |---------------------|---------------------------------------------------|----------------|
   | [Text]              | odoc-escaped prose: [\{] [\}] [\[] [\] [\@]       | —              |
   | [Code]              | [[code]] ([Inline_code_unbalanced] if it contains []]) | yes        |
   | [Bold] / [Italic]   | [{b ...}] / [{i ...}]                             | —              |
   | [Link] (https only) | [{{:url}text}]                                    | —              |
   | [Page_ref]          | bare text (link dropped)                          | yes            |
   | [Sym_ref]           | [[endpoint]] code span                            | yes            |
   | [Param_ref]         | [[name]] code span                                | —              |
   | [Ref]               | [{!path}] (unreachable in practice)               | —              |
   | [Para]              | paragraph (blank line separated)                  | —              |
   | [Heading]           | per the heading policy above                      | —              |
   | [List]              | odoc shortcut lists ([{- item}] / [{+ item}])     | —              |
   | [Code_block]        | [{[ ... ]}] ([Code_block_verbatim] / [Code_block_stripped] on [}]]) | yes |

   Non-https markdown links ([http://...]) degrade to bare text and count as
   [Link_degraded]. Tables are dropped entirely, since cell text is not
   meaningful prose; [Table_stripped] marks where one was.

   {2 Comment-safety pass}

   The rendered string is passed through a comment-hazard pass that inserts a
   backslash into any star-paren or paren-star sequence, since either would end
   or nest an OCaml comment. The pass runs once over the whole output, so no
   span or block transformation can reintroduce a hazard. A hazard in the
   source is neutralised silently: no content is lost and no policy is
   involved, so it is not reported as a fallback. *)

open Doc_ast

val render : t -> string
(** Renders with the [Entity] heading policy. The output is comment-hazard
    neutralised and has no unescaped [@] in prose. *)

val render_as : context -> t -> string
(** [render] with the heading policy selected explicitly. *)

val render_with_fallbacks : context -> t -> string * fallback list
(** [render_as] plus the fallback events raised during rendering (page refs,
    symbol refs, unbalanced inline code, code-block fallbacks, non-https links).
*)
