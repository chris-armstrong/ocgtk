(** GTK4 Snapshot Rendering API

    GtkSnapshot is the new rendering system in GTK4, replacing the old
    draw signal. Instead of receiving a Cairo context directly, widgets
    now receive a GtkSnapshot object and build a render tree.

    Key concepts:
    - Snapshot: Records rendering operations into a render node tree
    - Cairo Compatibility: Use append_cairo for backward compatibility
    - Render Nodes: Immutable scene graph nodes *)

type t
(** Snapshot object *)

(** {2 Cairo Integration} *)

val append_cairo : t -> width:float -> height:float -> Cairo.context
(** Append a Cairo drawing operation to the snapshot.
    Returns a Cairo context to draw with.

    This provides backward compatibility for code that uses Cairo directly. *)

(** {2 Basic Rendering} *)

val append_color : t -> color:Gdk.RGBA.t -> bounds:Graphene.Rect.t -> unit
(** Append a colored rectangle to the snapshot *)

(** {2 Transformations} *)

val save : t -> unit
(** Save the current transformation state *)

val restore : t -> unit
(** Restore the previously saved transformation state *)

val translate : t -> point:Graphene.Point.t -> unit
(** Translate the snapshot *)

val scale : t -> factor_x:float -> factor_y:float -> unit
(** Scale the snapshot *)

val rotate : t -> angle:float -> unit
(** Rotate the snapshot (angle in degrees) *)

(** {2 Clipping} *)

val push_clip : t -> bounds:Graphene.Rect.t -> unit
(** Push a rectangular clip region *)

val pop : t -> unit
(** Pop the clip region *)

(** {2 Opacity} *)

val push_opacity : t -> opacity:float -> unit
(** Push an opacity modifier (0.0 = transparent, 1.0 = opaque) *)
