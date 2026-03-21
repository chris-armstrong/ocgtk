(* Signal class defined in geditable_signals.ml *)

class type editable_t = object
    inherit Geditable_signals.editable_signals
    method delegate_get_accessible_platform_state : Gtk_enums.accessibleplatformstate -> bool
    method delete_selection : unit -> unit
    method delete_text : int -> int -> unit
    method finish_delegate : unit -> unit
    method get_alignment : unit -> float
    method get_chars : int -> int -> string
    method get_delegate : unit -> editable_t option
    method get_editable : unit -> bool
    method get_enable_undo : unit -> bool
    method get_max_width_chars : unit -> int
    method get_position : unit -> int
    method get_text : unit -> string
    method get_width_chars : unit -> int
    method init_delegate : unit -> unit
    method select_region : int -> int -> unit
    method set_alignment : float -> unit
    method set_editable : bool -> unit
    method set_enable_undo : bool -> unit
    method set_max_width_chars : int -> unit
    method set_position : int -> unit
    method set_text : string -> unit
    method set_width_chars : int -> unit
    method cursor_position : int
    method selection_bound : int
    method xalign : float
    method set_xalign : float -> unit
    method as_editable : Editable.t
end

(* High-level class for Editable *)
class editable (obj : Editable.t) : editable_t = object (self)
  inherit Geditable_signals.editable_signals obj

  method delegate_get_accessible_platform_state : Gtk_enums.accessibleplatformstate -> bool =
    fun state ->
      (Editable.delegate_get_accessible_platform_state obj state)

  method delete_selection : unit -> unit =
    fun () ->
      (Editable.delete_selection obj)

  method delete_text : int -> int -> unit =
    fun start_pos end_pos ->
      (Editable.delete_text obj start_pos end_pos)

  method finish_delegate : unit -> unit =
    fun () ->
      (Editable.finish_delegate obj)

  method get_alignment : unit -> float =
    fun () ->
      (Editable.get_alignment obj)

  method get_chars : int -> int -> string =
    fun start_pos end_pos ->
      (Editable.get_chars obj start_pos end_pos)

  method get_delegate : unit -> editable_t option =
    fun () ->
      Option.map (fun ret -> new editable ret) (Editable.get_delegate obj)

  method get_editable : unit -> bool =
    fun () ->
      (Editable.get_editable obj)

  method get_enable_undo : unit -> bool =
    fun () ->
      (Editable.get_enable_undo obj)

  method get_max_width_chars : unit -> int =
    fun () ->
      (Editable.get_max_width_chars obj)

  method get_position : unit -> int =
    fun () ->
      (Editable.get_position obj)

  method get_text : unit -> string =
    fun () ->
      (Editable.get_text obj)

  method get_width_chars : unit -> int =
    fun () ->
      (Editable.get_width_chars obj)

  method init_delegate : unit -> unit =
    fun () ->
      (Editable.init_delegate obj)

  method select_region : int -> int -> unit =
    fun start_pos end_pos ->
      (Editable.select_region obj start_pos end_pos)

  method set_alignment : float -> unit =
    fun xalign ->
      (Editable.set_alignment obj xalign)

  method set_editable : bool -> unit =
    fun is_editable ->
      (Editable.set_editable obj is_editable)

  method set_enable_undo : bool -> unit =
    fun enable_undo ->
      (Editable.set_enable_undo obj enable_undo)

  method set_max_width_chars : int -> unit =
    fun n_chars ->
      (Editable.set_max_width_chars obj n_chars)

  method set_position : int -> unit =
    fun position ->
      (Editable.set_position obj position)

  method set_text : string -> unit =
    fun text ->
      (Editable.set_text obj text)

  method set_width_chars : int -> unit =
    fun n_chars ->
      (Editable.set_width_chars obj n_chars)

  method cursor_position = Editable.get_cursor_position obj

  method selection_bound = Editable.get_selection_bound obj

  method xalign = Editable.get_xalign obj
  method set_xalign v =  Editable.set_xalign obj v

    method as_editable = obj
end

