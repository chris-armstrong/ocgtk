(* High-level class for AccessibleText *)
class accessible_text (obj : Accessible_text.t) = object (self)

  method update_caret_position : unit -> unit = fun () -> (Accessible_text.update_caret_position obj )

  method update_selection_bound : unit -> unit = fun () -> (Accessible_text.update_selection_bound obj )

    method as_accessible_text = obj
end

