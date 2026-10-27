(** Contains the metadata associated with an item in the recently used files
    list.

    Its methods, signals and properties are on {!class-type-recent_info_t}. The
    functions it is built on are in {!Ocgtk.Raw.Recent_info}. *)

(** The methods, signals and properties of a [GtkRecentInfo]. *)
class type recent_info_t = object
  method create_app_info :
    string option -> (Ocgio.App_info.app_info_t option, GError.t) result

  method exists : unit -> bool
  method get_age : unit -> int
  method get_description : unit -> string
  method get_display_name : unit -> string
  method get_gicon : unit -> Ocgio.Icon.icon_t option
  method get_mime_type : unit -> string
  method get_private_hint : unit -> bool
  method get_short_name : unit -> string
  method get_uri : unit -> string
  method get_uri_display : unit -> string option
  method has_application : string -> bool
  method has_group : string -> bool
  method is_local : unit -> bool
  method last_application : unit -> string
  method match_ : Raw.Recent_info.t -> bool
  method ref : unit -> Raw.Recent_info.t
  method as_recent_info : Raw.Recent_info.t
end

class recent_info : Raw.Recent_info.t -> recent_info_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Recent_info.t}. Apply it directly only
    to convert a handle obtained from layer 1: constructors, and methods that
    return a [GtkRecentInfo], give one already wrapped. *)
