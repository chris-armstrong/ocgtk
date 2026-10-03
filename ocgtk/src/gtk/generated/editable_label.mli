(* GENERATED CODE - DO NOT EDIT *)
(* EditableLabel: EditableLabel *)

type t =
  [ `editable_label | `widget | `initially_unowned | `object_ ] Gobject.obj
(** Allows users to edit the displayed text by switching to an “edit mode”.

    An example GtkEditableLabel

    [GtkEditableLabel] does not have API of its own, but it implements the
    [Gtk.Editable] interface.

    The default bindings for activating the edit mode is to click or press the
    Enter key. The default bindings for leaving the edit mode are the Enter key
    (to save the results) or the Escape key (to cancel the editing).

    {b Shortcuts and Gestures}

    [GtkEditableLabel] supports the following keyboard shortcuts:

    - <kbd>Enter</kbd> starts editing.
    - <kbd>Escape</kbd> stops editing.

    {b Actions}

    [GtkEditableLabel] defines a set of built-in actions:

    - [editing.starts] switches the widget into editing mode.
    - [editing.stop] switches the widget out of editing mode.

    {b CSS nodes}

    {[
    editablelabel[.editing]
    ╰── stack
        ├── label
        ╰── text
    ]}

    [GtkEditableLabel] has a main node with the name editablelabel. When the
    entry is in editing mode, it gets the .editing style class.

    For all the subnodes added to the text node in various situations, see
    [Gtk.Text]. *)

external new_ : string -> t = "ml_gtk_editable_label_new"
(** Create a new EditableLabel *)

(* Methods *)

external stop_editing : t -> bool -> unit = "ml_gtk_editable_label_stop_editing"
(** Switches the label out of “editing mode”.

    If [commit] is [TRUE], the resulting text is kept as the [Gtk.Editable:text]
    property value, otherwise the resulting text is discarded and the label will
    keep its previous [Gtk.Editable:text] property value. *)

external start_editing : t -> unit = "ml_gtk_editable_label_start_editing"
(** Switches the label into “editing mode”. *)

external get_editing : t -> bool = "ml_gtk_editable_label_get_editing"
(** Returns whether the label is currently in “editing mode”. *)

(* Properties *)
