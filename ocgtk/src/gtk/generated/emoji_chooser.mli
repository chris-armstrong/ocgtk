(* GENERATED CODE - DO NOT EDIT *)
(* EmojiChooser: EmojiChooser *)

(** Used by text widgets to let users insert Emoji characters.

    An example GtkEmojiChooser

    [GtkEmojiChooser] emits the [Gtk.EmojiChooser::emoji-picked] signal when an
    Emoji is selected.

    {b Shortcuts and Gestures}

    [GtkEmojiChooser] supports the following keyboard shortcuts:

    - <kbd>Ctrl</kbd>+<kbd>N</kbd> scrolls th the next section.
    - <kbd>Ctrl</kbd>+<kbd>P</kbd> scrolls th the previous section.

    {b Actions}

    [GtkEmojiChooser] defines a set of built-in actions:

    - [scroll.section] scrolls to the next or previous section.

    {b CSS nodes}

    {[
    popover
    ├── box.emoji-searchbar
    │   ╰── entry.search
    ╰── box.emoji-toolbar
        ├── button.image-button.emoji-section
        ├── ...
        ╰── button.image-button.emoji-section
    ]}

    Every [GtkEmojiChooser] consists of a main node called popover. The contents
    of the popover are largely implementation defined and supposed to inherit
    general styles. The top searchbar used to search emoji and gets the
    .emoji-searchbar style class itself. The bottom toolbar used to switch
    between different emoji categories consists of buttons with the
    .emoji-section style class and gets the .emoji-toolbar style class itself.
*)

type t =
  [ `emoji_chooser | `popover | `widget | `initially_unowned | `object_ ]
  Gobject.obj

external new_ : unit -> t = "ml_gtk_emoji_chooser_new"
(** Create a new EmojiChooser *)

(* Methods *)
val on_emoji_picked :
  ?after:bool ->
  t ->
  callback:(text:string -> unit) ->
  Gobject.Signal.handler_id
