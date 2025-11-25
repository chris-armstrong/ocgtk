(* GENERATED CODE - DO NOT EDIT *)
(* Widget: DrawingArea *)

type t = [`drawing_area | `widget] Gobject.obj

let as_widget (obj : t) : Gtk.widget = Obj.magic obj

(** Create a new DrawingArea *)
external new_ : unit -> t = "ml_gtk_drawing_area_new"

(* Properties *)

(** Sets the desired width of the contents of the drawing area.

Note that because widgets may be allocated larger sizes than they
requested, it is possible that the actual width passed to your draw
function is larger than the width set here. You can use
[method@Gtk.Widget.set_halign] to avoid that.

If the width is set to 0 (the default), the drawing area may disappear. *)
external set_content_width : t -> int -> unit = "ml_gtk_drawing_area_set_content_width"

(** Sets the desired height of the contents of the drawing area.

Note that because widgets may be allocated larger sizes than they
requested, it is possible that the actual height passed to your draw
function is larger than the height set here. You can use
[method@Gtk.Widget.set_valign] to avoid that.

If the height is set to 0 (the default), the drawing area may disappear. *)
external set_content_height : t -> int -> unit = "ml_gtk_drawing_area_set_content_height"

(** Retrieves the content width of the `GtkDrawingArea`. *)
external get_content_width : t -> int = "ml_gtk_drawing_area_get_content_width"

(** Retrieves the content height of the `GtkDrawingArea`. *)
external get_content_height : t -> int = "ml_gtk_drawing_area_get_content_height"

