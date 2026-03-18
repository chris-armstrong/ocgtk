(* Signal class defined in gdrop_target_signals.ml *)

(* High-level class for DropTarget *)
class drop_target (obj : Drop_target.t) = object (self)
  inherit Gdrop_target_signals.drop_target_signals obj

  method get_actions : unit -> Ocgtk_gdk.Gdk.dragaction =
    fun () ->
      (Drop_target.get_actions obj)

  method get_current_drop : unit -> Ocgtk_gdk.Gdk.drop option =
    fun () ->
      Option.map (fun ret -> new Ocgtk_gdk.Gdk.drop ret) (Drop_target.get_current_drop obj)

  method get_drop : unit -> Ocgtk_gdk.Gdk.drop option =
    fun () ->
      Option.map (fun ret -> new Ocgtk_gdk.Gdk.drop ret) (Drop_target.get_drop obj)

  method get_formats : unit -> Ocgtk_gdk.Gdk.content_formats option =
    fun () ->
      Option.map (fun ret -> new Ocgtk_gdk.Gdk.content_formats ret) (Drop_target.get_formats obj)

  method get_preload : unit -> bool =
    fun () ->
      (Drop_target.get_preload obj)

  method reject : unit -> unit =
    fun () ->
      (Drop_target.reject obj)

  method set_actions : Ocgtk_gdk.Gdk.dragaction -> unit =
    fun actions ->
      (Drop_target.set_actions obj actions)

  method set_preload : bool -> unit =
    fun preload ->
      (Drop_target.set_preload obj preload)

    method as_drop_target = obj
end

