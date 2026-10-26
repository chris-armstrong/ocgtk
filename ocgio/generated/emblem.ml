class type emblem_t = object
  inherit Icon.icon_t
  method get_icon : unit -> Icon.icon_t
  method get_origin : unit -> Enums.emblemorigin
  method as_emblem : Raw.Emblem.t
end

(* High-level class for Emblem *)
class emblem (obj : Raw.Emblem.t) : emblem_t =
  object (self)
    inherit Icon.icon (Raw.Icon.from_gobject obj)

    method get_icon : unit -> Icon.icon_t =
      fun () -> new Icon.icon (Raw.Emblem.get_icon obj)

    method get_origin : unit -> Enums.emblemorigin =
      fun () -> Raw.Emblem.get_origin obj

    method as_emblem = obj
  end

let new_ (icon : Icon.icon_t) : emblem_t =
  let icon = icon#as_icon in
  let obj_ = Raw.Emblem.new_ icon in
  new emblem obj_

let new_with_origin (icon : Icon.icon_t) (origin : Enums.emblemorigin) :
    emblem_t =
  let icon = icon#as_icon in
  let obj_ = Raw.Emblem.new_with_origin icon origin in
  new emblem obj_
