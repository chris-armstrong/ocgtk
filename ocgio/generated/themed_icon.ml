class type themed_icon_t = object
  inherit Icon.icon_t

  method append_name : string -> unit
  (** Append a name to the list of icons from within [icon].

      Note that doing so invalidates the hash computed by prior calls to
      g_icon_hash(). *)

  method get_names : unit -> string array
  (** Gets the names of icons from within [icon]. *)

  method prepend_name : string -> unit
  (** Prepend a name to the list of icons from within [icon].

      Note that doing so invalidates the hash computed by prior calls to
      g_icon_hash(). *)

  method use_default_fallbacks : bool
  method as_themed_icon : Raw.Themed_icon.t
end

(* High-level class for ThemedIcon *)
class themed_icon (obj : Raw.Themed_icon.t) : themed_icon_t =
  object (self)
    inherit Icon.icon (Raw.Icon.from_gobject obj)

    method append_name : string -> unit =
      fun iconname -> Raw.Themed_icon.append_name obj iconname

    method get_names : unit -> string array =
      fun () -> Raw.Themed_icon.get_names obj

    method prepend_name : string -> unit =
      fun iconname -> Raw.Themed_icon.prepend_name obj iconname

    method use_default_fallbacks = Raw.Themed_icon.get_use_default_fallbacks obj
    method as_themed_icon = obj
  end

let new_ (iconname : string) : themed_icon_t =
  let obj_ = Raw.Themed_icon.new_ iconname in
  new themed_icon obj_

let new_from_names (iconnames : string array) (len : int) : themed_icon_t =
  let obj_ = Raw.Themed_icon.new_from_names iconnames len in
  new themed_icon obj_

let new_with_default_fallbacks (iconname : string) : themed_icon_t =
  let obj_ = Raw.Themed_icon.new_with_default_fallbacks iconname in
  new themed_icon obj_
