(* Signal class defined in gnative_dialog_signals.ml *)

(* High-level class for NativeDialog *)
class native_dialog (obj : Native_dialog.t) = object (self)
  inherit Gnative_dialog_signals.native_dialog_signals obj

  method destroy : unit -> unit = fun () -> (Native_dialog.destroy obj )

  method get_modal : unit -> bool = fun () -> (Native_dialog.get_modal obj )

  method get_title : unit -> string option = fun () -> (Native_dialog.get_title obj )

  method get_transient_for : unit -> GApplication_and__window_and__window_group.window option = fun () -> Option.map (fun ret -> new GApplication_and__window_and__window_group.window ret) (Native_dialog.get_transient_for obj )

  method get_visible : unit -> bool = fun () -> (Native_dialog.get_visible obj )

  method hide : unit -> unit = fun () -> (Native_dialog.hide obj )

  method set_modal : bool -> unit = fun modal -> (Native_dialog.set_modal obj modal)

  method set_title : string -> unit = fun title -> (Native_dialog.set_title obj title)

  method set_transient_for : 'p1. (#GApplication_and__window_and__window_group.window as 'p1) option -> unit =
    fun parent ->
      let parent = Option.map (fun (c) -> c#as_window) parent in
      (Native_dialog.set_transient_for obj parent)

  method show : unit -> unit = fun () -> (Native_dialog.show obj )

    method as_native_dialog = obj
end

