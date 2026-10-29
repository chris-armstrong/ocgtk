(* GENERATED CODE - DO NOT EDIT *)
(* TextChildAnchor: TextChildAnchor *)

(** Marks a spot in a [GtkTextBuffer] where child widgets can be “anchored”.

    The anchor can have multiple widgets anchored, to allow for multiple views.

    The class built on this module is in {!Ocgtk.Text_child_anchor}. *)

type t = [ `text_child_anchor | `object_ ] Gobject.obj

external gtype : unit -> Gobject.Type.t = "ml_gtk_text_child_anchor_get_type"

external new_ : unit -> t = "ml_gtk_text_child_anchor_new"
(** Creates a new [GtkTextChildAnchor].

    Usually you would then insert it into a [GtkTextBuffer] with
    {{!Ocgtk.Raw.Text_buffer.val-insert_child_anchor}[Gtk.TextBuffer.insert_child_anchor]}.
    To perform the creation and insertion in one step, use the convenience
    function
    {{!Ocgtk.Raw.Text_buffer.val-create_child_anchor}[Gtk.TextBuffer.create_child_anchor]}.
*)

external new_with_replacement : string -> t
  = "ml_gtk_text_child_anchor_new_with_replacement"
(** Creates a new [GtkTextChildAnchor] with the given replacement character.

    Usually you would then insert it into a [GtkTextBuffer] with
    {{!Ocgtk.Raw.Text_buffer.val-insert_child_anchor}[Gtk.TextBuffer.insert_child_anchor]}.
*)

(* Methods *)

external get_widgets :
  t ->
  Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
  .Widget
  .t
  array
  * int = "ml_gtk_text_child_anchor_get_widgets"
(** Gets a list of all widgets anchored at this child anchor.

    The order in which the widgets are returned is not defined. *)

external get_deleted : t -> bool = "ml_gtk_text_child_anchor_get_deleted"
(** Determines whether a child anchor has been deleted from the buffer.

    Keep in mind that the child anchor will be unreferenced when removed from
    the buffer, so you need to hold your own reference (with g_object_ref()) if
    you plan to use this function — otherwise all deleted child anchors will
    also be finalized. *)
