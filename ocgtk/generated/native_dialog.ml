class type native_dialog_t = object
  method on_response :
    ?after:bool ->
    callback:(response_id:int -> unit) ->
    unit ->
    Gobject.Signal.handler_id

  method destroy : unit -> unit
  method get_modal : unit -> bool
  method get_title : unit -> string option

  method get_transient_for :
    unit -> Application_and__window_and__window_group.window_t option

  method get_visible : unit -> bool
  method hide : unit -> unit
  method set_modal : bool -> unit
  method set_title : string -> unit

  method set_transient_for :
    Application_and__window_and__window_group.window_t option -> unit

  method show : unit -> unit
  method as_native_dialog : Raw.Native_dialog.t
end

(* High-level class for NativeDialog *)
class native_dialog (obj : Raw.Native_dialog.t) : native_dialog_t =
  object (self)
    method on_response ?(after = false) ~callback () =
      Raw.Native_dialog.on_response ~after self#as_native_dialog ~callback

    method destroy : unit -> unit = fun () -> Raw.Native_dialog.destroy obj
    method get_modal : unit -> bool = fun () -> Raw.Native_dialog.get_modal obj

    method get_title : unit -> string option =
      fun () -> Raw.Native_dialog.get_title obj

    method get_transient_for :
        unit -> Application_and__window_and__window_group.window_t option =
      fun () ->
        Option.map
          (fun ret -> new Application_and__window_and__window_group.window ret)
          (Raw.Native_dialog.get_transient_for obj)

    method get_visible : unit -> bool =
      fun () -> Raw.Native_dialog.get_visible obj

    method hide : unit -> unit = fun () -> Raw.Native_dialog.hide obj

    method set_modal : bool -> unit =
      fun modal -> Raw.Native_dialog.set_modal obj modal

    method set_title : string -> unit =
      fun title -> Raw.Native_dialog.set_title obj title

    method set_transient_for :
        Application_and__window_and__window_group.window_t option -> unit =
      fun parent ->
        let parent = Option.map (fun c -> c#as_window) parent in
        Raw.Native_dialog.set_transient_for obj parent

    method show : unit -> unit = fun () -> Raw.Native_dialog.show obj
    method as_native_dialog = obj
  end
