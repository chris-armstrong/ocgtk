class editable : Editable.t ->
  object
    inherit Geditable_signals.editable_signals
    method cursor_position : int
    method editable : bool
    method set_editable : bool -> unit
    method enable_undo : bool
    method set_enable_undo : bool -> unit
    method max_width_chars : int
    method set_max_width_chars : int -> unit
    method selection_bound : int
    method text : string
    method set_text : string -> unit
    method width_chars : int
    method set_width_chars : int -> unit
    method xalign : float
    method set_xalign : float -> unit
    method delegate_get_accessible_platform_state : Gtk_enums.accessibleplatformstate -> bool
    method delete_selection : unit -> unit
    method delete_text : int -> int -> unit
    method finish_delegate : unit -> unit
    method get_alignment : unit -> float
    method get_delegate : unit -> editable option
    method get_position : unit -> int
    method init_delegate : unit -> unit
    method select_region : int -> int -> unit
    method set_alignment : float -> unit
    method set_position : int -> unit
    method as_editable : Editable.t
  end

