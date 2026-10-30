class type text_child_anchor_t = object
  (** {2:methods Methods} *)

  method get_deleted : unit -> bool
  (** Determines whether a child anchor has been deleted from the buffer.

      Keep in mind that the child anchor will be unreferenced when removed from
      the buffer, so you need to hold your own reference (with
      [g_object_ref ()]) if you plan to use this function — otherwise all
      deleted child anchors will also be finalized. *)

  (** {2:conversions Conversions} *)

  method as_text_child_anchor : Raw.Text_child_anchor.t
end

(* High-level class for TextChildAnchor *)
class text_child_anchor (obj : Raw.Text_child_anchor.t) : text_child_anchor_t =
  object (self)
    method get_deleted : unit -> bool =
      fun () -> Raw.Text_child_anchor.get_deleted obj

    method as_text_child_anchor = obj
  end

let new_ () : text_child_anchor_t =
  new text_child_anchor (Raw.Text_child_anchor.new_ ())

let new_with_replacement (character : string) : text_child_anchor_t =
  let obj_ = Raw.Text_child_anchor.new_with_replacement character in
  new text_child_anchor obj_
