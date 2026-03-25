class type file_chooser_native_t = object
    inherit GNative_dialog.native_dialog_t
    method get_accept_label : unit -> string option
    method get_cancel_label : unit -> string option
    method set_accept_label : string option -> unit
    method set_cancel_label : string option -> unit
    method as_file_chooser_native : File_chooser_native.t
end

(* High-level class for FileChooserNative *)
class file_chooser_native (obj : File_chooser_native.t) : file_chooser_native_t = object (self)
  inherit GNative_dialog.native_dialog (obj :> Native_dialog.t)

  method get_accept_label : unit -> string option =
    fun () ->
      (File_chooser_native.get_accept_label obj)

  method get_cancel_label : unit -> string option =
    fun () ->
      (File_chooser_native.get_cancel_label obj)

  method set_accept_label : string option -> unit =
    fun accept_label ->
      (File_chooser_native.set_accept_label obj accept_label)

  method set_cancel_label : string option -> unit =
    fun cancel_label ->
      (File_chooser_native.set_cancel_label obj cancel_label)

    method as_file_chooser_native = obj
end

let new_ (title : string option) (parent : GApplication_and__window_and__window_group.window_t option) (action : Gtk_enums.filechooseraction) (accept_label : string option) (cancel_label : string option) : file_chooser_native_t =
  let parent = Option.map (fun c -> c#as_window) parent in
  let obj_ = File_chooser_native.new_ title parent action accept_label cancel_label in
  new file_chooser_native obj_

