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

    Its methods, signals and properties are on {!class-type-emoji_chooser_t}.
    The functions it is built on are in {!Ocgtk.Raw.Emoji_chooser}. *)

(** The methods, signals and properties of a [GtkEmojiChooser]. *)
class type emoji_chooser_t = object
  inherit Popover.popover_t

  method on_emoji_picked :
    ?after:bool ->
    callback:(text:string -> unit) ->
    unit ->
    Gobject.Signal.handler_id

  method as_emoji_chooser : Raw.Emoji_chooser.t
end

class emoji_chooser : Raw.Emoji_chooser.t -> emoji_chooser_t
(** Wraps a layer 1 handle, {!Ocgtk.Raw.Emoji_chooser.t}. Apply it directly only
    to convert a handle obtained from layer 1: constructors, and methods that
    return a [GtkEmojiChooser], give one already wrapped. *)

val new_ : unit -> emoji_chooser_t
