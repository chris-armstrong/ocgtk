class text_child_anchor : Text_child_anchor.t ->
  object
    method get_deleted : unit -> bool
    method as_text_child_anchor : Text_child_anchor.t
  end

