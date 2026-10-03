(* Doc_emit — assembles one item doc comment from GIR [<doc>] text.

   Every item-doc emission site goes through [item_doc]. It owns three
   things the sites should not repeat:

   - translation: the raw GIR text goes through [Doc_translate] (raw text
     only; never translator output — plan invariant 5);
   - tags last: the real [@since] tag is appended after the prose, on its
     own line, so an upstream [@self] or [@group] in prose can never start
     a tag (plan decision 6);
   - final comment safety: the assembled comment is passed through
     [Utils.sanitize_doc] once more, so no fallback can reintroduce an
     unneutralised comment terminator or opener (plan invariant 1).

   Placement is the caller's job. [item_doc] returns the comment text and
   the site decides whether it goes before the item (vals, externals) or
   after the tag (polymorphic-variant members: odoc only renders a member
   doc written after its tag). *)

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
      indented under [indent]; with only a fallback it is appended inline,
      matching the constant emitter's historical single-line form.
    - [indent] is the indentation of the line the comment starts on. It applies
      only to the [@since] continuation line; prose is left as translated, since
      odoc ignores layout inside comments. *)
