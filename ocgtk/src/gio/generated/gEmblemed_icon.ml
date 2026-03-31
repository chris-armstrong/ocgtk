class type emblemed_icon_t = object
    method add_emblem : GEmblem.emblem_t -> unit
    method clear_emblems : unit -> unit
    method get_emblems : unit -> Emblem.t list
    method get_icon : unit -> GIcon.icon_t
    method as_emblemed_icon : Emblemed_icon.t
end

(* High-level class for EmblemedIcon *)
class emblemed_icon (obj : Emblemed_icon.t) : emblemed_icon_t = object (self)

  method add_emblem : GEmblem.emblem_t -> unit =
    fun emblem ->
      let emblem = emblem#as_emblem in
      (Emblemed_icon.add_emblem obj emblem)

  method clear_emblems : unit -> unit =
    fun () ->
      (Emblemed_icon.clear_emblems obj)

  method get_emblems : unit -> Emblem.t list =
    fun () ->
      (Emblemed_icon.get_emblems obj)

  method get_icon : unit -> GIcon.icon_t =
    fun () ->
      new  GIcon.icon(Emblemed_icon.get_icon obj)

    method as_emblemed_icon = obj
end

let new_ (icon : GIcon.icon_t) (emblem : GEmblem.emblem_t option) : emblemed_icon_t =
  let icon = icon#as_icon in
  let emblem = Option.map (fun c -> c#as_emblem) emblem in
  let obj_ = Emblemed_icon.new_ icon emblem in
  new emblemed_icon obj_

