(* GENERATED CODE - DO NOT EDIT *)
(* ScrollInfo: ScrollInfo *)

type t = [ `scroll_info ] Gobject.obj
(** The `GtkScrollInfo` can be used to provide more accurate data on how a
    scroll operation should be performed.

    Scrolling functions usually allow passing a %NULL scroll info which will
    cause the default values to be used and just scroll the element into view.
*)

external new_ : unit -> t = "ml_gtk_scroll_info_new"
(** Create a new ScrollInfo *)

(* Methods *)

external unref : t -> unit = "ml_gtk_scroll_info_unref"
(** Decreases the reference count of a `GtkScrollInfo` by one.

    If the resulting reference count is zero, frees the self. *)

external set_enable_vertical : t -> bool -> unit
  = "ml_gtk_scroll_info_set_enable_vertical"
(** Turns vertical scrolling on or off. *)

external set_enable_horizontal : t -> bool -> unit
  = "ml_gtk_scroll_info_set_enable_horizontal"
(** Turns horizontal scrolling on or off. *)

external ref : t -> t = "ml_gtk_scroll_info_ref"
(** Increases the reference count of a `GtkScrollInfo` by one. *)

external get_enable_vertical : t -> bool
  = "ml_gtk_scroll_info_get_enable_vertical"
(** Checks if vertical scrolling is enabled. *)

external get_enable_horizontal : t -> bool
  = "ml_gtk_scroll_info_get_enable_horizontal"
(** Checks if horizontal scrolling is enabled. *)
