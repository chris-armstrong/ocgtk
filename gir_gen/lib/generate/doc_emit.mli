(* Doc_emit — assembles one item doc comment from GIR [<doc>] text.

   Every item-doc emission site goes through [item_doc], which translates the
   raw GIR text, appends the [@since] tag after the prose so an upstream
   [@self] or [@group] can never start a tag, and sanitises the assembled
   comment so no fallback can reintroduce a comment terminator or opener.

   Placement is the caller's job: vals and externals take the comment before
   the item, while polymorphic-variant members take it after their tag, since
   odoc only renders a member doc written after its tag. *)

val item_doc :
  indent:string ->
  ?since:string ->
  ?fallback:string ->
  context:Doc_translate.context ->
  string option ->
  string option
(** [item_doc ~indent ?since ?fallback ~context doc] returns the complete
    comment text for an item, or [None] when there is nothing to say.

    - [doc] is raw GIR [<doc>] text, translated in [context]. When it is absent,
      or translates to nothing, [fallback] is used instead.
    - [fallback] is trusted odoc markup (e.g. a synthetic code span holding a C
      type name). It is not translated, but it is still sanitised.
    - [since] is the native version. With prose it goes on its own line,
      indented under [indent]; with only a fallback it is appended inline.
    - [indent] applies only to the [@since] continuation line; prose is left as
      translated, since odoc ignores layout inside comments. *)
