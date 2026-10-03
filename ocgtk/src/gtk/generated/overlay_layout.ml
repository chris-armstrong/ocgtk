(* GENERATED CODE - DO NOT EDIT *)
(* OverlayLayout: OverlayLayout *)

(** The layout manager used by [Gtk.Overlay].

    It places widgets as overlays on top of the main child.

    This is not a reusable layout manager, since it expects its widget to be a
    [GtkOverlay]. It is only listed here so that its layout properties get
    documented. *)

type t = [ `overlay_layout | `layout_manager | `object_ ] Gobject.obj

external new_ : unit -> t = "ml_gtk_overlay_layout_new"
(** Create a new OverlayLayout *)

(* Methods *)
