(** [GFileIcon] specifies an icon by pointing to an image file to be used as
    icon.

    It implements [Gio.LoadableIcon].

    Its methods, signals and properties are on {!class-type-file_icon_t}. The
    functions it is built on are in {!Ocgio.Raw.File_icon}. *)

(** The methods, signals and properties of a [GFileIcon]. *)
class type file_icon_t = object
  inherit Icon.icon_t
  inherit Loadable_icon.loadable_icon_t
  method get_file : unit -> App_info_cycle_64c425a0.file_t
  method as_file_icon : Raw.File_icon.t
end

class file_icon : Raw.File_icon.t -> file_icon_t
(** Wraps a layer 1 handle, {!Ocgio.Raw.File_icon.t}. Apply it directly only to
    convert a handle obtained from layer 1: constructors, and methods that
    return a [GFileIcon], give one already wrapped. *)

val new_ : App_info_cycle_64c425a0.file_t -> file_icon_t
