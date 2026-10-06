(* Doc_emit — assembles one item doc from GIR [<doc>] text.

   Every item-doc emission site goes through [item_doc], which translates the
   raw GIR text, appends the [@since] tag after the prose so an upstream
   [@self] or [@group] can never start a tag, and sanitises the assembled
   text.

   The text is carried in one of two forms. A plain body is a doc comment,
   which is the readable form. A body that OCaml's lexer could misread inside
   a comment (an ASCII double quote, or a quoted-string opener such as a
   brace, an identifier and a pipe) is carried as an [ocaml.doc] attribute payload instead, where it is
   an ordinary string literal.

   Placement follows the form and the item: a comment goes before a val or
   external, an attribute after it; polymorphic-variant members take either
   after their tag, since odoc only renders a member doc written after its tag;
   a module's floating doc is a comment or an [ocaml.text] attribute. *)

type t =
  | Comment of string  (** A complete [(** ... *)] comment. *)
  | Attribute of string  (** The raw doc text, carried as a string literal. *)

val item_doc :
  indent:string ->
  ?since:string ->
  ?fallback:string ->
  context:Doc_translate.context ->
  string option ->
  t option
(** [item_doc ~indent ?since ?fallback ~context doc] returns the doc for an
    item, or [None] when there is nothing to say.

    - [doc] is raw GIR [<doc>] text, translated in [context]. When it is absent,
      or translates to nothing, [fallback] is used instead.
    - [fallback] is trusted odoc markup (e.g. a synthetic code span holding a C
      type name). It is not translated, but it is still sanitised.
    - [since] is the native version. With prose it goes on its own line,
      indented under [indent]; with only a fallback it is appended inline.
    - [indent] applies only to the [@since] continuation line; prose is left as
      translated, since odoc ignores layout inside comments. *)

val before_item : t option -> string
(** The comment to write before an item, with its newline, or [""] when the doc
    is absent or an attribute. *)

val after_item : t option -> string
(** The [ocaml.doc] attribute to write after an item, or [""] when the doc is
    absent or a comment. *)

val member_suffix : t option -> string
(** The text to write after a polymorphic-variant tag: a leading-space comment,
    or an [ocaml.doc] attribute on the tag. [""] when the doc is absent. *)

val floating : t -> string
(** A module's floating doc: the comment text, or an [ocaml.text] attribute. The
    caller adds the blank line that keeps a comment floating. *)
