(* GENERATED CODE - DO NOT EDIT *)
(* Widget: CheckButton *)

type t = [`check_button | `widget] Gobject.obj

val as_widget : t -> Gtk.widget

(** Create a new CheckButton *)
external new_ : unit -> t = "ml_gtk_check_button_new"

(** Create a new CheckButton *)
external new_with_label : string option -> t = "ml_gtk_check_button_new_with_label"

(** Create a new CheckButton *)
external new_with_mnemonic : string option -> t = "ml_gtk_check_button_new_with_mnemonic"

(* Properties *)

(** Sets whether underlines in the label indicate mnemonics.

If @setting is %TRUE, an underscore character in @self's label
indicates a mnemonic accelerator key. This behavior is similar
to [property@Gtk.Label:use-underline]. *)
external set_use_underline : t -> bool -> unit = "ml_gtk_check_button_set_use_underline"

(** Sets the text of @self.

If [property@Gtk.CheckButton:use-underline] is %TRUE, an underscore
in @label is interpreted as mnemonic indicator, see
[method@Gtk.CheckButton.set_use_underline] for details on this behavior. *)
external set_label : t -> string option -> unit = "ml_gtk_check_button_set_label"

(** Sets the `GtkCheckButton` to inconsistent state.

You should turn off the inconsistent state again if the user checks
the check button. This has to be done manually. *)
external set_inconsistent : t -> bool -> unit = "ml_gtk_check_button_set_inconsistent"

(** Adds @self to the group of @group.

In a group of multiple check buttons, only one button can be active
at a time. The behavior of a checkbutton in a group is also commonly
known as a *radio button*.

Setting the group of a check button also changes the css name of the
indicator widget's CSS node to 'radio'.

Setting up groups in a cycle leads to undefined behavior.

Note that the same effect can be achieved via the [iface@Gtk.Actionable]
API, by using the same action with parameter type and state type 's'
for all buttons in the group, and giving each button its own target
value. *)
external set_group : t -> Gtk.widget option -> unit = "ml_gtk_check_button_set_group"

(** Sets the child widget of @button.

Note that by using this API, you take full responsibility for setting
up the proper accessibility label and description information for @button.
Most likely, you'll either set the accessibility label or description
for @button explicitly, or you'll set a labelled-by or described-by
relations from @child to @button. *)
external set_child : t -> Gtk.widget option -> unit = "ml_gtk_check_button_set_child"

(** Changes the check buttons active state. *)
external set_active : t -> bool -> unit = "ml_gtk_check_button_set_active"

(** Returns whether underlines in the label indicate mnemonics. *)
external get_use_underline : t -> bool = "ml_gtk_check_button_get_use_underline"

(** Returns the label of the check button or `NULL` if [property@CheckButton:child] is set. *)
external get_label : t -> string option = "ml_gtk_check_button_get_label"

(** Returns whether the check button is in an inconsistent state. *)
external get_inconsistent : t -> bool = "ml_gtk_check_button_get_inconsistent"

(** Gets the child widget of @button or `NULL` if [property@CheckButton:label] is set. *)
external get_child : t -> Gtk.widget option = "ml_gtk_check_button_get_child"

(** Returns whether the check button is active. *)
external get_active : t -> bool = "ml_gtk_check_button_get_active"

