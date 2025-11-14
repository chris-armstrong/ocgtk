(**************************************************************************)
(*                Lablgtk                                                 *)
(*                                                                        *)
(*    This program is free software; you can redistribute it              *)
(*    and/or modify it under the terms of the GNU Library General         *)
(*    Public License as published by the Free Software Foundation         *)
(*    version 2, with the exception described in file COPYING which       *)
(*    comes with the library.                                             *)
(*                                                                        *)
(*    This program is distributed in the hope that it will be useful,     *)
(*    but WITHOUT ANY WARRANTY; without even the implied warranty of      *)
(*    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the       *)
(*    GNU Library General Public License for more details.                *)
(*                                                                        *)
(*    You should have received a copy of the GNU Library General          *)
(*    Public License along with this program; if not, write to the        *)
(*    Free Software Foundation, Inc., 59 Temple Place, Suite 330,         *)
(*    Boston, MA 02111-1307  USA                                          *)
(*                                                                        *)
(**************************************************************************)

(** GdkClipboard - Clipboard API (new in GTK4)

    GTK4 completely replaced GtkClipboard with GdkClipboard using GValue
    and GType instead of opaque atoms. This provides a cleaner, more
    type-safe clipboard API.

    MAJOR CHANGES FROM GTK3:
    - GtkClipboard → GdkClipboard (new namespace)
    - Atom-based APIs replaced with GType-based APIs
    - All operations are now asynchronous by default
    - New content formats API for type negotiation *)

open Gobject

(** {2 Core Types} *)

type t
(** Clipboard handle *)

type content_provider
(** Abstract content provider type *)

(** {2 Getting Clipboard Instances} *)

val get : Gdk.display -> t
(** Get the default clipboard for the display.
    This is the clipboard used for copy/paste operations (Ctrl+C/Ctrl+V). *)

val get_primary : Gdk.display -> t
(** Get the primary clipboard for the display.
    This is the clipboard used for middle-click paste on X11.
    On other platforms, this may be the same as the default clipboard. *)

(** {2 Synchronous Write Operations} *)

val set_text : t -> string -> unit
(** Set text content on the clipboard.
    This is a synchronous operation that completes immediately.
    @param clipboard The clipboard
    @param text The UTF-8 text to set *)

val set_content : t -> content_provider -> bool
(** Set custom content on the clipboard using a content provider.
    @param clipboard The clipboard
    @param provider The content provider (or NULL to clear)
    @return true if content was set successfully *)

(** {2 Asynchronous Read Operations} *)

val read_text_async : t -> callback:(string option -> unit) -> unit
(** Asynchronously read text from the clipboard.
    The callback will be invoked with Some text if successful, or None if
    the clipboard doesn't contain text or an error occurred.
    @param clipboard The clipboard
    @param callback Function to call with the result *)

(** {2 Content Queries} *)

module Formats : sig
  type t
  (** Content formats descriptor *)

  val contains_text : t -> bool
  (** Check if the formats include text content *)

  val get_mime_types : t -> string array
  (** Get all MIME types supported by this formats object *)
end

val get_formats : t -> Formats.t
(** Get the content formats currently available on the clipboard.
    This can be used to check what types of data are available before
    attempting to read. *)

val is_local : t -> bool
(** Check if the clipboard content is owned by the current process.
    This can be useful to optimize certain operations. *)

(** {2 Content Providers}

    Note: Basic content provider support for custom clipboard data.
    Full content provider API may be expanded in future versions. *)

val content_provider_of_value : g_value -> content_provider
(** Create a content provider from a GValue.
    This is useful for providing custom clipboard content. *)
