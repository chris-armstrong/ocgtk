(** [GFileIcon] specifies an icon by pointing to an image file to be used as
    icon.

    Its methods, signals and properties are on {!class-type-file_icon_t}. Its
    full description is under {!section-description}. Its constructors are under
    {!section-constructors}. The functions it is built on are in
    {!Ocgio.Raw.File_icon}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [FileIcon].}

    [GFileIcon] specifies an icon by pointing to an image file to be used as
    icon.

    It implements [Gio.LoadableIcon]. *)
class type file_icon_t = object
  inherit Icon.icon_t
  inherit Loadable_icon.loadable_icon_t

  (** {2:methods Methods} *)

  method get_file : unit -> App_info_cycle_64c425a0.file_t
  (** Gets the [GFile] associated with the given [icon]. *)

  (** {2:conversions Conversions} *)

  method as_file_icon : Raw.File_icon.t
end

class file_icon : Raw.File_icon.t -> file_icon_t
(** Wraps a raw handle of {!Ocgio.Raw.File_icon.t}. *)

(** {1:description Description}

    [GFileIcon] specifies an icon by pointing to an image file to be used as
    icon.

    It implements [Gio.LoadableIcon]. *)

(** {1:constructors Constructors} *)

val new_ : App_info_cycle_64c425a0.file_t -> file_icon_t
(** Creates a new icon for a file. *)
