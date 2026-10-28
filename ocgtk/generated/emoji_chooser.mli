(** Used by text widgets to let users insert Emoji characters.

    Its methods, signals and properties are on {!class-type-emoji_chooser_t}.
    Its full description is under {!section-description}. Its constructors are
    under {!section-constructors}. The functions it is built on are in
    {!Ocgtk.Raw.Emoji_chooser}. *)

(** {1:class Class} *)

(** {b The methods, signals and properties of a [EmojiChooser].}

    Used by text widgets to let users insert Emoji characters.

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
class type emoji_chooser_t = object
  inherit Popover.popover_t

  method on_emoji_picked :
    ?after:bool ->
    callback:(text:string -> unit) ->
    unit ->
    Gobject.Signal.handler_id
  (** Emitted when the user selects an Emoji. *)

  method as_emoji_chooser : Raw.Emoji_chooser.t
end

class emoji_chooser : Raw.Emoji_chooser.t -> emoji_chooser_t
(** Wraps a raw handle of {!Ocgtk.Raw.Emoji_chooser.t}. *)

(** {1:description Description}

    Used by text widgets to let users insert Emoji characters.

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

(** {1:constructors Constructors} *)

val new_ : unit -> emoji_chooser_t
(** Creates a new [GtkEmojiChooser]. *)
