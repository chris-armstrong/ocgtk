(* Signal class defined in gdrop_target_async_signals.ml *)

(* High-level class for DropTargetAsync *)
class drop_target_async (obj : Drop_target_async.t) = object (self)
  inherit Gdrop_target_async_signals.drop_target_async_signals obj

  method get_actions : unit -> Ocgtk_gdk.Gdk.dragaction =
    fun () ->
      (Drop_target_async.get_actions obj)

  method get_formats : unit -> Ocgtk_gdk.Gdk.content_formats option =
    fun () ->
      Option.map (fun ret -> new Ocgtk_gdk.Gdk.content_formats ret) (Drop_target_async.get_formats obj)

  method reject_drop : 'p1. (#Ocgtk_gdk.Gdk.drop as 'p1) -> unit =
    fun drop ->
      let drop = drop#as_drop in
      (Drop_target_async.reject_drop obj drop)

  method set_actions : Ocgtk_gdk.Gdk.dragaction -> unit =
    fun actions ->
      (Drop_target_async.set_actions obj actions)

  method set_formats : 'p1. (#Ocgtk_gdk.Gdk.content_formats as 'p1) option -> unit =
    fun formats ->
      let formats = Option.map (fun (c) -> c#as_content_formats) formats in
      (Drop_target_async.set_formats obj formats)

    method as_drop_target_async = obj
end

