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

(* High-level class for NativeDialog *)
class native_dialog (obj : Native_dialog.t) : native_dialog_t =
  object (self)
    method on_response ~callback =
      Native_dialog.on_response self#as_native_dialog ~callback

    method destroy : unit -> unit = fun () -> Native_dialog.destroy obj
    method get_modal : unit -> bool = fun () -> Native_dialog.get_modal obj

    method get_title : unit -> string option =
      fun () -> Native_dialog.get_title obj

    method get_transient_for :
        unit -> GApplication_and__window_and__window_group.window_t option =
      fun () ->
        Option.map
          (fun ret -> new GApplication_and__window_and__window_group.window ret)
          (Native_dialog.get_transient_for obj)

    method get_visible : unit -> bool = fun () -> Native_dialog.get_visible obj
    method hide : unit -> unit = fun () -> Native_dialog.hide obj

    method set_modal : bool -> unit =
      fun modal -> Native_dialog.set_modal obj modal

    method set_title : string -> unit =
      fun title -> Native_dialog.set_title obj title

    method set_transient_for :
        GApplication_and__window_and__window_group.window_t option -> unit =
      fun parent ->
        let parent = Option.map (fun c -> c#as_window) parent in
        Native_dialog.set_transient_for obj parent

    method show : unit -> unit = fun () -> Native_dialog.show obj
    method as_native_dialog = obj
  end
