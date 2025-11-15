(** GTK4 Snapshot Rendering API *)

type t
(** Snapshot object (opaque pointer from C) *)

(** {2 External C bindings} *)

external append_cairo : t -> width:float -> height:float -> Cairo.context
  = "ml_gtk_snapshot_append_cairo"

external append_color : t -> color:Gdk.RGBA.t -> bounds:Graphene.Rect.t -> unit
  = "ml_gtk_snapshot_append_color"

external save : t -> unit = "ml_gtk_snapshot_save"
external restore : t -> unit = "ml_gtk_snapshot_restore"

external translate : t -> point:Graphene.Point.t -> unit
  = "ml_gtk_snapshot_translate"

external scale : t -> factor_x:float -> factor_y:float -> unit
  = "ml_gtk_snapshot_scale"

external rotate : t -> angle:float -> unit
  = "ml_gtk_snapshot_rotate"

external push_clip : t -> bounds:Graphene.Rect.t -> unit
  = "ml_gtk_snapshot_push_clip"

external pop : t -> unit = "ml_gtk_snapshot_pop"

external push_opacity : t -> opacity:float -> unit
  = "ml_gtk_snapshot_push_opacity"
