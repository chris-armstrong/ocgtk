(* Doc_parse — reads GIR [<doc>] markdown (the gi-docgen dialect plus the
   legacy gtk-doc sigils) into the flat [Doc_ast.t]. Pure: no I/O, no global
   state, deterministic. See [Doc_ast] for the parse/render split invariant
   this module must hold.

   {2 Parse grammar notes (corpus-derived)}

   - Fenced blocks come in two gi-docgen dialects: triple-backtick and the
     pipe form [|[...]|] (with an optional [<!-- language="X" -->] first
     line); the double-backtick multi-line block form (`` ``c `` ``) is the
     same fence with an opening run of two backticks. All three become
     [Code_block] with the raw content; fence markers and language hints are
     dropped (the non-OCaml banner is a deferred leg).
   - Markdown images ([![alt](src)]) are treated like [<img alt=...>]:
     alt text kept as plain prose, counted as [Image_stripped];
     [<picture>]/[<source>] wrappers are stripped, counted as
     [Picture_stripped].
   - Legacy sigils follow the GIR-PRD §3.5 guard rules: [#] not preceded by
     [/], [#]/[%] followed by an uppercase identifier with no space (so URL
     fragments, heading markers, CSS/hex and "50%" never match);
     [#Type:property]/[#Type::signal] keep their suffix on the endpoint.
     [@param] names must start lowercase, not be preceded by an identifier
     character and not be followed by [.]+letter (the email/namespace
     guard); any other bare [@] is literal prose and is escaped at render —
     a literal [@word] can never start an odoc tag.
   - Fragments ([keyword@endpoint]) may be backtick-wrapped whole
     ([`class@Foo`] per the gi-docgen linking grammar); the wrapping
     backticks are stripped, and a backtick-wrapped endpoint
     ([class@`Foo`]) is unwrapped too. A trailing [#anchor] may be
     appended and is preserved on the node.
   - An unmatched backtick in prose is literal text (some corpus docs have
     unbalanced backticks; swallowing the rest of the paragraph into a code
     span would be worse).
   - Backslash escapes follow markdown: [\] before a markdown-escapable
     character yields the literal character — the exact inverse of
     [Doc_render]'s escaping.

   The [context] parameter is threaded so [Doc_translate.translate] can hand
   it to [Doc_render.render_as]; parse itself is context-independent (raw
   heading levels are recorded in [Heading], policy is applied at render). *)

open Doc_ast

val parse : context -> string -> t
(** [parse ctx gir_markdown] parses raw GIR [<doc>] content into the AST. [ctx]
    is threaded to render; see module comment. *)

val parse_with_fallbacks : context -> string -> t * fallback list
(** [parse] plus the parse-time fallback events (stripped constructs:
    admonitions, tables, pictures, images, quotes — constructs the plan strips
    to plain prose at parse, each forward-compatible with the full GIR-PRD
    mapping in a later leg). *)
