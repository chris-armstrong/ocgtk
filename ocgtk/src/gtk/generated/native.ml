(* GENERATED CODE - DO NOT EDIT *)
(* Native: Native *)

type t = [`native] Gobject.obj

(* Methods *)
(** Unrealizes a `GtkNative`.

This should only be used by subclasses. *)
external unrealize : t -> unit = "ml_gtk_native_unrealize"

(** Realizes a `GtkNative`.

This should only be used by subclasses. *)
external realize : t -> unit = "ml_gtk_native_realize"

(** Retrieves the surface transform of @self.

This is the translation from @self's surface coordinates into
@self's widget coordinates. *)
external get_surface_transform : t -> float * float = "ml_gtk_native_get_surface_transform"

(** Returns the surface of this `GtkNative`. *)
external get_surface : t -> Ocgtk_gdk.Gdk.Wrappers.Surface.t option = "ml_gtk_native_get_surface"

(** Returns the renderer that is used for this `GtkNative`. *)
external get_renderer : t -> Ocgtk_gsk.Gsk.Wrappers.Renderer.t option = "ml_gtk_native_get_renderer"

