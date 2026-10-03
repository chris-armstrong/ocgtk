(* GENERATED CODE - DO NOT EDIT *)
(* Separator: Separator *)

(** Draws a horizontal or vertical line to separate other widgets.

    An example GtkSeparator

    A [GtkSeparator] can be used to group the widgets within a window. It
    displays a line with a shadow to make it appear sunken into the interface.

    {b CSS nodes}

    [GtkSeparator] has a single CSS node with name separator. The node gets one
    of the .horizontal or .vertical style classes.

    {b Accessibility}

    [GtkSeparator] uses the [Gtk.AccessibleRole.separator] role. *)

type t = [ `separator | `widget | `initially_unowned | `object_ ] Gobject.obj

external new_ : Gtk_enums.orientation -> t = "ml_gtk_separator_new"
(** Create a new Separator *)

(* Methods *)
