(* Signal class defined in gdrop_target_signals.ml *)

class type drop_target_t = object
    inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.event_controller_t
    inherit Gdrop_target_signals.drop_target_signals
    method get_actions : unit -> Ocgtk_gdk.Gdk.dragaction
    method get_current_drop : unit -> Ocgtk_gdk.Gdk.Drop.drop_t option
    method get_drop : unit -> Ocgtk_gdk.Gdk.Drop.drop_t option
    method get_formats : unit -> Ocgtk_gdk.Gdk.Content_formats.content_formats_t option
    method get_preload : unit -> bool
    method reject : unit -> unit
    method set_actions : Ocgtk_gdk.Gdk.dragaction -> unit
    method set_gtypes : int array option -> Gsize.t -> unit
    method set_preload : bool -> unit
    method as_drop_target : Drop_target.t
end

(* High-level class for DropTarget *)
class drop_target (obj : Drop_target.t) : drop_target_t = object (self)
  inherit GEvent_controller_and__layout_child_and__layout_manager_and__root_and__widget.event_controller (obj :> Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Event_controller.t)
  inherit Gdrop_target_signals.drop_target_signals obj

  method get_actions : unit -> Ocgtk_gdk.Gdk.dragaction =
    fun () ->
      (Drop_target.get_actions obj)

  method get_current_drop : unit -> Ocgtk_gdk.Gdk.Drop.drop_t option =
    fun () ->
      Option.map (fun ret -> new Ocgtk_gdk.Gdk.Drop.drop ret) (Drop_target.get_current_drop obj)

  method get_drop : unit -> Ocgtk_gdk.Gdk.Drop.drop_t option =
    fun () ->
      Option.map (fun ret -> new Ocgtk_gdk.Gdk.Drop.drop ret) (Drop_target.get_drop obj)

  method get_formats : unit -> Ocgtk_gdk.Gdk.Content_formats.content_formats_t option =
    fun () ->
      Option.map (fun ret -> new Ocgtk_gdk.Gdk.Content_formats.content_formats ret) (Drop_target.get_formats obj)

  method get_preload : unit -> bool =
    fun () ->
      (Drop_target.get_preload obj)

  method reject : unit -> unit =
    fun () ->
      (Drop_target.reject obj)

  method set_actions : Ocgtk_gdk.Gdk.dragaction -> unit =
    fun actions ->
      (Drop_target.set_actions obj actions)

  method set_gtypes : int array option -> Gsize.t -> unit =
    fun types n_types ->
      (Drop_target.set_gtypes obj types n_types)

  method set_preload : bool -> unit =
    fun preload ->
      (Drop_target.set_preload obj preload)

    method as_drop_target = obj
end

let new_ (type_ : int) (actions : Ocgtk_gdk.Gdk.dragaction) : drop_target_t =
  let obj_ = Drop_target.new_ type_ actions in
  new drop_target obj_

