class editable : Editable.t ->
  object
    inherit Geditable_signals.editable_signals
    method delegate_get_accessible_platform_state : Gtk_enums.accessibleplatformstate -> bool
    method delete_selection : unit -> unit
    method delete_text : int -> int -> unit
    method finish_delegate : unit -> unit
    method get_alignment : unit -> float
    method get_chars : int -> int -> string
    method get_delegate : unit -> editable option
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

