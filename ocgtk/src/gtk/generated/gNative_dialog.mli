class type native_dialog_t = object
  method on_response :
    callback:(response_id:int -> unit) -> Gobject.Signal.handler_id

  method destroy : unit -> unit
  method get_modal : unit -> bool
  method get_title : unit -> string option

  method get_transient_for :
    unit -> GApplication_and__window_and__window_group.window_t option

  method get_visible : unit -> bool
  method hide : unit -> unit
  method set_modal : bool -> unit
  method set_title : string -> unit

  method set_transient_for :
    GApplication_and__window_and__window_group.window_t option -> unit

  method show : unit -> unit
  method as_native_dialog : Native_dialog.t
end

class native_dialog : Native_dialog.t -> native_dialog_t
