(* GENERATED CODE - DO NOT EDIT *)
(* Widget: Scrollbar *)

type t = [`scrollbar | `widget] Gobject.obj

let as_widget (obj : t) : Gtk.widget = Obj.magic obj

(** Create a new Scrollbar *)
external new_ : Gtk_enums.orientation -> Gtk.widget option -> t = "ml_gtk_scrollbar_new"

(* Properties *)

(** Makes the scrollbar use the given adjustment. *)
external set_adjustment : t -> Gtk.widget option -> unit = "ml_gtk_scrollbar_set_adjustment"

(** Returns the scrollbar's adjustment. *)
external get_adjustment : t -> Gtk.widget = "ml_gtk_scrollbar_get_adjustment"

