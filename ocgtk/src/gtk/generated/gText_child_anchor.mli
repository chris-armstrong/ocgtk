class type text_child_anchor_t = object
    method get_deleted : unit -> bool
    method as_text_child_anchor : Text_child_anchor.t
end

class text_child_anchor : Text_child_anchor.t -> text_child_anchor_t

val new_ : unit -> text_child_anchor_t
val new_with_replacement : string -> text_child_anchor_t
