(* Signal class defined in geditable_signals.ml *)

(* High-level class for Editable *)
class editable (obj : Editable.t) = object (self)
  inherit Geditable_signals.editable_signals obj

  method cursor_position = Editable.get_cursor_position obj

  method editable = Editable.get_editable obj
  method set_editable v = Editable.set_editable obj v

  method enable_undo = Editable.get_enable_undo obj
  method set_enable_undo v = Editable.set_enable_undo obj v

  method max_width_chars = Editable.get_max_width_chars obj
  method set_max_width_chars v = Editable.set_max_width_chars obj v

  method selection_bound = Editable.get_selection_bound obj

  method text = Editable.get_text obj
  method set_text v = Editable.set_text obj v

  method width_chars = Editable.get_width_chars obj
  method set_width_chars v = Editable.set_width_chars obj v

  method xalign = Editable.get_xalign obj
  method set_xalign v = Editable.set_xalign obj v

  method delegate_get_accessible_platform_state : Gtk_enums.accessibleplatformstate -> bool = fun state -> (Editable.delegate_get_accessible_platform_state obj state)

  method delete_selection : unit -> unit = fun () -> (Editable.delete_selection obj )

  method delete_text : int -> int -> unit = fun start_pos end_pos -> (Editable.delete_text obj start_pos end_pos)

  method finish_delegate : unit -> unit = fun () -> (Editable.finish_delegate obj )

  method get_alignment : unit -> float = fun () -> (Editable.get_alignment obj )

  method get_delegate : unit -> editable option = fun () -> Option.map (fun ret -> new editable ret) (Editable.get_delegate obj )

  method get_position : unit -> int = fun () -> (Editable.get_position obj )

  method init_delegate : unit -> unit = fun () -> (Editable.init_delegate obj )

  method select_region : int -> int -> unit = fun start_pos end_pos -> (Editable.select_region obj start_pos end_pos)

  method set_alignment : float -> unit = fun xalign -> (Editable.set_alignment obj xalign)

  method set_position : int -> unit = fun position -> (Editable.set_position obj position)

    method as_editable = obj
end

