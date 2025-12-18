(* GENERATED CODE - DO NOT EDIT *)
(* Widget: EditableLabel *)

type t = [`editable_label | `widget | `initially_unowned] Gobject.obj

let as_widget (obj : t) : Event_controller_and__layout_child_and__layout_manager_and__root_and__widget.Widget.t = Obj.magic obj

(** Create a new EditableLabel *)
external new_ : string -> t = "ml_gtk_editable_label_new"

(* Properties *)

(** Get property: editing *)
external get_editing : t -> bool = "ml_gtk_editable_label_get_editing"

(** Set property: editing *)
external set_editing : t -> bool -> unit = "ml_gtk_editable_label_set_editing"

(** Switches the label out of “editing mode”.

If @commit is %TRUE, the resulting text is kept as the
[property@Gtk.Editable:text] property value, otherwise the
resulting text is discarded and the label will keep its
previous [property@Gtk.Editable:text] property value. *)
external stop_editing : t -> bool -> unit = "ml_gtk_editable_label_stop_editing"

(** Switches the label into “editing mode”. *)
external start_editing : t -> unit = "ml_gtk_editable_label_start_editing"

