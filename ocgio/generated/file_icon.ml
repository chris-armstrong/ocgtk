class type file_icon_t = object
  inherit Icon.icon_t
  inherit Loadable_icon.loadable_icon_t

  (** {2:methods Methods} *)

  method get_file : unit -> File.file_t
  (** Gets the [GFile] associated with the given [icon]. *)

  (** {2:conversions Conversions} *)

  method as_file_icon : Raw.File_icon.t
end

(* High-level class for FileIcon *)
class file_icon (obj : Raw.File_icon.t) : file_icon_t =
  object (self)
    inherit Icon.icon (Raw.Icon.from_gobject obj)
    inherit Loadable_icon.loadable_icon (Raw.Loadable_icon.from_gobject obj)

    method get_file : unit -> File.file_t =
      fun () -> new File.file (Raw.File_icon.get_file obj)

    method as_file_icon = obj
  end

let new_ (file : File.file_t) : file_icon_t =
  let file = file#as_file in
  let obj_ = Raw.File_icon.new_ file in
  new file_icon obj_
