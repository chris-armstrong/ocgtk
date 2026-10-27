[@@@ocaml.text
"A [GtkComboBoxText] is a simple variant of [GtkComboBox] for text-only\n\
 use cases.\n\n\
 An example GtkComboBoxText\n\n\
 [GtkComboBoxText] hides the model-view complexity of [GtkComboBox].\n\n\
 To create a [GtkComboBoxText], use [Gtk.ComboBoxText.new] or\n\
 [Gtk.ComboBoxText.new_with_entry].\n\n\
 You can add items to a [GtkComboBoxText] with\n\
 [Gtk.ComboBoxText.append_text],\n\
 [Gtk.ComboBoxText.insert_text] or\n\
 [Gtk.ComboBoxText.prepend_text] and remove options with\n\
 [Gtk.ComboBoxText.remove].\n\n\
 If the [GtkComboBoxText] contains an entry (via the\n\
 [Gtk.ComboBox:has-entry] property), its contents can be retrieved\n\
 using [Gtk.ComboBoxText.get_active_text].\n\n\
 You should not call [Gtk.ComboBox.set_model] or attempt to pack more\n\
 cells into this combo box via its [Gtk.CellLayout] interface.\n\n\
 {b GtkComboBoxText as GtkBuildable}\n\n\
 The [GtkComboBoxText] implementation of the [GtkBuildable] interface supports\n\
 adding items directly using the [<items>] element and specifying [<item>]\n\
 elements for each item. Each [<item>] element can specify the “id”\n\
 corresponding to the appended text and also supports the regular\n\
 translation attributes “translatable”, “context” and “comments”.\n\n\
 Here is a UI definition fragment specifying [GtkComboBoxText] items:\n\n\
 {[\n\
 <object class=\"GtkComboBoxText\">\n\
\  <items>\n\
\    <item translatable=\"yes\" id=\"factory\">Factory</item>\n\
\    <item translatable=\"yes\" id=\"home\">Home</item>\n\
\    <item translatable=\"yes\" id=\"subway\">Subway</item>\n\
\  </items>\n\
 </object>\n\
 ]}\n\n\
 {b CSS nodes}\n\n\
 {[\n\
 combobox\n\
 ╰── box.linked\n\
\    ├── entry.combo\n\
\    ├── button.combo\n\
\    ╰── window.popup\n\
 ]}\n\n\
 [GtkComboBoxText] has a single CSS node with name combobox. It adds\n\
 the style class .combo to the main CSS nodes of its entry and button\n\
 children, and the .linked class to the node of its internal box.\n\n\
 Its methods, signals and properties are on {!class-type-combo_box_text_t}. \
 The functions it is built on are in {!Ocgtk.Raw.Combo_box_text}."]

(** The methods, signals and properties of a [GtkComboBoxText]. *)
class type combo_box_text_t = object
  inherit Combo_box.combo_box_t
  method append : string option -> string -> unit
  method append_text : string -> unit
  method get_active_text : unit -> string option
  method insert : int -> string option -> string -> unit
  method insert_text : int -> string -> unit
  method prepend : string option -> string -> unit
  method prepend_text : string -> unit
  method remove : int -> unit
  method remove_all : unit -> unit
  method as_combo_box_text : Raw.Combo_box_text.t
end

class combo_box_text : Raw.Combo_box_text.t -> combo_box_text_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Combo_box_text.t}. Apply it directly
    only to convert a handle obtained from layer 1: constructors, and methods
    that return a [GtkComboBoxText], give one already wrapped. *)

val new_ : unit -> combo_box_text_t
val new_with_entry : unit -> combo_box_text_t
