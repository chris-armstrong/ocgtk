(* GENERATED CODE - DO NOT EDIT *)
(* Cell renderer: CellRendererPixbuf *)

type t = [`cell_renderer_pixbuf | `cell_renderer | `initially_unowned] Gobject.obj

let as_cell_renderer (obj : t) : Cell_renderer.t = Obj.magic obj

(** Create a new CellRendererPixbuf *)
external new_ : unit -> t = "ml_gtk_cell_renderer_pixbuf_new"

(* Methods *)
(* Properties *)

(** Get property: icon-name *)
external get_icon_name : t -> string = "ml_gtk_cell_renderer_pixbuf_get_icon_name"

(** Set property: icon-name *)
external set_icon_name : t -> string -> unit = "ml_gtk_cell_renderer_pixbuf_set_icon_name"

(** Get property: icon-size *)
external get_icon_size : t -> Gtk_enums.iconsize = "ml_gtk_cell_renderer_pixbuf_get_icon_size"

(** Set property: icon-size *)
external set_icon_size : t -> Gtk_enums.iconsize -> unit = "ml_gtk_cell_renderer_pixbuf_set_icon_size"

