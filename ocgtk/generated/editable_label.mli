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
    [Gtk.Text].

    Its methods, signals and properties are on {!class-type-editable_label_t}.
    Its constructors are under {!section-constructors}. The functions it is
    built on are in {!Ocgtk.Raw.Editable_label}. *)

(** The methods, signals and properties of a [EditableLabel]. *)
class type editable_label_t = object
  inherit
    Event_controller_and__layout_child_and__layout_manager_and__root_and__tooltip_and__widget
    .widget_t

  inherit Editable.editable_t

  method get_editing : unit -> bool
  (** Returns whether the label is currently in “editing mode”. *)

  method start_editing : unit -> unit
  (** Switches the label into “editing mode”. *)

  method stop_editing : bool -> unit
  (** Switches the label out of “editing mode”.

      If [commit] is [TRUE], the resulting text is kept as the
      [Gtk.Editable:text] property value, otherwise the resulting text is
      discarded and the label will keep its previous [Gtk.Editable:text]
      property value. *)

  method as_editable_label : Raw.Editable_label.t
end

class editable_label : Raw.Editable_label.t -> editable_label_t
(** Wraps a raw handle of {!Ocgtk.Raw.Editable_label.t}. *)

(** {2:constructors Constructors} *)

val new_ : string -> editable_label_t
(** Creates a new [GtkEditableLabel] widget. *)
