(* GENERATED CODE - DO NOT EDIT *)
(* Record: ScrollInfo *)

(** The `GtkScrollInfo` can be used to provide more accurate data on how a scroll
operation should be performed.

Scrolling functions usually allow passing a %NULL scroll info which will cause
the default values to be used and just scroll the element into view. *)
type t

(** Create a new ScrollInfo *)
external new_ : unit -> t = "ml_gtk_scroll_info_new"

(** Decreases the reference count of a `GtkScrollInfo` by one.

If the resulting reference count is zero, frees the self. *)
external unref : t -> unit = "ml_gtk_scroll_info_unref"

(** Turns vertical scrolling on or off. *)
external set_enable_vertical : t -> bool -> unit = "ml_gtk_scroll_info_set_enable_vertical"

(** Turns horizontal scrolling on or off. *)
external set_enable_horizontal : t -> bool -> unit = "ml_gtk_scroll_info_set_enable_horizontal"

(** Increases the reference count of a `GtkScrollInfo` by one. *)
external ref : t -> Obj.t = "ml_gtk_scroll_info_ref"

(** Checks if vertical scrolling is enabled. *)
external get_enable_vertical : t -> bool = "ml_gtk_scroll_info_get_enable_vertical"

(** Checks if horizontal scrolling is enabled. *)
external get_enable_horizontal : t -> bool = "ml_gtk_scroll_info_get_enable_horizontal"

