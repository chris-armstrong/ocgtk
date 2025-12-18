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

(** GdkClipboard - Clipboard API (new in GTK4) *)

open Gobject

(** {2 Core Types} *)

type t
(** Clipboard handle *)

type content_provider
(** Content provider for custom clipboard data *)

(** {2 Getting Clipboard Instances} *)

external get : Gdk.display -> t = "ml_gdk_display_get_clipboard"
(** Get the default clipboard for the display *)

external get_primary : Gdk.display -> t = "ml_gdk_display_get_primary_clipboard"
(** Get the primary clipboard for the display *)

(** {2 Synchronous Write Operations} *)

external set_text : t -> string -> unit = "ml_gdk_clipboard_set_text"
(** Set text content on the clipboard *)

external set_content : t -> content_provider -> bool = "ml_gdk_clipboard_set_content"
(** Set custom content on the clipboard *)

(** {2 Asynchronous Read Operations} *)

external read_text_async : t -> callback:(string option -> unit) -> unit = "ml_gdk_clipboard_read_text_async"
(** Asynchronously read text from the clipboard *)

(** {2 Content Queries} *)

module Formats = struct
  type t
  (** Content formats descriptor *)

  external contains_text : t -> bool = "ml_gdk_content_formats_contain_gtype_text"
  (** Check if the formats include text content *)

  external get_mime_types : t -> string array = "ml_gdk_content_formats_get_mime_types"
  (** Get all MIME types supported by this formats object *)
end

external get_formats : t -> Formats.t = "ml_gdk_clipboard_get_formats"
(** Get the content formats currently available on the clipboard *)

external is_local : t -> bool = "ml_gdk_clipboard_is_local"
(** Check if the clipboard content is owned by the current process *)

(** {2 Content Providers} *)

external content_provider_of_value : g_value -> content_provider = "ml_gdk_content_provider_new_for_value"
(** Create a content provider from a GValue *)
