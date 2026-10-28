(** [GFileIcon] specifies an icon by pointing to an image file to be used as
    icon.

    It implements [Gio.LoadableIcon].

    Its methods, signals and properties are on {!class-type-file_icon_t}. Its
    constructors are under {!section-constructors}. The functions it is built on
    are in {!Ocgio.Raw.File_icon}. *)

(** The methods, signals and properties of a [FileIcon]. *)
class type file_icon_t = object
  inherit Icon.icon_t
  inherit Loadable_icon.loadable_icon_t

  method get_file : unit -> App_info_cycle_64c425a0.file_t
  (** Gets the [GFile] associated with the given [icon]. *)

  method as_file_icon : Raw.File_icon.t
end

class file_icon : Raw.File_icon.t -> file_icon_t
(** Wraps a raw handle of {!Ocgio.Raw.File_icon.t}. *)

(** {2:constructors Constructors} *)

val new_ : App_info_cycle_64c425a0.file_t -> file_icon_t
(** Creates a new icon for a file. *)
