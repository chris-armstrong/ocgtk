class type text_child_anchor_t = object
  method get_deleted : unit -> bool
  method as_text_child_anchor : Text_child_anchor.t
end

(* High-level class for TextChildAnchor *)
class text_child_anchor (obj : Text_child_anchor.t) : text_child_anchor_t =
  object (self)
    method get_deleted : unit -> bool =
      fun () -> Text_child_anchor.get_deleted obj

    method as_text_child_anchor = obj
  end

let new_ () : text_child_anchor_t =
  new text_child_anchor (Text_child_anchor.new_ ())

let new_with_replacement (character : string) : text_child_anchor_t =
  let obj_ = Text_child_anchor.new_with_replacement character in
  new text_child_anchor obj_
