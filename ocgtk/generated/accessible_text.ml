class type accessible_text_t = object
  method update_caret_position : unit -> unit

  method update_contents :
    Enums.accessibletextcontentchange -> int -> int -> unit

  method update_selection_bound : unit -> unit
  method as_accessible_text : Raw.Accessible_text.t
end

(* High-level class for AccessibleText *)
class accessible_text (obj : Raw.Accessible_text.t) : accessible_text_t =
  object (self)
    method update_caret_position : unit -> unit =
      fun () -> Raw.Accessible_text.update_caret_position obj

    method update_contents :
        Enums.accessibletextcontentchange -> int -> int -> unit =
      fun change start end_ ->
        Raw.Accessible_text.update_contents obj change start end_

    method update_selection_bound : unit -> unit =
      fun () -> Raw.Accessible_text.update_selection_bound obj

    method as_accessible_text = obj
  end
