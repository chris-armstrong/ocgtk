(* Signal class defined in gnative_dialog_signals.ml *)

(* High-level class for NativeDialog *)
class native_dialog (obj : Native_dialog.t) = object (self)
  inherit Gnative_dialog_signals.native_dialog_signals obj

  method modal = Native_dialog.get_modal obj
  method set_modal v = Native_dialog.set_modal obj v

  method title = Native_dialog.get_title obj
  method set_title v = Native_dialog.set_title obj v

  method visible = Native_dialog.get_visible obj
  method set_visible v = Native_dialog.set_visible obj v

  method destroy : unit -> unit = fun () -> (Native_dialog.destroy obj )

  method get_transient_for : unit -> GApplication_and__window_and__window_group.window option = fun () -> Option.map (fun ret -> new GApplication_and__window_and__window_group.window ret) (Native_dialog.get_transient_for obj )

  method hide : unit -> unit = fun () -> (Native_dialog.hide obj )

  method set_transient_for : 'p1. (#GApplication_and__window_and__window_group.window as 'p1) option -> unit =
    fun parent ->
      let parent = Option.map (fun (c) -> c#as_window) parent in
      (Native_dialog.set_transient_for obj parent)

  method show : unit -> unit = fun () -> (Native_dialog.show obj )

    method as_native_dialog = obj
end

