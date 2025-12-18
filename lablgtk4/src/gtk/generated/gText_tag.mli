class text_tag : Text_tag.t ->
  object
    method changed : bool -> unit
    method get_priority : unit -> int
    method set_priority : int -> unit
    method as_text_tag : Text_tag.t
  end

