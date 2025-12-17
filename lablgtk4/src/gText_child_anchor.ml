(* High-level class for TextChildAnchor *)
class text_child_anchor (obj : Text_child_anchor.t) = object (self)

  method get_deleted : unit -> bool = fun () -> (Text_child_anchor.get_deleted obj )

    method as_text_child_anchor = obj
end

