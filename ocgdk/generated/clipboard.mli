(* GENERATED CODE - DO NOT EDIT *)
(* Shim module for Clipboard from cyclic group App_launch_context_cycle_de440b34 *)

(** Represents data shared between applications or inside an application.

    Its methods, signals and properties are on {!class-type-clipboard_t}. Its
    full description is under {!section-description}. Its constructors are under
    {!section-constructors}. The functions it is built on are in
    {!Ocgdk.Raw.Clipboard}. *)

(** {1:class Class} *)

class type clipboard_t = App_launch_context_cycle_de440b34.clipboard_t
(** {b The methods, signals and properties of a [Clipboard].}

    Represents data shared between applications or inside an application.

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
    object. *)

class clipboard : Raw.Clipboard.t -> clipboard_t
(** Wraps a raw handle of {!Ocgdk.Raw.Clipboard.t}. *)

(** {1:description Description}

    Represents data shared between applications or inside an application.

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
    object. *)

(** {1:constructors Constructors} *)

(** This class is not instantiated directly - it is used as a return value by
    methods on other classes. *)
