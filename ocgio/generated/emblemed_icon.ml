class type emblemed_icon_t = object
  inherit Icon.icon_t

  method add_emblem : Emblem.emblem_t -> unit
  (** Adds [emblem] to the [GList] of [GEmblems]. *)

  method clear_emblems : unit -> unit
  (** Removes all the emblems from [icon]. *)

  method get_emblems : unit -> Emblem.emblem_t list
  (** Gets the list of emblems for the [icon]. *)

  method get_icon : unit -> Icon.icon_t
  (** Gets the main icon for [emblemed]. *)

  method gicon : Icon.icon_t
  method as_emblemed_icon : Raw.Emblemed_icon.t
end

(* High-level class for EmblemedIcon *)
class emblemed_icon (obj : Raw.Emblemed_icon.t) : emblemed_icon_t =
  object (self)
    inherit Icon.icon (Raw.Icon.from_gobject obj)

    method add_emblem : Emblem.emblem_t -> unit =
      fun emblem ->
        let emblem = emblem#as_emblem in
        Raw.Emblemed_icon.add_emblem obj emblem

    method clear_emblems : unit -> unit =
      fun () -> Raw.Emblemed_icon.clear_emblems obj

    method get_emblems : unit -> Emblem.emblem_t list =
      fun () ->
        (List.map (fun ret -> new Emblem.emblem ret))
          (Raw.Emblemed_icon.get_emblems obj)

    method get_icon : unit -> Icon.icon_t =
      fun () -> new Icon.icon (Raw.Emblemed_icon.get_icon obj)

    method gicon = new Icon.icon (Raw.Emblemed_icon.get_gicon obj)
    method as_emblemed_icon = obj
  end

let new_ (icon : Icon.icon_t) (emblem : Emblem.emblem_t option) :
    emblemed_icon_t =
  let icon = icon#as_icon in
  let emblem = Option.map (fun c -> c#as_emblem) emblem in
  let obj_ = Raw.Emblemed_icon.new_ icon emblem in
  new emblemed_icon obj_
