class type file_chooser_native_t = object
  inherit Native_dialog.native_dialog_t
  inherit File_chooser.file_chooser_t
  method get_accept_label : unit -> string option
  method get_cancel_label : unit -> string option
  method set_accept_label : string option -> unit
  method set_cancel_label : string option -> unit
  method as_file_chooser_native : Raw.File_chooser_native.t
end

(* High-level class for FileChooserNative *)
class file_chooser_native (obj : Raw.File_chooser_native.t) :
  file_chooser_native_t =
  object (self)
    inherit Native_dialog.native_dialog (obj :> Raw.Native_dialog.t)
    inherit File_chooser.file_chooser (Raw.File_chooser.from_gobject obj)

    method get_accept_label : unit -> string option =
      fun () -> Raw.File_chooser_native.get_accept_label obj

    method get_cancel_label : unit -> string option =
      fun () -> Raw.File_chooser_native.get_cancel_label obj

    method set_accept_label : string option -> unit =
      fun accept_label ->
        Raw.File_chooser_native.set_accept_label obj accept_label

    method set_cancel_label : string option -> unit =
      fun cancel_label ->
        Raw.File_chooser_native.set_cancel_label obj cancel_label

    method as_file_chooser_native = obj
  end

let new_ (title : string option)
    (parent : Application_and__window_and__window_group.window_t option)
    (action : Enums.filechooseraction) (accept_label : string option)
    (cancel_label : string option) : file_chooser_native_t =
  let parent = Option.map (fun c -> c#as_window) parent in
  let obj_ =
    Raw.File_chooser_native.new_ title parent action accept_label cancel_label
  in
  new file_chooser_native obj_
