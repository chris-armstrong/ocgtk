class native_dialog : Native_dialog.t ->
  object
    inherit Gnative_dialog_signals.native_dialog_signals
    method destroy : unit -> unit
    method get_modal : unit -> bool
    method get_title : unit -> string option
    method get_transient_for : unit -> GApplication_and__window_and__window_group.window option
    method get_visible : unit -> bool
    method hide : unit -> unit
    method set_modal : bool -> unit
    method set_title : string -> unit
    method set_transient_for : #GApplication_and__window_and__window_group.window option -> unit
    method show : unit -> unit
    method as_native_dialog : Native_dialog.t
  end

