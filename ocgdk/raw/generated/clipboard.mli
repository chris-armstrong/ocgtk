(* GENERATED CODE - DO NOT EDIT *)
(* Clipboard, a member of the cyclic module App_launch_context_cycle_de440b34 *)

(** Represents data shared between applications or inside an application.

    To get a [GdkClipboard] object, use [Gdk.Display.get_clipboard] or
    [Gdk.Display.get_primary_clipboard]. You can find out about the data that is
    currently available in a clipboard using [Gdk.Clipboard.get_formats].

    To make text or image data available in a clipboard, use
    [Gdk.Clipboard.set_text] or [Gdk.Clipboard.set_texture]. For other data, you
    can use [Gdk.Clipboard.set_content], which takes a [Gdk.ContentProvider]
    object.

    To read textual or image data from a clipboard, use
    [Gdk.Clipboard.read_text_async] or [Gdk.Clipboard.read_texture_async]. For
    other data, use [Gdk.Clipboard.read_async], which provides a [GInputStream]
    object.

    The class built on this module is in {!Ocgdk.Clipboard}. *)

include module type of struct
  include App_launch_context_cycle_de440b34.Clipboard
end
