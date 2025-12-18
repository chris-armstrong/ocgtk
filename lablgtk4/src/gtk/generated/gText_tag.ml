(* High-level class for TextTag *)
class text_tag (obj : Text_tag.t) = object (self)

  method changed : bool -> unit = fun size_changed -> (Text_tag.changed obj size_changed)

  method get_priority : unit -> int = fun () -> (Text_tag.get_priority obj )

  method set_priority : int -> unit = fun priority -> (Text_tag.set_priority obj priority)

    method as_text_tag = obj
end

