# Migrating to one package per library

After `0.1~preview2`, each GIR namespace is its own opam package and dune
library, and the module paths are flat. The **`ocgtk` package changes
meaning**: in `0.1~preview2` it held every library (`ocgtk.gtk`,
`ocgtk.gio`, ...) under an umbrella `Ocgtk` module; now it is Gtk only.
There are no compatibility aliases, so code written against `0.1~preview2`
needs the renames below.

## Packages and dune libraries

| `0.1~preview2` dune library | opam package and dune library | Main module |
|---|---|---|
| `ocgtk` (umbrella) | none: depend on each library you use | |
| `ocgtk.common` (part of the `ocgtk` package) | `ocglib` | `Ocglib` |
| `ocgtk.cairo` | `occairo` | `Occairo` |
| `ocgtk.gdk` | `ocgdk` | `Ocgdk` |
| `ocgtk.gdkpixbuf` | `ocgdkpixbuf` | `Ocgdkpixbuf` |
| `ocgtk.gio` | `ocgio` | `Ocgio` |
| `ocgtk.graphene` | `ocgraphene` | `Ocgraphene` |
| `ocgtk.gsk` | `ocgsk` | `Ocgsk` |
| `ocgtk.gtk` | `ocgtk` | `Ocgtk` |
| `ocgtk.pango` | `ocpango` | `Ocpango` |
| `ocgtk.pangocairo` | `ocpangocairo` | `Ocpangocairo` |

Each package also installs `<package>.raw` and `<package>.enums`
(`ocgio.raw`, `ocgio.enums`, ...). You do not need to name them: the main
library re-exports both as `Raw` and `Enums`.

## Module paths

The rules, with Gio as the example (every namespace follows them):

| `0.1~preview2` | Now |
|---|---|
| `Ocgtk_gio.Gio.Application` (classes, layer 2) | `Ocgio.Application` |
| `Ocgtk_gio.Gio.Wrappers.Application` (externals, layer 1) | `Ocgio.Raw.Application` |
| `Ocgtk_gio.Gio_enums.x` | `Ocgio.Enums.x` |
| `Ocgtk_gio.Gio_constants.x` | `Ocgio.Constants.x` |
| `Ocgtk_gio.Gio_volume_monitor_core` (hand-written layer 1) | `Ocgio.Raw.Gio_volume_monitor_core` |
| `Ocgtk_gtk.GMain` | `Ocgtk.Main` |
| `Ocgtk_gtk.GVersion` | `Ocgtk.Version` |
| `Ocgtk.Gtk.Widget`, `Ocgtk.Gio.File`, ... (umbrella) | `Ocgtk.Widget`, `Ocgio.File`, ... |
| `Ocgtk.Common` (umbrella) | `Ocglib` |
| `Gobject`, `Gvariant`, `Int32`, ... (top level) | `Ocglib.Gobject`, `Ocglib.Gvariant`, `Ocglib.Int32`, ... |

`Ocgtk_gtk.Gtk` also re-exported each Gtk enum type at its top level
(`Gtk.orientation`); `Ocgtk` does not, so write `Ocgtk.Enums.orientation`.

To keep writing `Gobject.obj`, open `Ocglib` (for example with
`(flags (:standard -open Ocglib))` in dune), as the bindings themselves do.

In C stubs that include another namespace's declarations, drop the
directory prefix: `#include "gio_decls.h"`, not
`#include "generated/gio_decls.h"`. The headers are installed by the
`.raw` libraries.

## Every module path

Generated from the 2778 public module paths in the odoc page tree just
before the change, and each new path checked against the current page tree.
Every path changed except `Ocgtk`, which now means Gtk. `class` rows are the
layer 2 class and class type of the module above them.

| Before | Now |
|---|---|
| `Bounded_int` | `Ocglib.Bounded_int` |
| `GError` | `Ocglib.GError` |
| `Glib` | `Ocglib.Glib` |
| `Glib_bytes` | `Ocglib.Glib_bytes` |
| `Glib.Convert` | `Ocglib.Glib.Convert` |
| `Glib.Idle` | `Ocglib.Glib.Idle` |
| `Glib.Main` | `Ocglib.Glib.Main` |
| `Glib.Timeout` | `Ocglib.Glib.Timeout` |
| `Glib.Utf8` | `Ocglib.Glib.Utf8` |
| `Gobject` | `Ocglib.Gobject` |
| `Gobject.Closure` | `Ocglib.Gobject.Closure` |
| `Gobject.Property` | `Ocglib.Gobject.Property` |
| `Gobject.Signal` | `Ocglib.Gobject.Signal` |
| `Gobject.Type` | `Ocglib.Gobject.Type` |
| `Gobject.Value` | `Ocglib.Gobject.Value` |
| `Gsize` | `Ocglib.Gsize` |
| `Gvariant` | `Ocglib.Gvariant` |
| `Gvariant_type` | `Ocglib.Gvariant_type` |
| `Int16` | `Ocglib.Int16` |
| `Int32` | `Ocglib.Int32` |
| `Int8` | `Ocglib.Int8` |
| `Ocgtk_cairo` | `Occairo` |
| `Ocgtk_cairo.Cairo` | `Occairo` |
| `Ocgtk_cairo.Cairo.Context` | `Occairo.Context` |
| `Ocgtk_cairo.Cairo.Context.class context` | `Occairo.Context.class context` |
| `Ocgtk_cairo.Cairo.Context.class type context_t` | `Occairo.Context.class type context_t` |
| `Ocgtk_cairo.Cairo.Device` | `Occairo.Device` |
| `Ocgtk_cairo.Cairo.Device.class device` | `Occairo.Device.class device` |
| `Ocgtk_cairo.Cairo.Device.class type device_t` | `Occairo.Device.class type device_t` |
| `Ocgtk_cairo.Cairo_enums` | `Occairo.Enums` |
| `Ocgtk_cairo.Cairo.Font_face` | `Occairo.Font_face` |
| `Ocgtk_cairo.Cairo.Font_face.class font_face` | `Occairo.Font_face.class font_face` |
| `Ocgtk_cairo.Cairo.Font_face.class type font_face_t` | `Occairo.Font_face.class type font_face_t` |
| `Ocgtk_cairo.Cairo.Font_options` | `Occairo.Font_options` |
| `Ocgtk_cairo.Cairo.Font_options.class font_options` | `Occairo.Font_options.class font_options` |
| `Ocgtk_cairo.Cairo.Font_options.class type font_options_t` | `Occairo.Font_options.class type font_options_t` |
| `Ocgtk_cairo.Cairo.Glyph` | `Occairo.Glyph` |
| `Ocgtk_cairo.Cairo.Glyph.class glyph` | `Occairo.Glyph.class glyph` |
| `Ocgtk_cairo.Cairo.Glyph.class type glyph_t` | `Occairo.Glyph.class type glyph_t` |
| `Ocgtk_cairo.Cairo.Matrix` | `Occairo.Matrix` |
| `Ocgtk_cairo.Cairo.Matrix.class matrix` | `Occairo.Matrix.class matrix` |
| `Ocgtk_cairo.Cairo.Matrix.class type matrix_t` | `Occairo.Matrix.class type matrix_t` |
| `Ocgtk_cairo.Cairo.Path` | `Occairo.Path` |
| `Ocgtk_cairo.Cairo.Path.class path` | `Occairo.Path.class path` |
| `Ocgtk_cairo.Cairo.Path.class type path_t` | `Occairo.Path.class type path_t` |
| `Ocgtk_cairo.Cairo.Pattern` | `Occairo.Pattern` |
| `Ocgtk_cairo.Cairo.Pattern.class pattern` | `Occairo.Pattern.class pattern` |
| `Ocgtk_cairo.Cairo.Pattern.class type pattern_t` | `Occairo.Pattern.class type pattern_t` |
| `Ocgtk_cairo.Cairo.Rectangle` | `Occairo.Rectangle` |
| `Ocgtk_cairo.Cairo.Rectangle.class rectangle` | `Occairo.Rectangle.class rectangle` |
| `Ocgtk_cairo.Cairo.Rectangle.class type rectangle_t` | `Occairo.Rectangle.class type rectangle_t` |
| `Ocgtk_cairo.Cairo.Rectangle_int` | `Occairo.Rectangle_int` |
| `Ocgtk_cairo.Cairo.Rectangle_int.class rectangle_int` | `Occairo.Rectangle_int.class rectangle_int` |
| `Ocgtk_cairo.Cairo.Rectangle_int.class type rectangle_int_t` | `Occairo.Rectangle_int.class type rectangle_int_t` |
| `Ocgtk_cairo.Cairo.Region` | `Occairo.Region` |
| `Ocgtk_cairo.Cairo.Region.class region` | `Occairo.Region.class region` |
| `Ocgtk_cairo.Cairo.Region.class type region_t` | `Occairo.Region.class type region_t` |
| `Ocgtk_cairo.Cairo.Scaled_font` | `Occairo.Scaled_font` |
| `Ocgtk_cairo.Cairo.Scaled_font.class scaled_font` | `Occairo.Scaled_font.class scaled_font` |
| `Ocgtk_cairo.Cairo.Scaled_font.class type scaled_font_t` | `Occairo.Scaled_font.class type scaled_font_t` |
| `Ocgtk_cairo.Cairo.Surface` | `Occairo.Surface` |
| `Ocgtk_cairo.Cairo.Surface.class surface` | `Occairo.Surface.class surface` |
| `Ocgtk_cairo.Cairo.Surface.class type surface_t` | `Occairo.Surface.class type surface_t` |
| `Ocgtk_cairo.Cairo.Text_cluster` | `Occairo.Text_cluster` |
| `Ocgtk_cairo.Cairo.Text_cluster.class text_cluster` | `Occairo.Text_cluster.class text_cluster` |
| `Ocgtk_cairo.Cairo.Text_cluster.class type text_cluster_t` | `Occairo.Text_cluster.class type text_cluster_t` |
| `Ocgtk_cairo.Cairo.Wrappers` | `Occairo.Raw` |
| `Ocgtk_cairo.Cairo.Wrappers.Context` | `Occairo.Raw.Context` |
| `Ocgtk_cairo.Cairo.Wrappers.Device` | `Occairo.Raw.Device` |
| `Ocgtk_cairo.Cairo.Wrappers.Font_face` | `Occairo.Raw.Font_face` |
| `Ocgtk_cairo.Cairo.Wrappers.Font_options` | `Occairo.Raw.Font_options` |
| `Ocgtk_cairo.Cairo.Wrappers.Glyph` | `Occairo.Raw.Glyph` |
| `Ocgtk_cairo.Cairo.Wrappers.Matrix` | `Occairo.Raw.Matrix` |
| `Ocgtk_cairo.Cairo.Wrappers.Path` | `Occairo.Raw.Path` |
| `Ocgtk_cairo.Cairo.Wrappers.Pattern` | `Occairo.Raw.Pattern` |
| `Ocgtk_cairo.Cairo.Wrappers.Rectangle` | `Occairo.Raw.Rectangle` |
| `Ocgtk_cairo.Cairo.Wrappers.Rectangle_int` | `Occairo.Raw.Rectangle_int` |
| `Ocgtk_cairo.Cairo.Wrappers.Region` | `Occairo.Raw.Region` |
| `Ocgtk_cairo.Cairo.Wrappers.Scaled_font` | `Occairo.Raw.Scaled_font` |
| `Ocgtk_cairo.Cairo.Wrappers.Surface` | `Occairo.Raw.Surface` |
| `Ocgtk_cairo.Cairo.Wrappers.Text_cluster` | `Occairo.Raw.Text_cluster` |
| `Ocgtk_common` | `Ocglib` |
| `Ocgtk_gdk` | `Ocgdk` |
| `Ocgtk_gdk.Gdk` | `Ocgdk` |
| `Ocgtk_gdk.Gdk.App_launch_context` | `Ocgdk.App_launch_context` |
| `Ocgtk_gdk.Gdk.App_launch_context.class app_launch_context` | `Ocgdk.App_launch_context.class app_launch_context` |
| `Ocgtk_gdk.Gdk.App_launch_context.class type app_launch_context_t` | `Ocgdk.App_launch_context.class type app_launch_context_t` |
| `Ocgtk_gdk.Gdk.Button_event` | `Ocgdk.Button_event` |
| `Ocgtk_gdk.Gdk.Button_event.class button_event` | `Ocgdk.Button_event.class button_event` |
| `Ocgtk_gdk.Gdk.Button_event.class type button_event_t` | `Ocgdk.Button_event.class type button_event_t` |
| `Ocgtk_gdk.Gdk.Cairo_context` | `Ocgdk.Cairo_context` |
| `Ocgtk_gdk.Gdk.Cairo_context.class cairo_context` | `Ocgdk.Cairo_context.class cairo_context` |
| `Ocgtk_gdk.Gdk.Cairo_context.class type cairo_context_t` | `Ocgdk.Cairo_context.class type cairo_context_t` |
| `Ocgtk_gdk.Gdk.Cicp_params` | `Ocgdk.Cicp_params` |
| `Ocgtk_gdk.Gdk.Cicp_params.class cicp_params` | `Ocgdk.Cicp_params.class cicp_params` |
| `Ocgtk_gdk.Gdk.Cicp_params.class type cicp_params_t` | `Ocgdk.Cicp_params.class type cicp_params_t` |
| `Ocgtk_gdk.Gdk.Clipboard` | `Ocgdk.Clipboard` |
| `Ocgtk_gdk.Gdk.Clipboard.class clipboard` | `Ocgdk.Clipboard.class clipboard` |
| `Ocgtk_gdk.Gdk.Clipboard.class type clipboard_t` | `Ocgdk.Clipboard.class type clipboard_t` |
| `Ocgtk_gdk.Gdk.Color_state` | `Ocgdk.Color_state` |
| `Ocgtk_gdk.Gdk.Color_state.class color_state` | `Ocgdk.Color_state.class color_state` |
| `Ocgtk_gdk.Gdk.Color_state.class type color_state_t` | `Ocgdk.Color_state.class type color_state_t` |
| `Ocgtk_gdk.Gdk_constants` | `Ocgdk.Constants` |
| `Ocgtk_gdk.Gdk.Content_deserializer` | `Ocgdk.Content_deserializer` |
| `Ocgtk_gdk.Gdk.Content_deserializer.class content_deserializer` | `Ocgdk.Content_deserializer.class content_deserializer` |
| `Ocgtk_gdk.Gdk.Content_deserializer.class type content_deserializer_t` | `Ocgdk.Content_deserializer.class type content_deserializer_t` |
| `Ocgtk_gdk.Gdk.Content_formats` | `Ocgdk.Content_formats` |
| `Ocgtk_gdk.Gdk.Content_formats_builder` | `Ocgdk.Content_formats_builder` |
| `Ocgtk_gdk.Gdk.Content_formats_builder.class content_formats_builder` | `Ocgdk.Content_formats_builder.class content_formats_builder` |
| `Ocgtk_gdk.Gdk.Content_formats_builder.class type content_formats_builder_t` | `Ocgdk.Content_formats_builder.class type content_formats_builder_t` |
| `Ocgtk_gdk.Gdk.Content_formats.class content_formats` | `Ocgdk.Content_formats.class content_formats` |
| `Ocgtk_gdk.Gdk.Content_formats.class type content_formats_t` | `Ocgdk.Content_formats.class type content_formats_t` |
| `Ocgtk_gdk.Gdk.Content_provider` | `Ocgdk.Content_provider` |
| `Ocgtk_gdk.Gdk.Content_provider.class content_provider` | `Ocgdk.Content_provider.class content_provider` |
| `Ocgtk_gdk.Gdk.Content_provider.class type content_provider_t` | `Ocgdk.Content_provider.class type content_provider_t` |
| `Ocgtk_gdk.Gdk.Content_serializer` | `Ocgdk.Content_serializer` |
| `Ocgtk_gdk.Gdk.Content_serializer.class content_serializer` | `Ocgdk.Content_serializer.class content_serializer` |
| `Ocgtk_gdk.Gdk.Content_serializer.class type content_serializer_t` | `Ocgdk.Content_serializer.class type content_serializer_t` |
| `Ocgtk_gdk.Gdk.Crossing_event` | `Ocgdk.Crossing_event` |
| `Ocgtk_gdk.Gdk.Crossing_event.class crossing_event` | `Ocgdk.Crossing_event.class crossing_event` |
| `Ocgtk_gdk.Gdk.Crossing_event.class type crossing_event_t` | `Ocgdk.Crossing_event.class type crossing_event_t` |
| `Ocgtk_gdk.Gdk.Cursor` | `Ocgdk.Cursor` |
| `Ocgtk_gdk.Gdk.Cursor.class cursor` | `Ocgdk.Cursor.class cursor` |
| `Ocgtk_gdk.Gdk.Cursor.class type cursor_t` | `Ocgdk.Cursor.class type cursor_t` |
| `Ocgtk_gdk.Gdk.Delete_event` | `Ocgdk.Delete_event` |
| `Ocgtk_gdk.Gdk.Delete_event.class delete_event` | `Ocgdk.Delete_event.class delete_event` |
| `Ocgtk_gdk.Gdk.Delete_event.class type delete_event_t` | `Ocgdk.Delete_event.class type delete_event_t` |
| `Ocgtk_gdk.Gdk.Device` | `Ocgdk.Device` |
| `Ocgtk_gdk.Gdk.Device.class device` | `Ocgdk.Device.class device` |
| `Ocgtk_gdk.Gdk.Device.class type device_t` | `Ocgdk.Device.class type device_t` |
| `Ocgtk_gdk.Gdk.Device_pad` | `Ocgdk.Device_pad` |
| `Ocgtk_gdk.Gdk.Device_pad.class device_pad` | `Ocgdk.Device_pad.class device_pad` |
| `Ocgtk_gdk.Gdk.Device_pad.class type device_pad_t` | `Ocgdk.Device_pad.class type device_pad_t` |
| `Ocgtk_gdk.Gdk.Device_tool` | `Ocgdk.Device_tool` |
| `Ocgtk_gdk.Gdk.Device_tool.class device_tool` | `Ocgdk.Device_tool.class device_tool` |
| `Ocgtk_gdk.Gdk.Device_tool.class type device_tool_t` | `Ocgdk.Device_tool.class type device_tool_t` |
| `Ocgtk_gdk.Gdk.Display` | `Ocgdk.Display` |
| `Ocgtk_gdk.Gdk.Display.class display` | `Ocgdk.Display.class display` |
| `Ocgtk_gdk.Gdk.Display.class type display_t` | `Ocgdk.Display.class type display_t` |
| `Ocgtk_gdk.Gdk.Display_manager` | `Ocgdk.Display_manager` |
| `Ocgtk_gdk.Gdk.Display_manager.class display_manager` | `Ocgdk.Display_manager.class display_manager` |
| `Ocgtk_gdk.Gdk.Display_manager.class type display_manager_t` | `Ocgdk.Display_manager.class type display_manager_t` |
| `Ocgtk_gdk.Gdk.Dmabuf_formats` | `Ocgdk.Dmabuf_formats` |
| `Ocgtk_gdk.Gdk.Dmabuf_formats.class dmabuf_formats` | `Ocgdk.Dmabuf_formats.class dmabuf_formats` |
| `Ocgtk_gdk.Gdk.Dmabuf_formats.class type dmabuf_formats_t` | `Ocgdk.Dmabuf_formats.class type dmabuf_formats_t` |
| `Ocgtk_gdk.Gdk.Dmabuf_texture` | `Ocgdk.Dmabuf_texture` |
| `Ocgtk_gdk.Gdk.Dmabuf_texture_builder` | `Ocgdk.Dmabuf_texture_builder` |
| `Ocgtk_gdk.Gdk.Dmabuf_texture_builder.class dmabuf_texture_builder` | `Ocgdk.Dmabuf_texture_builder.class dmabuf_texture_builder` |
| `Ocgtk_gdk.Gdk.Dmabuf_texture_builder.class type dmabuf_texture_builder_t` | `Ocgdk.Dmabuf_texture_builder.class type dmabuf_texture_builder_t` |
| `Ocgtk_gdk.Gdk.Dmabuf_texture.class dmabuf_texture` | `Ocgdk.Dmabuf_texture.class dmabuf_texture` |
| `Ocgtk_gdk.Gdk.Dmabuf_texture.class type dmabuf_texture_t` | `Ocgdk.Dmabuf_texture.class type dmabuf_texture_t` |
| `Ocgtk_gdk.Gdk.Dnd_event` | `Ocgdk.Dnd_event` |
| `Ocgtk_gdk.Gdk.Dnd_event.class dnd_event` | `Ocgdk.Dnd_event.class dnd_event` |
| `Ocgtk_gdk.Gdk.Dnd_event.class type dnd_event_t` | `Ocgdk.Dnd_event.class type dnd_event_t` |
| `Ocgtk_gdk.Gdk.Drag` | `Ocgdk.Drag` |
| `Ocgtk_gdk.Gdk.Drag.class drag` | `Ocgdk.Drag.class drag` |
| `Ocgtk_gdk.Gdk.Drag.class type drag_t` | `Ocgdk.Drag.class type drag_t` |
| `Ocgtk_gdk.Gdk.Drag_surface` | `Ocgdk.Drag_surface` |
| `Ocgtk_gdk.Gdk.Drag_surface.class drag_surface` | `Ocgdk.Drag_surface.class drag_surface` |
| `Ocgtk_gdk.Gdk.Drag_surface.class type drag_surface_t` | `Ocgdk.Drag_surface.class type drag_surface_t` |
| `Ocgtk_gdk.Gdk.Drag_surface_size` | `Ocgdk.Drag_surface_size` |
| `Ocgtk_gdk.Gdk.Drag_surface_size.class drag_surface_size` | `Ocgdk.Drag_surface_size.class drag_surface_size` |
| `Ocgtk_gdk.Gdk.Drag_surface_size.class type drag_surface_size_t` | `Ocgdk.Drag_surface_size.class type drag_surface_size_t` |
| `Ocgtk_gdk.Gdk.Draw_context` | `Ocgdk.Draw_context` |
| `Ocgtk_gdk.Gdk.Draw_context.class draw_context` | `Ocgdk.Draw_context.class draw_context` |
| `Ocgtk_gdk.Gdk.Draw_context.class type draw_context_t` | `Ocgdk.Draw_context.class type draw_context_t` |
| `Ocgtk_gdk.Gdk.Drop` | `Ocgdk.Drop` |
| `Ocgtk_gdk.Gdk.Drop.class drop` | `Ocgdk.Drop.class drop` |
| `Ocgtk_gdk.Gdk.Drop.class type drop_t` | `Ocgdk.Drop.class type drop_t` |
| `Ocgtk_gdk.Gdk_enums` | `Ocgdk.Enums` |
| `Ocgtk_gdk.Gdk.Event` | `Ocgdk.Event` |
| `Ocgtk_gdk.Gdk.Event.class event` | `Ocgdk.Event.class event` |
| `Ocgtk_gdk.Gdk.Event.class type event_t` | `Ocgdk.Event.class type event_t` |
| `Ocgtk_gdk.Gdk.Event_sequence` | `Ocgdk.Event_sequence` |
| `Ocgtk_gdk.Gdk.Event_sequence.class event_sequence` | `Ocgdk.Event_sequence.class event_sequence` |
| `Ocgtk_gdk.Gdk.Event_sequence.class type event_sequence_t` | `Ocgdk.Event_sequence.class type event_sequence_t` |
| `Ocgtk_gdk.Gdk.File_list` | `Ocgdk.File_list` |
| `Ocgtk_gdk.Gdk.File_list.class file_list` | `Ocgdk.File_list.class file_list` |
| `Ocgtk_gdk.Gdk.File_list.class type file_list_t` | `Ocgdk.File_list.class type file_list_t` |
| `Ocgtk_gdk.Gdk.Focus_event` | `Ocgdk.Focus_event` |
| `Ocgtk_gdk.Gdk.Focus_event.class focus_event` | `Ocgdk.Focus_event.class focus_event` |
| `Ocgtk_gdk.Gdk.Focus_event.class type focus_event_t` | `Ocgdk.Focus_event.class type focus_event_t` |
| `Ocgtk_gdk.Gdk.Frame_clock` | `Ocgdk.Frame_clock` |
| `Ocgtk_gdk.Gdk.Frame_clock.class frame_clock` | `Ocgdk.Frame_clock.class frame_clock` |
| `Ocgtk_gdk.Gdk.Frame_clock.class type frame_clock_t` | `Ocgdk.Frame_clock.class type frame_clock_t` |
| `Ocgtk_gdk.Gdk.Frame_timings` | `Ocgdk.Frame_timings` |
| `Ocgtk_gdk.Gdk.Frame_timings.class frame_timings` | `Ocgdk.Frame_timings.class frame_timings` |
| `Ocgtk_gdk.Gdk.Frame_timings.class type frame_timings_t` | `Ocgdk.Frame_timings.class type frame_timings_t` |
| `Ocgtk_gdk.Gdk.Gl_context` | `Ocgdk.Gl_context` |
| `Ocgtk_gdk.Gdk.Gl_context.class gl_context` | `Ocgdk.Gl_context.class gl_context` |
| `Ocgtk_gdk.Gdk.Gl_context.class type gl_context_t` | `Ocgdk.Gl_context.class type gl_context_t` |
| `Ocgtk_gdk.Gdk.Gl_texture` | `Ocgdk.Gl_texture` |
| `Ocgtk_gdk.Gdk.Gl_texture_builder` | `Ocgdk.Gl_texture_builder` |
| `Ocgtk_gdk.Gdk.Gl_texture_builder.class gl_texture_builder` | `Ocgdk.Gl_texture_builder.class gl_texture_builder` |
| `Ocgtk_gdk.Gdk.Gl_texture_builder.class type gl_texture_builder_t` | `Ocgdk.Gl_texture_builder.class type gl_texture_builder_t` |
| `Ocgtk_gdk.Gdk.Gl_texture.class gl_texture` | `Ocgdk.Gl_texture.class gl_texture` |
| `Ocgtk_gdk.Gdk.Gl_texture.class type gl_texture_t` | `Ocgdk.Gl_texture.class type gl_texture_t` |
| `Ocgtk_gdk.Gdk.Grab_broken_event` | `Ocgdk.Grab_broken_event` |
| `Ocgtk_gdk.Gdk.Grab_broken_event.class grab_broken_event` | `Ocgdk.Grab_broken_event.class grab_broken_event` |
| `Ocgtk_gdk.Gdk.Grab_broken_event.class type grab_broken_event_t` | `Ocgdk.Grab_broken_event.class type grab_broken_event_t` |
| `Ocgtk_gdk.Gdk.Key_event` | `Ocgdk.Key_event` |
| `Ocgtk_gdk.Gdk.Key_event.class key_event` | `Ocgdk.Key_event.class key_event` |
| `Ocgtk_gdk.Gdk.Key_event.class type key_event_t` | `Ocgdk.Key_event.class type key_event_t` |
| `Ocgtk_gdk.Gdk.Keymap_key` | `Ocgdk.Keymap_key` |
| `Ocgtk_gdk.Gdk.Keymap_key.class keymap_key` | `Ocgdk.Keymap_key.class keymap_key` |
| `Ocgtk_gdk.Gdk.Keymap_key.class type keymap_key_t` | `Ocgdk.Keymap_key.class type keymap_key_t` |
| `Ocgtk_gdk.Gdk.Memory_texture` | `Ocgdk.Memory_texture` |
| `Ocgtk_gdk.Gdk.Memory_texture_builder` | `Ocgdk.Memory_texture_builder` |
| `Ocgtk_gdk.Gdk.Memory_texture_builder.class memory_texture_builder` | `Ocgdk.Memory_texture_builder.class memory_texture_builder` |
| `Ocgtk_gdk.Gdk.Memory_texture_builder.class type memory_texture_builder_t` | `Ocgdk.Memory_texture_builder.class type memory_texture_builder_t` |
| `Ocgtk_gdk.Gdk.Memory_texture.class memory_texture` | `Ocgdk.Memory_texture.class memory_texture` |
| `Ocgtk_gdk.Gdk.Memory_texture.class type memory_texture_t` | `Ocgdk.Memory_texture.class type memory_texture_t` |
| `Ocgtk_gdk.Gdk.Monitor` | `Ocgdk.Monitor` |
| `Ocgtk_gdk.Gdk.Monitor.class monitor` | `Ocgdk.Monitor.class monitor` |
| `Ocgtk_gdk.Gdk.Monitor.class type monitor_t` | `Ocgdk.Monitor.class type monitor_t` |
| `Ocgtk_gdk.Gdk.Motion_event` | `Ocgdk.Motion_event` |
| `Ocgtk_gdk.Gdk.Motion_event.class motion_event` | `Ocgdk.Motion_event.class motion_event` |
| `Ocgtk_gdk.Gdk.Motion_event.class type motion_event_t` | `Ocgdk.Motion_event.class type motion_event_t` |
| `Ocgtk_gdk.Gdk.Pad_event` | `Ocgdk.Pad_event` |
| `Ocgtk_gdk.Gdk.Pad_event.class pad_event` | `Ocgdk.Pad_event.class pad_event` |
| `Ocgtk_gdk.Gdk.Pad_event.class type pad_event_t` | `Ocgdk.Pad_event.class type pad_event_t` |
| `Ocgtk_gdk.Gdk.Paintable` | `Ocgdk.Paintable` |
| `Ocgtk_gdk.Gdk.Paintable.class paintable` | `Ocgdk.Paintable.class paintable` |
| `Ocgtk_gdk.Gdk.Paintable.class type paintable_t` | `Ocgdk.Paintable.class type paintable_t` |
| `Ocgtk_gdk.Gdk.Popup` | `Ocgdk.Popup` |
| `Ocgtk_gdk.Gdk.Popup.class popup` | `Ocgdk.Popup.class popup` |
| `Ocgtk_gdk.Gdk.Popup.class type popup_t` | `Ocgdk.Popup.class type popup_t` |
| `Ocgtk_gdk.Gdk.Popup_layout` | `Ocgdk.Popup_layout` |
| `Ocgtk_gdk.Gdk.Popup_layout.class popup_layout` | `Ocgdk.Popup_layout.class popup_layout` |
| `Ocgtk_gdk.Gdk.Popup_layout.class type popup_layout_t` | `Ocgdk.Popup_layout.class type popup_layout_t` |
| `Ocgtk_gdk.Gdk.Proximity_event` | `Ocgdk.Proximity_event` |
| `Ocgtk_gdk.Gdk.Proximity_event.class proximity_event` | `Ocgdk.Proximity_event.class proximity_event` |
| `Ocgtk_gdk.Gdk.Proximity_event.class type proximity_event_t` | `Ocgdk.Proximity_event.class type proximity_event_t` |
| `Ocgtk_gdk.Gdk.Rectangle` | `Ocgdk.Rectangle` |
| `Ocgtk_gdk.Gdk.Rectangle.class rectangle` | `Ocgdk.Rectangle.class rectangle` |
| `Ocgtk_gdk.Gdk.Rectangle.class type rectangle_t` | `Ocgdk.Rectangle.class type rectangle_t` |
| `Ocgtk_gdk.Gdk.Rgb_a` | `Ocgdk.Rgb_a` |
| `Ocgtk_gdk.Gdk.Rgb_a.class rgb_a` | `Ocgdk.Rgb_a.class rgb_a` |
| `Ocgtk_gdk.Gdk.Rgb_a.class type rgb_a_t` | `Ocgdk.Rgb_a.class type rgb_a_t` |
| `Ocgtk_gdk.Gdk.Scroll_event` | `Ocgdk.Scroll_event` |
| `Ocgtk_gdk.Gdk.Scroll_event.class scroll_event` | `Ocgdk.Scroll_event.class scroll_event` |
| `Ocgtk_gdk.Gdk.Scroll_event.class type scroll_event_t` | `Ocgdk.Scroll_event.class type scroll_event_t` |
| `Ocgtk_gdk.Gdk.Seat` | `Ocgdk.Seat` |
| `Ocgtk_gdk.Gdk.Seat.class seat` | `Ocgdk.Seat.class seat` |
| `Ocgtk_gdk.Gdk.Seat.class type seat_t` | `Ocgdk.Seat.class type seat_t` |
| `Ocgtk_gdk.Gdk.Snapshot` | `Ocgdk.Snapshot` |
| `Ocgtk_gdk.Gdk.Snapshot.class snapshot` | `Ocgdk.Snapshot.class snapshot` |
| `Ocgtk_gdk.Gdk.Snapshot.class type snapshot_t` | `Ocgdk.Snapshot.class type snapshot_t` |
| `Ocgtk_gdk.Gdk.Surface` | `Ocgdk.Surface` |
| `Ocgtk_gdk.Gdk.Surface.class surface` | `Ocgdk.Surface.class surface` |
| `Ocgtk_gdk.Gdk.Surface.class type surface_t` | `Ocgdk.Surface.class type surface_t` |
| `Ocgtk_gdk.Gdk.Texture` | `Ocgdk.Texture` |
| `Ocgtk_gdk.Gdk.Texture.class texture` | `Ocgdk.Texture.class texture` |
| `Ocgtk_gdk.Gdk.Texture.class type texture_t` | `Ocgdk.Texture.class type texture_t` |
| `Ocgtk_gdk.Gdk.Texture_downloader` | `Ocgdk.Texture_downloader` |
| `Ocgtk_gdk.Gdk.Texture_downloader.class texture_downloader` | `Ocgdk.Texture_downloader.class texture_downloader` |
| `Ocgtk_gdk.Gdk.Texture_downloader.class type texture_downloader_t` | `Ocgdk.Texture_downloader.class type texture_downloader_t` |
| `Ocgtk_gdk.Gdk.Time_coord` | `Ocgdk.Time_coord` |
| `Ocgtk_gdk.Gdk.Time_coord.class time_coord` | `Ocgdk.Time_coord.class time_coord` |
| `Ocgtk_gdk.Gdk.Time_coord.class type time_coord_t` | `Ocgdk.Time_coord.class type time_coord_t` |
| `Ocgtk_gdk.Gdk.Toplevel` | `Ocgdk.Toplevel` |
| `Ocgtk_gdk.Gdk.Toplevel.class toplevel` | `Ocgdk.Toplevel.class toplevel` |
| `Ocgtk_gdk.Gdk.Toplevel.class type toplevel_t` | `Ocgdk.Toplevel.class type toplevel_t` |
| `Ocgtk_gdk.Gdk.Toplevel_layout` | `Ocgdk.Toplevel_layout` |
| `Ocgtk_gdk.Gdk.Toplevel_layout.class toplevel_layout` | `Ocgdk.Toplevel_layout.class toplevel_layout` |
| `Ocgtk_gdk.Gdk.Toplevel_layout.class type toplevel_layout_t` | `Ocgdk.Toplevel_layout.class type toplevel_layout_t` |
| `Ocgtk_gdk.Gdk.Toplevel_size` | `Ocgdk.Toplevel_size` |
| `Ocgtk_gdk.Gdk.Toplevel_size.class toplevel_size` | `Ocgdk.Toplevel_size.class toplevel_size` |
| `Ocgtk_gdk.Gdk.Toplevel_size.class type toplevel_size_t` | `Ocgdk.Toplevel_size.class type toplevel_size_t` |
| `Ocgtk_gdk.Gdk.Touch_event` | `Ocgdk.Touch_event` |
| `Ocgtk_gdk.Gdk.Touch_event.class touch_event` | `Ocgdk.Touch_event.class touch_event` |
| `Ocgtk_gdk.Gdk.Touch_event.class type touch_event_t` | `Ocgdk.Touch_event.class type touch_event_t` |
| `Ocgtk_gdk.Gdk.Touchpad_event` | `Ocgdk.Touchpad_event` |
| `Ocgtk_gdk.Gdk.Touchpad_event.class touchpad_event` | `Ocgdk.Touchpad_event.class touchpad_event` |
| `Ocgtk_gdk.Gdk.Touchpad_event.class type touchpad_event_t` | `Ocgdk.Touchpad_event.class type touchpad_event_t` |
| `Ocgtk_gdk.Gdk.Vulkan_context` | `Ocgdk.Vulkan_context` |
| `Ocgtk_gdk.Gdk.Vulkan_context.class type vulkan_context_t` | `Ocgdk.Vulkan_context.class type vulkan_context_t` |
| `Ocgtk_gdk.Gdk.Vulkan_context.class vulkan_context` | `Ocgdk.Vulkan_context.class vulkan_context` |
| `Ocgtk_gdk.Gdk.Wrappers` | `Ocgdk.Raw` |
| `Ocgtk_gdk.Gdk.Wrappers.App_launch_context` | `Ocgdk.Raw.App_launch_context` |
| `Ocgtk_gdk.Gdk.Wrappers.Button_event` | `Ocgdk.Raw.Button_event` |
| `Ocgtk_gdk.Gdk.Wrappers.Cairo_context` | `Ocgdk.Raw.Cairo_context` |
| `Ocgtk_gdk.Gdk.Wrappers.Cicp_params` | `Ocgdk.Raw.Cicp_params` |
| `Ocgtk_gdk.Gdk.Wrappers.Clipboard` | `Ocgdk.Raw.Clipboard` |
| `Ocgtk_gdk.Gdk.Wrappers.Color_state` | `Ocgdk.Raw.Color_state` |
| `Ocgtk_gdk.Gdk.Wrappers.Content_deserializer` | `Ocgdk.Raw.Content_deserializer` |
| `Ocgtk_gdk.Gdk.Wrappers.Content_formats` | `Ocgdk.Raw.Content_formats` |
| `Ocgtk_gdk.Gdk.Wrappers.Content_formats_builder` | `Ocgdk.Raw.Content_formats_builder` |
| `Ocgtk_gdk.Gdk.Wrappers.Content_provider` | `Ocgdk.Raw.Content_provider` |
| `Ocgtk_gdk.Gdk.Wrappers.Content_serializer` | `Ocgdk.Raw.Content_serializer` |
| `Ocgtk_gdk.Gdk.Wrappers.Crossing_event` | `Ocgdk.Raw.Crossing_event` |
| `Ocgtk_gdk.Gdk.Wrappers.Cursor` | `Ocgdk.Raw.Cursor` |
| `Ocgtk_gdk.Gdk.Wrappers.Delete_event` | `Ocgdk.Raw.Delete_event` |
| `Ocgtk_gdk.Gdk.Wrappers.Device` | `Ocgdk.Raw.Device` |
| `Ocgtk_gdk.Gdk.Wrappers.Device_pad` | `Ocgdk.Raw.Device_pad` |
| `Ocgtk_gdk.Gdk.Wrappers.Device_tool` | `Ocgdk.Raw.Device_tool` |
| `Ocgtk_gdk.Gdk.Wrappers.Display` | `Ocgdk.Raw.Display` |
| `Ocgtk_gdk.Gdk.Wrappers.Display_manager` | `Ocgdk.Raw.Display_manager` |
| `Ocgtk_gdk.Gdk.Wrappers.Dmabuf_formats` | `Ocgdk.Raw.Dmabuf_formats` |
| `Ocgtk_gdk.Gdk.Wrappers.Dmabuf_texture` | `Ocgdk.Raw.Dmabuf_texture` |
| `Ocgtk_gdk.Gdk.Wrappers.Dmabuf_texture_builder` | `Ocgdk.Raw.Dmabuf_texture_builder` |
| `Ocgtk_gdk.Gdk.Wrappers.Dnd_event` | `Ocgdk.Raw.Dnd_event` |
| `Ocgtk_gdk.Gdk.Wrappers.Drag` | `Ocgdk.Raw.Drag` |
| `Ocgtk_gdk.Gdk.Wrappers.Drag_surface` | `Ocgdk.Raw.Drag_surface` |
| `Ocgtk_gdk.Gdk.Wrappers.Drag_surface_size` | `Ocgdk.Raw.Drag_surface_size` |
| `Ocgtk_gdk.Gdk.Wrappers.Draw_context` | `Ocgdk.Raw.Draw_context` |
| `Ocgtk_gdk.Gdk.Wrappers.Drop` | `Ocgdk.Raw.Drop` |
| `Ocgtk_gdk.Gdk.Wrappers.Event` | `Ocgdk.Raw.Event` |
| `Ocgtk_gdk.Gdk.Wrappers.Event_sequence` | `Ocgdk.Raw.Event_sequence` |
| `Ocgtk_gdk.Gdk.Wrappers.File_list` | `Ocgdk.Raw.File_list` |
| `Ocgtk_gdk.Gdk.Wrappers.Focus_event` | `Ocgdk.Raw.Focus_event` |
| `Ocgtk_gdk.Gdk.Wrappers.Frame_clock` | `Ocgdk.Raw.Frame_clock` |
| `Ocgtk_gdk.Gdk.Wrappers.Frame_timings` | `Ocgdk.Raw.Frame_timings` |
| `Ocgtk_gdk.Gdk.Wrappers.Gl_context` | `Ocgdk.Raw.Gl_context` |
| `Ocgtk_gdk.Gdk.Wrappers.Gl_texture` | `Ocgdk.Raw.Gl_texture` |
| `Ocgtk_gdk.Gdk.Wrappers.Gl_texture_builder` | `Ocgdk.Raw.Gl_texture_builder` |
| `Ocgtk_gdk.Gdk.Wrappers.Grab_broken_event` | `Ocgdk.Raw.Grab_broken_event` |
| `Ocgtk_gdk.Gdk.Wrappers.Key_event` | `Ocgdk.Raw.Key_event` |
| `Ocgtk_gdk.Gdk.Wrappers.Keymap_key` | `Ocgdk.Raw.Keymap_key` |
| `Ocgtk_gdk.Gdk.Wrappers.Memory_texture` | `Ocgdk.Raw.Memory_texture` |
| `Ocgtk_gdk.Gdk.Wrappers.Memory_texture_builder` | `Ocgdk.Raw.Memory_texture_builder` |
| `Ocgtk_gdk.Gdk.Wrappers.Monitor` | `Ocgdk.Raw.Monitor` |
| `Ocgtk_gdk.Gdk.Wrappers.Motion_event` | `Ocgdk.Raw.Motion_event` |
| `Ocgtk_gdk.Gdk.Wrappers.Pad_event` | `Ocgdk.Raw.Pad_event` |
| `Ocgtk_gdk.Gdk.Wrappers.Paintable` | `Ocgdk.Raw.Paintable` |
| `Ocgtk_gdk.Gdk.Wrappers.Popup` | `Ocgdk.Raw.Popup` |
| `Ocgtk_gdk.Gdk.Wrappers.Popup_layout` | `Ocgdk.Raw.Popup_layout` |
| `Ocgtk_gdk.Gdk.Wrappers.Proximity_event` | `Ocgdk.Raw.Proximity_event` |
| `Ocgtk_gdk.Gdk.Wrappers.Rectangle` | `Ocgdk.Raw.Rectangle` |
| `Ocgtk_gdk.Gdk.Wrappers.Rgb_a` | `Ocgdk.Raw.Rgb_a` |
| `Ocgtk_gdk.Gdk.Wrappers.Scroll_event` | `Ocgdk.Raw.Scroll_event` |
| `Ocgtk_gdk.Gdk.Wrappers.Seat` | `Ocgdk.Raw.Seat` |
| `Ocgtk_gdk.Gdk.Wrappers.Snapshot` | `Ocgdk.Raw.Snapshot` |
| `Ocgtk_gdk.Gdk.Wrappers.Surface` | `Ocgdk.Raw.Surface` |
| `Ocgtk_gdk.Gdk.Wrappers.Texture` | `Ocgdk.Raw.Texture` |
| `Ocgtk_gdk.Gdk.Wrappers.Texture_downloader` | `Ocgdk.Raw.Texture_downloader` |
| `Ocgtk_gdk.Gdk.Wrappers.Time_coord` | `Ocgdk.Raw.Time_coord` |
| `Ocgtk_gdk.Gdk.Wrappers.Toplevel` | `Ocgdk.Raw.Toplevel` |
| `Ocgtk_gdk.Gdk.Wrappers.Toplevel_layout` | `Ocgdk.Raw.Toplevel_layout` |
| `Ocgtk_gdk.Gdk.Wrappers.Toplevel_size` | `Ocgdk.Raw.Toplevel_size` |
| `Ocgtk_gdk.Gdk.Wrappers.Touch_event` | `Ocgdk.Raw.Touch_event` |
| `Ocgtk_gdk.Gdk.Wrappers.Touchpad_event` | `Ocgdk.Raw.Touchpad_event` |
| `Ocgtk_gdk.Gdk.Wrappers.Vulkan_context` | `Ocgdk.Raw.Vulkan_context` |
| `Ocgtk_gdkpixbuf` | `Ocgdkpixbuf` |
| `Ocgtk_gdkpixbuf.GdkPixbuf` | `Ocgdkpixbuf` |
| `Ocgtk_gdkpixbuf.Gdkpixbuf_constants` | `Ocgdkpixbuf.Constants` |
| `Ocgtk_gdkpixbuf.Gdkpixbuf_enums` | `Ocgdkpixbuf.Enums` |
| `Ocgtk_gdkpixbuf.GdkPixbuf.Pixbuf` | `Ocgdkpixbuf.Pixbuf` |
| `Ocgtk_gdkpixbuf.GdkPixbuf.Pixbuf_animation` | `Ocgdkpixbuf.Pixbuf_animation` |
| `Ocgtk_gdkpixbuf.GdkPixbuf.Pixbuf_animation.class pixbuf_animation` | `Ocgdkpixbuf.Pixbuf_animation.class pixbuf_animation` |
| `Ocgtk_gdkpixbuf.GdkPixbuf.Pixbuf_animation.class type pixbuf_animation_t` | `Ocgdkpixbuf.Pixbuf_animation.class type pixbuf_animation_t` |
| `Ocgtk_gdkpixbuf.GdkPixbuf.Pixbuf_animation_iter` | `Ocgdkpixbuf.Pixbuf_animation_iter` |
| `Ocgtk_gdkpixbuf.GdkPixbuf.Pixbuf_animation_iter.class pixbuf_animation_iter` | `Ocgdkpixbuf.Pixbuf_animation_iter.class pixbuf_animation_iter` |
| `Ocgtk_gdkpixbuf.GdkPixbuf.Pixbuf_animation_iter.class type pixbuf_animation_iter_t` | `Ocgdkpixbuf.Pixbuf_animation_iter.class type pixbuf_animation_iter_t` |
| `Ocgtk_gdkpixbuf.GdkPixbuf.Pixbuf.class pixbuf` | `Ocgdkpixbuf.Pixbuf.class pixbuf` |
| `Ocgtk_gdkpixbuf.GdkPixbuf.Pixbuf.class type pixbuf_t` | `Ocgdkpixbuf.Pixbuf.class type pixbuf_t` |
| `Ocgtk_gdkpixbuf.GdkPixbuf.Pixbuf_format` | `Ocgdkpixbuf.Pixbuf_format` |
| `Ocgtk_gdkpixbuf.GdkPixbuf.Pixbuf_format.class pixbuf_format` | `Ocgdkpixbuf.Pixbuf_format.class pixbuf_format` |
| `Ocgtk_gdkpixbuf.GdkPixbuf.Pixbuf_format.class type pixbuf_format_t` | `Ocgdkpixbuf.Pixbuf_format.class type pixbuf_format_t` |
| `Ocgtk_gdkpixbuf.GdkPixbuf.Pixbuf_loader` | `Ocgdkpixbuf.Pixbuf_loader` |
| `Ocgtk_gdkpixbuf.GdkPixbuf.Pixbuf_loader.class pixbuf_loader` | `Ocgdkpixbuf.Pixbuf_loader.class pixbuf_loader` |
| `Ocgtk_gdkpixbuf.GdkPixbuf.Pixbuf_loader.class type pixbuf_loader_t` | `Ocgdkpixbuf.Pixbuf_loader.class type pixbuf_loader_t` |
| `Ocgtk_gdkpixbuf.GdkPixbuf.Pixbuf_simple_anim` | `Ocgdkpixbuf.Pixbuf_simple_anim` |
| `Ocgtk_gdkpixbuf.GdkPixbuf.Pixbuf_simple_anim.class pixbuf_simple_anim` | `Ocgdkpixbuf.Pixbuf_simple_anim.class pixbuf_simple_anim` |
| `Ocgtk_gdkpixbuf.GdkPixbuf.Pixbuf_simple_anim.class type pixbuf_simple_anim_t` | `Ocgdkpixbuf.Pixbuf_simple_anim.class type pixbuf_simple_anim_t` |
| `Ocgtk_gdkpixbuf.GdkPixbuf.Pixbuf_simple_anim_iter` | `Ocgdkpixbuf.Pixbuf_simple_anim_iter` |
| `Ocgtk_gdkpixbuf.GdkPixbuf.Pixbuf_simple_anim_iter.class pixbuf_simple_anim_iter` | `Ocgdkpixbuf.Pixbuf_simple_anim_iter.class pixbuf_simple_anim_iter` |
| `Ocgtk_gdkpixbuf.GdkPixbuf.Pixbuf_simple_anim_iter.class type pixbuf_simple_anim_iter_t` | `Ocgdkpixbuf.Pixbuf_simple_anim_iter.class type pixbuf_simple_anim_iter_t` |
| `Ocgtk_gdkpixbuf.GdkPixbuf.Wrappers` | `Ocgdkpixbuf.Raw` |
| `Ocgtk_gdkpixbuf.GdkPixbuf.Wrappers.Pixbuf` | `Ocgdkpixbuf.Raw.Pixbuf` |
| `Ocgtk_gdkpixbuf.GdkPixbuf.Wrappers.Pixbuf_animation` | `Ocgdkpixbuf.Raw.Pixbuf_animation` |
| `Ocgtk_gdkpixbuf.GdkPixbuf.Wrappers.Pixbuf_animation_iter` | `Ocgdkpixbuf.Raw.Pixbuf_animation_iter` |
| `Ocgtk_gdkpixbuf.GdkPixbuf.Wrappers.Pixbuf_format` | `Ocgdkpixbuf.Raw.Pixbuf_format` |
| `Ocgtk_gdkpixbuf.GdkPixbuf.Wrappers.Pixbuf_loader` | `Ocgdkpixbuf.Raw.Pixbuf_loader` |
| `Ocgtk_gdkpixbuf.GdkPixbuf.Wrappers.Pixbuf_simple_anim` | `Ocgdkpixbuf.Raw.Pixbuf_simple_anim` |
| `Ocgtk_gdkpixbuf.GdkPixbuf.Wrappers.Pixbuf_simple_anim_iter` | `Ocgdkpixbuf.Raw.Pixbuf_simple_anim_iter` |
| `Ocgtk_gio` | `Ocgio` |
| `Ocgtk_gio.Gio` | `Ocgio` |
| `Ocgtk_gio.Gio.Action` | `Ocgio.Action` |
| `Ocgtk_gio.Gio.Action.class action` | `Ocgio.Action.class action` |
| `Ocgtk_gio.Gio.Action.class type action_t` | `Ocgio.Action.class type action_t` |
| `Ocgtk_gio.Gio.Action_entry` | `Ocgio.Action_entry` |
| `Ocgtk_gio.Gio.Action_entry.class action_entry` | `Ocgio.Action_entry.class action_entry` |
| `Ocgtk_gio.Gio.Action_entry.class type action_entry_t` | `Ocgio.Action_entry.class type action_entry_t` |
| `Ocgtk_gio.Gio.Action_group` | `Ocgio.Action_group` |
| `Ocgtk_gio.Gio.Action_group.class action_group` | `Ocgio.Action_group.class action_group` |
| `Ocgtk_gio.Gio.Action_group.class type action_group_t` | `Ocgio.Action_group.class type action_group_t` |
| `Ocgtk_gio.Gio.Action_map` | `Ocgio.Action_map` |
| `Ocgtk_gio.Gio.Action_map.class action_map` | `Ocgio.Action_map.class action_map` |
| `Ocgtk_gio.Gio.Action_map.class type action_map_t` | `Ocgio.Action_map.class type action_map_t` |
| `Ocgtk_gio.Gio.App_info` | `Ocgio.App_info` |
| `Ocgtk_gio.Gio.App_info.class app_info` | `Ocgio.App_info.class app_info` |
| `Ocgtk_gio.Gio.App_info.class type app_info_t` | `Ocgio.App_info.class type app_info_t` |
| `Ocgtk_gio.Gio.App_info_monitor` | `Ocgio.App_info_monitor` |
| `Ocgtk_gio.Gio.App_info_monitor.class app_info_monitor` | `Ocgio.App_info_monitor.class app_info_monitor` |
| `Ocgtk_gio.Gio.App_info_monitor.class type app_info_monitor_t` | `Ocgio.App_info_monitor.class type app_info_monitor_t` |
| `Ocgtk_gio.Gio.App_launch_context` | `Ocgio.App_launch_context` |
| `Ocgtk_gio.Gio.App_launch_context.class app_launch_context` | `Ocgio.App_launch_context.class app_launch_context` |
| `Ocgtk_gio.Gio.App_launch_context.class type app_launch_context_t` | `Ocgio.App_launch_context.class type app_launch_context_t` |
| `Ocgtk_gio.Gio.Application` | `Ocgio.Application` |
| `Ocgtk_gio.Gio.Application.class application` | `Ocgio.Application.class application` |
| `Ocgtk_gio.Gio.Application.class type application_t` | `Ocgio.Application.class type application_t` |
| `Ocgtk_gio.Gio.Application_command_line` | `Ocgio.Application_command_line` |
| `Ocgtk_gio.Gio.Application_command_line.class application_command_line` | `Ocgio.Application_command_line.class application_command_line` |
| `Ocgtk_gio.Gio.Application_command_line.class type application_command_line_t` | `Ocgio.Application_command_line.class type application_command_line_t` |
| `Ocgtk_gio.Gio.Async_initable` | `Ocgio.Async_initable` |
| `Ocgtk_gio.Gio.Async_initable.class async_initable` | `Ocgio.Async_initable.class async_initable` |
| `Ocgtk_gio.Gio.Async_initable.class type async_initable_t` | `Ocgio.Async_initable.class type async_initable_t` |
| `Ocgtk_gio.Gio.Async_result` | `Ocgio.Async_result` |
| `Ocgtk_gio.Gio.Async_result.class async_result` | `Ocgio.Async_result.class async_result` |
| `Ocgtk_gio.Gio.Async_result.class type async_result_t` | `Ocgio.Async_result.class type async_result_t` |
| `Ocgtk_gio.Gio.Buffered_input_stream` | `Ocgio.Buffered_input_stream` |
| `Ocgtk_gio.Gio.Buffered_input_stream.class buffered_input_stream` | `Ocgio.Buffered_input_stream.class buffered_input_stream` |
| `Ocgtk_gio.Gio.Buffered_input_stream.class type buffered_input_stream_t` | `Ocgio.Buffered_input_stream.class type buffered_input_stream_t` |
| `Ocgtk_gio.Gio.Buffered_output_stream` | `Ocgio.Buffered_output_stream` |
| `Ocgtk_gio.Gio.Buffered_output_stream.class buffered_output_stream` | `Ocgio.Buffered_output_stream.class buffered_output_stream` |
| `Ocgtk_gio.Gio.Buffered_output_stream.class type buffered_output_stream_t` | `Ocgio.Buffered_output_stream.class type buffered_output_stream_t` |
| `Ocgtk_gio.Gio.Bytes_icon` | `Ocgio.Bytes_icon` |
| `Ocgtk_gio.Gio.Bytes_icon.class bytes_icon` | `Ocgio.Bytes_icon.class bytes_icon` |
| `Ocgtk_gio.Gio.Bytes_icon.class type bytes_icon_t` | `Ocgio.Bytes_icon.class type bytes_icon_t` |
| `Ocgtk_gio.Gio.Cancellable` | `Ocgio.Cancellable` |
| `Ocgtk_gio.Gio.Cancellable.class cancellable` | `Ocgio.Cancellable.class cancellable` |
| `Ocgtk_gio.Gio.Cancellable.class type cancellable_t` | `Ocgio.Cancellable.class type cancellable_t` |
| `Ocgtk_gio.Gio.Charset_converter` | `Ocgio.Charset_converter` |
| `Ocgtk_gio.Gio.Charset_converter.class charset_converter` | `Ocgio.Charset_converter.class charset_converter` |
| `Ocgtk_gio.Gio.Charset_converter.class type charset_converter_t` | `Ocgio.Charset_converter.class type charset_converter_t` |
| `Ocgtk_gio.Gio_constants` | `Ocgio.Constants` |
| `Ocgtk_gio.Gio.Converter` | `Ocgio.Converter` |
| `Ocgtk_gio.Gio.Converter.class converter` | `Ocgio.Converter.class converter` |
| `Ocgtk_gio.Gio.Converter.class type converter_t` | `Ocgio.Converter.class type converter_t` |
| `Ocgtk_gio.Gio.Converter_input_stream` | `Ocgio.Converter_input_stream` |
| `Ocgtk_gio.Gio.Converter_input_stream.class converter_input_stream` | `Ocgio.Converter_input_stream.class converter_input_stream` |
| `Ocgtk_gio.Gio.Converter_input_stream.class type converter_input_stream_t` | `Ocgio.Converter_input_stream.class type converter_input_stream_t` |
| `Ocgtk_gio.Gio.Converter_output_stream` | `Ocgio.Converter_output_stream` |
| `Ocgtk_gio.Gio.Converter_output_stream.class converter_output_stream` | `Ocgio.Converter_output_stream.class converter_output_stream` |
| `Ocgtk_gio.Gio.Converter_output_stream.class type converter_output_stream_t` | `Ocgio.Converter_output_stream.class type converter_output_stream_t` |
| `Ocgtk_gio.Gio.Credentials` | `Ocgio.Credentials` |
| `Ocgtk_gio.Gio.Credentials.class credentials` | `Ocgio.Credentials.class credentials` |
| `Ocgtk_gio.Gio.Credentials.class type credentials_t` | `Ocgio.Credentials.class type credentials_t` |
| `Ocgtk_gio.Gio.Datagram_based` | `Ocgio.Datagram_based` |
| `Ocgtk_gio.Gio.Datagram_based.class datagram_based` | `Ocgio.Datagram_based.class datagram_based` |
| `Ocgtk_gio.Gio.Datagram_based.class type datagram_based_t` | `Ocgio.Datagram_based.class type datagram_based_t` |
| `Ocgtk_gio.Gio.Data_input_stream` | `Ocgio.Data_input_stream` |
| `Ocgtk_gio.Gio.Data_input_stream.class data_input_stream` | `Ocgio.Data_input_stream.class data_input_stream` |
| `Ocgtk_gio.Gio.Data_input_stream.class type data_input_stream_t` | `Ocgio.Data_input_stream.class type data_input_stream_t` |
| `Ocgtk_gio.Gio.Data_output_stream` | `Ocgio.Data_output_stream` |
| `Ocgtk_gio.Gio.Data_output_stream.class data_output_stream` | `Ocgio.Data_output_stream.class data_output_stream` |
| `Ocgtk_gio.Gio.Data_output_stream.class type data_output_stream_t` | `Ocgio.Data_output_stream.class type data_output_stream_t` |
| `Ocgtk_gio.Gio.D_bus_action_group` | `Ocgio.D_bus_action_group` |
| `Ocgtk_gio.Gio.D_bus_action_group.class d_bus_action_group` | `Ocgio.D_bus_action_group.class d_bus_action_group` |
| `Ocgtk_gio.Gio.D_bus_action_group.class type d_bus_action_group_t` | `Ocgio.D_bus_action_group.class type d_bus_action_group_t` |
| `Ocgtk_gio.Gio.D_bus_annotation_info` | `Ocgio.D_bus_annotation_info` |
| `Ocgtk_gio.Gio.D_bus_annotation_info.class d_bus_annotation_info` | `Ocgio.D_bus_annotation_info.class d_bus_annotation_info` |
| `Ocgtk_gio.Gio.D_bus_annotation_info.class type d_bus_annotation_info_t` | `Ocgio.D_bus_annotation_info.class type d_bus_annotation_info_t` |
| `Ocgtk_gio.Gio.D_bus_arg_info` | `Ocgio.D_bus_arg_info` |
| `Ocgtk_gio.Gio.D_bus_arg_info.class d_bus_arg_info` | `Ocgio.D_bus_arg_info.class d_bus_arg_info` |
| `Ocgtk_gio.Gio.D_bus_arg_info.class type d_bus_arg_info_t` | `Ocgio.D_bus_arg_info.class type d_bus_arg_info_t` |
| `Ocgtk_gio.Gio.D_bus_auth_observer` | `Ocgio.D_bus_auth_observer` |
| `Ocgtk_gio.Gio.D_bus_auth_observer.class d_bus_auth_observer` | `Ocgio.D_bus_auth_observer.class d_bus_auth_observer` |
| `Ocgtk_gio.Gio.D_bus_auth_observer.class type d_bus_auth_observer_t` | `Ocgio.D_bus_auth_observer.class type d_bus_auth_observer_t` |
| `Ocgtk_gio.Gio.D_bus_connection` | `Ocgio.D_bus_connection` |
| `Ocgtk_gio.Gio.D_bus_connection.class d_bus_connection` | `Ocgio.D_bus_connection.class d_bus_connection` |
| `Ocgtk_gio.Gio.D_bus_connection.class type d_bus_connection_t` | `Ocgio.D_bus_connection.class type d_bus_connection_t` |
| `Ocgtk_gio.Gio.D_bus_error_entry` | `Ocgio.D_bus_error_entry` |
| `Ocgtk_gio.Gio.D_bus_error_entry.class d_bus_error_entry` | `Ocgio.D_bus_error_entry.class d_bus_error_entry` |
| `Ocgtk_gio.Gio.D_bus_error_entry.class type d_bus_error_entry_t` | `Ocgio.D_bus_error_entry.class type d_bus_error_entry_t` |
| `Ocgtk_gio.Gio.D_bus_interface` | `Ocgio.D_bus_interface` |
| `Ocgtk_gio.Gio.D_bus_interface.class d_bus_interface` | `Ocgio.D_bus_interface.class d_bus_interface` |
| `Ocgtk_gio.Gio.D_bus_interface.class type d_bus_interface_t` | `Ocgio.D_bus_interface.class type d_bus_interface_t` |
| `Ocgtk_gio.Gio.D_bus_interface_info` | `Ocgio.D_bus_interface_info` |
| `Ocgtk_gio.Gio.D_bus_interface_info.class d_bus_interface_info` | `Ocgio.D_bus_interface_info.class d_bus_interface_info` |
| `Ocgtk_gio.Gio.D_bus_interface_info.class type d_bus_interface_info_t` | `Ocgio.D_bus_interface_info.class type d_bus_interface_info_t` |
| `Ocgtk_gio.Gio.D_bus_interface_skeleton` | `Ocgio.D_bus_interface_skeleton` |
| `Ocgtk_gio.Gio.D_bus_interface_skeleton.class d_bus_interface_skeleton` | `Ocgio.D_bus_interface_skeleton.class d_bus_interface_skeleton` |
| `Ocgtk_gio.Gio.D_bus_interface_skeleton.class type d_bus_interface_skeleton_t` | `Ocgio.D_bus_interface_skeleton.class type d_bus_interface_skeleton_t` |
| `Ocgtk_gio.Gio.D_bus_interface_v_table` | `Ocgio.D_bus_interface_v_table` |
| `Ocgtk_gio.Gio.D_bus_interface_v_table.class d_bus_interface_v_table` | `Ocgio.D_bus_interface_v_table.class d_bus_interface_v_table` |
| `Ocgtk_gio.Gio.D_bus_interface_v_table.class type d_bus_interface_v_table_t` | `Ocgio.D_bus_interface_v_table.class type d_bus_interface_v_table_t` |
| `Ocgtk_gio.Gio.D_bus_menu_model` | `Ocgio.D_bus_menu_model` |
| `Ocgtk_gio.Gio.D_bus_menu_model.class d_bus_menu_model` | `Ocgio.D_bus_menu_model.class d_bus_menu_model` |
| `Ocgtk_gio.Gio.D_bus_menu_model.class type d_bus_menu_model_t` | `Ocgio.D_bus_menu_model.class type d_bus_menu_model_t` |
| `Ocgtk_gio.Gio.D_bus_message` | `Ocgio.D_bus_message` |
| `Ocgtk_gio.Gio.D_bus_message.class d_bus_message` | `Ocgio.D_bus_message.class d_bus_message` |
| `Ocgtk_gio.Gio.D_bus_message.class type d_bus_message_t` | `Ocgio.D_bus_message.class type d_bus_message_t` |
| `Ocgtk_gio.Gio.D_bus_method_info` | `Ocgio.D_bus_method_info` |
| `Ocgtk_gio.Gio.D_bus_method_info.class d_bus_method_info` | `Ocgio.D_bus_method_info.class d_bus_method_info` |
| `Ocgtk_gio.Gio.D_bus_method_info.class type d_bus_method_info_t` | `Ocgio.D_bus_method_info.class type d_bus_method_info_t` |
| `Ocgtk_gio.Gio.D_bus_method_invocation` | `Ocgio.D_bus_method_invocation` |
| `Ocgtk_gio.Gio.D_bus_method_invocation.class d_bus_method_invocation` | `Ocgio.D_bus_method_invocation.class d_bus_method_invocation` |
| `Ocgtk_gio.Gio.D_bus_method_invocation.class type d_bus_method_invocation_t` | `Ocgio.D_bus_method_invocation.class type d_bus_method_invocation_t` |
| `Ocgtk_gio.Gio.D_bus_node_info` | `Ocgio.D_bus_node_info` |
| `Ocgtk_gio.Gio.D_bus_node_info.class d_bus_node_info` | `Ocgio.D_bus_node_info.class d_bus_node_info` |
| `Ocgtk_gio.Gio.D_bus_node_info.class type d_bus_node_info_t` | `Ocgio.D_bus_node_info.class type d_bus_node_info_t` |
| `Ocgtk_gio.Gio.D_bus_object` | `Ocgio.D_bus_object` |
| `Ocgtk_gio.Gio.D_bus_object.class d_bus_object` | `Ocgio.D_bus_object.class d_bus_object` |
| `Ocgtk_gio.Gio.D_bus_object.class type d_bus_object_t` | `Ocgio.D_bus_object.class type d_bus_object_t` |
| `Ocgtk_gio.Gio.D_bus_object_manager` | `Ocgio.D_bus_object_manager` |
| `Ocgtk_gio.Gio.D_bus_object_manager.class d_bus_object_manager` | `Ocgio.D_bus_object_manager.class d_bus_object_manager` |
| `Ocgtk_gio.Gio.D_bus_object_manager.class type d_bus_object_manager_t` | `Ocgio.D_bus_object_manager.class type d_bus_object_manager_t` |
| `Ocgtk_gio.Gio.D_bus_object_manager_client` | `Ocgio.D_bus_object_manager_client` |
| `Ocgtk_gio.Gio.D_bus_object_manager_client.class d_bus_object_manager_client` | `Ocgio.D_bus_object_manager_client.class d_bus_object_manager_client` |
| `Ocgtk_gio.Gio.D_bus_object_manager_client.class type d_bus_object_manager_client_t` | `Ocgio.D_bus_object_manager_client.class type d_bus_object_manager_client_t` |
| `Ocgtk_gio.Gio.D_bus_object_manager_server` | `Ocgio.D_bus_object_manager_server` |
| `Ocgtk_gio.Gio.D_bus_object_manager_server.class d_bus_object_manager_server` | `Ocgio.D_bus_object_manager_server.class d_bus_object_manager_server` |
| `Ocgtk_gio.Gio.D_bus_object_manager_server.class type d_bus_object_manager_server_t` | `Ocgio.D_bus_object_manager_server.class type d_bus_object_manager_server_t` |
| `Ocgtk_gio.Gio.D_bus_object_proxy` | `Ocgio.D_bus_object_proxy` |
| `Ocgtk_gio.Gio.D_bus_object_proxy.class d_bus_object_proxy` | `Ocgio.D_bus_object_proxy.class d_bus_object_proxy` |
| `Ocgtk_gio.Gio.D_bus_object_proxy.class type d_bus_object_proxy_t` | `Ocgio.D_bus_object_proxy.class type d_bus_object_proxy_t` |
| `Ocgtk_gio.Gio.D_bus_object_skeleton` | `Ocgio.D_bus_object_skeleton` |
| `Ocgtk_gio.Gio.D_bus_object_skeleton.class d_bus_object_skeleton` | `Ocgio.D_bus_object_skeleton.class d_bus_object_skeleton` |
| `Ocgtk_gio.Gio.D_bus_object_skeleton.class type d_bus_object_skeleton_t` | `Ocgio.D_bus_object_skeleton.class type d_bus_object_skeleton_t` |
| `Ocgtk_gio.Gio.D_bus_property_info` | `Ocgio.D_bus_property_info` |
| `Ocgtk_gio.Gio.D_bus_property_info.class d_bus_property_info` | `Ocgio.D_bus_property_info.class d_bus_property_info` |
| `Ocgtk_gio.Gio.D_bus_property_info.class type d_bus_property_info_t` | `Ocgio.D_bus_property_info.class type d_bus_property_info_t` |
| `Ocgtk_gio.Gio.D_bus_proxy` | `Ocgio.D_bus_proxy` |
| `Ocgtk_gio.Gio.D_bus_proxy.class d_bus_proxy` | `Ocgio.D_bus_proxy.class d_bus_proxy` |
| `Ocgtk_gio.Gio.D_bus_proxy.class type d_bus_proxy_t` | `Ocgio.D_bus_proxy.class type d_bus_proxy_t` |
| `Ocgtk_gio.Gio.D_bus_server` | `Ocgio.D_bus_server` |
| `Ocgtk_gio.Gio.D_bus_server.class d_bus_server` | `Ocgio.D_bus_server.class d_bus_server` |
| `Ocgtk_gio.Gio.D_bus_server.class type d_bus_server_t` | `Ocgio.D_bus_server.class type d_bus_server_t` |
| `Ocgtk_gio.Gio.D_bus_signal_info` | `Ocgio.D_bus_signal_info` |
| `Ocgtk_gio.Gio.D_bus_signal_info.class d_bus_signal_info` | `Ocgio.D_bus_signal_info.class d_bus_signal_info` |
| `Ocgtk_gio.Gio.D_bus_signal_info.class type d_bus_signal_info_t` | `Ocgio.D_bus_signal_info.class type d_bus_signal_info_t` |
| `Ocgtk_gio.Gio.D_bus_subtree_v_table` | `Ocgio.D_bus_subtree_v_table` |
| `Ocgtk_gio.Gio.D_bus_subtree_v_table.class d_bus_subtree_v_table` | `Ocgio.D_bus_subtree_v_table.class d_bus_subtree_v_table` |
| `Ocgtk_gio.Gio.D_bus_subtree_v_table.class type d_bus_subtree_v_table_t` | `Ocgio.D_bus_subtree_v_table.class type d_bus_subtree_v_table_t` |
| `Ocgtk_gio.Gio.Debug_controller` | `Ocgio.Debug_controller` |
| `Ocgtk_gio.Gio.Debug_controller.class debug_controller` | `Ocgio.Debug_controller.class debug_controller` |
| `Ocgtk_gio.Gio.Debug_controller.class type debug_controller_t` | `Ocgio.Debug_controller.class type debug_controller_t` |
| `Ocgtk_gio.Gio.Debug_controller_d_bus` | `Ocgio.Debug_controller_d_bus` |
| `Ocgtk_gio.Gio.Debug_controller_d_bus.class debug_controller_d_bus` | `Ocgio.Debug_controller_d_bus.class debug_controller_d_bus` |
| `Ocgtk_gio.Gio.Debug_controller_d_bus.class type debug_controller_d_bus_t` | `Ocgio.Debug_controller_d_bus.class type debug_controller_d_bus_t` |
| `Ocgtk_gio.Gio.Drive` | `Ocgio.Drive` |
| `Ocgtk_gio.Gio.Drive.class drive` | `Ocgio.Drive.class drive` |
| `Ocgtk_gio.Gio.Drive.class type drive_t` | `Ocgio.Drive.class type drive_t` |
| `Ocgtk_gio.Gio.Dtls_client_connection` | `Ocgio.Dtls_client_connection` |
| `Ocgtk_gio.Gio.Dtls_client_connection.class dtls_client_connection` | `Ocgio.Dtls_client_connection.class dtls_client_connection` |
| `Ocgtk_gio.Gio.Dtls_client_connection.class type dtls_client_connection_t` | `Ocgio.Dtls_client_connection.class type dtls_client_connection_t` |
| `Ocgtk_gio.Gio.Dtls_connection` | `Ocgio.Dtls_connection` |
| `Ocgtk_gio.Gio.Dtls_connection.class dtls_connection` | `Ocgio.Dtls_connection.class dtls_connection` |
| `Ocgtk_gio.Gio.Dtls_connection.class type dtls_connection_t` | `Ocgio.Dtls_connection.class type dtls_connection_t` |
| `Ocgtk_gio.Gio.Dtls_server_connection` | `Ocgio.Dtls_server_connection` |
| `Ocgtk_gio.Gio.Dtls_server_connection.class dtls_server_connection` | `Ocgio.Dtls_server_connection.class dtls_server_connection` |
| `Ocgtk_gio.Gio.Dtls_server_connection.class type dtls_server_connection_t` | `Ocgio.Dtls_server_connection.class type dtls_server_connection_t` |
| `Ocgtk_gio.Gio.Emblem` | `Ocgio.Emblem` |
| `Ocgtk_gio.Gio.Emblem.class emblem` | `Ocgio.Emblem.class emblem` |
| `Ocgtk_gio.Gio.Emblem.class type emblem_t` | `Ocgio.Emblem.class type emblem_t` |
| `Ocgtk_gio.Gio.Emblemed_icon` | `Ocgio.Emblemed_icon` |
| `Ocgtk_gio.Gio.Emblemed_icon.class emblemed_icon` | `Ocgio.Emblemed_icon.class emblemed_icon` |
| `Ocgtk_gio.Gio.Emblemed_icon.class type emblemed_icon_t` | `Ocgio.Emblemed_icon.class type emblemed_icon_t` |
| `Ocgtk_gio.Gio_enums` | `Ocgio.Enums` |
| `Ocgtk_gio.Gio.File` | `Ocgio.File` |
| `Ocgtk_gio.Gio.File_attribute_info` | `Ocgio.File_attribute_info` |
| `Ocgtk_gio.Gio.File_attribute_info.class file_attribute_info` | `Ocgio.File_attribute_info.class file_attribute_info` |
| `Ocgtk_gio.Gio.File_attribute_info.class type file_attribute_info_t` | `Ocgio.File_attribute_info.class type file_attribute_info_t` |
| `Ocgtk_gio.Gio.File_attribute_info_list` | `Ocgio.File_attribute_info_list` |
| `Ocgtk_gio.Gio.File_attribute_info_list.class file_attribute_info_list` | `Ocgio.File_attribute_info_list.class file_attribute_info_list` |
| `Ocgtk_gio.Gio.File_attribute_info_list.class type file_attribute_info_list_t` | `Ocgio.File_attribute_info_list.class type file_attribute_info_list_t` |
| `Ocgtk_gio.Gio.File_attribute_matcher` | `Ocgio.File_attribute_matcher` |
| `Ocgtk_gio.Gio.File_attribute_matcher.class file_attribute_matcher` | `Ocgio.File_attribute_matcher.class file_attribute_matcher` |
| `Ocgtk_gio.Gio.File_attribute_matcher.class type file_attribute_matcher_t` | `Ocgio.File_attribute_matcher.class type file_attribute_matcher_t` |
| `Ocgtk_gio.Gio.File.class file` | `Ocgio.File.class file` |
| `Ocgtk_gio.Gio.File.class type file_t` | `Ocgio.File.class type file_t` |
| `Ocgtk_gio.Gio.File_enumerator` | `Ocgio.File_enumerator` |
| `Ocgtk_gio.Gio.File_enumerator.class file_enumerator` | `Ocgio.File_enumerator.class file_enumerator` |
| `Ocgtk_gio.Gio.File_enumerator.class type file_enumerator_t` | `Ocgio.File_enumerator.class type file_enumerator_t` |
| `Ocgtk_gio.Gio.File_icon` | `Ocgio.File_icon` |
| `Ocgtk_gio.Gio.File_icon.class file_icon` | `Ocgio.File_icon.class file_icon` |
| `Ocgtk_gio.Gio.File_icon.class type file_icon_t` | `Ocgio.File_icon.class type file_icon_t` |
| `Ocgtk_gio.Gio.File_info` | `Ocgio.File_info` |
| `Ocgtk_gio.Gio.File_info.class file_info` | `Ocgio.File_info.class file_info` |
| `Ocgtk_gio.Gio.File_info.class type file_info_t` | `Ocgio.File_info.class type file_info_t` |
| `Ocgtk_gio.Gio.File_input_stream` | `Ocgio.File_input_stream` |
| `Ocgtk_gio.Gio.File_input_stream.class file_input_stream` | `Ocgio.File_input_stream.class file_input_stream` |
| `Ocgtk_gio.Gio.File_input_stream.class type file_input_stream_t` | `Ocgio.File_input_stream.class type file_input_stream_t` |
| `Ocgtk_gio.Gio.File_io_stream` | `Ocgio.File_io_stream` |
| `Ocgtk_gio.Gio.File_io_stream.class file_io_stream` | `Ocgio.File_io_stream.class file_io_stream` |
| `Ocgtk_gio.Gio.File_io_stream.class type file_io_stream_t` | `Ocgio.File_io_stream.class type file_io_stream_t` |
| `Ocgtk_gio.Gio.File_monitor` | `Ocgio.File_monitor` |
| `Ocgtk_gio.Gio.File_monitor.class file_monitor` | `Ocgio.File_monitor.class file_monitor` |
| `Ocgtk_gio.Gio.File_monitor.class type file_monitor_t` | `Ocgio.File_monitor.class type file_monitor_t` |
| `Ocgtk_gio.Gio.Filename_completer` | `Ocgio.Filename_completer` |
| `Ocgtk_gio.Gio.Filename_completer.class filename_completer` | `Ocgio.Filename_completer.class filename_completer` |
| `Ocgtk_gio.Gio.Filename_completer.class type filename_completer_t` | `Ocgio.Filename_completer.class type filename_completer_t` |
| `Ocgtk_gio.Gio.File_output_stream` | `Ocgio.File_output_stream` |
| `Ocgtk_gio.Gio.File_output_stream.class file_output_stream` | `Ocgio.File_output_stream.class file_output_stream` |
| `Ocgtk_gio.Gio.File_output_stream.class type file_output_stream_t` | `Ocgio.File_output_stream.class type file_output_stream_t` |
| `Ocgtk_gio.Gio.Filter_input_stream` | `Ocgio.Filter_input_stream` |
| `Ocgtk_gio.Gio.Filter_input_stream.class filter_input_stream` | `Ocgio.Filter_input_stream.class filter_input_stream` |
| `Ocgtk_gio.Gio.Filter_input_stream.class type filter_input_stream_t` | `Ocgio.Filter_input_stream.class type filter_input_stream_t` |
| `Ocgtk_gio.Gio.Filter_output_stream` | `Ocgio.Filter_output_stream` |
| `Ocgtk_gio.Gio.Filter_output_stream.class filter_output_stream` | `Ocgio.Filter_output_stream.class filter_output_stream` |
| `Ocgtk_gio.Gio.Filter_output_stream.class type filter_output_stream_t` | `Ocgio.Filter_output_stream.class type filter_output_stream_t` |
| `Ocgtk_gio.Gio.Icon` | `Ocgio.Icon` |
| `Ocgtk_gio.Gio.Icon.class icon` | `Ocgio.Icon.class icon` |
| `Ocgtk_gio.Gio.Icon.class type icon_t` | `Ocgio.Icon.class type icon_t` |
| `Ocgtk_gio.Gio.Inet_address` | `Ocgio.Inet_address` |
| `Ocgtk_gio.Gio.Inet_address.class inet_address` | `Ocgio.Inet_address.class inet_address` |
| `Ocgtk_gio.Gio.Inet_address.class type inet_address_t` | `Ocgio.Inet_address.class type inet_address_t` |
| `Ocgtk_gio.Gio.Inet_address_mask` | `Ocgio.Inet_address_mask` |
| `Ocgtk_gio.Gio.Inet_address_mask.class inet_address_mask` | `Ocgio.Inet_address_mask.class inet_address_mask` |
| `Ocgtk_gio.Gio.Inet_address_mask.class type inet_address_mask_t` | `Ocgio.Inet_address_mask.class type inet_address_mask_t` |
| `Ocgtk_gio.Gio.Inet_socket_address` | `Ocgio.Inet_socket_address` |
| `Ocgtk_gio.Gio.Inet_socket_address.class inet_socket_address` | `Ocgio.Inet_socket_address.class inet_socket_address` |
| `Ocgtk_gio.Gio.Inet_socket_address.class type inet_socket_address_t` | `Ocgio.Inet_socket_address.class type inet_socket_address_t` |
| `Ocgtk_gio.Gio.Initable` | `Ocgio.Initable` |
| `Ocgtk_gio.Gio.Initable.class initable` | `Ocgio.Initable.class initable` |
| `Ocgtk_gio.Gio.Initable.class type initable_t` | `Ocgio.Initable.class type initable_t` |
| `Ocgtk_gio.Gio.Input_message` | `Ocgio.Input_message` |
| `Ocgtk_gio.Gio.Input_message.class input_message` | `Ocgio.Input_message.class input_message` |
| `Ocgtk_gio.Gio.Input_message.class type input_message_t` | `Ocgio.Input_message.class type input_message_t` |
| `Ocgtk_gio.Gio.Input_stream` | `Ocgio.Input_stream` |
| `Ocgtk_gio.Gio.Input_stream.class input_stream` | `Ocgio.Input_stream.class input_stream` |
| `Ocgtk_gio.Gio.Input_stream.class type input_stream_t` | `Ocgio.Input_stream.class type input_stream_t` |
| `Ocgtk_gio.Gio.Input_vector` | `Ocgio.Input_vector` |
| `Ocgtk_gio.Gio.Input_vector.class input_vector` | `Ocgio.Input_vector.class input_vector` |
| `Ocgtk_gio.Gio.Input_vector.class type input_vector_t` | `Ocgio.Input_vector.class type input_vector_t` |
| `Ocgtk_gio.Gio.Io_extension` | `Ocgio.Io_extension` |
| `Ocgtk_gio.Gio.Io_extension.class io_extension` | `Ocgio.Io_extension.class io_extension` |
| `Ocgtk_gio.Gio.Io_extension.class type io_extension_t` | `Ocgio.Io_extension.class type io_extension_t` |
| `Ocgtk_gio.Gio.Io_extension_point` | `Ocgio.Io_extension_point` |
| `Ocgtk_gio.Gio.Io_extension_point.class io_extension_point` | `Ocgio.Io_extension_point.class io_extension_point` |
| `Ocgtk_gio.Gio.Io_extension_point.class type io_extension_point_t` | `Ocgio.Io_extension_point.class type io_extension_point_t` |
| `Ocgtk_gio.Gio.Io_module` | `Ocgio.Io_module` |
| `Ocgtk_gio.Gio.Io_module.class io_module` | `Ocgio.Io_module.class io_module` |
| `Ocgtk_gio.Gio.Io_module.class type io_module_t` | `Ocgio.Io_module.class type io_module_t` |
| `Ocgtk_gio.Gio.Io_module_scope` | `Ocgio.Io_module_scope` |
| `Ocgtk_gio.Gio.Io_module_scope.class io_module_scope` | `Ocgio.Io_module_scope.class io_module_scope` |
| `Ocgtk_gio.Gio.Io_module_scope.class type io_module_scope_t` | `Ocgio.Io_module_scope.class type io_module_scope_t` |
| `Ocgtk_gio.Gio.Io_scheduler_job` | `Ocgio.Io_scheduler_job` |
| `Ocgtk_gio.Gio.Io_scheduler_job.class io_scheduler_job` | `Ocgio.Io_scheduler_job.class io_scheduler_job` |
| `Ocgtk_gio.Gio.Io_scheduler_job.class type io_scheduler_job_t` | `Ocgio.Io_scheduler_job.class type io_scheduler_job_t` |
| `Ocgtk_gio.Gio.Io_stream` | `Ocgio.Io_stream` |
| `Ocgtk_gio.Gio.Io_stream_adapter` | `Ocgio.Io_stream_adapter` |
| `Ocgtk_gio.Gio.Io_stream_adapter.class io_stream_adapter` | `Ocgio.Io_stream_adapter.class io_stream_adapter` |
| `Ocgtk_gio.Gio.Io_stream_adapter.class type io_stream_adapter_t` | `Ocgio.Io_stream_adapter.class type io_stream_adapter_t` |
| `Ocgtk_gio.Gio.Io_stream.class io_stream` | `Ocgio.Io_stream.class io_stream` |
| `Ocgtk_gio.Gio.Io_stream.class type io_stream_t` | `Ocgio.Io_stream.class type io_stream_t` |
| `Ocgtk_gio.Gio.List_model` | `Ocgio.List_model` |
| `Ocgtk_gio.Gio.List_model.class list_model` | `Ocgio.List_model.class list_model` |
| `Ocgtk_gio.Gio.List_model.class type list_model_t` | `Ocgio.List_model.class type list_model_t` |
| `Ocgtk_gio.Gio.List_store` | `Ocgio.List_store` |
| `Ocgtk_gio.Gio.List_store.class list_store` | `Ocgio.List_store.class list_store` |
| `Ocgtk_gio.Gio.List_store.class type list_store_t` | `Ocgio.List_store.class type list_store_t` |
| `Ocgtk_gio.Gio.Loadable_icon` | `Ocgio.Loadable_icon` |
| `Ocgtk_gio.Gio.Loadable_icon.class loadable_icon` | `Ocgio.Loadable_icon.class loadable_icon` |
| `Ocgtk_gio.Gio.Loadable_icon.class type loadable_icon_t` | `Ocgio.Loadable_icon.class type loadable_icon_t` |
| `Ocgtk_gio.Gio.Memory_input_stream` | `Ocgio.Memory_input_stream` |
| `Ocgtk_gio.Gio.Memory_input_stream.class memory_input_stream` | `Ocgio.Memory_input_stream.class memory_input_stream` |
| `Ocgtk_gio.Gio.Memory_input_stream.class type memory_input_stream_t` | `Ocgio.Memory_input_stream.class type memory_input_stream_t` |
| `Ocgtk_gio.Gio.Memory_monitor` | `Ocgio.Memory_monitor` |
| `Ocgtk_gio.Gio.Memory_monitor.class memory_monitor` | `Ocgio.Memory_monitor.class memory_monitor` |
| `Ocgtk_gio.Gio.Memory_monitor.class type memory_monitor_t` | `Ocgio.Memory_monitor.class type memory_monitor_t` |
| `Ocgtk_gio.Gio.Memory_output_stream` | `Ocgio.Memory_output_stream` |
| `Ocgtk_gio.Gio.Memory_output_stream.class memory_output_stream` | `Ocgio.Memory_output_stream.class memory_output_stream` |
| `Ocgtk_gio.Gio.Memory_output_stream.class type memory_output_stream_t` | `Ocgio.Memory_output_stream.class type memory_output_stream_t` |
| `Ocgtk_gio.Gio.Menu` | `Ocgio.Menu` |
| `Ocgtk_gio.Gio.Menu_attribute_iter` | `Ocgio.Menu_attribute_iter` |
| `Ocgtk_gio.Gio.Menu_attribute_iter.class menu_attribute_iter` | `Ocgio.Menu_attribute_iter.class menu_attribute_iter` |
| `Ocgtk_gio.Gio.Menu_attribute_iter.class type menu_attribute_iter_t` | `Ocgio.Menu_attribute_iter.class type menu_attribute_iter_t` |
| `Ocgtk_gio.Gio.Menu.class menu` | `Ocgio.Menu.class menu` |
| `Ocgtk_gio.Gio.Menu.class type menu_t` | `Ocgio.Menu.class type menu_t` |
| `Ocgtk_gio.Gio.Menu_item` | `Ocgio.Menu_item` |
| `Ocgtk_gio.Gio.Menu_item.class menu_item` | `Ocgio.Menu_item.class menu_item` |
| `Ocgtk_gio.Gio.Menu_item.class type menu_item_t` | `Ocgio.Menu_item.class type menu_item_t` |
| `Ocgtk_gio.Gio.Menu_link_iter` | `Ocgio.Menu_link_iter` |
| `Ocgtk_gio.Gio.Menu_link_iter.class menu_link_iter` | `Ocgio.Menu_link_iter.class menu_link_iter` |
| `Ocgtk_gio.Gio.Menu_link_iter.class type menu_link_iter_t` | `Ocgio.Menu_link_iter.class type menu_link_iter_t` |
| `Ocgtk_gio.Gio.Menu_model` | `Ocgio.Menu_model` |
| `Ocgtk_gio.Gio.Menu_model.class menu_model` | `Ocgio.Menu_model.class menu_model` |
| `Ocgtk_gio.Gio.Menu_model.class type menu_model_t` | `Ocgio.Menu_model.class type menu_model_t` |
| `Ocgtk_gio.Gio.Mount` | `Ocgio.Mount` |
| `Ocgtk_gio.Gio.Mount.class mount` | `Ocgio.Mount.class mount` |
| `Ocgtk_gio.Gio.Mount.class type mount_t` | `Ocgio.Mount.class type mount_t` |
| `Ocgtk_gio.Gio.Mount_operation` | `Ocgio.Mount_operation` |
| `Ocgtk_gio.Gio.Mount_operation.class mount_operation` | `Ocgio.Mount_operation.class mount_operation` |
| `Ocgtk_gio.Gio.Mount_operation.class type mount_operation_t` | `Ocgio.Mount_operation.class type mount_operation_t` |
| `Ocgtk_gio.Gio.Native_socket_address` | `Ocgio.Native_socket_address` |
| `Ocgtk_gio.Gio.Native_socket_address.class native_socket_address` | `Ocgio.Native_socket_address.class native_socket_address` |
| `Ocgtk_gio.Gio.Native_socket_address.class type native_socket_address_t` | `Ocgio.Native_socket_address.class type native_socket_address_t` |
| `Ocgtk_gio.Gio.Native_volume_monitor` | `Ocgio.Native_volume_monitor` |
| `Ocgtk_gio.Gio.Native_volume_monitor.class native_volume_monitor` | `Ocgio.Native_volume_monitor.class native_volume_monitor` |
| `Ocgtk_gio.Gio.Native_volume_monitor.class type native_volume_monitor_t` | `Ocgio.Native_volume_monitor.class type native_volume_monitor_t` |
| `Ocgtk_gio.Gio.Network_address` | `Ocgio.Network_address` |
| `Ocgtk_gio.Gio.Network_address.class network_address` | `Ocgio.Network_address.class network_address` |
| `Ocgtk_gio.Gio.Network_address.class type network_address_t` | `Ocgio.Network_address.class type network_address_t` |
| `Ocgtk_gio.Gio.Network_monitor` | `Ocgio.Network_monitor` |
| `Ocgtk_gio.Gio.Network_monitor.class network_monitor` | `Ocgio.Network_monitor.class network_monitor` |
| `Ocgtk_gio.Gio.Network_monitor.class type network_monitor_t` | `Ocgio.Network_monitor.class type network_monitor_t` |
| `Ocgtk_gio.Gio.Network_service` | `Ocgio.Network_service` |
| `Ocgtk_gio.Gio.Network_service.class network_service` | `Ocgio.Network_service.class network_service` |
| `Ocgtk_gio.Gio.Network_service.class type network_service_t` | `Ocgio.Network_service.class type network_service_t` |
| `Ocgtk_gio.Gio.Notification` | `Ocgio.Notification` |
| `Ocgtk_gio.Gio.Notification.class notification` | `Ocgio.Notification.class notification` |
| `Ocgtk_gio.Gio.Notification.class type notification_t` | `Ocgio.Notification.class type notification_t` |
| `Ocgtk_gio.Gio.Output_message` | `Ocgio.Output_message` |
| `Ocgtk_gio.Gio.Output_message.class output_message` | `Ocgio.Output_message.class output_message` |
| `Ocgtk_gio.Gio.Output_message.class type output_message_t` | `Ocgio.Output_message.class type output_message_t` |
| `Ocgtk_gio.Gio.Output_stream` | `Ocgio.Output_stream` |
| `Ocgtk_gio.Gio.Output_stream.class output_stream` | `Ocgio.Output_stream.class output_stream` |
| `Ocgtk_gio.Gio.Output_stream.class type output_stream_t` | `Ocgio.Output_stream.class type output_stream_t` |
| `Ocgtk_gio.Gio.Output_vector` | `Ocgio.Output_vector` |
| `Ocgtk_gio.Gio.Output_vector.class output_vector` | `Ocgio.Output_vector.class output_vector` |
| `Ocgtk_gio.Gio.Output_vector.class type output_vector_t` | `Ocgio.Output_vector.class type output_vector_t` |
| `Ocgtk_gio.Gio.Permission` | `Ocgio.Permission` |
| `Ocgtk_gio.Gio.Permission.class permission` | `Ocgio.Permission.class permission` |
| `Ocgtk_gio.Gio.Permission.class type permission_t` | `Ocgio.Permission.class type permission_t` |
| `Ocgtk_gio.Gio.Pollable_input_stream` | `Ocgio.Pollable_input_stream` |
| `Ocgtk_gio.Gio.Pollable_input_stream.class pollable_input_stream` | `Ocgio.Pollable_input_stream.class pollable_input_stream` |
| `Ocgtk_gio.Gio.Pollable_input_stream.class type pollable_input_stream_t` | `Ocgio.Pollable_input_stream.class type pollable_input_stream_t` |
| `Ocgtk_gio.Gio.Pollable_output_stream` | `Ocgio.Pollable_output_stream` |
| `Ocgtk_gio.Gio.Pollable_output_stream.class pollable_output_stream` | `Ocgio.Pollable_output_stream.class pollable_output_stream` |
| `Ocgtk_gio.Gio.Pollable_output_stream.class type pollable_output_stream_t` | `Ocgio.Pollable_output_stream.class type pollable_output_stream_t` |
| `Ocgtk_gio.Gio.Power_profile_monitor` | `Ocgio.Power_profile_monitor` |
| `Ocgtk_gio.Gio.Power_profile_monitor.class power_profile_monitor` | `Ocgio.Power_profile_monitor.class power_profile_monitor` |
| `Ocgtk_gio.Gio.Power_profile_monitor.class type power_profile_monitor_t` | `Ocgio.Power_profile_monitor.class type power_profile_monitor_t` |
| `Ocgtk_gio.Gio.Property_action` | `Ocgio.Property_action` |
| `Ocgtk_gio.Gio.Property_action.class property_action` | `Ocgio.Property_action.class property_action` |
| `Ocgtk_gio.Gio.Property_action.class type property_action_t` | `Ocgio.Property_action.class type property_action_t` |
| `Ocgtk_gio.Gio.Proxy` | `Ocgio.Proxy` |
| `Ocgtk_gio.Gio.Proxy_address` | `Ocgio.Proxy_address` |
| `Ocgtk_gio.Gio.Proxy_address.class proxy_address` | `Ocgio.Proxy_address.class proxy_address` |
| `Ocgtk_gio.Gio.Proxy_address.class type proxy_address_t` | `Ocgio.Proxy_address.class type proxy_address_t` |
| `Ocgtk_gio.Gio.Proxy_address_enumerator` | `Ocgio.Proxy_address_enumerator` |
| `Ocgtk_gio.Gio.Proxy_address_enumerator.class proxy_address_enumerator` | `Ocgio.Proxy_address_enumerator.class proxy_address_enumerator` |
| `Ocgtk_gio.Gio.Proxy_address_enumerator.class type proxy_address_enumerator_t` | `Ocgio.Proxy_address_enumerator.class type proxy_address_enumerator_t` |
| `Ocgtk_gio.Gio.Proxy.class proxy` | `Ocgio.Proxy.class proxy` |
| `Ocgtk_gio.Gio.Proxy.class type proxy_t` | `Ocgio.Proxy.class type proxy_t` |
| `Ocgtk_gio.Gio.Proxy_resolver` | `Ocgio.Proxy_resolver` |
| `Ocgtk_gio.Gio.Proxy_resolver.class proxy_resolver` | `Ocgio.Proxy_resolver.class proxy_resolver` |
| `Ocgtk_gio.Gio.Proxy_resolver.class type proxy_resolver_t` | `Ocgio.Proxy_resolver.class type proxy_resolver_t` |
| `Ocgtk_gio.Gio.Remote_action_group` | `Ocgio.Remote_action_group` |
| `Ocgtk_gio.Gio.Remote_action_group.class remote_action_group` | `Ocgio.Remote_action_group.class remote_action_group` |
| `Ocgtk_gio.Gio.Remote_action_group.class type remote_action_group_t` | `Ocgio.Remote_action_group.class type remote_action_group_t` |
| `Ocgtk_gio.Gio.Resolver` | `Ocgio.Resolver` |
| `Ocgtk_gio.Gio.Resolver.class resolver` | `Ocgio.Resolver.class resolver` |
| `Ocgtk_gio.Gio.Resolver.class type resolver_t` | `Ocgio.Resolver.class type resolver_t` |
| `Ocgtk_gio.Gio.Resource` | `Ocgio.Resource` |
| `Ocgtk_gio.Gio.Resource.class resource` | `Ocgio.Resource.class resource` |
| `Ocgtk_gio.Gio.Resource.class type resource_t` | `Ocgio.Resource.class type resource_t` |
| `Ocgtk_gio.Gio.Seekable` | `Ocgio.Seekable` |
| `Ocgtk_gio.Gio.Seekable.class seekable` | `Ocgio.Seekable.class seekable` |
| `Ocgtk_gio.Gio.Seekable.class type seekable_t` | `Ocgio.Seekable.class type seekable_t` |
| `Ocgtk_gio.Gio.Settings` | `Ocgio.Settings` |
| `Ocgtk_gio.Gio.Settings.class settings` | `Ocgio.Settings.class settings` |
| `Ocgtk_gio.Gio.Settings.class type settings_t` | `Ocgio.Settings.class type settings_t` |
| `Ocgtk_gio.Gio.Settings_schema` | `Ocgio.Settings_schema` |
| `Ocgtk_gio.Gio.Settings_schema.class settings_schema` | `Ocgio.Settings_schema.class settings_schema` |
| `Ocgtk_gio.Gio.Settings_schema.class type settings_schema_t` | `Ocgio.Settings_schema.class type settings_schema_t` |
| `Ocgtk_gio.Gio.Settings_schema_key` | `Ocgio.Settings_schema_key` |
| `Ocgtk_gio.Gio.Settings_schema_key.class settings_schema_key` | `Ocgio.Settings_schema_key.class settings_schema_key` |
| `Ocgtk_gio.Gio.Settings_schema_key.class type settings_schema_key_t` | `Ocgio.Settings_schema_key.class type settings_schema_key_t` |
| `Ocgtk_gio.Gio.Settings_schema_source` | `Ocgio.Settings_schema_source` |
| `Ocgtk_gio.Gio.Settings_schema_source.class settings_schema_source` | `Ocgio.Settings_schema_source.class settings_schema_source` |
| `Ocgtk_gio.Gio.Settings_schema_source.class type settings_schema_source_t` | `Ocgio.Settings_schema_source.class type settings_schema_source_t` |
| `Ocgtk_gio.Gio.Simple_action` | `Ocgio.Simple_action` |
| `Ocgtk_gio.Gio.Simple_action.class simple_action` | `Ocgio.Simple_action.class simple_action` |
| `Ocgtk_gio.Gio.Simple_action.class type simple_action_t` | `Ocgio.Simple_action.class type simple_action_t` |
| `Ocgtk_gio.Gio.Simple_action_group` | `Ocgio.Simple_action_group` |
| `Ocgtk_gio.Gio.Simple_action_group.class simple_action_group` | `Ocgio.Simple_action_group.class simple_action_group` |
| `Ocgtk_gio.Gio.Simple_action_group.class type simple_action_group_t` | `Ocgio.Simple_action_group.class type simple_action_group_t` |
| `Ocgtk_gio.Gio.Simple_async_result` | `Ocgio.Simple_async_result` |
| `Ocgtk_gio.Gio.Simple_async_result.class simple_async_result` | `Ocgio.Simple_async_result.class simple_async_result` |
| `Ocgtk_gio.Gio.Simple_async_result.class type simple_async_result_t` | `Ocgio.Simple_async_result.class type simple_async_result_t` |
| `Ocgtk_gio.Gio.Simple_io_stream` | `Ocgio.Simple_io_stream` |
| `Ocgtk_gio.Gio.Simple_io_stream.class simple_io_stream` | `Ocgio.Simple_io_stream.class simple_io_stream` |
| `Ocgtk_gio.Gio.Simple_io_stream.class type simple_io_stream_t` | `Ocgio.Simple_io_stream.class type simple_io_stream_t` |
| `Ocgtk_gio.Gio.Simple_permission` | `Ocgio.Simple_permission` |
| `Ocgtk_gio.Gio.Simple_permission.class simple_permission` | `Ocgio.Simple_permission.class simple_permission` |
| `Ocgtk_gio.Gio.Simple_permission.class type simple_permission_t` | `Ocgio.Simple_permission.class type simple_permission_t` |
| `Ocgtk_gio.Gio.Simple_proxy_resolver` | `Ocgio.Simple_proxy_resolver` |
| `Ocgtk_gio.Gio.Simple_proxy_resolver.class simple_proxy_resolver` | `Ocgio.Simple_proxy_resolver.class simple_proxy_resolver` |
| `Ocgtk_gio.Gio.Simple_proxy_resolver.class type simple_proxy_resolver_t` | `Ocgio.Simple_proxy_resolver.class type simple_proxy_resolver_t` |
| `Ocgtk_gio.Gio.Socket` | `Ocgio.Socket` |
| `Ocgtk_gio.Gio.Socket_address` | `Ocgio.Socket_address` |
| `Ocgtk_gio.Gio.Socket_address.class socket_address` | `Ocgio.Socket_address.class socket_address` |
| `Ocgtk_gio.Gio.Socket_address.class type socket_address_t` | `Ocgio.Socket_address.class type socket_address_t` |
| `Ocgtk_gio.Gio.Socket_address_enumerator` | `Ocgio.Socket_address_enumerator` |
| `Ocgtk_gio.Gio.Socket_address_enumerator.class socket_address_enumerator` | `Ocgio.Socket_address_enumerator.class socket_address_enumerator` |
| `Ocgtk_gio.Gio.Socket_address_enumerator.class type socket_address_enumerator_t` | `Ocgio.Socket_address_enumerator.class type socket_address_enumerator_t` |
| `Ocgtk_gio.Gio.Socket.class socket` | `Ocgio.Socket.class socket` |
| `Ocgtk_gio.Gio.Socket.class type socket_t` | `Ocgio.Socket.class type socket_t` |
| `Ocgtk_gio.Gio.Socket_client` | `Ocgio.Socket_client` |
| `Ocgtk_gio.Gio.Socket_client.class socket_client` | `Ocgio.Socket_client.class socket_client` |
| `Ocgtk_gio.Gio.Socket_client.class type socket_client_t` | `Ocgio.Socket_client.class type socket_client_t` |
| `Ocgtk_gio.Gio.Socket_connectable` | `Ocgio.Socket_connectable` |
| `Ocgtk_gio.Gio.Socket_connectable.class socket_connectable` | `Ocgio.Socket_connectable.class socket_connectable` |
| `Ocgtk_gio.Gio.Socket_connectable.class type socket_connectable_t` | `Ocgio.Socket_connectable.class type socket_connectable_t` |
| `Ocgtk_gio.Gio.Socket_connection` | `Ocgio.Socket_connection` |
| `Ocgtk_gio.Gio.Socket_connection.class socket_connection` | `Ocgio.Socket_connection.class socket_connection` |
| `Ocgtk_gio.Gio.Socket_connection.class type socket_connection_t` | `Ocgio.Socket_connection.class type socket_connection_t` |
| `Ocgtk_gio.Gio.Socket_control_message` | `Ocgio.Socket_control_message` |
| `Ocgtk_gio.Gio.Socket_control_message.class socket_control_message` | `Ocgio.Socket_control_message.class socket_control_message` |
| `Ocgtk_gio.Gio.Socket_control_message.class type socket_control_message_t` | `Ocgio.Socket_control_message.class type socket_control_message_t` |
| `Ocgtk_gio.Gio.Socket_listener` | `Ocgio.Socket_listener` |
| `Ocgtk_gio.Gio.Socket_listener.class socket_listener` | `Ocgio.Socket_listener.class socket_listener` |
| `Ocgtk_gio.Gio.Socket_listener.class type socket_listener_t` | `Ocgio.Socket_listener.class type socket_listener_t` |
| `Ocgtk_gio.Gio.Socket_service` | `Ocgio.Socket_service` |
| `Ocgtk_gio.Gio.Socket_service.class socket_service` | `Ocgio.Socket_service.class socket_service` |
| `Ocgtk_gio.Gio.Socket_service.class type socket_service_t` | `Ocgio.Socket_service.class type socket_service_t` |
| `Ocgtk_gio.Gio.Srv_target` | `Ocgio.Srv_target` |
| `Ocgtk_gio.Gio.Srv_target.class srv_target` | `Ocgio.Srv_target.class srv_target` |
| `Ocgtk_gio.Gio.Srv_target.class type srv_target_t` | `Ocgio.Srv_target.class type srv_target_t` |
| `Ocgtk_gio.Gio.Static_resource` | `Ocgio.Static_resource` |
| `Ocgtk_gio.Gio.Static_resource.class static_resource` | `Ocgio.Static_resource.class static_resource` |
| `Ocgtk_gio.Gio.Static_resource.class type static_resource_t` | `Ocgio.Static_resource.class type static_resource_t` |
| `Ocgtk_gio.Gio.Subprocess` | `Ocgio.Subprocess` |
| `Ocgtk_gio.Gio.Subprocess.class subprocess` | `Ocgio.Subprocess.class subprocess` |
| `Ocgtk_gio.Gio.Subprocess.class type subprocess_t` | `Ocgio.Subprocess.class type subprocess_t` |
| `Ocgtk_gio.Gio.Subprocess_launcher` | `Ocgio.Subprocess_launcher` |
| `Ocgtk_gio.Gio.Subprocess_launcher.class subprocess_launcher` | `Ocgio.Subprocess_launcher.class subprocess_launcher` |
| `Ocgtk_gio.Gio.Subprocess_launcher.class type subprocess_launcher_t` | `Ocgio.Subprocess_launcher.class type subprocess_launcher_t` |
| `Ocgtk_gio.Gio.Task` | `Ocgio.Task` |
| `Ocgtk_gio.Gio.Task.class task` | `Ocgio.Task.class task` |
| `Ocgtk_gio.Gio.Task.class type task_t` | `Ocgio.Task.class type task_t` |
| `Ocgtk_gio.Gio.Tcp_connection` | `Ocgio.Tcp_connection` |
| `Ocgtk_gio.Gio.Tcp_connection.class tcp_connection` | `Ocgio.Tcp_connection.class tcp_connection` |
| `Ocgtk_gio.Gio.Tcp_connection.class type tcp_connection_t` | `Ocgio.Tcp_connection.class type tcp_connection_t` |
| `Ocgtk_gio.Gio.Tcp_wrapper_connection` | `Ocgio.Tcp_wrapper_connection` |
| `Ocgtk_gio.Gio.Tcp_wrapper_connection.class tcp_wrapper_connection` | `Ocgio.Tcp_wrapper_connection.class tcp_wrapper_connection` |
| `Ocgtk_gio.Gio.Tcp_wrapper_connection.class type tcp_wrapper_connection_t` | `Ocgio.Tcp_wrapper_connection.class type tcp_wrapper_connection_t` |
| `Ocgtk_gio.Gio.Test_d_bus` | `Ocgio.Test_d_bus` |
| `Ocgtk_gio.Gio.Test_d_bus.class test_d_bus` | `Ocgio.Test_d_bus.class test_d_bus` |
| `Ocgtk_gio.Gio.Test_d_bus.class type test_d_bus_t` | `Ocgio.Test_d_bus.class type test_d_bus_t` |
| `Ocgtk_gio.Gio.Themed_icon` | `Ocgio.Themed_icon` |
| `Ocgtk_gio.Gio.Themed_icon.class themed_icon` | `Ocgio.Themed_icon.class themed_icon` |
| `Ocgtk_gio.Gio.Themed_icon.class type themed_icon_t` | `Ocgio.Themed_icon.class type themed_icon_t` |
| `Ocgtk_gio.Gio.Threaded_resolver` | `Ocgio.Threaded_resolver` |
| `Ocgtk_gio.Gio.Threaded_resolver.class threaded_resolver` | `Ocgio.Threaded_resolver.class threaded_resolver` |
| `Ocgtk_gio.Gio.Threaded_resolver.class type threaded_resolver_t` | `Ocgio.Threaded_resolver.class type threaded_resolver_t` |
| `Ocgtk_gio.Gio.Threaded_socket_service` | `Ocgio.Threaded_socket_service` |
| `Ocgtk_gio.Gio.Threaded_socket_service.class threaded_socket_service` | `Ocgio.Threaded_socket_service.class threaded_socket_service` |
| `Ocgtk_gio.Gio.Threaded_socket_service.class type threaded_socket_service_t` | `Ocgio.Threaded_socket_service.class type threaded_socket_service_t` |
| `Ocgtk_gio.Gio.Tls_backend` | `Ocgio.Tls_backend` |
| `Ocgtk_gio.Gio.Tls_backend.class tls_backend` | `Ocgio.Tls_backend.class tls_backend` |
| `Ocgtk_gio.Gio.Tls_backend.class type tls_backend_t` | `Ocgio.Tls_backend.class type tls_backend_t` |
| `Ocgtk_gio.Gio.Tls_certificate` | `Ocgio.Tls_certificate` |
| `Ocgtk_gio.Gio.Tls_certificate.class tls_certificate` | `Ocgio.Tls_certificate.class tls_certificate` |
| `Ocgtk_gio.Gio.Tls_certificate.class type tls_certificate_t` | `Ocgio.Tls_certificate.class type tls_certificate_t` |
| `Ocgtk_gio.Gio.Tls_client_connection` | `Ocgio.Tls_client_connection` |
| `Ocgtk_gio.Gio.Tls_client_connection.class tls_client_connection` | `Ocgio.Tls_client_connection.class tls_client_connection` |
| `Ocgtk_gio.Gio.Tls_client_connection.class type tls_client_connection_t` | `Ocgio.Tls_client_connection.class type tls_client_connection_t` |
| `Ocgtk_gio.Gio.Tls_connection` | `Ocgio.Tls_connection` |
| `Ocgtk_gio.Gio.Tls_connection.class tls_connection` | `Ocgio.Tls_connection.class tls_connection` |
| `Ocgtk_gio.Gio.Tls_connection.class type tls_connection_t` | `Ocgio.Tls_connection.class type tls_connection_t` |
| `Ocgtk_gio.Gio.Tls_database` | `Ocgio.Tls_database` |
| `Ocgtk_gio.Gio.Tls_database.class tls_database` | `Ocgio.Tls_database.class tls_database` |
| `Ocgtk_gio.Gio.Tls_database.class type tls_database_t` | `Ocgio.Tls_database.class type tls_database_t` |
| `Ocgtk_gio.Gio.Tls_file_database` | `Ocgio.Tls_file_database` |
| `Ocgtk_gio.Gio.Tls_file_database.class tls_file_database` | `Ocgio.Tls_file_database.class tls_file_database` |
| `Ocgtk_gio.Gio.Tls_file_database.class type tls_file_database_t` | `Ocgio.Tls_file_database.class type tls_file_database_t` |
| `Ocgtk_gio.Gio.Tls_interaction` | `Ocgio.Tls_interaction` |
| `Ocgtk_gio.Gio.Tls_interaction.class tls_interaction` | `Ocgio.Tls_interaction.class tls_interaction` |
| `Ocgtk_gio.Gio.Tls_interaction.class type tls_interaction_t` | `Ocgio.Tls_interaction.class type tls_interaction_t` |
| `Ocgtk_gio.Gio.Tls_password` | `Ocgio.Tls_password` |
| `Ocgtk_gio.Gio.Tls_password.class tls_password` | `Ocgio.Tls_password.class tls_password` |
| `Ocgtk_gio.Gio.Tls_password.class type tls_password_t` | `Ocgio.Tls_password.class type tls_password_t` |
| `Ocgtk_gio.Gio.Tls_server_connection` | `Ocgio.Tls_server_connection` |
| `Ocgtk_gio.Gio.Tls_server_connection.class tls_server_connection` | `Ocgio.Tls_server_connection.class tls_server_connection` |
| `Ocgtk_gio.Gio.Tls_server_connection.class type tls_server_connection_t` | `Ocgio.Tls_server_connection.class type tls_server_connection_t` |
| `Ocgtk_gio.Gio.Unix_connection` | `Ocgio.Unix_connection` |
| `Ocgtk_gio.Gio.Unix_connection.class type unix_connection_t` | `Ocgio.Unix_connection.class type unix_connection_t` |
| `Ocgtk_gio.Gio.Unix_connection.class unix_connection` | `Ocgio.Unix_connection.class unix_connection` |
| `Ocgtk_gio.Gio.Unix_credentials_message` | `Ocgio.Unix_credentials_message` |
| `Ocgtk_gio.Gio.Unix_credentials_message.class type unix_credentials_message_t` | `Ocgio.Unix_credentials_message.class type unix_credentials_message_t` |
| `Ocgtk_gio.Gio.Unix_credentials_message.class unix_credentials_message` | `Ocgio.Unix_credentials_message.class unix_credentials_message` |
| `Ocgtk_gio.Gio.Unix_fd_list` | `Ocgio.Unix_fd_list` |
| `Ocgtk_gio.Gio.Unix_fd_list.class type unix_fd_list_t` | `Ocgio.Unix_fd_list.class type unix_fd_list_t` |
| `Ocgtk_gio.Gio.Unix_fd_list.class unix_fd_list` | `Ocgio.Unix_fd_list.class unix_fd_list` |
| `Ocgtk_gio.Gio.Unix_socket_address` | `Ocgio.Unix_socket_address` |
| `Ocgtk_gio.Gio.Unix_socket_address.class type unix_socket_address_t` | `Ocgio.Unix_socket_address.class type unix_socket_address_t` |
| `Ocgtk_gio.Gio.Unix_socket_address.class unix_socket_address` | `Ocgio.Unix_socket_address.class unix_socket_address` |
| `Ocgtk_gio.Gio.Vfs` | `Ocgio.Vfs` |
| `Ocgtk_gio.Gio.Vfs.class type vfs_t` | `Ocgio.Vfs.class type vfs_t` |
| `Ocgtk_gio.Gio.Vfs.class vfs` | `Ocgio.Vfs.class vfs` |
| `Ocgtk_gio.Gio.Volume` | `Ocgio.Volume` |
| `Ocgtk_gio.Gio.Volume.class type volume_t` | `Ocgio.Volume.class type volume_t` |
| `Ocgtk_gio.Gio.Volume.class volume` | `Ocgio.Volume.class volume` |
| `Ocgtk_gio.Gio.Volume_monitor` | `Ocgio.Volume_monitor` |
| `Ocgtk_gio.Gio.Volume_monitor.class type volume_monitor_t` | `Ocgio.Volume_monitor.class type volume_monitor_t` |
| `Ocgtk_gio.Gio.Volume_monitor.class volume_monitor` | `Ocgio.Volume_monitor.class volume_monitor` |
| `Ocgtk_gio.Gio_volume_monitor_core` | `Ocgio.Raw.Gio_volume_monitor_core` |
| `Ocgtk_gio.Gio.Wrappers` | `Ocgio.Raw` |
| `Ocgtk_gio.Gio.Wrappers.Action` | `Ocgio.Raw.Action` |
| `Ocgtk_gio.Gio.Wrappers.Action_entry` | `Ocgio.Raw.Action_entry` |
| `Ocgtk_gio.Gio.Wrappers.Action_group` | `Ocgio.Raw.Action_group` |
| `Ocgtk_gio.Gio.Wrappers.Action_map` | `Ocgio.Raw.Action_map` |
| `Ocgtk_gio.Gio.Wrappers.App_info` | `Ocgio.Raw.App_info` |
| `Ocgtk_gio.Gio.Wrappers.App_info_monitor` | `Ocgio.Raw.App_info_monitor` |
| `Ocgtk_gio.Gio.Wrappers.App_launch_context` | `Ocgio.Raw.App_launch_context` |
| `Ocgtk_gio.Gio.Wrappers.Application` | `Ocgio.Raw.Application` |
| `Ocgtk_gio.Gio.Wrappers.Application_command_line` | `Ocgio.Raw.Application_command_line` |
| `Ocgtk_gio.Gio.Wrappers.Async_initable` | `Ocgio.Raw.Async_initable` |
| `Ocgtk_gio.Gio.Wrappers.Async_result` | `Ocgio.Raw.Async_result` |
| `Ocgtk_gio.Gio.Wrappers.Buffered_input_stream` | `Ocgio.Raw.Buffered_input_stream` |
| `Ocgtk_gio.Gio.Wrappers.Buffered_output_stream` | `Ocgio.Raw.Buffered_output_stream` |
| `Ocgtk_gio.Gio.Wrappers.Bytes_icon` | `Ocgio.Raw.Bytes_icon` |
| `Ocgtk_gio.Gio.Wrappers.Cancellable` | `Ocgio.Raw.Cancellable` |
| `Ocgtk_gio.Gio.Wrappers.Charset_converter` | `Ocgio.Raw.Charset_converter` |
| `Ocgtk_gio.Gio.Wrappers.Converter` | `Ocgio.Raw.Converter` |
| `Ocgtk_gio.Gio.Wrappers.Converter_input_stream` | `Ocgio.Raw.Converter_input_stream` |
| `Ocgtk_gio.Gio.Wrappers.Converter_output_stream` | `Ocgio.Raw.Converter_output_stream` |
| `Ocgtk_gio.Gio.Wrappers.Credentials` | `Ocgio.Raw.Credentials` |
| `Ocgtk_gio.Gio.Wrappers.Datagram_based` | `Ocgio.Raw.Datagram_based` |
| `Ocgtk_gio.Gio.Wrappers.Data_input_stream` | `Ocgio.Raw.Data_input_stream` |
| `Ocgtk_gio.Gio.Wrappers.Data_output_stream` | `Ocgio.Raw.Data_output_stream` |
| `Ocgtk_gio.Gio.Wrappers.D_bus_action_group` | `Ocgio.Raw.D_bus_action_group` |
| `Ocgtk_gio.Gio.Wrappers.D_bus_annotation_info` | `Ocgio.Raw.D_bus_annotation_info` |
| `Ocgtk_gio.Gio.Wrappers.D_bus_arg_info` | `Ocgio.Raw.D_bus_arg_info` |
| `Ocgtk_gio.Gio.Wrappers.D_bus_auth_observer` | `Ocgio.Raw.D_bus_auth_observer` |
| `Ocgtk_gio.Gio.Wrappers.D_bus_connection` | `Ocgio.Raw.D_bus_connection` |
| `Ocgtk_gio.Gio.Wrappers.D_bus_error_entry` | `Ocgio.Raw.D_bus_error_entry` |
| `Ocgtk_gio.Gio.Wrappers.D_bus_interface` | `Ocgio.Raw.D_bus_interface` |
| `Ocgtk_gio.Gio.Wrappers.D_bus_interface_info` | `Ocgio.Raw.D_bus_interface_info` |
| `Ocgtk_gio.Gio.Wrappers.D_bus_interface_skeleton` | `Ocgio.Raw.D_bus_interface_skeleton` |
| `Ocgtk_gio.Gio.Wrappers.D_bus_interface_v_table` | `Ocgio.Raw.D_bus_interface_v_table` |
| `Ocgtk_gio.Gio.Wrappers.D_bus_menu_model` | `Ocgio.Raw.D_bus_menu_model` |
| `Ocgtk_gio.Gio.Wrappers.D_bus_message` | `Ocgio.Raw.D_bus_message` |
| `Ocgtk_gio.Gio.Wrappers.D_bus_method_info` | `Ocgio.Raw.D_bus_method_info` |
| `Ocgtk_gio.Gio.Wrappers.D_bus_method_invocation` | `Ocgio.Raw.D_bus_method_invocation` |
| `Ocgtk_gio.Gio.Wrappers.D_bus_node_info` | `Ocgio.Raw.D_bus_node_info` |
| `Ocgtk_gio.Gio.Wrappers.D_bus_object` | `Ocgio.Raw.D_bus_object` |
| `Ocgtk_gio.Gio.Wrappers.D_bus_object_manager` | `Ocgio.Raw.D_bus_object_manager` |
| `Ocgtk_gio.Gio.Wrappers.D_bus_object_manager_client` | `Ocgio.Raw.D_bus_object_manager_client` |
| `Ocgtk_gio.Gio.Wrappers.D_bus_object_manager_server` | `Ocgio.Raw.D_bus_object_manager_server` |
| `Ocgtk_gio.Gio.Wrappers.D_bus_object_proxy` | `Ocgio.Raw.D_bus_object_proxy` |
| `Ocgtk_gio.Gio.Wrappers.D_bus_object_skeleton` | `Ocgio.Raw.D_bus_object_skeleton` |
| `Ocgtk_gio.Gio.Wrappers.D_bus_property_info` | `Ocgio.Raw.D_bus_property_info` |
| `Ocgtk_gio.Gio.Wrappers.D_bus_proxy` | `Ocgio.Raw.D_bus_proxy` |
| `Ocgtk_gio.Gio.Wrappers.D_bus_server` | `Ocgio.Raw.D_bus_server` |
| `Ocgtk_gio.Gio.Wrappers.D_bus_signal_info` | `Ocgio.Raw.D_bus_signal_info` |
| `Ocgtk_gio.Gio.Wrappers.D_bus_subtree_v_table` | `Ocgio.Raw.D_bus_subtree_v_table` |
| `Ocgtk_gio.Gio.Wrappers.Debug_controller` | `Ocgio.Raw.Debug_controller` |
| `Ocgtk_gio.Gio.Wrappers.Debug_controller_d_bus` | `Ocgio.Raw.Debug_controller_d_bus` |
| `Ocgtk_gio.Gio.Wrappers.Drive` | `Ocgio.Raw.Drive` |
| `Ocgtk_gio.Gio.Wrappers.Dtls_client_connection` | `Ocgio.Raw.Dtls_client_connection` |
| `Ocgtk_gio.Gio.Wrappers.Dtls_connection` | `Ocgio.Raw.Dtls_connection` |
| `Ocgtk_gio.Gio.Wrappers.Dtls_server_connection` | `Ocgio.Raw.Dtls_server_connection` |
| `Ocgtk_gio.Gio.Wrappers.Emblem` | `Ocgio.Raw.Emblem` |
| `Ocgtk_gio.Gio.Wrappers.Emblemed_icon` | `Ocgio.Raw.Emblemed_icon` |
| `Ocgtk_gio.Gio.Wrappers.File` | `Ocgio.Raw.File` |
| `Ocgtk_gio.Gio.Wrappers.File_attribute_info` | `Ocgio.Raw.File_attribute_info` |
| `Ocgtk_gio.Gio.Wrappers.File_attribute_info_list` | `Ocgio.Raw.File_attribute_info_list` |
| `Ocgtk_gio.Gio.Wrappers.File_attribute_matcher` | `Ocgio.Raw.File_attribute_matcher` |
| `Ocgtk_gio.Gio.Wrappers.File_enumerator` | `Ocgio.Raw.File_enumerator` |
| `Ocgtk_gio.Gio.Wrappers.File_icon` | `Ocgio.Raw.File_icon` |
| `Ocgtk_gio.Gio.Wrappers.File_info` | `Ocgio.Raw.File_info` |
| `Ocgtk_gio.Gio.Wrappers.File_input_stream` | `Ocgio.Raw.File_input_stream` |
| `Ocgtk_gio.Gio.Wrappers.File_io_stream` | `Ocgio.Raw.File_io_stream` |
| `Ocgtk_gio.Gio.Wrappers.File_monitor` | `Ocgio.Raw.File_monitor` |
| `Ocgtk_gio.Gio.Wrappers.Filename_completer` | `Ocgio.Raw.Filename_completer` |
| `Ocgtk_gio.Gio.Wrappers.File_output_stream` | `Ocgio.Raw.File_output_stream` |
| `Ocgtk_gio.Gio.Wrappers.Filter_input_stream` | `Ocgio.Raw.Filter_input_stream` |
| `Ocgtk_gio.Gio.Wrappers.Filter_output_stream` | `Ocgio.Raw.Filter_output_stream` |
| `Ocgtk_gio.Gio.Wrappers.Icon` | `Ocgio.Raw.Icon` |
| `Ocgtk_gio.Gio.Wrappers.Inet_address` | `Ocgio.Raw.Inet_address` |
| `Ocgtk_gio.Gio.Wrappers.Inet_address_mask` | `Ocgio.Raw.Inet_address_mask` |
| `Ocgtk_gio.Gio.Wrappers.Inet_socket_address` | `Ocgio.Raw.Inet_socket_address` |
| `Ocgtk_gio.Gio.Wrappers.Initable` | `Ocgio.Raw.Initable` |
| `Ocgtk_gio.Gio.Wrappers.Input_message` | `Ocgio.Raw.Input_message` |
| `Ocgtk_gio.Gio.Wrappers.Input_stream` | `Ocgio.Raw.Input_stream` |
| `Ocgtk_gio.Gio.Wrappers.Input_vector` | `Ocgio.Raw.Input_vector` |
| `Ocgtk_gio.Gio.Wrappers.Io_extension` | `Ocgio.Raw.Io_extension` |
| `Ocgtk_gio.Gio.Wrappers.Io_extension_point` | `Ocgio.Raw.Io_extension_point` |
| `Ocgtk_gio.Gio.Wrappers.Io_module` | `Ocgio.Raw.Io_module` |
| `Ocgtk_gio.Gio.Wrappers.Io_module_scope` | `Ocgio.Raw.Io_module_scope` |
| `Ocgtk_gio.Gio.Wrappers.Io_scheduler_job` | `Ocgio.Raw.Io_scheduler_job` |
| `Ocgtk_gio.Gio.Wrappers.Io_stream` | `Ocgio.Raw.Io_stream` |
| `Ocgtk_gio.Gio.Wrappers.Io_stream_adapter` | `Ocgio.Raw.Io_stream_adapter` |
| `Ocgtk_gio.Gio.Wrappers.List_model` | `Ocgio.Raw.List_model` |
| `Ocgtk_gio.Gio.Wrappers.List_store` | `Ocgio.Raw.List_store` |
| `Ocgtk_gio.Gio.Wrappers.Loadable_icon` | `Ocgio.Raw.Loadable_icon` |
| `Ocgtk_gio.Gio.Wrappers.Memory_input_stream` | `Ocgio.Raw.Memory_input_stream` |
| `Ocgtk_gio.Gio.Wrappers.Memory_monitor` | `Ocgio.Raw.Memory_monitor` |
| `Ocgtk_gio.Gio.Wrappers.Memory_output_stream` | `Ocgio.Raw.Memory_output_stream` |
| `Ocgtk_gio.Gio.Wrappers.Menu` | `Ocgio.Raw.Menu` |
| `Ocgtk_gio.Gio.Wrappers.Menu_attribute_iter` | `Ocgio.Raw.Menu_attribute_iter` |
| `Ocgtk_gio.Gio.Wrappers.Menu_item` | `Ocgio.Raw.Menu_item` |
| `Ocgtk_gio.Gio.Wrappers.Menu_link_iter` | `Ocgio.Raw.Menu_link_iter` |
| `Ocgtk_gio.Gio.Wrappers.Menu_model` | `Ocgio.Raw.Menu_model` |
| `Ocgtk_gio.Gio.Wrappers.Mount` | `Ocgio.Raw.Mount` |
| `Ocgtk_gio.Gio.Wrappers.Mount_operation` | `Ocgio.Raw.Mount_operation` |
| `Ocgtk_gio.Gio.Wrappers.Native_socket_address` | `Ocgio.Raw.Native_socket_address` |
| `Ocgtk_gio.Gio.Wrappers.Native_volume_monitor` | `Ocgio.Raw.Native_volume_monitor` |
| `Ocgtk_gio.Gio.Wrappers.Network_address` | `Ocgio.Raw.Network_address` |
| `Ocgtk_gio.Gio.Wrappers.Network_monitor` | `Ocgio.Raw.Network_monitor` |
| `Ocgtk_gio.Gio.Wrappers.Network_service` | `Ocgio.Raw.Network_service` |
| `Ocgtk_gio.Gio.Wrappers.Notification` | `Ocgio.Raw.Notification` |
| `Ocgtk_gio.Gio.Wrappers.Output_message` | `Ocgio.Raw.Output_message` |
| `Ocgtk_gio.Gio.Wrappers.Output_stream` | `Ocgio.Raw.Output_stream` |
| `Ocgtk_gio.Gio.Wrappers.Output_vector` | `Ocgio.Raw.Output_vector` |
| `Ocgtk_gio.Gio.Wrappers.Permission` | `Ocgio.Raw.Permission` |
| `Ocgtk_gio.Gio.Wrappers.Pollable_input_stream` | `Ocgio.Raw.Pollable_input_stream` |
| `Ocgtk_gio.Gio.Wrappers.Pollable_output_stream` | `Ocgio.Raw.Pollable_output_stream` |
| `Ocgtk_gio.Gio.Wrappers.Power_profile_monitor` | `Ocgio.Raw.Power_profile_monitor` |
| `Ocgtk_gio.Gio.Wrappers.Property_action` | `Ocgio.Raw.Property_action` |
| `Ocgtk_gio.Gio.Wrappers.Proxy` | `Ocgio.Raw.Proxy` |
| `Ocgtk_gio.Gio.Wrappers.Proxy_address` | `Ocgio.Raw.Proxy_address` |
| `Ocgtk_gio.Gio.Wrappers.Proxy_address_enumerator` | `Ocgio.Raw.Proxy_address_enumerator` |
| `Ocgtk_gio.Gio.Wrappers.Proxy_resolver` | `Ocgio.Raw.Proxy_resolver` |
| `Ocgtk_gio.Gio.Wrappers.Remote_action_group` | `Ocgio.Raw.Remote_action_group` |
| `Ocgtk_gio.Gio.Wrappers.Resolver` | `Ocgio.Raw.Resolver` |
| `Ocgtk_gio.Gio.Wrappers.Resource` | `Ocgio.Raw.Resource` |
| `Ocgtk_gio.Gio.Wrappers.Seekable` | `Ocgio.Raw.Seekable` |
| `Ocgtk_gio.Gio.Wrappers.Settings` | `Ocgio.Raw.Settings` |
| `Ocgtk_gio.Gio.Wrappers.Settings_schema` | `Ocgio.Raw.Settings_schema` |
| `Ocgtk_gio.Gio.Wrappers.Settings_schema_key` | `Ocgio.Raw.Settings_schema_key` |
| `Ocgtk_gio.Gio.Wrappers.Settings_schema_source` | `Ocgio.Raw.Settings_schema_source` |
| `Ocgtk_gio.Gio.Wrappers.Simple_action` | `Ocgio.Raw.Simple_action` |
| `Ocgtk_gio.Gio.Wrappers.Simple_action_group` | `Ocgio.Raw.Simple_action_group` |
| `Ocgtk_gio.Gio.Wrappers.Simple_async_result` | `Ocgio.Raw.Simple_async_result` |
| `Ocgtk_gio.Gio.Wrappers.Simple_io_stream` | `Ocgio.Raw.Simple_io_stream` |
| `Ocgtk_gio.Gio.Wrappers.Simple_permission` | `Ocgio.Raw.Simple_permission` |
| `Ocgtk_gio.Gio.Wrappers.Simple_proxy_resolver` | `Ocgio.Raw.Simple_proxy_resolver` |
| `Ocgtk_gio.Gio.Wrappers.Socket` | `Ocgio.Raw.Socket` |
| `Ocgtk_gio.Gio.Wrappers.Socket_address` | `Ocgio.Raw.Socket_address` |
| `Ocgtk_gio.Gio.Wrappers.Socket_address_enumerator` | `Ocgio.Raw.Socket_address_enumerator` |
| `Ocgtk_gio.Gio.Wrappers.Socket_client` | `Ocgio.Raw.Socket_client` |
| `Ocgtk_gio.Gio.Wrappers.Socket_connectable` | `Ocgio.Raw.Socket_connectable` |
| `Ocgtk_gio.Gio.Wrappers.Socket_connection` | `Ocgio.Raw.Socket_connection` |
| `Ocgtk_gio.Gio.Wrappers.Socket_control_message` | `Ocgio.Raw.Socket_control_message` |
| `Ocgtk_gio.Gio.Wrappers.Socket_listener` | `Ocgio.Raw.Socket_listener` |
| `Ocgtk_gio.Gio.Wrappers.Socket_service` | `Ocgio.Raw.Socket_service` |
| `Ocgtk_gio.Gio.Wrappers.Srv_target` | `Ocgio.Raw.Srv_target` |
| `Ocgtk_gio.Gio.Wrappers.Static_resource` | `Ocgio.Raw.Static_resource` |
| `Ocgtk_gio.Gio.Wrappers.Subprocess` | `Ocgio.Raw.Subprocess` |
| `Ocgtk_gio.Gio.Wrappers.Subprocess_launcher` | `Ocgio.Raw.Subprocess_launcher` |
| `Ocgtk_gio.Gio.Wrappers.Task` | `Ocgio.Raw.Task` |
| `Ocgtk_gio.Gio.Wrappers.Tcp_connection` | `Ocgio.Raw.Tcp_connection` |
| `Ocgtk_gio.Gio.Wrappers.Tcp_wrapper_connection` | `Ocgio.Raw.Tcp_wrapper_connection` |
| `Ocgtk_gio.Gio.Wrappers.Test_d_bus` | `Ocgio.Raw.Test_d_bus` |
| `Ocgtk_gio.Gio.Wrappers.Themed_icon` | `Ocgio.Raw.Themed_icon` |
| `Ocgtk_gio.Gio.Wrappers.Threaded_resolver` | `Ocgio.Raw.Threaded_resolver` |
| `Ocgtk_gio.Gio.Wrappers.Threaded_socket_service` | `Ocgio.Raw.Threaded_socket_service` |
| `Ocgtk_gio.Gio.Wrappers.Tls_backend` | `Ocgio.Raw.Tls_backend` |
| `Ocgtk_gio.Gio.Wrappers.Tls_certificate` | `Ocgio.Raw.Tls_certificate` |
| `Ocgtk_gio.Gio.Wrappers.Tls_client_connection` | `Ocgio.Raw.Tls_client_connection` |
| `Ocgtk_gio.Gio.Wrappers.Tls_connection` | `Ocgio.Raw.Tls_connection` |
| `Ocgtk_gio.Gio.Wrappers.Tls_database` | `Ocgio.Raw.Tls_database` |
| `Ocgtk_gio.Gio.Wrappers.Tls_file_database` | `Ocgio.Raw.Tls_file_database` |
| `Ocgtk_gio.Gio.Wrappers.Tls_interaction` | `Ocgio.Raw.Tls_interaction` |
| `Ocgtk_gio.Gio.Wrappers.Tls_password` | `Ocgio.Raw.Tls_password` |
| `Ocgtk_gio.Gio.Wrappers.Tls_server_connection` | `Ocgio.Raw.Tls_server_connection` |
| `Ocgtk_gio.Gio.Wrappers.Unix_connection` | `Ocgio.Raw.Unix_connection` |
| `Ocgtk_gio.Gio.Wrappers.Unix_credentials_message` | `Ocgio.Raw.Unix_credentials_message` |
| `Ocgtk_gio.Gio.Wrappers.Unix_fd_list` | `Ocgio.Raw.Unix_fd_list` |
| `Ocgtk_gio.Gio.Wrappers.Unix_socket_address` | `Ocgio.Raw.Unix_socket_address` |
| `Ocgtk_gio.Gio.Wrappers.Vfs` | `Ocgio.Raw.Vfs` |
| `Ocgtk_gio.Gio.Wrappers.Volume` | `Ocgio.Raw.Volume` |
| `Ocgtk_gio.Gio.Wrappers.Volume_monitor` | `Ocgio.Raw.Volume_monitor` |
| `Ocgtk_gio.Gio.Wrappers.Zlib_compressor` | `Ocgio.Raw.Zlib_compressor` |
| `Ocgtk_gio.Gio.Wrappers.Zlib_decompressor` | `Ocgio.Raw.Zlib_decompressor` |
| `Ocgtk_gio.Gio.Zlib_compressor` | `Ocgio.Zlib_compressor` |
| `Ocgtk_gio.Gio.Zlib_compressor.class type zlib_compressor_t` | `Ocgio.Zlib_compressor.class type zlib_compressor_t` |
| `Ocgtk_gio.Gio.Zlib_compressor.class zlib_compressor` | `Ocgio.Zlib_compressor.class zlib_compressor` |
| `Ocgtk_gio.Gio.Zlib_decompressor` | `Ocgio.Zlib_decompressor` |
| `Ocgtk_gio.Gio.Zlib_decompressor.class type zlib_decompressor_t` | `Ocgio.Zlib_decompressor.class type zlib_decompressor_t` |
| `Ocgtk_gio.Gio.Zlib_decompressor.class zlib_decompressor` | `Ocgio.Zlib_decompressor.class zlib_decompressor` |
| `Ocgtk_graphene` | `Ocgraphene` |
| `Ocgtk_graphene.Graphene` | `Ocgraphene` |
| `Ocgtk_graphene.Graphene.Box` | `Ocgraphene.Box` |
| `Ocgtk_graphene.Graphene.Box.class box` | `Ocgraphene.Box.class box` |
| `Ocgtk_graphene.Graphene.Box.class type box_t` | `Ocgraphene.Box.class type box_t` |
| `Ocgtk_graphene.Graphene_constants` | `Ocgraphene.Constants` |
| `Ocgtk_graphene.Graphene_enums` | `Ocgraphene.Enums` |
| `Ocgtk_graphene.Graphene.Euler` | `Ocgraphene.Euler` |
| `Ocgtk_graphene.Graphene.Euler.class euler` | `Ocgraphene.Euler.class euler` |
| `Ocgtk_graphene.Graphene.Euler.class type euler_t` | `Ocgraphene.Euler.class type euler_t` |
| `Ocgtk_graphene.Graphene.Frustum` | `Ocgraphene.Frustum` |
| `Ocgtk_graphene.Graphene.Frustum.class frustum` | `Ocgraphene.Frustum.class frustum` |
| `Ocgtk_graphene.Graphene.Frustum.class type frustum_t` | `Ocgraphene.Frustum.class type frustum_t` |
| `Ocgtk_graphene.Graphene.Matrix` | `Ocgraphene.Matrix` |
| `Ocgtk_graphene.Graphene.Matrix.class matrix` | `Ocgraphene.Matrix.class matrix` |
| `Ocgtk_graphene.Graphene.Matrix.class type matrix_t` | `Ocgraphene.Matrix.class type matrix_t` |
| `Ocgtk_graphene.Graphene.Plane` | `Ocgraphene.Plane` |
| `Ocgtk_graphene.Graphene.Plane.class plane` | `Ocgraphene.Plane.class plane` |
| `Ocgtk_graphene.Graphene.Plane.class type plane_t` | `Ocgraphene.Plane.class type plane_t` |
| `Ocgtk_graphene.Graphene.Point` | `Ocgraphene.Point` |
| `Ocgtk_graphene.Graphene.Point3_d` | `Ocgraphene.Point3_d` |
| `Ocgtk_graphene.Graphene.Point3_d.class point3_d` | `Ocgraphene.Point3_d.class point3_d` |
| `Ocgtk_graphene.Graphene.Point3_d.class type point3_d_t` | `Ocgraphene.Point3_d.class type point3_d_t` |
| `Ocgtk_graphene.Graphene.Point.class point` | `Ocgraphene.Point.class point` |
| `Ocgtk_graphene.Graphene.Point.class type point_t` | `Ocgraphene.Point.class type point_t` |
| `Ocgtk_graphene.Graphene.Quad` | `Ocgraphene.Quad` |
| `Ocgtk_graphene.Graphene.Quad.class quad` | `Ocgraphene.Quad.class quad` |
| `Ocgtk_graphene.Graphene.Quad.class type quad_t` | `Ocgraphene.Quad.class type quad_t` |
| `Ocgtk_graphene.Graphene.Quaternion` | `Ocgraphene.Quaternion` |
| `Ocgtk_graphene.Graphene.Quaternion.class quaternion` | `Ocgraphene.Quaternion.class quaternion` |
| `Ocgtk_graphene.Graphene.Quaternion.class type quaternion_t` | `Ocgraphene.Quaternion.class type quaternion_t` |
| `Ocgtk_graphene.Graphene.Ray` | `Ocgraphene.Ray` |
| `Ocgtk_graphene.Graphene.Ray.class ray` | `Ocgraphene.Ray.class ray` |
| `Ocgtk_graphene.Graphene.Ray.class type ray_t` | `Ocgraphene.Ray.class type ray_t` |
| `Ocgtk_graphene.Graphene.Rect` | `Ocgraphene.Rect` |
| `Ocgtk_graphene.Graphene.Rect.class rect` | `Ocgraphene.Rect.class rect` |
| `Ocgtk_graphene.Graphene.Rect.class type rect_t` | `Ocgraphene.Rect.class type rect_t` |
| `Ocgtk_graphene.Graphene.Simd4_f` | `Ocgraphene.Simd4_f` |
| `Ocgtk_graphene.Graphene.Simd4_f.class simd4_f` | `Ocgraphene.Simd4_f.class simd4_f` |
| `Ocgtk_graphene.Graphene.Simd4_f.class type simd4_f_t` | `Ocgraphene.Simd4_f.class type simd4_f_t` |
| `Ocgtk_graphene.Graphene.Simd4_x4_f` | `Ocgraphene.Simd4_x4_f` |
| `Ocgtk_graphene.Graphene.Simd4_x4_f.class simd4_x4_f` | `Ocgraphene.Simd4_x4_f.class simd4_x4_f` |
| `Ocgtk_graphene.Graphene.Simd4_x4_f.class type simd4_x4_f_t` | `Ocgraphene.Simd4_x4_f.class type simd4_x4_f_t` |
| `Ocgtk_graphene.Graphene.Size` | `Ocgraphene.Size` |
| `Ocgtk_graphene.Graphene.Size.class size` | `Ocgraphene.Size.class size` |
| `Ocgtk_graphene.Graphene.Size.class type size_t` | `Ocgraphene.Size.class type size_t` |
| `Ocgtk_graphene.Graphene.Sphere` | `Ocgraphene.Sphere` |
| `Ocgtk_graphene.Graphene.Sphere.class sphere` | `Ocgraphene.Sphere.class sphere` |
| `Ocgtk_graphene.Graphene.Sphere.class type sphere_t` | `Ocgraphene.Sphere.class type sphere_t` |
| `Ocgtk_graphene.Graphene.Triangle` | `Ocgraphene.Triangle` |
| `Ocgtk_graphene.Graphene.Triangle.class triangle` | `Ocgraphene.Triangle.class triangle` |
| `Ocgtk_graphene.Graphene.Triangle.class type triangle_t` | `Ocgraphene.Triangle.class type triangle_t` |
| `Ocgtk_graphene.Graphene.Vec2` | `Ocgraphene.Vec2` |
| `Ocgtk_graphene.Graphene.Vec2.class type vec2_t` | `Ocgraphene.Vec2.class type vec2_t` |
| `Ocgtk_graphene.Graphene.Vec2.class vec2` | `Ocgraphene.Vec2.class vec2` |
| `Ocgtk_graphene.Graphene.Vec3` | `Ocgraphene.Vec3` |
| `Ocgtk_graphene.Graphene.Vec3.class type vec3_t` | `Ocgraphene.Vec3.class type vec3_t` |
| `Ocgtk_graphene.Graphene.Vec3.class vec3` | `Ocgraphene.Vec3.class vec3` |
| `Ocgtk_graphene.Graphene.Vec4` | `Ocgraphene.Vec4` |
| `Ocgtk_graphene.Graphene.Vec4.class type vec4_t` | `Ocgraphene.Vec4.class type vec4_t` |
| `Ocgtk_graphene.Graphene.Vec4.class vec4` | `Ocgraphene.Vec4.class vec4` |
| `Ocgtk_graphene.Graphene.Wrappers` | `Ocgraphene.Raw` |
| `Ocgtk_graphene.Graphene.Wrappers.Box` | `Ocgraphene.Raw.Box` |
| `Ocgtk_graphene.Graphene.Wrappers.Euler` | `Ocgraphene.Raw.Euler` |
| `Ocgtk_graphene.Graphene.Wrappers.Frustum` | `Ocgraphene.Raw.Frustum` |
| `Ocgtk_graphene.Graphene.Wrappers.Matrix` | `Ocgraphene.Raw.Matrix` |
| `Ocgtk_graphene.Graphene.Wrappers.Plane` | `Ocgraphene.Raw.Plane` |
| `Ocgtk_graphene.Graphene.Wrappers.Point` | `Ocgraphene.Raw.Point` |
| `Ocgtk_graphene.Graphene.Wrappers.Point3_d` | `Ocgraphene.Raw.Point3_d` |
| `Ocgtk_graphene.Graphene.Wrappers.Quad` | `Ocgraphene.Raw.Quad` |
| `Ocgtk_graphene.Graphene.Wrappers.Quaternion` | `Ocgraphene.Raw.Quaternion` |
| `Ocgtk_graphene.Graphene.Wrappers.Ray` | `Ocgraphene.Raw.Ray` |
| `Ocgtk_graphene.Graphene.Wrappers.Rect` | `Ocgraphene.Raw.Rect` |
| `Ocgtk_graphene.Graphene.Wrappers.Simd4_f` | `Ocgraphene.Raw.Simd4_f` |
| `Ocgtk_graphene.Graphene.Wrappers.Simd4_x4_f` | `Ocgraphene.Raw.Simd4_x4_f` |
| `Ocgtk_graphene.Graphene.Wrappers.Size` | `Ocgraphene.Raw.Size` |
| `Ocgtk_graphene.Graphene.Wrappers.Sphere` | `Ocgraphene.Raw.Sphere` |
| `Ocgtk_graphene.Graphene.Wrappers.Triangle` | `Ocgraphene.Raw.Triangle` |
| `Ocgtk_graphene.Graphene.Wrappers.Vec2` | `Ocgraphene.Raw.Vec2` |
| `Ocgtk_graphene.Graphene.Wrappers.Vec3` | `Ocgraphene.Raw.Vec3` |
| `Ocgtk_graphene.Graphene.Wrappers.Vec4` | `Ocgraphene.Raw.Vec4` |
| `Ocgtk_gsk` | `Ocgsk` |
| `Ocgtk_gsk.Gsk` | `Ocgsk` |
| `Ocgtk_gsk.Gsk.Blend_node` | `Ocgsk.Blend_node` |
| `Ocgtk_gsk.Gsk.Blend_node.class blend_node` | `Ocgsk.Blend_node.class blend_node` |
| `Ocgtk_gsk.Gsk.Blend_node.class type blend_node_t` | `Ocgsk.Blend_node.class type blend_node_t` |
| `Ocgtk_gsk.Gsk.Blur_node` | `Ocgsk.Blur_node` |
| `Ocgtk_gsk.Gsk.Blur_node.class blur_node` | `Ocgsk.Blur_node.class blur_node` |
| `Ocgtk_gsk.Gsk.Blur_node.class type blur_node_t` | `Ocgsk.Blur_node.class type blur_node_t` |
| `Ocgtk_gsk.Gsk.Border_node` | `Ocgsk.Border_node` |
| `Ocgtk_gsk.Gsk.Border_node.class border_node` | `Ocgsk.Border_node.class border_node` |
| `Ocgtk_gsk.Gsk.Border_node.class type border_node_t` | `Ocgsk.Border_node.class type border_node_t` |
| `Ocgtk_gsk.Gsk.Cairo_node` | `Ocgsk.Cairo_node` |
| `Ocgtk_gsk.Gsk.Cairo_node.class cairo_node` | `Ocgsk.Cairo_node.class cairo_node` |
| `Ocgtk_gsk.Gsk.Cairo_node.class type cairo_node_t` | `Ocgsk.Cairo_node.class type cairo_node_t` |
| `Ocgtk_gsk.Gsk.Cairo_renderer` | `Ocgsk.Cairo_renderer` |
| `Ocgtk_gsk.Gsk.Cairo_renderer.class cairo_renderer` | `Ocgsk.Cairo_renderer.class cairo_renderer` |
| `Ocgtk_gsk.Gsk.Cairo_renderer.class type cairo_renderer_t` | `Ocgsk.Cairo_renderer.class type cairo_renderer_t` |
| `Ocgtk_gsk.Gsk.Clip_node` | `Ocgsk.Clip_node` |
| `Ocgtk_gsk.Gsk.Clip_node.class clip_node` | `Ocgsk.Clip_node.class clip_node` |
| `Ocgtk_gsk.Gsk.Clip_node.class type clip_node_t` | `Ocgsk.Clip_node.class type clip_node_t` |
| `Ocgtk_gsk.Gsk.Color_matrix_node` | `Ocgsk.Color_matrix_node` |
| `Ocgtk_gsk.Gsk.Color_matrix_node.class color_matrix_node` | `Ocgsk.Color_matrix_node.class color_matrix_node` |
| `Ocgtk_gsk.Gsk.Color_matrix_node.class type color_matrix_node_t` | `Ocgsk.Color_matrix_node.class type color_matrix_node_t` |
| `Ocgtk_gsk.Gsk.Color_node` | `Ocgsk.Color_node` |
| `Ocgtk_gsk.Gsk.Color_node.class color_node` | `Ocgsk.Color_node.class color_node` |
| `Ocgtk_gsk.Gsk.Color_node.class type color_node_t` | `Ocgsk.Color_node.class type color_node_t` |
| `Ocgtk_gsk.Gsk.Color_stop` | `Ocgsk.Color_stop` |
| `Ocgtk_gsk.Gsk.Color_stop.class color_stop` | `Ocgsk.Color_stop.class color_stop` |
| `Ocgtk_gsk.Gsk.Color_stop.class type color_stop_t` | `Ocgsk.Color_stop.class type color_stop_t` |
| `Ocgtk_gsk.Gsk.Component_transfer` | `Ocgsk.Component_transfer` |
| `Ocgtk_gsk.Gsk.Component_transfer.class component_transfer` | `Ocgsk.Component_transfer.class component_transfer` |
| `Ocgtk_gsk.Gsk.Component_transfer.class type component_transfer_t` | `Ocgsk.Component_transfer.class type component_transfer_t` |
| `Ocgtk_gsk.Gsk.Component_transfer_node` | `Ocgsk.Component_transfer_node` |
| `Ocgtk_gsk.Gsk.Component_transfer_node.class component_transfer_node` | `Ocgsk.Component_transfer_node.class component_transfer_node` |
| `Ocgtk_gsk.Gsk.Component_transfer_node.class type component_transfer_node_t` | `Ocgsk.Component_transfer_node.class type component_transfer_node_t` |
| `Ocgtk_gsk.Gsk.Conic_gradient_node` | `Ocgsk.Conic_gradient_node` |
| `Ocgtk_gsk.Gsk.Conic_gradient_node.class conic_gradient_node` | `Ocgsk.Conic_gradient_node.class conic_gradient_node` |
| `Ocgtk_gsk.Gsk.Conic_gradient_node.class type conic_gradient_node_t` | `Ocgsk.Conic_gradient_node.class type conic_gradient_node_t` |
| `Ocgtk_gsk.Gsk.Container_node` | `Ocgsk.Container_node` |
| `Ocgtk_gsk.Gsk.Container_node.class container_node` | `Ocgsk.Container_node.class container_node` |
| `Ocgtk_gsk.Gsk.Container_node.class type container_node_t` | `Ocgsk.Container_node.class type container_node_t` |
| `Ocgtk_gsk.Gsk.Cross_fade_node` | `Ocgsk.Cross_fade_node` |
| `Ocgtk_gsk.Gsk.Cross_fade_node.class cross_fade_node` | `Ocgsk.Cross_fade_node.class cross_fade_node` |
| `Ocgtk_gsk.Gsk.Cross_fade_node.class type cross_fade_node_t` | `Ocgsk.Cross_fade_node.class type cross_fade_node_t` |
| `Ocgtk_gsk.Gsk.Debug_node` | `Ocgsk.Debug_node` |
| `Ocgtk_gsk.Gsk.Debug_node.class debug_node` | `Ocgsk.Debug_node.class debug_node` |
| `Ocgtk_gsk.Gsk.Debug_node.class type debug_node_t` | `Ocgsk.Debug_node.class type debug_node_t` |
| `Ocgtk_gsk.Gsk_enums` | `Ocgsk.Enums` |
| `Ocgtk_gsk.Gsk.Fill_node` | `Ocgsk.Fill_node` |
| `Ocgtk_gsk.Gsk.Fill_node.class fill_node` | `Ocgsk.Fill_node.class fill_node` |
| `Ocgtk_gsk.Gsk.Fill_node.class type fill_node_t` | `Ocgsk.Fill_node.class type fill_node_t` |
| `Ocgtk_gsk.Gsk.Gl_shader` | `Ocgsk.Gl_shader` |
| `Ocgtk_gsk.Gsk.Gl_shader.class gl_shader` | `Ocgsk.Gl_shader.class gl_shader` |
| `Ocgtk_gsk.Gsk.Gl_shader.class type gl_shader_t` | `Ocgsk.Gl_shader.class type gl_shader_t` |
| `Ocgtk_gsk.Gsk.Gl_shader_node` | `Ocgsk.Gl_shader_node` |
| `Ocgtk_gsk.Gsk.Gl_shader_node.class gl_shader_node` | `Ocgsk.Gl_shader_node.class gl_shader_node` |
| `Ocgtk_gsk.Gsk.Gl_shader_node.class type gl_shader_node_t` | `Ocgsk.Gl_shader_node.class type gl_shader_node_t` |
| `Ocgtk_gsk.Gsk.Inset_shadow_node` | `Ocgsk.Inset_shadow_node` |
| `Ocgtk_gsk.Gsk.Inset_shadow_node.class inset_shadow_node` | `Ocgsk.Inset_shadow_node.class inset_shadow_node` |
| `Ocgtk_gsk.Gsk.Inset_shadow_node.class type inset_shadow_node_t` | `Ocgsk.Inset_shadow_node.class type inset_shadow_node_t` |
| `Ocgtk_gsk.Gsk.Linear_gradient_node` | `Ocgsk.Linear_gradient_node` |
| `Ocgtk_gsk.Gsk.Linear_gradient_node.class linear_gradient_node` | `Ocgsk.Linear_gradient_node.class linear_gradient_node` |
| `Ocgtk_gsk.Gsk.Linear_gradient_node.class type linear_gradient_node_t` | `Ocgsk.Linear_gradient_node.class type linear_gradient_node_t` |
| `Ocgtk_gsk.Gsk.Mask_node` | `Ocgsk.Mask_node` |
| `Ocgtk_gsk.Gsk.Mask_node.class mask_node` | `Ocgsk.Mask_node.class mask_node` |
| `Ocgtk_gsk.Gsk.Mask_node.class type mask_node_t` | `Ocgsk.Mask_node.class type mask_node_t` |
| `Ocgtk_gsk.Gsk.Opacity_node` | `Ocgsk.Opacity_node` |
| `Ocgtk_gsk.Gsk.Opacity_node.class opacity_node` | `Ocgsk.Opacity_node.class opacity_node` |
| `Ocgtk_gsk.Gsk.Opacity_node.class type opacity_node_t` | `Ocgsk.Opacity_node.class type opacity_node_t` |
| `Ocgtk_gsk.Gsk.Outset_shadow_node` | `Ocgsk.Outset_shadow_node` |
| `Ocgtk_gsk.Gsk.Outset_shadow_node.class outset_shadow_node` | `Ocgsk.Outset_shadow_node.class outset_shadow_node` |
| `Ocgtk_gsk.Gsk.Outset_shadow_node.class type outset_shadow_node_t` | `Ocgsk.Outset_shadow_node.class type outset_shadow_node_t` |
| `Ocgtk_gsk.Gsk.Parse_location` | `Ocgsk.Parse_location` |
| `Ocgtk_gsk.Gsk.Parse_location.class parse_location` | `Ocgsk.Parse_location.class parse_location` |
| `Ocgtk_gsk.Gsk.Parse_location.class type parse_location_t` | `Ocgsk.Parse_location.class type parse_location_t` |
| `Ocgtk_gsk.Gsk.Path` | `Ocgsk.Path` |
| `Ocgtk_gsk.Gsk.Path_builder` | `Ocgsk.Path_builder` |
| `Ocgtk_gsk.Gsk.Path_builder.class path_builder` | `Ocgsk.Path_builder.class path_builder` |
| `Ocgtk_gsk.Gsk.Path_builder.class type path_builder_t` | `Ocgsk.Path_builder.class type path_builder_t` |
| `Ocgtk_gsk.Gsk.Path.class path` | `Ocgsk.Path.class path` |
| `Ocgtk_gsk.Gsk.Path.class type path_t` | `Ocgsk.Path.class type path_t` |
| `Ocgtk_gsk.Gsk.Path_measure` | `Ocgsk.Path_measure` |
| `Ocgtk_gsk.Gsk.Path_measure.class path_measure` | `Ocgsk.Path_measure.class path_measure` |
| `Ocgtk_gsk.Gsk.Path_measure.class type path_measure_t` | `Ocgsk.Path_measure.class type path_measure_t` |
| `Ocgtk_gsk.Gsk.Path_point` | `Ocgsk.Path_point` |
| `Ocgtk_gsk.Gsk.Path_point.class path_point` | `Ocgsk.Path_point.class path_point` |
| `Ocgtk_gsk.Gsk.Path_point.class type path_point_t` | `Ocgsk.Path_point.class type path_point_t` |
| `Ocgtk_gsk.Gsk.Radial_gradient_node` | `Ocgsk.Radial_gradient_node` |
| `Ocgtk_gsk.Gsk.Radial_gradient_node.class radial_gradient_node` | `Ocgsk.Radial_gradient_node.class radial_gradient_node` |
| `Ocgtk_gsk.Gsk.Radial_gradient_node.class type radial_gradient_node_t` | `Ocgsk.Radial_gradient_node.class type radial_gradient_node_t` |
| `Ocgtk_gsk.Gsk.Renderer` | `Ocgsk.Renderer` |
| `Ocgtk_gsk.Gsk.Renderer.class renderer` | `Ocgsk.Renderer.class renderer` |
| `Ocgtk_gsk.Gsk.Renderer.class type renderer_t` | `Ocgsk.Renderer.class type renderer_t` |
| `Ocgtk_gsk.Gsk.Render_node` | `Ocgsk.Render_node` |
| `Ocgtk_gsk.Gsk.Render_node.class render_node` | `Ocgsk.Render_node.class render_node` |
| `Ocgtk_gsk.Gsk.Render_node.class type render_node_t` | `Ocgsk.Render_node.class type render_node_t` |
| `Ocgtk_gsk.Gsk.Repeating_linear_gradient_node` | `Ocgsk.Repeating_linear_gradient_node` |
| `Ocgtk_gsk.Gsk.Repeating_linear_gradient_node.class repeating_linear_gradient_node` | `Ocgsk.Repeating_linear_gradient_node.class repeating_linear_gradient_node` |
| `Ocgtk_gsk.Gsk.Repeating_linear_gradient_node.class type repeating_linear_gradient_node_t` | `Ocgsk.Repeating_linear_gradient_node.class type repeating_linear_gradient_node_t` |
| `Ocgtk_gsk.Gsk.Repeating_radial_gradient_node` | `Ocgsk.Repeating_radial_gradient_node` |
| `Ocgtk_gsk.Gsk.Repeating_radial_gradient_node.class repeating_radial_gradient_node` | `Ocgsk.Repeating_radial_gradient_node.class repeating_radial_gradient_node` |
| `Ocgtk_gsk.Gsk.Repeating_radial_gradient_node.class type repeating_radial_gradient_node_t` | `Ocgsk.Repeating_radial_gradient_node.class type repeating_radial_gradient_node_t` |
| `Ocgtk_gsk.Gsk.Repeat_node` | `Ocgsk.Repeat_node` |
| `Ocgtk_gsk.Gsk.Repeat_node.class repeat_node` | `Ocgsk.Repeat_node.class repeat_node` |
| `Ocgtk_gsk.Gsk.Repeat_node.class type repeat_node_t` | `Ocgsk.Repeat_node.class type repeat_node_t` |
| `Ocgtk_gsk.Gsk.Rounded_clip_node` | `Ocgsk.Rounded_clip_node` |
| `Ocgtk_gsk.Gsk.Rounded_clip_node.class rounded_clip_node` | `Ocgsk.Rounded_clip_node.class rounded_clip_node` |
| `Ocgtk_gsk.Gsk.Rounded_clip_node.class type rounded_clip_node_t` | `Ocgsk.Rounded_clip_node.class type rounded_clip_node_t` |
| `Ocgtk_gsk.Gsk.Rounded_rect` | `Ocgsk.Rounded_rect` |
| `Ocgtk_gsk.Gsk.Rounded_rect.class rounded_rect` | `Ocgsk.Rounded_rect.class rounded_rect` |
| `Ocgtk_gsk.Gsk.Rounded_rect.class type rounded_rect_t` | `Ocgsk.Rounded_rect.class type rounded_rect_t` |
| `Ocgtk_gsk.Gsk.Shader_args_builder` | `Ocgsk.Shader_args_builder` |
| `Ocgtk_gsk.Gsk.Shader_args_builder.class shader_args_builder` | `Ocgsk.Shader_args_builder.class shader_args_builder` |
| `Ocgtk_gsk.Gsk.Shader_args_builder.class type shader_args_builder_t` | `Ocgsk.Shader_args_builder.class type shader_args_builder_t` |
| `Ocgtk_gsk.Gsk.Shadow` | `Ocgsk.Shadow` |
| `Ocgtk_gsk.Gsk.Shadow.class shadow` | `Ocgsk.Shadow.class shadow` |
| `Ocgtk_gsk.Gsk.Shadow.class type shadow_t` | `Ocgsk.Shadow.class type shadow_t` |
| `Ocgtk_gsk.Gsk.Shadow_node` | `Ocgsk.Shadow_node` |
| `Ocgtk_gsk.Gsk.Shadow_node.class shadow_node` | `Ocgsk.Shadow_node.class shadow_node` |
| `Ocgtk_gsk.Gsk.Shadow_node.class type shadow_node_t` | `Ocgsk.Shadow_node.class type shadow_node_t` |
| `Ocgtk_gsk.Gsk.Stroke` | `Ocgsk.Stroke` |
| `Ocgtk_gsk.Gsk.Stroke.class stroke` | `Ocgsk.Stroke.class stroke` |
| `Ocgtk_gsk.Gsk.Stroke.class type stroke_t` | `Ocgsk.Stroke.class type stroke_t` |
| `Ocgtk_gsk.Gsk.Stroke_node` | `Ocgsk.Stroke_node` |
| `Ocgtk_gsk.Gsk.Stroke_node.class stroke_node` | `Ocgsk.Stroke_node.class stroke_node` |
| `Ocgtk_gsk.Gsk.Stroke_node.class type stroke_node_t` | `Ocgsk.Stroke_node.class type stroke_node_t` |
| `Ocgtk_gsk.Gsk.Subsurface_node` | `Ocgsk.Subsurface_node` |
| `Ocgtk_gsk.Gsk.Subsurface_node.class subsurface_node` | `Ocgsk.Subsurface_node.class subsurface_node` |
| `Ocgtk_gsk.Gsk.Subsurface_node.class type subsurface_node_t` | `Ocgsk.Subsurface_node.class type subsurface_node_t` |
| `Ocgtk_gsk.Gsk.Text_node` | `Ocgsk.Text_node` |
| `Ocgtk_gsk.Gsk.Text_node.class text_node` | `Ocgsk.Text_node.class text_node` |
| `Ocgtk_gsk.Gsk.Text_node.class type text_node_t` | `Ocgsk.Text_node.class type text_node_t` |
| `Ocgtk_gsk.Gsk.Texture_node` | `Ocgsk.Texture_node` |
| `Ocgtk_gsk.Gsk.Texture_node.class texture_node` | `Ocgsk.Texture_node.class texture_node` |
| `Ocgtk_gsk.Gsk.Texture_node.class type texture_node_t` | `Ocgsk.Texture_node.class type texture_node_t` |
| `Ocgtk_gsk.Gsk.Texture_scale_node` | `Ocgsk.Texture_scale_node` |
| `Ocgtk_gsk.Gsk.Texture_scale_node.class texture_scale_node` | `Ocgsk.Texture_scale_node.class texture_scale_node` |
| `Ocgtk_gsk.Gsk.Texture_scale_node.class type texture_scale_node_t` | `Ocgsk.Texture_scale_node.class type texture_scale_node_t` |
| `Ocgtk_gsk.Gsk.Transform` | `Ocgsk.Transform` |
| `Ocgtk_gsk.Gsk.Transform.class transform` | `Ocgsk.Transform.class transform` |
| `Ocgtk_gsk.Gsk.Transform.class type transform_t` | `Ocgsk.Transform.class type transform_t` |
| `Ocgtk_gsk.Gsk.Transform_node` | `Ocgsk.Transform_node` |
| `Ocgtk_gsk.Gsk.Transform_node.class transform_node` | `Ocgsk.Transform_node.class transform_node` |
| `Ocgtk_gsk.Gsk.Transform_node.class type transform_node_t` | `Ocgsk.Transform_node.class type transform_node_t` |
| `Ocgtk_gsk.Gsk.Wrappers` | `Ocgsk.Raw` |
| `Ocgtk_gsk.Gsk.Wrappers.Blend_node` | `Ocgsk.Raw.Blend_node` |
| `Ocgtk_gsk.Gsk.Wrappers.Blur_node` | `Ocgsk.Raw.Blur_node` |
| `Ocgtk_gsk.Gsk.Wrappers.Border_node` | `Ocgsk.Raw.Border_node` |
| `Ocgtk_gsk.Gsk.Wrappers.Cairo_node` | `Ocgsk.Raw.Cairo_node` |
| `Ocgtk_gsk.Gsk.Wrappers.Cairo_renderer` | `Ocgsk.Raw.Cairo_renderer` |
| `Ocgtk_gsk.Gsk.Wrappers.Clip_node` | `Ocgsk.Raw.Clip_node` |
| `Ocgtk_gsk.Gsk.Wrappers.Color_matrix_node` | `Ocgsk.Raw.Color_matrix_node` |
| `Ocgtk_gsk.Gsk.Wrappers.Color_node` | `Ocgsk.Raw.Color_node` |
| `Ocgtk_gsk.Gsk.Wrappers.Color_stop` | `Ocgsk.Raw.Color_stop` |
| `Ocgtk_gsk.Gsk.Wrappers.Component_transfer` | `Ocgsk.Raw.Component_transfer` |
| `Ocgtk_gsk.Gsk.Wrappers.Component_transfer_node` | `Ocgsk.Raw.Component_transfer_node` |
| `Ocgtk_gsk.Gsk.Wrappers.Conic_gradient_node` | `Ocgsk.Raw.Conic_gradient_node` |
| `Ocgtk_gsk.Gsk.Wrappers.Container_node` | `Ocgsk.Raw.Container_node` |
| `Ocgtk_gsk.Gsk.Wrappers.Cross_fade_node` | `Ocgsk.Raw.Cross_fade_node` |
| `Ocgtk_gsk.Gsk.Wrappers.Debug_node` | `Ocgsk.Raw.Debug_node` |
| `Ocgtk_gsk.Gsk.Wrappers.Fill_node` | `Ocgsk.Raw.Fill_node` |
| `Ocgtk_gsk.Gsk.Wrappers.Gl_shader` | `Ocgsk.Raw.Gl_shader` |
| `Ocgtk_gsk.Gsk.Wrappers.Gl_shader_node` | `Ocgsk.Raw.Gl_shader_node` |
| `Ocgtk_gsk.Gsk.Wrappers.Inset_shadow_node` | `Ocgsk.Raw.Inset_shadow_node` |
| `Ocgtk_gsk.Gsk.Wrappers.Linear_gradient_node` | `Ocgsk.Raw.Linear_gradient_node` |
| `Ocgtk_gsk.Gsk.Wrappers.Mask_node` | `Ocgsk.Raw.Mask_node` |
| `Ocgtk_gsk.Gsk.Wrappers.Opacity_node` | `Ocgsk.Raw.Opacity_node` |
| `Ocgtk_gsk.Gsk.Wrappers.Outset_shadow_node` | `Ocgsk.Raw.Outset_shadow_node` |
| `Ocgtk_gsk.Gsk.Wrappers.Parse_location` | `Ocgsk.Raw.Parse_location` |
| `Ocgtk_gsk.Gsk.Wrappers.Path` | `Ocgsk.Raw.Path` |
| `Ocgtk_gsk.Gsk.Wrappers.Path_builder` | `Ocgsk.Raw.Path_builder` |
| `Ocgtk_gsk.Gsk.Wrappers.Path_measure` | `Ocgsk.Raw.Path_measure` |
| `Ocgtk_gsk.Gsk.Wrappers.Path_point` | `Ocgsk.Raw.Path_point` |
| `Ocgtk_gsk.Gsk.Wrappers.Radial_gradient_node` | `Ocgsk.Raw.Radial_gradient_node` |
| `Ocgtk_gsk.Gsk.Wrappers.Renderer` | `Ocgsk.Raw.Renderer` |
| `Ocgtk_gsk.Gsk.Wrappers.Render_node` | `Ocgsk.Raw.Render_node` |
| `Ocgtk_gsk.Gsk.Wrappers.Repeating_linear_gradient_node` | `Ocgsk.Raw.Repeating_linear_gradient_node` |
| `Ocgtk_gsk.Gsk.Wrappers.Repeating_radial_gradient_node` | `Ocgsk.Raw.Repeating_radial_gradient_node` |
| `Ocgtk_gsk.Gsk.Wrappers.Repeat_node` | `Ocgsk.Raw.Repeat_node` |
| `Ocgtk_gsk.Gsk.Wrappers.Rounded_clip_node` | `Ocgsk.Raw.Rounded_clip_node` |
| `Ocgtk_gsk.Gsk.Wrappers.Rounded_rect` | `Ocgsk.Raw.Rounded_rect` |
| `Ocgtk_gsk.Gsk.Wrappers.Shader_args_builder` | `Ocgsk.Raw.Shader_args_builder` |
| `Ocgtk_gsk.Gsk.Wrappers.Shadow` | `Ocgsk.Raw.Shadow` |
| `Ocgtk_gsk.Gsk.Wrappers.Shadow_node` | `Ocgsk.Raw.Shadow_node` |
| `Ocgtk_gsk.Gsk.Wrappers.Stroke` | `Ocgsk.Raw.Stroke` |
| `Ocgtk_gsk.Gsk.Wrappers.Stroke_node` | `Ocgsk.Raw.Stroke_node` |
| `Ocgtk_gsk.Gsk.Wrappers.Subsurface_node` | `Ocgsk.Raw.Subsurface_node` |
| `Ocgtk_gsk.Gsk.Wrappers.Text_node` | `Ocgsk.Raw.Text_node` |
| `Ocgtk_gsk.Gsk.Wrappers.Texture_node` | `Ocgsk.Raw.Texture_node` |
| `Ocgtk_gsk.Gsk.Wrappers.Texture_scale_node` | `Ocgsk.Raw.Texture_scale_node` |
| `Ocgtk_gsk.Gsk.Wrappers.Transform` | `Ocgsk.Raw.Transform` |
| `Ocgtk_gsk.Gsk.Wrappers.Transform_node` | `Ocgsk.Raw.Transform_node` |
| `Ocgtk_gtk` | `Ocgtk` |
| `Ocgtk_gtk.GMain` | `Ocgtk.Main` |
| `Ocgtk_gtk.Gtk` | `Ocgtk` |
| `Ocgtk_gtk.Gtk.About_dialog` | `Ocgtk.About_dialog` |
| `Ocgtk_gtk.Gtk.About_dialog.class about_dialog` | `Ocgtk.About_dialog.class about_dialog` |
| `Ocgtk_gtk.Gtk.About_dialog.class type about_dialog_t` | `Ocgtk.About_dialog.class type about_dialog_t` |
| `Ocgtk_gtk.Gtk.Accessible` | `Ocgtk.Accessible` |
| `Ocgtk_gtk.Gtk.Accessible.class accessible` | `Ocgtk.Accessible.class accessible` |
| `Ocgtk_gtk.Gtk.Accessible.class type accessible_t` | `Ocgtk.Accessible.class type accessible_t` |
| `Ocgtk_gtk.Gtk.Accessible_list` | `Ocgtk.Accessible_list` |
| `Ocgtk_gtk.Gtk.Accessible_list.class accessible_list` | `Ocgtk.Accessible_list.class accessible_list` |
| `Ocgtk_gtk.Gtk.Accessible_list.class type accessible_list_t` | `Ocgtk.Accessible_list.class type accessible_list_t` |
| `Ocgtk_gtk.Gtk.Accessible_range` | `Ocgtk.Accessible_range` |
| `Ocgtk_gtk.Gtk.Accessible_range.class accessible_range` | `Ocgtk.Accessible_range.class accessible_range` |
| `Ocgtk_gtk.Gtk.Accessible_range.class type accessible_range_t` | `Ocgtk.Accessible_range.class type accessible_range_t` |
| `Ocgtk_gtk.Gtk.Accessible_text` | `Ocgtk.Accessible_text` |
| `Ocgtk_gtk.Gtk.Accessible_text.class accessible_text` | `Ocgtk.Accessible_text.class accessible_text` |
| `Ocgtk_gtk.Gtk.Accessible_text.class type accessible_text_t` | `Ocgtk.Accessible_text.class type accessible_text_t` |
| `Ocgtk_gtk.Gtk.Accessible_text_range` | `Ocgtk.Accessible_text_range` |
| `Ocgtk_gtk.Gtk.Accessible_text_range.class accessible_text_range` | `Ocgtk.Accessible_text_range.class accessible_text_range` |
| `Ocgtk_gtk.Gtk.Accessible_text_range.class type accessible_text_range_t` | `Ocgtk.Accessible_text_range.class type accessible_text_range_t` |
| `Ocgtk_gtk.Gtk.Actionable` | `Ocgtk.Actionable` |
| `Ocgtk_gtk.Gtk.Actionable.class actionable` | `Ocgtk.Actionable.class actionable` |
| `Ocgtk_gtk.Gtk.Actionable.class type actionable_t` | `Ocgtk.Actionable.class type actionable_t` |
| `Ocgtk_gtk.Gtk.Action_bar` | `Ocgtk.Action_bar` |
| `Ocgtk_gtk.Gtk.Action_bar.class action_bar` | `Ocgtk.Action_bar.class action_bar` |
| `Ocgtk_gtk.Gtk.Action_bar.class type action_bar_t` | `Ocgtk.Action_bar.class type action_bar_t` |
| `Ocgtk_gtk.Gtk.Activate_action` | `Ocgtk.Activate_action` |
| `Ocgtk_gtk.Gtk.Activate_action.class activate_action` | `Ocgtk.Activate_action.class activate_action` |
| `Ocgtk_gtk.Gtk.Activate_action.class type activate_action_t` | `Ocgtk.Activate_action.class type activate_action_t` |
| `Ocgtk_gtk.Gtk.Adjustment` | `Ocgtk.Adjustment` |
| `Ocgtk_gtk.Gtk.Adjustment.class adjustment` | `Ocgtk.Adjustment.class adjustment` |
| `Ocgtk_gtk.Gtk.Adjustment.class type adjustment_t` | `Ocgtk.Adjustment.class type adjustment_t` |
| `Ocgtk_gtk.Gtk.Alert_dialog` | `Ocgtk.Alert_dialog` |
| `Ocgtk_gtk.Gtk.Alert_dialog.class alert_dialog` | `Ocgtk.Alert_dialog.class alert_dialog` |
| `Ocgtk_gtk.Gtk.Alert_dialog.class type alert_dialog_t` | `Ocgtk.Alert_dialog.class type alert_dialog_t` |
| `Ocgtk_gtk.Gtk.Alternative_trigger` | `Ocgtk.Alternative_trigger` |
| `Ocgtk_gtk.Gtk.Alternative_trigger.class alternative_trigger` | `Ocgtk.Alternative_trigger.class alternative_trigger` |
| `Ocgtk_gtk.Gtk.Alternative_trigger.class type alternative_trigger_t` | `Ocgtk.Alternative_trigger.class type alternative_trigger_t` |
| `Ocgtk_gtk.Gtk.Any_filter` | `Ocgtk.Any_filter` |
| `Ocgtk_gtk.Gtk.Any_filter.class any_filter` | `Ocgtk.Any_filter.class any_filter` |
| `Ocgtk_gtk.Gtk.Any_filter.class type any_filter_t` | `Ocgtk.Any_filter.class type any_filter_t` |
| `Ocgtk_gtk.Gtk.App_chooser` | `Ocgtk.App_chooser` |
| `Ocgtk_gtk.Gtk.App_chooser_button` | `Ocgtk.App_chooser_button` |
| `Ocgtk_gtk.Gtk.App_chooser_button.class app_chooser_button` | `Ocgtk.App_chooser_button.class app_chooser_button` |
| `Ocgtk_gtk.Gtk.App_chooser_button.class type app_chooser_button_t` | `Ocgtk.App_chooser_button.class type app_chooser_button_t` |
| `Ocgtk_gtk.Gtk.App_chooser.class app_chooser` | `Ocgtk.App_chooser.class app_chooser` |
| `Ocgtk_gtk.Gtk.App_chooser.class type app_chooser_t` | `Ocgtk.App_chooser.class type app_chooser_t` |
| `Ocgtk_gtk.Gtk.App_chooser_dialog` | `Ocgtk.App_chooser_dialog` |
| `Ocgtk_gtk.Gtk.App_chooser_dialog.class app_chooser_dialog` | `Ocgtk.App_chooser_dialog.class app_chooser_dialog` |
| `Ocgtk_gtk.Gtk.App_chooser_dialog.class type app_chooser_dialog_t` | `Ocgtk.App_chooser_dialog.class type app_chooser_dialog_t` |
| `Ocgtk_gtk.Gtk.App_chooser_widget` | `Ocgtk.App_chooser_widget` |
| `Ocgtk_gtk.Gtk.App_chooser_widget.class app_chooser_widget` | `Ocgtk.App_chooser_widget.class app_chooser_widget` |
| `Ocgtk_gtk.Gtk.App_chooser_widget.class type app_chooser_widget_t` | `Ocgtk.App_chooser_widget.class type app_chooser_widget_t` |
| `Ocgtk_gtk.Gtk.Application` | `Ocgtk.Application` |
| `Ocgtk_gtk.Gtk.Application.class application` | `Ocgtk.Application.class application` |
| `Ocgtk_gtk.Gtk.Application.class type application_t` | `Ocgtk.Application.class type application_t` |
| `Ocgtk_gtk.Gtk.Application_window` | `Ocgtk.Application_window` |
| `Ocgtk_gtk.Gtk.Application_window.class application_window` | `Ocgtk.Application_window.class application_window` |
| `Ocgtk_gtk.Gtk.Application_window.class type application_window_t` | `Ocgtk.Application_window.class type application_window_t` |
| `Ocgtk_gtk.Gtk.Aspect_frame` | `Ocgtk.Aspect_frame` |
| `Ocgtk_gtk.Gtk.Aspect_frame.class aspect_frame` | `Ocgtk.Aspect_frame.class aspect_frame` |
| `Ocgtk_gtk.Gtk.Aspect_frame.class type aspect_frame_t` | `Ocgtk.Aspect_frame.class type aspect_frame_t` |
| `Ocgtk_gtk.Gtk.Assistant` | `Ocgtk.Assistant` |
| `Ocgtk_gtk.Gtk.Assistant.class assistant` | `Ocgtk.Assistant.class assistant` |
| `Ocgtk_gtk.Gtk.Assistant.class type assistant_t` | `Ocgtk.Assistant.class type assistant_t` |
| `Ocgtk_gtk.Gtk.Assistant_page` | `Ocgtk.Assistant_page` |
| `Ocgtk_gtk.Gtk.Assistant_page.class assistant_page` | `Ocgtk.Assistant_page.class assistant_page` |
| `Ocgtk_gtk.Gtk.Assistant_page.class type assistant_page_t` | `Ocgtk.Assistant_page.class type assistant_page_t` |
| `Ocgtk_gtk.Gtk.At_context` | `Ocgtk.At_context` |
| `Ocgtk_gtk.Gtk.At_context.class at_context` | `Ocgtk.At_context.class at_context` |
| `Ocgtk_gtk.Gtk.At_context.class type at_context_t` | `Ocgtk.At_context.class type at_context_t` |
| `Ocgtk_gtk.Gtk.Bin_layout` | `Ocgtk.Bin_layout` |
| `Ocgtk_gtk.Gtk.Bin_layout.class bin_layout` | `Ocgtk.Bin_layout.class bin_layout` |
| `Ocgtk_gtk.Gtk.Bin_layout.class type bin_layout_t` | `Ocgtk.Bin_layout.class type bin_layout_t` |
| `Ocgtk_gtk.Gtk.Bitset` | `Ocgtk.Bitset` |
| `Ocgtk_gtk.Gtk.Bitset.class bitset` | `Ocgtk.Bitset.class bitset` |
| `Ocgtk_gtk.Gtk.Bitset.class type bitset_t` | `Ocgtk.Bitset.class type bitset_t` |
| `Ocgtk_gtk.Gtk.Bitset_iter` | `Ocgtk.Bitset_iter` |
| `Ocgtk_gtk.Gtk.Bitset_iter.class bitset_iter` | `Ocgtk.Bitset_iter.class bitset_iter` |
| `Ocgtk_gtk.Gtk.Bitset_iter.class type bitset_iter_t` | `Ocgtk.Bitset_iter.class type bitset_iter_t` |
| `Ocgtk_gtk.Gtk.Bookmark_list` | `Ocgtk.Bookmark_list` |
| `Ocgtk_gtk.Gtk.Bookmark_list.class bookmark_list` | `Ocgtk.Bookmark_list.class bookmark_list` |
| `Ocgtk_gtk.Gtk.Bookmark_list.class type bookmark_list_t` | `Ocgtk.Bookmark_list.class type bookmark_list_t` |
| `Ocgtk_gtk.Gtk.Bool_filter` | `Ocgtk.Bool_filter` |
| `Ocgtk_gtk.Gtk.Bool_filter.class bool_filter` | `Ocgtk.Bool_filter.class bool_filter` |
| `Ocgtk_gtk.Gtk.Bool_filter.class type bool_filter_t` | `Ocgtk.Bool_filter.class type bool_filter_t` |
| `Ocgtk_gtk.Gtk.Border` | `Ocgtk.Border` |
| `Ocgtk_gtk.Gtk.Border.class border` | `Ocgtk.Border.class border` |
| `Ocgtk_gtk.Gtk.Border.class type border_t` | `Ocgtk.Border.class type border_t` |
| `Ocgtk_gtk.Gtk.Box` | `Ocgtk.Box` |
| `Ocgtk_gtk.Gtk.Box.class box` | `Ocgtk.Box.class box` |
| `Ocgtk_gtk.Gtk.Box.class type box_t` | `Ocgtk.Box.class type box_t` |
| `Ocgtk_gtk.Gtk.Box_layout` | `Ocgtk.Box_layout` |
| `Ocgtk_gtk.Gtk.Box_layout.class box_layout` | `Ocgtk.Box_layout.class box_layout` |
| `Ocgtk_gtk.Gtk.Box_layout.class type box_layout_t` | `Ocgtk.Box_layout.class type box_layout_t` |
| `Ocgtk_gtk.Gtk.Buildable` | `Ocgtk.Buildable` |
| `Ocgtk_gtk.Gtk.Buildable.class buildable` | `Ocgtk.Buildable.class buildable` |
| `Ocgtk_gtk.Gtk.Buildable.class type buildable_t` | `Ocgtk.Buildable.class type buildable_t` |
| `Ocgtk_gtk.Gtk.Buildable_parse_context` | `Ocgtk.Buildable_parse_context` |
| `Ocgtk_gtk.Gtk.Buildable_parse_context.class buildable_parse_context` | `Ocgtk.Buildable_parse_context.class buildable_parse_context` |
| `Ocgtk_gtk.Gtk.Buildable_parse_context.class type buildable_parse_context_t` | `Ocgtk.Buildable_parse_context.class type buildable_parse_context_t` |
| `Ocgtk_gtk.Gtk.Buildable_parser` | `Ocgtk.Buildable_parser` |
| `Ocgtk_gtk.Gtk.Buildable_parser.class buildable_parser` | `Ocgtk.Buildable_parser.class buildable_parser` |
| `Ocgtk_gtk.Gtk.Buildable_parser.class type buildable_parser_t` | `Ocgtk.Buildable_parser.class type buildable_parser_t` |
| `Ocgtk_gtk.Gtk.Builder` | `Ocgtk.Builder` |
| `Ocgtk_gtk.Gtk.Builder.class builder` | `Ocgtk.Builder.class builder` |
| `Ocgtk_gtk.Gtk.Builder.class type builder_t` | `Ocgtk.Builder.class type builder_t` |
| `Ocgtk_gtk.Gtk.Builder_c_scope` | `Ocgtk.Builder_c_scope` |
| `Ocgtk_gtk.Gtk.Builder_c_scope.class builder_c_scope` | `Ocgtk.Builder_c_scope.class builder_c_scope` |
| `Ocgtk_gtk.Gtk.Builder_c_scope.class type builder_c_scope_t` | `Ocgtk.Builder_c_scope.class type builder_c_scope_t` |
| `Ocgtk_gtk.Gtk.Builder_list_item_factory` | `Ocgtk.Builder_list_item_factory` |
| `Ocgtk_gtk.Gtk.Builder_list_item_factory.class builder_list_item_factory` | `Ocgtk.Builder_list_item_factory.class builder_list_item_factory` |
| `Ocgtk_gtk.Gtk.Builder_list_item_factory.class type builder_list_item_factory_t` | `Ocgtk.Builder_list_item_factory.class type builder_list_item_factory_t` |
| `Ocgtk_gtk.Gtk.Builder_scope` | `Ocgtk.Builder_scope` |
| `Ocgtk_gtk.Gtk.Builder_scope.class builder_scope` | `Ocgtk.Builder_scope.class builder_scope` |
| `Ocgtk_gtk.Gtk.Builder_scope.class type builder_scope_t` | `Ocgtk.Builder_scope.class type builder_scope_t` |
| `Ocgtk_gtk.Gtk.Button` | `Ocgtk.Button` |
| `Ocgtk_gtk.Gtk.Button.class button` | `Ocgtk.Button.class button` |
| `Ocgtk_gtk.Gtk.Button.class type button_t` | `Ocgtk.Button.class type button_t` |
| `Ocgtk_gtk.Gtk.Calendar` | `Ocgtk.Calendar` |
| `Ocgtk_gtk.Gtk.Calendar.class calendar` | `Ocgtk.Calendar.class calendar` |
| `Ocgtk_gtk.Gtk.Calendar.class type calendar_t` | `Ocgtk.Calendar.class type calendar_t` |
| `Ocgtk_gtk.Gtk.Callback_action` | `Ocgtk.Callback_action` |
| `Ocgtk_gtk.Gtk.Callback_action.class callback_action` | `Ocgtk.Callback_action.class callback_action` |
| `Ocgtk_gtk.Gtk.Callback_action.class type callback_action_t` | `Ocgtk.Callback_action.class type callback_action_t` |
| `Ocgtk_gtk.Gtk.C_closure_expression` | `Ocgtk.C_closure_expression` |
| `Ocgtk_gtk.Gtk.C_closure_expression.class c_closure_expression` | `Ocgtk.C_closure_expression.class c_closure_expression` |
| `Ocgtk_gtk.Gtk.C_closure_expression.class type c_closure_expression_t` | `Ocgtk.C_closure_expression.class type c_closure_expression_t` |
| `Ocgtk_gtk.Gtk.Cell_area` | `Ocgtk.Cell_area` |
| `Ocgtk_gtk.Gtk.Cell_area_box` | `Ocgtk.Cell_area_box` |
| `Ocgtk_gtk.Gtk.Cell_area_box.class cell_area_box` | `Ocgtk.Cell_area_box.class cell_area_box` |
| `Ocgtk_gtk.Gtk.Cell_area_box.class type cell_area_box_t` | `Ocgtk.Cell_area_box.class type cell_area_box_t` |
| `Ocgtk_gtk.Gtk.Cell_area.class cell_area` | `Ocgtk.Cell_area.class cell_area` |
| `Ocgtk_gtk.Gtk.Cell_area.class type cell_area_t` | `Ocgtk.Cell_area.class type cell_area_t` |
| `Ocgtk_gtk.Gtk.Cell_area_context` | `Ocgtk.Cell_area_context` |
| `Ocgtk_gtk.Gtk.Cell_area_context.class cell_area_context` | `Ocgtk.Cell_area_context.class cell_area_context` |
| `Ocgtk_gtk.Gtk.Cell_area_context.class type cell_area_context_t` | `Ocgtk.Cell_area_context.class type cell_area_context_t` |
| `Ocgtk_gtk.Gtk.Cell_editable` | `Ocgtk.Cell_editable` |
| `Ocgtk_gtk.Gtk.Cell_editable.class cell_editable` | `Ocgtk.Cell_editable.class cell_editable` |
| `Ocgtk_gtk.Gtk.Cell_editable.class type cell_editable_t` | `Ocgtk.Cell_editable.class type cell_editable_t` |
| `Ocgtk_gtk.Gtk.Cell_layout` | `Ocgtk.Cell_layout` |
| `Ocgtk_gtk.Gtk.Cell_layout.class cell_layout` | `Ocgtk.Cell_layout.class cell_layout` |
| `Ocgtk_gtk.Gtk.Cell_layout.class type cell_layout_t` | `Ocgtk.Cell_layout.class type cell_layout_t` |
| `Ocgtk_gtk.Gtk.Cell_renderer` | `Ocgtk.Cell_renderer` |
| `Ocgtk_gtk.Gtk.Cell_renderer_accel` | `Ocgtk.Cell_renderer_accel` |
| `Ocgtk_gtk.Gtk.Cell_renderer_accel.class cell_renderer_accel` | `Ocgtk.Cell_renderer_accel.class cell_renderer_accel` |
| `Ocgtk_gtk.Gtk.Cell_renderer_accel.class type cell_renderer_accel_t` | `Ocgtk.Cell_renderer_accel.class type cell_renderer_accel_t` |
| `Ocgtk_gtk.Gtk.Cell_renderer.class cell_renderer` | `Ocgtk.Cell_renderer.class cell_renderer` |
| `Ocgtk_gtk.Gtk.Cell_renderer.class type cell_renderer_t` | `Ocgtk.Cell_renderer.class type cell_renderer_t` |
| `Ocgtk_gtk.Gtk.Cell_renderer_combo` | `Ocgtk.Cell_renderer_combo` |
| `Ocgtk_gtk.Gtk.Cell_renderer_combo.class cell_renderer_combo` | `Ocgtk.Cell_renderer_combo.class cell_renderer_combo` |
| `Ocgtk_gtk.Gtk.Cell_renderer_combo.class type cell_renderer_combo_t` | `Ocgtk.Cell_renderer_combo.class type cell_renderer_combo_t` |
| `Ocgtk_gtk.Gtk.Cell_renderer_pixbuf` | `Ocgtk.Cell_renderer_pixbuf` |
| `Ocgtk_gtk.Gtk.Cell_renderer_pixbuf.class cell_renderer_pixbuf` | `Ocgtk.Cell_renderer_pixbuf.class cell_renderer_pixbuf` |
| `Ocgtk_gtk.Gtk.Cell_renderer_pixbuf.class type cell_renderer_pixbuf_t` | `Ocgtk.Cell_renderer_pixbuf.class type cell_renderer_pixbuf_t` |
| `Ocgtk_gtk.Gtk.Cell_renderer_progress` | `Ocgtk.Cell_renderer_progress` |
| `Ocgtk_gtk.Gtk.Cell_renderer_progress.class cell_renderer_progress` | `Ocgtk.Cell_renderer_progress.class cell_renderer_progress` |
| `Ocgtk_gtk.Gtk.Cell_renderer_progress.class type cell_renderer_progress_t` | `Ocgtk.Cell_renderer_progress.class type cell_renderer_progress_t` |
| `Ocgtk_gtk.Gtk.Cell_renderer_spin` | `Ocgtk.Cell_renderer_spin` |
| `Ocgtk_gtk.Gtk.Cell_renderer_spin.class cell_renderer_spin` | `Ocgtk.Cell_renderer_spin.class cell_renderer_spin` |
| `Ocgtk_gtk.Gtk.Cell_renderer_spin.class type cell_renderer_spin_t` | `Ocgtk.Cell_renderer_spin.class type cell_renderer_spin_t` |
| `Ocgtk_gtk.Gtk.Cell_renderer_spinner` | `Ocgtk.Cell_renderer_spinner` |
| `Ocgtk_gtk.Gtk.Cell_renderer_spinner.class cell_renderer_spinner` | `Ocgtk.Cell_renderer_spinner.class cell_renderer_spinner` |
| `Ocgtk_gtk.Gtk.Cell_renderer_spinner.class type cell_renderer_spinner_t` | `Ocgtk.Cell_renderer_spinner.class type cell_renderer_spinner_t` |
| `Ocgtk_gtk.Gtk.Cell_renderer_text` | `Ocgtk.Cell_renderer_text` |
| `Ocgtk_gtk.Gtk.Cell_renderer_text.class cell_renderer_text` | `Ocgtk.Cell_renderer_text.class cell_renderer_text` |
| `Ocgtk_gtk.Gtk.Cell_renderer_text.class type cell_renderer_text_t` | `Ocgtk.Cell_renderer_text.class type cell_renderer_text_t` |
| `Ocgtk_gtk.Gtk.Cell_renderer_toggle` | `Ocgtk.Cell_renderer_toggle` |
| `Ocgtk_gtk.Gtk.Cell_renderer_toggle.class cell_renderer_toggle` | `Ocgtk.Cell_renderer_toggle.class cell_renderer_toggle` |
| `Ocgtk_gtk.Gtk.Cell_renderer_toggle.class type cell_renderer_toggle_t` | `Ocgtk.Cell_renderer_toggle.class type cell_renderer_toggle_t` |
| `Ocgtk_gtk.Gtk.Cell_view` | `Ocgtk.Cell_view` |
| `Ocgtk_gtk.Gtk.Cell_view.class cell_view` | `Ocgtk.Cell_view.class cell_view` |
| `Ocgtk_gtk.Gtk.Cell_view.class type cell_view_t` | `Ocgtk.Cell_view.class type cell_view_t` |
| `Ocgtk_gtk.Gtk.Center_box` | `Ocgtk.Center_box` |
| `Ocgtk_gtk.Gtk.Center_box.class center_box` | `Ocgtk.Center_box.class center_box` |
| `Ocgtk_gtk.Gtk.Center_box.class type center_box_t` | `Ocgtk.Center_box.class type center_box_t` |
| `Ocgtk_gtk.Gtk.Center_layout` | `Ocgtk.Center_layout` |
| `Ocgtk_gtk.Gtk.Center_layout.class center_layout` | `Ocgtk.Center_layout.class center_layout` |
| `Ocgtk_gtk.Gtk.Center_layout.class type center_layout_t` | `Ocgtk.Center_layout.class type center_layout_t` |
| `Ocgtk_gtk.Gtk.Check_button` | `Ocgtk.Check_button` |
| `Ocgtk_gtk.Gtk.Check_button.class check_button` | `Ocgtk.Check_button.class check_button` |
| `Ocgtk_gtk.Gtk.Check_button.class type check_button_t` | `Ocgtk.Check_button.class type check_button_t` |
| `Ocgtk_gtk.Gtk.Closure_expression` | `Ocgtk.Closure_expression` |
| `Ocgtk_gtk.Gtk.Closure_expression.class closure_expression` | `Ocgtk.Closure_expression.class closure_expression` |
| `Ocgtk_gtk.Gtk.Closure_expression.class type closure_expression_t` | `Ocgtk.Closure_expression.class type closure_expression_t` |
| `Ocgtk_gtk.Gtk.Color_button` | `Ocgtk.Color_button` |
| `Ocgtk_gtk.Gtk.Color_button.class color_button` | `Ocgtk.Color_button.class color_button` |
| `Ocgtk_gtk.Gtk.Color_button.class type color_button_t` | `Ocgtk.Color_button.class type color_button_t` |
| `Ocgtk_gtk.Gtk.Color_chooser` | `Ocgtk.Color_chooser` |
| `Ocgtk_gtk.Gtk.Color_chooser.class color_chooser` | `Ocgtk.Color_chooser.class color_chooser` |
| `Ocgtk_gtk.Gtk.Color_chooser.class type color_chooser_t` | `Ocgtk.Color_chooser.class type color_chooser_t` |
| `Ocgtk_gtk.Gtk.Color_chooser_dialog` | `Ocgtk.Color_chooser_dialog` |
| `Ocgtk_gtk.Gtk.Color_chooser_dialog.class color_chooser_dialog` | `Ocgtk.Color_chooser_dialog.class color_chooser_dialog` |
| `Ocgtk_gtk.Gtk.Color_chooser_dialog.class type color_chooser_dialog_t` | `Ocgtk.Color_chooser_dialog.class type color_chooser_dialog_t` |
| `Ocgtk_gtk.Gtk.Color_chooser_widget` | `Ocgtk.Color_chooser_widget` |
| `Ocgtk_gtk.Gtk.Color_chooser_widget.class color_chooser_widget` | `Ocgtk.Color_chooser_widget.class color_chooser_widget` |
| `Ocgtk_gtk.Gtk.Color_chooser_widget.class type color_chooser_widget_t` | `Ocgtk.Color_chooser_widget.class type color_chooser_widget_t` |
| `Ocgtk_gtk.Gtk.Color_dialog` | `Ocgtk.Color_dialog` |
| `Ocgtk_gtk.Gtk.Color_dialog_button` | `Ocgtk.Color_dialog_button` |
| `Ocgtk_gtk.Gtk.Color_dialog_button.class color_dialog_button` | `Ocgtk.Color_dialog_button.class color_dialog_button` |
| `Ocgtk_gtk.Gtk.Color_dialog_button.class type color_dialog_button_t` | `Ocgtk.Color_dialog_button.class type color_dialog_button_t` |
| `Ocgtk_gtk.Gtk.Color_dialog.class color_dialog` | `Ocgtk.Color_dialog.class color_dialog` |
| `Ocgtk_gtk.Gtk.Color_dialog.class type color_dialog_t` | `Ocgtk.Color_dialog.class type color_dialog_t` |
| `Ocgtk_gtk.Gtk.Column_view` | `Ocgtk.Column_view` |
| `Ocgtk_gtk.Gtk.Column_view_cell` | `Ocgtk.Column_view_cell` |
| `Ocgtk_gtk.Gtk.Column_view_cell.class column_view_cell` | `Ocgtk.Column_view_cell.class column_view_cell` |
| `Ocgtk_gtk.Gtk.Column_view_cell.class type column_view_cell_t` | `Ocgtk.Column_view_cell.class type column_view_cell_t` |
| `Ocgtk_gtk.Gtk.Column_view.class column_view` | `Ocgtk.Column_view.class column_view` |
| `Ocgtk_gtk.Gtk.Column_view.class type column_view_t` | `Ocgtk.Column_view.class type column_view_t` |
| `Ocgtk_gtk.Gtk.Column_view_column` | `Ocgtk.Column_view_column` |
| `Ocgtk_gtk.Gtk.Column_view_column.class column_view_column` | `Ocgtk.Column_view_column.class column_view_column` |
| `Ocgtk_gtk.Gtk.Column_view_column.class type column_view_column_t` | `Ocgtk.Column_view_column.class type column_view_column_t` |
| `Ocgtk_gtk.Gtk.Column_view_row` | `Ocgtk.Column_view_row` |
| `Ocgtk_gtk.Gtk.Column_view_row.class column_view_row` | `Ocgtk.Column_view_row.class column_view_row` |
| `Ocgtk_gtk.Gtk.Column_view_row.class type column_view_row_t` | `Ocgtk.Column_view_row.class type column_view_row_t` |
| `Ocgtk_gtk.Gtk.Column_view_sorter` | `Ocgtk.Column_view_sorter` |
| `Ocgtk_gtk.Gtk.Column_view_sorter.class column_view_sorter` | `Ocgtk.Column_view_sorter.class column_view_sorter` |
| `Ocgtk_gtk.Gtk.Column_view_sorter.class type column_view_sorter_t` | `Ocgtk.Column_view_sorter.class type column_view_sorter_t` |
| `Ocgtk_gtk.Gtk.Combo_box` | `Ocgtk.Combo_box` |
| `Ocgtk_gtk.Gtk.Combo_box.class combo_box` | `Ocgtk.Combo_box.class combo_box` |
| `Ocgtk_gtk.Gtk.Combo_box.class type combo_box_t` | `Ocgtk.Combo_box.class type combo_box_t` |
| `Ocgtk_gtk.Gtk.Combo_box_text` | `Ocgtk.Combo_box_text` |
| `Ocgtk_gtk.Gtk.Combo_box_text.class combo_box_text` | `Ocgtk.Combo_box_text.class combo_box_text` |
| `Ocgtk_gtk.Gtk.Combo_box_text.class type combo_box_text_t` | `Ocgtk.Combo_box_text.class type combo_box_text_t` |
| `Ocgtk_gtk.Gtk.Constant_expression` | `Ocgtk.Constant_expression` |
| `Ocgtk_gtk.Gtk.Constant_expression.class constant_expression` | `Ocgtk.Constant_expression.class constant_expression` |
| `Ocgtk_gtk.Gtk.Constant_expression.class type constant_expression_t` | `Ocgtk.Constant_expression.class type constant_expression_t` |
| `Ocgtk_gtk.Gtk_constants` | `Ocgtk.Constants` |
| `Ocgtk_gtk.Gtk.Constraint` | `Ocgtk.Constraint` |
| `Ocgtk_gtk.Gtk.Constraint.class constraint_` | `Ocgtk.Constraint.class constraint_` |
| `Ocgtk_gtk.Gtk.Constraint_guide` | `Ocgtk.Constraint_guide` |
| `Ocgtk_gtk.Gtk.Constraint_guide.class constraint_guide` | `Ocgtk.Constraint_guide.class constraint_guide` |
| `Ocgtk_gtk.Gtk.Constraint_guide.class type constraint_guide_t` | `Ocgtk.Constraint_guide.class type constraint_guide_t` |
| `Ocgtk_gtk.Gtk.Constraint_layout` | `Ocgtk.Constraint_layout` |
| `Ocgtk_gtk.Gtk.Constraint_layout_child` | `Ocgtk.Constraint_layout_child` |
| `Ocgtk_gtk.Gtk.Constraint_layout_child.class constraint_layout_child` | `Ocgtk.Constraint_layout_child.class constraint_layout_child` |
| `Ocgtk_gtk.Gtk.Constraint_layout_child.class type constraint_layout_child_t` | `Ocgtk.Constraint_layout_child.class type constraint_layout_child_t` |
| `Ocgtk_gtk.Gtk.Constraint_layout.class constraint_layout` | `Ocgtk.Constraint_layout.class constraint_layout` |
| `Ocgtk_gtk.Gtk.Constraint_layout.class type constraint_layout_t` | `Ocgtk.Constraint_layout.class type constraint_layout_t` |
| `Ocgtk_gtk.Gtk.Constraint_target` | `Ocgtk.Constraint_target` |
| `Ocgtk_gtk.Gtk.Constraint_target.class constraint_target` | `Ocgtk.Constraint_target.class constraint_target` |
| `Ocgtk_gtk.Gtk.Constraint_target.class type constraint_target_t` | `Ocgtk.Constraint_target.class type constraint_target_t` |
| `Ocgtk_gtk.Gtk.Css_location` | `Ocgtk.Css_location` |
| `Ocgtk_gtk.Gtk.Css_location.class css_location` | `Ocgtk.Css_location.class css_location` |
| `Ocgtk_gtk.Gtk.Css_location.class type css_location_t` | `Ocgtk.Css_location.class type css_location_t` |
| `Ocgtk_gtk.Gtk.Css_provider` | `Ocgtk.Css_provider` |
| `Ocgtk_gtk.Gtk.Css_provider.class css_provider` | `Ocgtk.Css_provider.class css_provider` |
| `Ocgtk_gtk.Gtk.Css_provider.class type css_provider_t` | `Ocgtk.Css_provider.class type css_provider_t` |
| `Ocgtk_gtk.Gtk.Css_section` | `Ocgtk.Css_section` |
| `Ocgtk_gtk.Gtk.Css_section.class css_section` | `Ocgtk.Css_section.class css_section` |
| `Ocgtk_gtk.Gtk.Css_section.class type css_section_t` | `Ocgtk.Css_section.class type css_section_t` |
| `Ocgtk_gtk.Gtk.Css_style_change` | `Ocgtk.Css_style_change` |
| `Ocgtk_gtk.Gtk.Css_style_change.class css_style_change` | `Ocgtk.Css_style_change.class css_style_change` |
| `Ocgtk_gtk.Gtk.Css_style_change.class type css_style_change_t` | `Ocgtk.Css_style_change.class type css_style_change_t` |
| `Ocgtk_gtk.Gtk.Custom_filter` | `Ocgtk.Custom_filter` |
| `Ocgtk_gtk.Gtk.Custom_filter.class custom_filter` | `Ocgtk.Custom_filter.class custom_filter` |
| `Ocgtk_gtk.Gtk.Custom_filter.class type custom_filter_t` | `Ocgtk.Custom_filter.class type custom_filter_t` |
| `Ocgtk_gtk.Gtk.Custom_layout` | `Ocgtk.Custom_layout` |
| `Ocgtk_gtk.Gtk.Custom_layout.class custom_layout` | `Ocgtk.Custom_layout.class custom_layout` |
| `Ocgtk_gtk.Gtk.Custom_layout.class type custom_layout_t` | `Ocgtk.Custom_layout.class type custom_layout_t` |
| `Ocgtk_gtk.Gtk.Custom_sorter` | `Ocgtk.Custom_sorter` |
| `Ocgtk_gtk.Gtk.Custom_sorter.class custom_sorter` | `Ocgtk.Custom_sorter.class custom_sorter` |
| `Ocgtk_gtk.Gtk.Custom_sorter.class type custom_sorter_t` | `Ocgtk.Custom_sorter.class type custom_sorter_t` |
| `Ocgtk_gtk.Gtk.Dialog` | `Ocgtk.Dialog` |
| `Ocgtk_gtk.Gtk.Dialog.class dialog` | `Ocgtk.Dialog.class dialog` |
| `Ocgtk_gtk.Gtk.Dialog.class type dialog_t` | `Ocgtk.Dialog.class type dialog_t` |
| `Ocgtk_gtk.Gtk.Directory_list` | `Ocgtk.Directory_list` |
| `Ocgtk_gtk.Gtk.Directory_list.class directory_list` | `Ocgtk.Directory_list.class directory_list` |
| `Ocgtk_gtk.Gtk.Directory_list.class type directory_list_t` | `Ocgtk.Directory_list.class type directory_list_t` |
| `Ocgtk_gtk.Gtk.Drag_icon` | `Ocgtk.Drag_icon` |
| `Ocgtk_gtk.Gtk.Drag_icon.class drag_icon` | `Ocgtk.Drag_icon.class drag_icon` |
| `Ocgtk_gtk.Gtk.Drag_icon.class type drag_icon_t` | `Ocgtk.Drag_icon.class type drag_icon_t` |
| `Ocgtk_gtk.Gtk.Drag_source` | `Ocgtk.Drag_source` |
| `Ocgtk_gtk.Gtk.Drag_source.class drag_source` | `Ocgtk.Drag_source.class drag_source` |
| `Ocgtk_gtk.Gtk.Drag_source.class type drag_source_t` | `Ocgtk.Drag_source.class type drag_source_t` |
| `Ocgtk_gtk.Gtk.Drawing_area` | `Ocgtk.Drawing_area` |
| `Ocgtk_gtk.Gtk.Drawing_area.class drawing_area` | `Ocgtk.Drawing_area.class drawing_area` |
| `Ocgtk_gtk.Gtk.Drawing_area.class type drawing_area_t` | `Ocgtk.Drawing_area.class type drawing_area_t` |
| `Ocgtk_gtk.Gtk.Drop_controller_motion` | `Ocgtk.Drop_controller_motion` |
| `Ocgtk_gtk.Gtk.Drop_controller_motion.class drop_controller_motion` | `Ocgtk.Drop_controller_motion.class drop_controller_motion` |
| `Ocgtk_gtk.Gtk.Drop_controller_motion.class type drop_controller_motion_t` | `Ocgtk.Drop_controller_motion.class type drop_controller_motion_t` |
| `Ocgtk_gtk.Gtk.Drop_down` | `Ocgtk.Drop_down` |
| `Ocgtk_gtk.Gtk.Drop_down.class drop_down` | `Ocgtk.Drop_down.class drop_down` |
| `Ocgtk_gtk.Gtk.Drop_down.class type drop_down_t` | `Ocgtk.Drop_down.class type drop_down_t` |
| `Ocgtk_gtk.Gtk.Drop_target` | `Ocgtk.Drop_target` |
| `Ocgtk_gtk.Gtk.Drop_target_async` | `Ocgtk.Drop_target_async` |
| `Ocgtk_gtk.Gtk.Drop_target_async.class drop_target_async` | `Ocgtk.Drop_target_async.class drop_target_async` |
| `Ocgtk_gtk.Gtk.Drop_target_async.class type drop_target_async_t` | `Ocgtk.Drop_target_async.class type drop_target_async_t` |
| `Ocgtk_gtk.Gtk.Drop_target.class drop_target` | `Ocgtk.Drop_target.class drop_target` |
| `Ocgtk_gtk.Gtk.Drop_target.class type drop_target_t` | `Ocgtk.Drop_target.class type drop_target_t` |
| `Ocgtk_gtk.Gtk.Editable` | `Ocgtk.Editable` |
| `Ocgtk_gtk.Gtk.Editable.class editable` | `Ocgtk.Editable.class editable` |
| `Ocgtk_gtk.Gtk.Editable.class type editable_t` | `Ocgtk.Editable.class type editable_t` |
| `Ocgtk_gtk.Gtk.Editable_label` | `Ocgtk.Editable_label` |
| `Ocgtk_gtk.Gtk.Editable_label.class editable_label` | `Ocgtk.Editable_label.class editable_label` |
| `Ocgtk_gtk.Gtk.Editable_label.class type editable_label_t` | `Ocgtk.Editable_label.class type editable_label_t` |
| `Ocgtk_gtk.Gtk.Emoji_chooser` | `Ocgtk.Emoji_chooser` |
| `Ocgtk_gtk.Gtk.Emoji_chooser.class emoji_chooser` | `Ocgtk.Emoji_chooser.class emoji_chooser` |
| `Ocgtk_gtk.Gtk.Emoji_chooser.class type emoji_chooser_t` | `Ocgtk.Emoji_chooser.class type emoji_chooser_t` |
| `Ocgtk_gtk.Gtk.Entry` | `Ocgtk.Entry` |
| `Ocgtk_gtk.Gtk.Entry_buffer` | `Ocgtk.Entry_buffer` |
| `Ocgtk_gtk.Gtk.Entry_buffer.class entry_buffer` | `Ocgtk.Entry_buffer.class entry_buffer` |
| `Ocgtk_gtk.Gtk.Entry_buffer.class type entry_buffer_t` | `Ocgtk.Entry_buffer.class type entry_buffer_t` |
| `Ocgtk_gtk.Gtk.Entry.class entry` | `Ocgtk.Entry.class entry` |
| `Ocgtk_gtk.Gtk.Entry.class type entry_t` | `Ocgtk.Entry.class type entry_t` |
| `Ocgtk_gtk.Gtk.Entry_completion` | `Ocgtk.Entry_completion` |
| `Ocgtk_gtk.Gtk.Entry_completion.class entry_completion` | `Ocgtk.Entry_completion.class entry_completion` |
| `Ocgtk_gtk.Gtk.Entry_completion.class type entry_completion_t` | `Ocgtk.Entry_completion.class type entry_completion_t` |
| `Ocgtk_gtk.Gtk_enums` | `Ocgtk.Enums` |
| `Ocgtk_gtk.Gtk.Event_controller` | `Ocgtk.Event_controller` |
| `Ocgtk_gtk.Gtk.Event_controller.class event_controller` | `Ocgtk.Event_controller.class event_controller` |
| `Ocgtk_gtk.Gtk.Event_controller.class type event_controller_t` | `Ocgtk.Event_controller.class type event_controller_t` |
| `Ocgtk_gtk.Gtk.Event_controller_focus` | `Ocgtk.Event_controller_focus` |
| `Ocgtk_gtk.Gtk.Event_controller_focus.class event_controller_focus` | `Ocgtk.Event_controller_focus.class event_controller_focus` |
| `Ocgtk_gtk.Gtk.Event_controller_focus.class type event_controller_focus_t` | `Ocgtk.Event_controller_focus.class type event_controller_focus_t` |
| `Ocgtk_gtk.Gtk.Event_controller_key` | `Ocgtk.Event_controller_key` |
| `Ocgtk_gtk.Gtk.Event_controller_key.class event_controller_key` | `Ocgtk.Event_controller_key.class event_controller_key` |
| `Ocgtk_gtk.Gtk.Event_controller_key.class type event_controller_key_t` | `Ocgtk.Event_controller_key.class type event_controller_key_t` |
| `Ocgtk_gtk.Gtk.Event_controller_legacy` | `Ocgtk.Event_controller_legacy` |
| `Ocgtk_gtk.Gtk.Event_controller_legacy.class event_controller_legacy` | `Ocgtk.Event_controller_legacy.class event_controller_legacy` |
| `Ocgtk_gtk.Gtk.Event_controller_legacy.class type event_controller_legacy_t` | `Ocgtk.Event_controller_legacy.class type event_controller_legacy_t` |
| `Ocgtk_gtk.Gtk.Event_controller_motion` | `Ocgtk.Event_controller_motion` |
| `Ocgtk_gtk.Gtk.Event_controller_motion.class event_controller_motion` | `Ocgtk.Event_controller_motion.class event_controller_motion` |
| `Ocgtk_gtk.Gtk.Event_controller_motion.class type event_controller_motion_t` | `Ocgtk.Event_controller_motion.class type event_controller_motion_t` |
| `Ocgtk_gtk.Gtk.Event_controller_scroll` | `Ocgtk.Event_controller_scroll` |
| `Ocgtk_gtk.Gtk.Event_controller_scroll.class event_controller_scroll` | `Ocgtk.Event_controller_scroll.class event_controller_scroll` |
| `Ocgtk_gtk.Gtk.Event_controller_scroll.class type event_controller_scroll_t` | `Ocgtk.Event_controller_scroll.class type event_controller_scroll_t` |
| `Ocgtk_gtk.Gtk.Every_filter` | `Ocgtk.Every_filter` |
| `Ocgtk_gtk.Gtk.Every_filter.class every_filter` | `Ocgtk.Every_filter.class every_filter` |
| `Ocgtk_gtk.Gtk.Every_filter.class type every_filter_t` | `Ocgtk.Every_filter.class type every_filter_t` |
| `Ocgtk_gtk.Gtk.Expander` | `Ocgtk.Expander` |
| `Ocgtk_gtk.Gtk.Expander.class expander` | `Ocgtk.Expander.class expander` |
| `Ocgtk_gtk.Gtk.Expander.class type expander_t` | `Ocgtk.Expander.class type expander_t` |
| `Ocgtk_gtk.Gtk.Expression` | `Ocgtk.Expression` |
| `Ocgtk_gtk.Gtk.Expression.class expression` | `Ocgtk.Expression.class expression` |
| `Ocgtk_gtk.Gtk.Expression.class type expression_t` | `Ocgtk.Expression.class type expression_t` |
| `Ocgtk_gtk.Gtk.Expression_watch` | `Ocgtk.Expression_watch` |
| `Ocgtk_gtk.Gtk.Expression_watch.class expression_watch` | `Ocgtk.Expression_watch.class expression_watch` |
| `Ocgtk_gtk.Gtk.Expression_watch.class type expression_watch_t` | `Ocgtk.Expression_watch.class type expression_watch_t` |
| `Ocgtk_gtk.Gtk.File_chooser` | `Ocgtk.File_chooser` |
| `Ocgtk_gtk.Gtk.File_chooser.class file_chooser` | `Ocgtk.File_chooser.class file_chooser` |
| `Ocgtk_gtk.Gtk.File_chooser.class type file_chooser_t` | `Ocgtk.File_chooser.class type file_chooser_t` |
| `Ocgtk_gtk.Gtk.File_chooser_dialog` | `Ocgtk.File_chooser_dialog` |
| `Ocgtk_gtk.Gtk.File_chooser_dialog.class file_chooser_dialog` | `Ocgtk.File_chooser_dialog.class file_chooser_dialog` |
| `Ocgtk_gtk.Gtk.File_chooser_dialog.class type file_chooser_dialog_t` | `Ocgtk.File_chooser_dialog.class type file_chooser_dialog_t` |
| `Ocgtk_gtk.Gtk.File_chooser_native` | `Ocgtk.File_chooser_native` |
| `Ocgtk_gtk.Gtk.File_chooser_native.class file_chooser_native` | `Ocgtk.File_chooser_native.class file_chooser_native` |
| `Ocgtk_gtk.Gtk.File_chooser_native.class type file_chooser_native_t` | `Ocgtk.File_chooser_native.class type file_chooser_native_t` |
| `Ocgtk_gtk.Gtk.File_chooser_widget` | `Ocgtk.File_chooser_widget` |
| `Ocgtk_gtk.Gtk.File_chooser_widget.class file_chooser_widget` | `Ocgtk.File_chooser_widget.class file_chooser_widget` |
| `Ocgtk_gtk.Gtk.File_chooser_widget.class type file_chooser_widget_t` | `Ocgtk.File_chooser_widget.class type file_chooser_widget_t` |
| `Ocgtk_gtk.Gtk.File_dialog` | `Ocgtk.File_dialog` |
| `Ocgtk_gtk.Gtk.File_dialog.class file_dialog` | `Ocgtk.File_dialog.class file_dialog` |
| `Ocgtk_gtk.Gtk.File_dialog.class type file_dialog_t` | `Ocgtk.File_dialog.class type file_dialog_t` |
| `Ocgtk_gtk.Gtk.File_filter` | `Ocgtk.File_filter` |
| `Ocgtk_gtk.Gtk.File_filter.class file_filter` | `Ocgtk.File_filter.class file_filter` |
| `Ocgtk_gtk.Gtk.File_filter.class type file_filter_t` | `Ocgtk.File_filter.class type file_filter_t` |
| `Ocgtk_gtk.Gtk.File_launcher` | `Ocgtk.File_launcher` |
| `Ocgtk_gtk.Gtk.File_launcher.class file_launcher` | `Ocgtk.File_launcher.class file_launcher` |
| `Ocgtk_gtk.Gtk.File_launcher.class type file_launcher_t` | `Ocgtk.File_launcher.class type file_launcher_t` |
| `Ocgtk_gtk.Gtk.Filter` | `Ocgtk.Filter` |
| `Ocgtk_gtk.Gtk.Filter.class filter` | `Ocgtk.Filter.class filter` |
| `Ocgtk_gtk.Gtk.Filter.class type filter_t` | `Ocgtk.Filter.class type filter_t` |
| `Ocgtk_gtk.Gtk.Filter_list_model` | `Ocgtk.Filter_list_model` |
| `Ocgtk_gtk.Gtk.Filter_list_model.class filter_list_model` | `Ocgtk.Filter_list_model.class filter_list_model` |
| `Ocgtk_gtk.Gtk.Filter_list_model.class type filter_list_model_t` | `Ocgtk.Filter_list_model.class type filter_list_model_t` |
| `Ocgtk_gtk.Gtk.Fixed` | `Ocgtk.Fixed` |
| `Ocgtk_gtk.Gtk.Fixed.class fixed` | `Ocgtk.Fixed.class fixed` |
| `Ocgtk_gtk.Gtk.Fixed.class type fixed_t` | `Ocgtk.Fixed.class type fixed_t` |
| `Ocgtk_gtk.Gtk.Fixed_layout` | `Ocgtk.Fixed_layout` |
| `Ocgtk_gtk.Gtk.Fixed_layout_child` | `Ocgtk.Fixed_layout_child` |
| `Ocgtk_gtk.Gtk.Fixed_layout_child.class fixed_layout_child` | `Ocgtk.Fixed_layout_child.class fixed_layout_child` |
| `Ocgtk_gtk.Gtk.Fixed_layout_child.class type fixed_layout_child_t` | `Ocgtk.Fixed_layout_child.class type fixed_layout_child_t` |
| `Ocgtk_gtk.Gtk.Fixed_layout.class fixed_layout` | `Ocgtk.Fixed_layout.class fixed_layout` |
| `Ocgtk_gtk.Gtk.Fixed_layout.class type fixed_layout_t` | `Ocgtk.Fixed_layout.class type fixed_layout_t` |
| `Ocgtk_gtk.Gtk.Flatten_list_model` | `Ocgtk.Flatten_list_model` |
| `Ocgtk_gtk.Gtk.Flatten_list_model.class flatten_list_model` | `Ocgtk.Flatten_list_model.class flatten_list_model` |
| `Ocgtk_gtk.Gtk.Flatten_list_model.class type flatten_list_model_t` | `Ocgtk.Flatten_list_model.class type flatten_list_model_t` |
| `Ocgtk_gtk.Gtk.Flow_box` | `Ocgtk.Flow_box` |
| `Ocgtk_gtk.Gtk.Flow_box_child` | `Ocgtk.Flow_box_child` |
| `Ocgtk_gtk.Gtk.Flow_box_child.class flow_box_child` | `Ocgtk.Flow_box_child.class flow_box_child` |
| `Ocgtk_gtk.Gtk.Flow_box_child.class type flow_box_child_t` | `Ocgtk.Flow_box_child.class type flow_box_child_t` |
| `Ocgtk_gtk.Gtk.Flow_box.class flow_box` | `Ocgtk.Flow_box.class flow_box` |
| `Ocgtk_gtk.Gtk.Flow_box.class type flow_box_t` | `Ocgtk.Flow_box.class type flow_box_t` |
| `Ocgtk_gtk.Gtk.Font_button` | `Ocgtk.Font_button` |
| `Ocgtk_gtk.Gtk.Font_button.class font_button` | `Ocgtk.Font_button.class font_button` |
| `Ocgtk_gtk.Gtk.Font_button.class type font_button_t` | `Ocgtk.Font_button.class type font_button_t` |
| `Ocgtk_gtk.Gtk.Font_chooser` | `Ocgtk.Font_chooser` |
| `Ocgtk_gtk.Gtk.Font_chooser.class font_chooser` | `Ocgtk.Font_chooser.class font_chooser` |
| `Ocgtk_gtk.Gtk.Font_chooser.class type font_chooser_t` | `Ocgtk.Font_chooser.class type font_chooser_t` |
| `Ocgtk_gtk.Gtk.Font_chooser_dialog` | `Ocgtk.Font_chooser_dialog` |
| `Ocgtk_gtk.Gtk.Font_chooser_dialog.class font_chooser_dialog` | `Ocgtk.Font_chooser_dialog.class font_chooser_dialog` |
| `Ocgtk_gtk.Gtk.Font_chooser_dialog.class type font_chooser_dialog_t` | `Ocgtk.Font_chooser_dialog.class type font_chooser_dialog_t` |
| `Ocgtk_gtk.Gtk.Font_chooser_widget` | `Ocgtk.Font_chooser_widget` |
| `Ocgtk_gtk.Gtk.Font_chooser_widget.class font_chooser_widget` | `Ocgtk.Font_chooser_widget.class font_chooser_widget` |
| `Ocgtk_gtk.Gtk.Font_chooser_widget.class type font_chooser_widget_t` | `Ocgtk.Font_chooser_widget.class type font_chooser_widget_t` |
| `Ocgtk_gtk.Gtk.Font_dialog` | `Ocgtk.Font_dialog` |
| `Ocgtk_gtk.Gtk.Font_dialog_button` | `Ocgtk.Font_dialog_button` |
| `Ocgtk_gtk.Gtk.Font_dialog_button.class font_dialog_button` | `Ocgtk.Font_dialog_button.class font_dialog_button` |
| `Ocgtk_gtk.Gtk.Font_dialog_button.class type font_dialog_button_t` | `Ocgtk.Font_dialog_button.class type font_dialog_button_t` |
| `Ocgtk_gtk.Gtk.Font_dialog.class font_dialog` | `Ocgtk.Font_dialog.class font_dialog` |
| `Ocgtk_gtk.Gtk.Font_dialog.class type font_dialog_t` | `Ocgtk.Font_dialog.class type font_dialog_t` |
| `Ocgtk_gtk.Gtk.Frame` | `Ocgtk.Frame` |
| `Ocgtk_gtk.Gtk.Frame.class frame` | `Ocgtk.Frame.class frame` |
| `Ocgtk_gtk.Gtk.Frame.class type frame_t` | `Ocgtk.Frame.class type frame_t` |
| `Ocgtk_gtk.Gtk.Gesture` | `Ocgtk.Gesture` |
| `Ocgtk_gtk.Gtk.Gesture.class gesture` | `Ocgtk.Gesture.class gesture` |
| `Ocgtk_gtk.Gtk.Gesture.class type gesture_t` | `Ocgtk.Gesture.class type gesture_t` |
| `Ocgtk_gtk.Gtk.Gesture_click` | `Ocgtk.Gesture_click` |
| `Ocgtk_gtk.Gtk.Gesture_click.class gesture_click` | `Ocgtk.Gesture_click.class gesture_click` |
| `Ocgtk_gtk.Gtk.Gesture_click.class type gesture_click_t` | `Ocgtk.Gesture_click.class type gesture_click_t` |
| `Ocgtk_gtk.Gtk.Gesture_drag` | `Ocgtk.Gesture_drag` |
| `Ocgtk_gtk.Gtk.Gesture_drag.class gesture_drag` | `Ocgtk.Gesture_drag.class gesture_drag` |
| `Ocgtk_gtk.Gtk.Gesture_drag.class type gesture_drag_t` | `Ocgtk.Gesture_drag.class type gesture_drag_t` |
| `Ocgtk_gtk.Gtk.Gesture_long_press` | `Ocgtk.Gesture_long_press` |
| `Ocgtk_gtk.Gtk.Gesture_long_press.class gesture_long_press` | `Ocgtk.Gesture_long_press.class gesture_long_press` |
| `Ocgtk_gtk.Gtk.Gesture_long_press.class type gesture_long_press_t` | `Ocgtk.Gesture_long_press.class type gesture_long_press_t` |
| `Ocgtk_gtk.Gtk.Gesture_pan` | `Ocgtk.Gesture_pan` |
| `Ocgtk_gtk.Gtk.Gesture_pan.class gesture_pan` | `Ocgtk.Gesture_pan.class gesture_pan` |
| `Ocgtk_gtk.Gtk.Gesture_pan.class type gesture_pan_t` | `Ocgtk.Gesture_pan.class type gesture_pan_t` |
| `Ocgtk_gtk.Gtk.Gesture_rotate` | `Ocgtk.Gesture_rotate` |
| `Ocgtk_gtk.Gtk.Gesture_rotate.class gesture_rotate` | `Ocgtk.Gesture_rotate.class gesture_rotate` |
| `Ocgtk_gtk.Gtk.Gesture_rotate.class type gesture_rotate_t` | `Ocgtk.Gesture_rotate.class type gesture_rotate_t` |
| `Ocgtk_gtk.Gtk.Gesture_single` | `Ocgtk.Gesture_single` |
| `Ocgtk_gtk.Gtk.Gesture_single.class gesture_single` | `Ocgtk.Gesture_single.class gesture_single` |
| `Ocgtk_gtk.Gtk.Gesture_single.class type gesture_single_t` | `Ocgtk.Gesture_single.class type gesture_single_t` |
| `Ocgtk_gtk.Gtk.Gesture_stylus` | `Ocgtk.Gesture_stylus` |
| `Ocgtk_gtk.Gtk.Gesture_stylus.class gesture_stylus` | `Ocgtk.Gesture_stylus.class gesture_stylus` |
| `Ocgtk_gtk.Gtk.Gesture_stylus.class type gesture_stylus_t` | `Ocgtk.Gesture_stylus.class type gesture_stylus_t` |
| `Ocgtk_gtk.Gtk.Gesture_swipe` | `Ocgtk.Gesture_swipe` |
| `Ocgtk_gtk.Gtk.Gesture_swipe.class gesture_swipe` | `Ocgtk.Gesture_swipe.class gesture_swipe` |
| `Ocgtk_gtk.Gtk.Gesture_swipe.class type gesture_swipe_t` | `Ocgtk.Gesture_swipe.class type gesture_swipe_t` |
| `Ocgtk_gtk.Gtk.Gesture_zoom` | `Ocgtk.Gesture_zoom` |
| `Ocgtk_gtk.Gtk.Gesture_zoom.class gesture_zoom` | `Ocgtk.Gesture_zoom.class gesture_zoom` |
| `Ocgtk_gtk.Gtk.Gesture_zoom.class type gesture_zoom_t` | `Ocgtk.Gesture_zoom.class type gesture_zoom_t` |
| `Ocgtk_gtk.Gtk.Gl_area` | `Ocgtk.Gl_area` |
| `Ocgtk_gtk.Gtk.Gl_area.class gl_area` | `Ocgtk.Gl_area.class gl_area` |
| `Ocgtk_gtk.Gtk.Gl_area.class type gl_area_t` | `Ocgtk.Gl_area.class type gl_area_t` |
| `Ocgtk_gtk.Gtk.Graphics_offload` | `Ocgtk.Graphics_offload` |
| `Ocgtk_gtk.Gtk.Graphics_offload.class graphics_offload` | `Ocgtk.Graphics_offload.class graphics_offload` |
| `Ocgtk_gtk.Gtk.Graphics_offload.class type graphics_offload_t` | `Ocgtk.Graphics_offload.class type graphics_offload_t` |
| `Ocgtk_gtk.Gtk.Grid` | `Ocgtk.Grid` |
| `Ocgtk_gtk.Gtk.Grid.class grid` | `Ocgtk.Grid.class grid` |
| `Ocgtk_gtk.Gtk.Grid.class type grid_t` | `Ocgtk.Grid.class type grid_t` |
| `Ocgtk_gtk.Gtk.Grid_layout` | `Ocgtk.Grid_layout` |
| `Ocgtk_gtk.Gtk.Grid_layout_child` | `Ocgtk.Grid_layout_child` |
| `Ocgtk_gtk.Gtk.Grid_layout_child.class grid_layout_child` | `Ocgtk.Grid_layout_child.class grid_layout_child` |
| `Ocgtk_gtk.Gtk.Grid_layout_child.class type grid_layout_child_t` | `Ocgtk.Grid_layout_child.class type grid_layout_child_t` |
| `Ocgtk_gtk.Gtk.Grid_layout.class grid_layout` | `Ocgtk.Grid_layout.class grid_layout` |
| `Ocgtk_gtk.Gtk.Grid_layout.class type grid_layout_t` | `Ocgtk.Grid_layout.class type grid_layout_t` |
| `Ocgtk_gtk.Gtk.Grid_view` | `Ocgtk.Grid_view` |
| `Ocgtk_gtk.Gtk.Grid_view.class grid_view` | `Ocgtk.Grid_view.class grid_view` |
| `Ocgtk_gtk.Gtk.Grid_view.class type grid_view_t` | `Ocgtk.Grid_view.class type grid_view_t` |
| `Ocgtk_gtk.Gtk.Header_bar` | `Ocgtk.Header_bar` |
| `Ocgtk_gtk.Gtk.Header_bar.class header_bar` | `Ocgtk.Header_bar.class header_bar` |
| `Ocgtk_gtk.Gtk.Header_bar.class type header_bar_t` | `Ocgtk.Header_bar.class type header_bar_t` |
| `Ocgtk_gtk.Gtk.Icon_paintable` | `Ocgtk.Icon_paintable` |
| `Ocgtk_gtk.Gtk.Icon_paintable.class icon_paintable` | `Ocgtk.Icon_paintable.class icon_paintable` |
| `Ocgtk_gtk.Gtk.Icon_paintable.class type icon_paintable_t` | `Ocgtk.Icon_paintable.class type icon_paintable_t` |
| `Ocgtk_gtk.Gtk.Icon_theme` | `Ocgtk.Icon_theme` |
| `Ocgtk_gtk.Gtk.Icon_theme.class icon_theme` | `Ocgtk.Icon_theme.class icon_theme` |
| `Ocgtk_gtk.Gtk.Icon_theme.class type icon_theme_t` | `Ocgtk.Icon_theme.class type icon_theme_t` |
| `Ocgtk_gtk.Gtk.Icon_view` | `Ocgtk.Icon_view` |
| `Ocgtk_gtk.Gtk.Icon_view.class icon_view` | `Ocgtk.Icon_view.class icon_view` |
| `Ocgtk_gtk.Gtk.Icon_view.class type icon_view_t` | `Ocgtk.Icon_view.class type icon_view_t` |
| `Ocgtk_gtk.Gtk.Image` | `Ocgtk.Image` |
| `Ocgtk_gtk.Gtk.Image.class image` | `Ocgtk.Image.class image` |
| `Ocgtk_gtk.Gtk.Image.class type image_t` | `Ocgtk.Image.class type image_t` |
| `Ocgtk_gtk.Gtk.Im_context` | `Ocgtk.Im_context` |
| `Ocgtk_gtk.Gtk.Im_context.class im_context` | `Ocgtk.Im_context.class im_context` |
| `Ocgtk_gtk.Gtk.Im_context.class type im_context_t` | `Ocgtk.Im_context.class type im_context_t` |
| `Ocgtk_gtk.Gtk.Im_context_simple` | `Ocgtk.Im_context_simple` |
| `Ocgtk_gtk.Gtk.Im_context_simple.class im_context_simple` | `Ocgtk.Im_context_simple.class im_context_simple` |
| `Ocgtk_gtk.Gtk.Im_context_simple.class type im_context_simple_t` | `Ocgtk.Im_context_simple.class type im_context_simple_t` |
| `Ocgtk_gtk.Gtk.Im_multicontext` | `Ocgtk.Im_multicontext` |
| `Ocgtk_gtk.Gtk.Im_multicontext.class im_multicontext` | `Ocgtk.Im_multicontext.class im_multicontext` |
| `Ocgtk_gtk.Gtk.Im_multicontext.class type im_multicontext_t` | `Ocgtk.Im_multicontext.class type im_multicontext_t` |
| `Ocgtk_gtk.Gtk.Info_bar` | `Ocgtk.Info_bar` |
| `Ocgtk_gtk.Gtk.Info_bar.class info_bar` | `Ocgtk.Info_bar.class info_bar` |
| `Ocgtk_gtk.Gtk.Info_bar.class type info_bar_t` | `Ocgtk.Info_bar.class type info_bar_t` |
| `Ocgtk_gtk.Gtk.Inscription` | `Ocgtk.Inscription` |
| `Ocgtk_gtk.Gtk.Inscription.class inscription` | `Ocgtk.Inscription.class inscription` |
| `Ocgtk_gtk.Gtk.Inscription.class type inscription_t` | `Ocgtk.Inscription.class type inscription_t` |
| `Ocgtk_gtk.Gtk.Keyval_trigger` | `Ocgtk.Keyval_trigger` |
| `Ocgtk_gtk.Gtk.Keyval_trigger.class keyval_trigger` | `Ocgtk.Keyval_trigger.class keyval_trigger` |
| `Ocgtk_gtk.Gtk.Keyval_trigger.class type keyval_trigger_t` | `Ocgtk.Keyval_trigger.class type keyval_trigger_t` |
| `Ocgtk_gtk.Gtk.Label` | `Ocgtk.Label` |
| `Ocgtk_gtk.Gtk.Label.class label` | `Ocgtk.Label.class label` |
| `Ocgtk_gtk.Gtk.Label.class type label_t` | `Ocgtk.Label.class type label_t` |
| `Ocgtk_gtk.Gtk.Layout_child` | `Ocgtk.Layout_child` |
| `Ocgtk_gtk.Gtk.Layout_child.class layout_child` | `Ocgtk.Layout_child.class layout_child` |
| `Ocgtk_gtk.Gtk.Layout_child.class type layout_child_t` | `Ocgtk.Layout_child.class type layout_child_t` |
| `Ocgtk_gtk.Gtk.Layout_manager` | `Ocgtk.Layout_manager` |
| `Ocgtk_gtk.Gtk.Layout_manager.class layout_manager` | `Ocgtk.Layout_manager.class layout_manager` |
| `Ocgtk_gtk.Gtk.Layout_manager.class type layout_manager_t` | `Ocgtk.Layout_manager.class type layout_manager_t` |
| `Ocgtk_gtk.Gtk.Level_bar` | `Ocgtk.Level_bar` |
| `Ocgtk_gtk.Gtk.Level_bar.class level_bar` | `Ocgtk.Level_bar.class level_bar` |
| `Ocgtk_gtk.Gtk.Level_bar.class type level_bar_t` | `Ocgtk.Level_bar.class type level_bar_t` |
| `Ocgtk_gtk.Gtk.Link_button` | `Ocgtk.Link_button` |
| `Ocgtk_gtk.Gtk.Link_button.class link_button` | `Ocgtk.Link_button.class link_button` |
| `Ocgtk_gtk.Gtk.Link_button.class type link_button_t` | `Ocgtk.Link_button.class type link_button_t` |
| `Ocgtk_gtk.Gtk.List_base` | `Ocgtk.List_base` |
| `Ocgtk_gtk.Gtk.List_base.class list_base` | `Ocgtk.List_base.class list_base` |
| `Ocgtk_gtk.Gtk.List_base.class type list_base_t` | `Ocgtk.List_base.class type list_base_t` |
| `Ocgtk_gtk.Gtk.List_box` | `Ocgtk.List_box` |
| `Ocgtk_gtk.Gtk.List_box.class list_box` | `Ocgtk.List_box.class list_box` |
| `Ocgtk_gtk.Gtk.List_box.class type list_box_t` | `Ocgtk.List_box.class type list_box_t` |
| `Ocgtk_gtk.Gtk.List_box_row` | `Ocgtk.List_box_row` |
| `Ocgtk_gtk.Gtk.List_box_row.class list_box_row` | `Ocgtk.List_box_row.class list_box_row` |
| `Ocgtk_gtk.Gtk.List_box_row.class type list_box_row_t` | `Ocgtk.List_box_row.class type list_box_row_t` |
| `Ocgtk_gtk.Gtk.List_header` | `Ocgtk.List_header` |
| `Ocgtk_gtk.Gtk.List_header.class list_header` | `Ocgtk.List_header.class list_header` |
| `Ocgtk_gtk.Gtk.List_header.class type list_header_t` | `Ocgtk.List_header.class type list_header_t` |
| `Ocgtk_gtk.Gtk.List_item` | `Ocgtk.List_item` |
| `Ocgtk_gtk.Gtk.List_item.class list_item` | `Ocgtk.List_item.class list_item` |
| `Ocgtk_gtk.Gtk.List_item.class type list_item_t` | `Ocgtk.List_item.class type list_item_t` |
| `Ocgtk_gtk.Gtk.List_item_factory` | `Ocgtk.List_item_factory` |
| `Ocgtk_gtk.Gtk.List_item_factory.class list_item_factory` | `Ocgtk.List_item_factory.class list_item_factory` |
| `Ocgtk_gtk.Gtk.List_item_factory.class type list_item_factory_t` | `Ocgtk.List_item_factory.class type list_item_factory_t` |
| `Ocgtk_gtk.Gtk.List_store` | `Ocgtk.List_store` |
| `Ocgtk_gtk.Gtk.List_store.class list_store` | `Ocgtk.List_store.class list_store` |
| `Ocgtk_gtk.Gtk.List_store.class type list_store_t` | `Ocgtk.List_store.class type list_store_t` |
| `Ocgtk_gtk.Gtk.List_view` | `Ocgtk.List_view` |
| `Ocgtk_gtk.Gtk.List_view.class list_view` | `Ocgtk.List_view.class list_view` |
| `Ocgtk_gtk.Gtk.List_view.class type list_view_t` | `Ocgtk.List_view.class type list_view_t` |
| `Ocgtk_gtk.Gtk.Lock_button` | `Ocgtk.Lock_button` |
| `Ocgtk_gtk.Gtk.Lock_button.class lock_button` | `Ocgtk.Lock_button.class lock_button` |
| `Ocgtk_gtk.Gtk.Lock_button.class type lock_button_t` | `Ocgtk.Lock_button.class type lock_button_t` |
| `Ocgtk_gtk.Gtk.Map_list_model` | `Ocgtk.Map_list_model` |
| `Ocgtk_gtk.Gtk.Map_list_model.class map_list_model` | `Ocgtk.Map_list_model.class map_list_model` |
| `Ocgtk_gtk.Gtk.Map_list_model.class type map_list_model_t` | `Ocgtk.Map_list_model.class type map_list_model_t` |
| `Ocgtk_gtk.Gtk.Media_controls` | `Ocgtk.Media_controls` |
| `Ocgtk_gtk.Gtk.Media_controls.class media_controls` | `Ocgtk.Media_controls.class media_controls` |
| `Ocgtk_gtk.Gtk.Media_controls.class type media_controls_t` | `Ocgtk.Media_controls.class type media_controls_t` |
| `Ocgtk_gtk.Gtk.Media_file` | `Ocgtk.Media_file` |
| `Ocgtk_gtk.Gtk.Media_file.class media_file` | `Ocgtk.Media_file.class media_file` |
| `Ocgtk_gtk.Gtk.Media_file.class type media_file_t` | `Ocgtk.Media_file.class type media_file_t` |
| `Ocgtk_gtk.Gtk.Media_stream` | `Ocgtk.Media_stream` |
| `Ocgtk_gtk.Gtk.Media_stream.class media_stream` | `Ocgtk.Media_stream.class media_stream` |
| `Ocgtk_gtk.Gtk.Media_stream.class type media_stream_t` | `Ocgtk.Media_stream.class type media_stream_t` |
| `Ocgtk_gtk.Gtk.Menu_button` | `Ocgtk.Menu_button` |
| `Ocgtk_gtk.Gtk.Menu_button.class menu_button` | `Ocgtk.Menu_button.class menu_button` |
| `Ocgtk_gtk.Gtk.Menu_button.class type menu_button_t` | `Ocgtk.Menu_button.class type menu_button_t` |
| `Ocgtk_gtk.Gtk.Message_dialog` | `Ocgtk.Message_dialog` |
| `Ocgtk_gtk.Gtk.Message_dialog.class message_dialog` | `Ocgtk.Message_dialog.class message_dialog` |
| `Ocgtk_gtk.Gtk.Message_dialog.class type message_dialog_t` | `Ocgtk.Message_dialog.class type message_dialog_t` |
| `Ocgtk_gtk.Gtk.Mnemonic_action` | `Ocgtk.Mnemonic_action` |
| `Ocgtk_gtk.Gtk.Mnemonic_action.class mnemonic_action` | `Ocgtk.Mnemonic_action.class mnemonic_action` |
| `Ocgtk_gtk.Gtk.Mnemonic_action.class type mnemonic_action_t` | `Ocgtk.Mnemonic_action.class type mnemonic_action_t` |
| `Ocgtk_gtk.Gtk.Mnemonic_trigger` | `Ocgtk.Mnemonic_trigger` |
| `Ocgtk_gtk.Gtk.Mnemonic_trigger.class mnemonic_trigger` | `Ocgtk.Mnemonic_trigger.class mnemonic_trigger` |
| `Ocgtk_gtk.Gtk.Mnemonic_trigger.class type mnemonic_trigger_t` | `Ocgtk.Mnemonic_trigger.class type mnemonic_trigger_t` |
| `Ocgtk_gtk.Gtk.Mount_operation` | `Ocgtk.Mount_operation` |
| `Ocgtk_gtk.Gtk.Mount_operation.class mount_operation` | `Ocgtk.Mount_operation.class mount_operation` |
| `Ocgtk_gtk.Gtk.Mount_operation.class type mount_operation_t` | `Ocgtk.Mount_operation.class type mount_operation_t` |
| `Ocgtk_gtk.Gtk.Multi_filter` | `Ocgtk.Multi_filter` |
| `Ocgtk_gtk.Gtk.Multi_filter.class multi_filter` | `Ocgtk.Multi_filter.class multi_filter` |
| `Ocgtk_gtk.Gtk.Multi_filter.class type multi_filter_t` | `Ocgtk.Multi_filter.class type multi_filter_t` |
| `Ocgtk_gtk.Gtk.Multi_selection` | `Ocgtk.Multi_selection` |
| `Ocgtk_gtk.Gtk.Multi_selection.class multi_selection` | `Ocgtk.Multi_selection.class multi_selection` |
| `Ocgtk_gtk.Gtk.Multi_selection.class type multi_selection_t` | `Ocgtk.Multi_selection.class type multi_selection_t` |
| `Ocgtk_gtk.Gtk.Multi_sorter` | `Ocgtk.Multi_sorter` |
| `Ocgtk_gtk.Gtk.Multi_sorter.class multi_sorter` | `Ocgtk.Multi_sorter.class multi_sorter` |
| `Ocgtk_gtk.Gtk.Multi_sorter.class type multi_sorter_t` | `Ocgtk.Multi_sorter.class type multi_sorter_t` |
| `Ocgtk_gtk.Gtk.Named_action` | `Ocgtk.Named_action` |
| `Ocgtk_gtk.Gtk.Named_action.class named_action` | `Ocgtk.Named_action.class named_action` |
| `Ocgtk_gtk.Gtk.Named_action.class type named_action_t` | `Ocgtk.Named_action.class type named_action_t` |
| `Ocgtk_gtk.Gtk.Native` | `Ocgtk.Native` |
| `Ocgtk_gtk.Gtk.Native.class native` | `Ocgtk.Native.class native` |
| `Ocgtk_gtk.Gtk.Native.class type native_t` | `Ocgtk.Native.class type native_t` |
| `Ocgtk_gtk.Gtk.Native_dialog` | `Ocgtk.Native_dialog` |
| `Ocgtk_gtk.Gtk.Native_dialog.class native_dialog` | `Ocgtk.Native_dialog.class native_dialog` |
| `Ocgtk_gtk.Gtk.Native_dialog.class type native_dialog_t` | `Ocgtk.Native_dialog.class type native_dialog_t` |
| `Ocgtk_gtk.Gtk.Never_trigger` | `Ocgtk.Never_trigger` |
| `Ocgtk_gtk.Gtk.Never_trigger.class never_trigger` | `Ocgtk.Never_trigger.class never_trigger` |
| `Ocgtk_gtk.Gtk.Never_trigger.class type never_trigger_t` | `Ocgtk.Never_trigger.class type never_trigger_t` |
| `Ocgtk_gtk.Gtk.No_selection` | `Ocgtk.No_selection` |
| `Ocgtk_gtk.Gtk.No_selection.class no_selection` | `Ocgtk.No_selection.class no_selection` |
| `Ocgtk_gtk.Gtk.No_selection.class type no_selection_t` | `Ocgtk.No_selection.class type no_selection_t` |
| `Ocgtk_gtk.Gtk.Notebook` | `Ocgtk.Notebook` |
| `Ocgtk_gtk.Gtk.Notebook.class notebook` | `Ocgtk.Notebook.class notebook` |
| `Ocgtk_gtk.Gtk.Notebook.class type notebook_t` | `Ocgtk.Notebook.class type notebook_t` |
| `Ocgtk_gtk.Gtk.Notebook_page` | `Ocgtk.Notebook_page` |
| `Ocgtk_gtk.Gtk.Notebook_page.class notebook_page` | `Ocgtk.Notebook_page.class notebook_page` |
| `Ocgtk_gtk.Gtk.Notebook_page.class type notebook_page_t` | `Ocgtk.Notebook_page.class type notebook_page_t` |
| `Ocgtk_gtk.Gtk.Nothing_action` | `Ocgtk.Nothing_action` |
| `Ocgtk_gtk.Gtk.Nothing_action.class nothing_action` | `Ocgtk.Nothing_action.class nothing_action` |
| `Ocgtk_gtk.Gtk.Nothing_action.class type nothing_action_t` | `Ocgtk.Nothing_action.class type nothing_action_t` |
| `Ocgtk_gtk.Gtk.Numeric_sorter` | `Ocgtk.Numeric_sorter` |
| `Ocgtk_gtk.Gtk.Numeric_sorter.class numeric_sorter` | `Ocgtk.Numeric_sorter.class numeric_sorter` |
| `Ocgtk_gtk.Gtk.Numeric_sorter.class type numeric_sorter_t` | `Ocgtk.Numeric_sorter.class type numeric_sorter_t` |
| `Ocgtk_gtk.Gtk.Object_expression` | `Ocgtk.Object_expression` |
| `Ocgtk_gtk.Gtk.Object_expression.class object_expression` | `Ocgtk.Object_expression.class object_expression` |
| `Ocgtk_gtk.Gtk.Object_expression.class type object_expression_t` | `Ocgtk.Object_expression.class type object_expression_t` |
| `Ocgtk_gtk.Gtk.Orientable` | `Ocgtk.Orientable` |
| `Ocgtk_gtk.Gtk.Orientable.class orientable` | `Ocgtk.Orientable.class orientable` |
| `Ocgtk_gtk.Gtk.Orientable.class type orientable_t` | `Ocgtk.Orientable.class type orientable_t` |
| `Ocgtk_gtk.Gtk.Overlay` | `Ocgtk.Overlay` |
| `Ocgtk_gtk.Gtk.Overlay.class overlay` | `Ocgtk.Overlay.class overlay` |
| `Ocgtk_gtk.Gtk.Overlay.class type overlay_t` | `Ocgtk.Overlay.class type overlay_t` |
| `Ocgtk_gtk.Gtk.Overlay_layout` | `Ocgtk.Overlay_layout` |
| `Ocgtk_gtk.Gtk.Overlay_layout_child` | `Ocgtk.Overlay_layout_child` |
| `Ocgtk_gtk.Gtk.Overlay_layout_child.class overlay_layout_child` | `Ocgtk.Overlay_layout_child.class overlay_layout_child` |
| `Ocgtk_gtk.Gtk.Overlay_layout_child.class type overlay_layout_child_t` | `Ocgtk.Overlay_layout_child.class type overlay_layout_child_t` |
| `Ocgtk_gtk.Gtk.Overlay_layout.class overlay_layout` | `Ocgtk.Overlay_layout.class overlay_layout` |
| `Ocgtk_gtk.Gtk.Overlay_layout.class type overlay_layout_t` | `Ocgtk.Overlay_layout.class type overlay_layout_t` |
| `Ocgtk_gtk.Gtk.Pad_action_entry` | `Ocgtk.Pad_action_entry` |
| `Ocgtk_gtk.Gtk.Pad_action_entry.class pad_action_entry` | `Ocgtk.Pad_action_entry.class pad_action_entry` |
| `Ocgtk_gtk.Gtk.Pad_action_entry.class type pad_action_entry_t` | `Ocgtk.Pad_action_entry.class type pad_action_entry_t` |
| `Ocgtk_gtk.Gtk.Pad_controller` | `Ocgtk.Pad_controller` |
| `Ocgtk_gtk.Gtk.Pad_controller.class pad_controller` | `Ocgtk.Pad_controller.class pad_controller` |
| `Ocgtk_gtk.Gtk.Pad_controller.class type pad_controller_t` | `Ocgtk.Pad_controller.class type pad_controller_t` |
| `Ocgtk_gtk.Gtk.Page_range` | `Ocgtk.Page_range` |
| `Ocgtk_gtk.Gtk.Page_range.class page_range` | `Ocgtk.Page_range.class page_range` |
| `Ocgtk_gtk.Gtk.Page_range.class type page_range_t` | `Ocgtk.Page_range.class type page_range_t` |
| `Ocgtk_gtk.Gtk.Page_setup` | `Ocgtk.Page_setup` |
| `Ocgtk_gtk.Gtk.Page_setup.class page_setup` | `Ocgtk.Page_setup.class page_setup` |
| `Ocgtk_gtk.Gtk.Page_setup.class type page_setup_t` | `Ocgtk.Page_setup.class type page_setup_t` |
| `Ocgtk_gtk.Gtk.Paned` | `Ocgtk.Paned` |
| `Ocgtk_gtk.Gtk.Paned.class paned` | `Ocgtk.Paned.class paned` |
| `Ocgtk_gtk.Gtk.Paned.class type paned_t` | `Ocgtk.Paned.class type paned_t` |
| `Ocgtk_gtk.Gtk.Paper_size` | `Ocgtk.Paper_size` |
| `Ocgtk_gtk.Gtk.Paper_size.class paper_size` | `Ocgtk.Paper_size.class paper_size` |
| `Ocgtk_gtk.Gtk.Paper_size.class type paper_size_t` | `Ocgtk.Paper_size.class type paper_size_t` |
| `Ocgtk_gtk.Gtk.Param_spec_expression` | `Ocgtk.Param_spec_expression` |
| `Ocgtk_gtk.Gtk.Param_spec_expression.class param_spec_expression` | `Ocgtk.Param_spec_expression.class param_spec_expression` |
| `Ocgtk_gtk.Gtk.Param_spec_expression.class type param_spec_expression_t` | `Ocgtk.Param_spec_expression.class type param_spec_expression_t` |
| `Ocgtk_gtk.Gtk.Password_entry` | `Ocgtk.Password_entry` |
| `Ocgtk_gtk.Gtk.Password_entry_buffer` | `Ocgtk.Password_entry_buffer` |
| `Ocgtk_gtk.Gtk.Password_entry_buffer.class password_entry_buffer` | `Ocgtk.Password_entry_buffer.class password_entry_buffer` |
| `Ocgtk_gtk.Gtk.Password_entry_buffer.class type password_entry_buffer_t` | `Ocgtk.Password_entry_buffer.class type password_entry_buffer_t` |
| `Ocgtk_gtk.Gtk.Password_entry.class password_entry` | `Ocgtk.Password_entry.class password_entry` |
| `Ocgtk_gtk.Gtk.Password_entry.class type password_entry_t` | `Ocgtk.Password_entry.class type password_entry_t` |
| `Ocgtk_gtk.Gtk.Picture` | `Ocgtk.Picture` |
| `Ocgtk_gtk.Gtk.Picture.class picture` | `Ocgtk.Picture.class picture` |
| `Ocgtk_gtk.Gtk.Picture.class type picture_t` | `Ocgtk.Picture.class type picture_t` |
| `Ocgtk_gtk.Gtk.Popover` | `Ocgtk.Popover` |
| `Ocgtk_gtk.Gtk.Popover.class popover` | `Ocgtk.Popover.class popover` |
| `Ocgtk_gtk.Gtk.Popover.class type popover_t` | `Ocgtk.Popover.class type popover_t` |
| `Ocgtk_gtk.Gtk.Popover_menu` | `Ocgtk.Popover_menu` |
| `Ocgtk_gtk.Gtk.Popover_menu_bar` | `Ocgtk.Popover_menu_bar` |
| `Ocgtk_gtk.Gtk.Popover_menu_bar.class popover_menu_bar` | `Ocgtk.Popover_menu_bar.class popover_menu_bar` |
| `Ocgtk_gtk.Gtk.Popover_menu_bar.class type popover_menu_bar_t` | `Ocgtk.Popover_menu_bar.class type popover_menu_bar_t` |
| `Ocgtk_gtk.Gtk.Popover_menu.class popover_menu` | `Ocgtk.Popover_menu.class popover_menu` |
| `Ocgtk_gtk.Gtk.Popover_menu.class type popover_menu_t` | `Ocgtk.Popover_menu.class type popover_menu_t` |
| `Ocgtk_gtk.Gtk.Print_context` | `Ocgtk.Print_context` |
| `Ocgtk_gtk.Gtk.Print_context.class print_context` | `Ocgtk.Print_context.class print_context` |
| `Ocgtk_gtk.Gtk.Print_context.class type print_context_t` | `Ocgtk.Print_context.class type print_context_t` |
| `Ocgtk_gtk.Gtk.Print_dialog` | `Ocgtk.Print_dialog` |
| `Ocgtk_gtk.Gtk.Print_dialog.class print_dialog` | `Ocgtk.Print_dialog.class print_dialog` |
| `Ocgtk_gtk.Gtk.Print_dialog.class type print_dialog_t` | `Ocgtk.Print_dialog.class type print_dialog_t` |
| `Ocgtk_gtk.Gtk.Print_operation` | `Ocgtk.Print_operation` |
| `Ocgtk_gtk.Gtk.Print_operation.class print_operation` | `Ocgtk.Print_operation.class print_operation` |
| `Ocgtk_gtk.Gtk.Print_operation.class type print_operation_t` | `Ocgtk.Print_operation.class type print_operation_t` |
| `Ocgtk_gtk.Gtk.Print_operation_preview` | `Ocgtk.Print_operation_preview` |
| `Ocgtk_gtk.Gtk.Print_operation_preview.class print_operation_preview` | `Ocgtk.Print_operation_preview.class print_operation_preview` |
| `Ocgtk_gtk.Gtk.Print_operation_preview.class type print_operation_preview_t` | `Ocgtk.Print_operation_preview.class type print_operation_preview_t` |
| `Ocgtk_gtk.Gtk.Print_settings` | `Ocgtk.Print_settings` |
| `Ocgtk_gtk.Gtk.Print_settings.class print_settings` | `Ocgtk.Print_settings.class print_settings` |
| `Ocgtk_gtk.Gtk.Print_settings.class type print_settings_t` | `Ocgtk.Print_settings.class type print_settings_t` |
| `Ocgtk_gtk.Gtk.Print_setup` | `Ocgtk.Print_setup` |
| `Ocgtk_gtk.Gtk.Print_setup.class print_setup` | `Ocgtk.Print_setup.class print_setup` |
| `Ocgtk_gtk.Gtk.Print_setup.class type print_setup_t` | `Ocgtk.Print_setup.class type print_setup_t` |
| `Ocgtk_gtk.Gtk.Progress_bar` | `Ocgtk.Progress_bar` |
| `Ocgtk_gtk.Gtk.Progress_bar.class progress_bar` | `Ocgtk.Progress_bar.class progress_bar` |
| `Ocgtk_gtk.Gtk.Progress_bar.class type progress_bar_t` | `Ocgtk.Progress_bar.class type progress_bar_t` |
| `Ocgtk_gtk.Gtk.Property_expression` | `Ocgtk.Property_expression` |
| `Ocgtk_gtk.Gtk.Property_expression.class property_expression` | `Ocgtk.Property_expression.class property_expression` |
| `Ocgtk_gtk.Gtk.Property_expression.class type property_expression_t` | `Ocgtk.Property_expression.class type property_expression_t` |
| `Ocgtk_gtk.Gtk.Range` | `Ocgtk.Range` |
| `Ocgtk_gtk.Gtk.Range.class range` | `Ocgtk.Range.class range` |
| `Ocgtk_gtk.Gtk.Range.class type range_t` | `Ocgtk.Range.class type range_t` |
| `Ocgtk_gtk.Gtk.Recent_data` | `Ocgtk.Recent_data` |
| `Ocgtk_gtk.Gtk.Recent_data.class recent_data` | `Ocgtk.Recent_data.class recent_data` |
| `Ocgtk_gtk.Gtk.Recent_data.class type recent_data_t` | `Ocgtk.Recent_data.class type recent_data_t` |
| `Ocgtk_gtk.Gtk.Recent_info` | `Ocgtk.Recent_info` |
| `Ocgtk_gtk.Gtk.Recent_info.class recent_info` | `Ocgtk.Recent_info.class recent_info` |
| `Ocgtk_gtk.Gtk.Recent_info.class type recent_info_t` | `Ocgtk.Recent_info.class type recent_info_t` |
| `Ocgtk_gtk.Gtk.Recent_manager` | `Ocgtk.Recent_manager` |
| `Ocgtk_gtk.Gtk.Recent_manager.class recent_manager` | `Ocgtk.Recent_manager.class recent_manager` |
| `Ocgtk_gtk.Gtk.Recent_manager.class type recent_manager_t` | `Ocgtk.Recent_manager.class type recent_manager_t` |
| `Ocgtk_gtk.Gtk.Requested_size` | `Ocgtk.Requested_size` |
| `Ocgtk_gtk.Gtk.Requested_size.class requested_size` | `Ocgtk.Requested_size.class requested_size` |
| `Ocgtk_gtk.Gtk.Requested_size.class type requested_size_t` | `Ocgtk.Requested_size.class type requested_size_t` |
| `Ocgtk_gtk.Gtk.Requisition` | `Ocgtk.Requisition` |
| `Ocgtk_gtk.Gtk.Requisition.class requisition` | `Ocgtk.Requisition.class requisition` |
| `Ocgtk_gtk.Gtk.Requisition.class type requisition_t` | `Ocgtk.Requisition.class type requisition_t` |
| `Ocgtk_gtk.Gtk.Revealer` | `Ocgtk.Revealer` |
| `Ocgtk_gtk.Gtk.Revealer.class revealer` | `Ocgtk.Revealer.class revealer` |
| `Ocgtk_gtk.Gtk.Revealer.class type revealer_t` | `Ocgtk.Revealer.class type revealer_t` |
| `Ocgtk_gtk.Gtk.Root` | `Ocgtk.Root` |
| `Ocgtk_gtk.Gtk.Root.class root` | `Ocgtk.Root.class root` |
| `Ocgtk_gtk.Gtk.Root.class type root_t` | `Ocgtk.Root.class type root_t` |
| `Ocgtk_gtk.Gtk.Scale` | `Ocgtk.Scale` |
| `Ocgtk_gtk.Gtk.Scale_button` | `Ocgtk.Scale_button` |
| `Ocgtk_gtk.Gtk.Scale_button.class scale_button` | `Ocgtk.Scale_button.class scale_button` |
| `Ocgtk_gtk.Gtk.Scale_button.class type scale_button_t` | `Ocgtk.Scale_button.class type scale_button_t` |
| `Ocgtk_gtk.Gtk.Scale.class scale` | `Ocgtk.Scale.class scale` |
| `Ocgtk_gtk.Gtk.Scale.class type scale_t` | `Ocgtk.Scale.class type scale_t` |
| `Ocgtk_gtk.Gtk.Scrollable` | `Ocgtk.Scrollable` |
| `Ocgtk_gtk.Gtk.Scrollable.class scrollable` | `Ocgtk.Scrollable.class scrollable` |
| `Ocgtk_gtk.Gtk.Scrollable.class type scrollable_t` | `Ocgtk.Scrollable.class type scrollable_t` |
| `Ocgtk_gtk.Gtk.Scrollbar` | `Ocgtk.Scrollbar` |
| `Ocgtk_gtk.Gtk.Scrollbar.class scrollbar` | `Ocgtk.Scrollbar.class scrollbar` |
| `Ocgtk_gtk.Gtk.Scrollbar.class type scrollbar_t` | `Ocgtk.Scrollbar.class type scrollbar_t` |
| `Ocgtk_gtk.Gtk.Scrolled_window` | `Ocgtk.Scrolled_window` |
| `Ocgtk_gtk.Gtk.Scrolled_window.class scrolled_window` | `Ocgtk.Scrolled_window.class scrolled_window` |
| `Ocgtk_gtk.Gtk.Scrolled_window.class type scrolled_window_t` | `Ocgtk.Scrolled_window.class type scrolled_window_t` |
| `Ocgtk_gtk.Gtk.Scroll_info` | `Ocgtk.Scroll_info` |
| `Ocgtk_gtk.Gtk.Scroll_info.class scroll_info` | `Ocgtk.Scroll_info.class scroll_info` |
| `Ocgtk_gtk.Gtk.Scroll_info.class type scroll_info_t` | `Ocgtk.Scroll_info.class type scroll_info_t` |
| `Ocgtk_gtk.Gtk.Search_bar` | `Ocgtk.Search_bar` |
| `Ocgtk_gtk.Gtk.Search_bar.class search_bar` | `Ocgtk.Search_bar.class search_bar` |
| `Ocgtk_gtk.Gtk.Search_bar.class type search_bar_t` | `Ocgtk.Search_bar.class type search_bar_t` |
| `Ocgtk_gtk.Gtk.Search_entry` | `Ocgtk.Search_entry` |
| `Ocgtk_gtk.Gtk.Search_entry.class search_entry` | `Ocgtk.Search_entry.class search_entry` |
| `Ocgtk_gtk.Gtk.Search_entry.class type search_entry_t` | `Ocgtk.Search_entry.class type search_entry_t` |
| `Ocgtk_gtk.Gtk.Section_model` | `Ocgtk.Section_model` |
| `Ocgtk_gtk.Gtk.Section_model.class section_model` | `Ocgtk.Section_model.class section_model` |
| `Ocgtk_gtk.Gtk.Section_model.class type section_model_t` | `Ocgtk.Section_model.class type section_model_t` |
| `Ocgtk_gtk.Gtk.Selection_filter_model` | `Ocgtk.Selection_filter_model` |
| `Ocgtk_gtk.Gtk.Selection_filter_model.class selection_filter_model` | `Ocgtk.Selection_filter_model.class selection_filter_model` |
| `Ocgtk_gtk.Gtk.Selection_filter_model.class type selection_filter_model_t` | `Ocgtk.Selection_filter_model.class type selection_filter_model_t` |
| `Ocgtk_gtk.Gtk.Selection_model` | `Ocgtk.Selection_model` |
| `Ocgtk_gtk.Gtk.Selection_model.class selection_model` | `Ocgtk.Selection_model.class selection_model` |
| `Ocgtk_gtk.Gtk.Selection_model.class type selection_model_t` | `Ocgtk.Selection_model.class type selection_model_t` |
| `Ocgtk_gtk.Gtk.Separator` | `Ocgtk.Separator` |
| `Ocgtk_gtk.Gtk.Separator.class separator` | `Ocgtk.Separator.class separator` |
| `Ocgtk_gtk.Gtk.Separator.class type separator_t` | `Ocgtk.Separator.class type separator_t` |
| `Ocgtk_gtk.Gtk.Settings` | `Ocgtk.Settings` |
| `Ocgtk_gtk.Gtk.Settings.class settings` | `Ocgtk.Settings.class settings` |
| `Ocgtk_gtk.Gtk.Settings.class type settings_t` | `Ocgtk.Settings.class type settings_t` |
| `Ocgtk_gtk.Gtk.Shortcut` | `Ocgtk.Shortcut` |
| `Ocgtk_gtk.Gtk.Shortcut_action` | `Ocgtk.Shortcut_action` |
| `Ocgtk_gtk.Gtk.Shortcut_action.class shortcut_action` | `Ocgtk.Shortcut_action.class shortcut_action` |
| `Ocgtk_gtk.Gtk.Shortcut_action.class type shortcut_action_t` | `Ocgtk.Shortcut_action.class type shortcut_action_t` |
| `Ocgtk_gtk.Gtk.Shortcut.class shortcut` | `Ocgtk.Shortcut.class shortcut` |
| `Ocgtk_gtk.Gtk.Shortcut.class type shortcut_t` | `Ocgtk.Shortcut.class type shortcut_t` |
| `Ocgtk_gtk.Gtk.Shortcut_controller` | `Ocgtk.Shortcut_controller` |
| `Ocgtk_gtk.Gtk.Shortcut_controller.class shortcut_controller` | `Ocgtk.Shortcut_controller.class shortcut_controller` |
| `Ocgtk_gtk.Gtk.Shortcut_controller.class type shortcut_controller_t` | `Ocgtk.Shortcut_controller.class type shortcut_controller_t` |
| `Ocgtk_gtk.Gtk.Shortcut_label` | `Ocgtk.Shortcut_label` |
| `Ocgtk_gtk.Gtk.Shortcut_label.class shortcut_label` | `Ocgtk.Shortcut_label.class shortcut_label` |
| `Ocgtk_gtk.Gtk.Shortcut_label.class type shortcut_label_t` | `Ocgtk.Shortcut_label.class type shortcut_label_t` |
| `Ocgtk_gtk.Gtk.Shortcut_manager` | `Ocgtk.Shortcut_manager` |
| `Ocgtk_gtk.Gtk.Shortcut_manager.class shortcut_manager` | `Ocgtk.Shortcut_manager.class shortcut_manager` |
| `Ocgtk_gtk.Gtk.Shortcut_manager.class type shortcut_manager_t` | `Ocgtk.Shortcut_manager.class type shortcut_manager_t` |
| `Ocgtk_gtk.Gtk.Shortcuts_group` | `Ocgtk.Shortcuts_group` |
| `Ocgtk_gtk.Gtk.Shortcuts_group.class shortcuts_group` | `Ocgtk.Shortcuts_group.class shortcuts_group` |
| `Ocgtk_gtk.Gtk.Shortcuts_group.class type shortcuts_group_t` | `Ocgtk.Shortcuts_group.class type shortcuts_group_t` |
| `Ocgtk_gtk.Gtk.Shortcuts_section` | `Ocgtk.Shortcuts_section` |
| `Ocgtk_gtk.Gtk.Shortcuts_section.class shortcuts_section` | `Ocgtk.Shortcuts_section.class shortcuts_section` |
| `Ocgtk_gtk.Gtk.Shortcuts_section.class type shortcuts_section_t` | `Ocgtk.Shortcuts_section.class type shortcuts_section_t` |
| `Ocgtk_gtk.Gtk.Shortcuts_shortcut` | `Ocgtk.Shortcuts_shortcut` |
| `Ocgtk_gtk.Gtk.Shortcuts_shortcut.class shortcuts_shortcut` | `Ocgtk.Shortcuts_shortcut.class shortcuts_shortcut` |
| `Ocgtk_gtk.Gtk.Shortcuts_shortcut.class type shortcuts_shortcut_t` | `Ocgtk.Shortcuts_shortcut.class type shortcuts_shortcut_t` |
| `Ocgtk_gtk.Gtk.Shortcuts_window` | `Ocgtk.Shortcuts_window` |
| `Ocgtk_gtk.Gtk.Shortcuts_window.class shortcuts_window` | `Ocgtk.Shortcuts_window.class shortcuts_window` |
| `Ocgtk_gtk.Gtk.Shortcuts_window.class type shortcuts_window_t` | `Ocgtk.Shortcuts_window.class type shortcuts_window_t` |
| `Ocgtk_gtk.Gtk.Shortcut_trigger` | `Ocgtk.Shortcut_trigger` |
| `Ocgtk_gtk.Gtk.Shortcut_trigger.class shortcut_trigger` | `Ocgtk.Shortcut_trigger.class shortcut_trigger` |
| `Ocgtk_gtk.Gtk.Shortcut_trigger.class type shortcut_trigger_t` | `Ocgtk.Shortcut_trigger.class type shortcut_trigger_t` |
| `Ocgtk_gtk.Gtk.Signal_action` | `Ocgtk.Signal_action` |
| `Ocgtk_gtk.Gtk.Signal_action.class signal_action` | `Ocgtk.Signal_action.class signal_action` |
| `Ocgtk_gtk.Gtk.Signal_action.class type signal_action_t` | `Ocgtk.Signal_action.class type signal_action_t` |
| `Ocgtk_gtk.Gtk.Signal_list_item_factory` | `Ocgtk.Signal_list_item_factory` |
| `Ocgtk_gtk.Gtk.Signal_list_item_factory.class signal_list_item_factory` | `Ocgtk.Signal_list_item_factory.class signal_list_item_factory` |
| `Ocgtk_gtk.Gtk.Signal_list_item_factory.class type signal_list_item_factory_t` | `Ocgtk.Signal_list_item_factory.class type signal_list_item_factory_t` |
| `Ocgtk_gtk.Gtk.Single_selection` | `Ocgtk.Single_selection` |
| `Ocgtk_gtk.Gtk.Single_selection.class single_selection` | `Ocgtk.Single_selection.class single_selection` |
| `Ocgtk_gtk.Gtk.Single_selection.class type single_selection_t` | `Ocgtk.Single_selection.class type single_selection_t` |
| `Ocgtk_gtk.Gtk.Size_group` | `Ocgtk.Size_group` |
| `Ocgtk_gtk.Gtk.Size_group.class size_group` | `Ocgtk.Size_group.class size_group` |
| `Ocgtk_gtk.Gtk.Size_group.class type size_group_t` | `Ocgtk.Size_group.class type size_group_t` |
| `Ocgtk_gtk.Gtk.Slice_list_model` | `Ocgtk.Slice_list_model` |
| `Ocgtk_gtk.Gtk.Slice_list_model.class slice_list_model` | `Ocgtk.Slice_list_model.class slice_list_model` |
| `Ocgtk_gtk.Gtk.Slice_list_model.class type slice_list_model_t` | `Ocgtk.Slice_list_model.class type slice_list_model_t` |
| `Ocgtk_gtk.Gtk.Snapshot` | `Ocgtk.Snapshot` |
| `Ocgtk_gtk.Gtk.Snapshot.class snapshot` | `Ocgtk.Snapshot.class snapshot` |
| `Ocgtk_gtk.Gtk.Snapshot.class type snapshot_t` | `Ocgtk.Snapshot.class type snapshot_t` |
| `Ocgtk_gtk.Gtk.Sorter` | `Ocgtk.Sorter` |
| `Ocgtk_gtk.Gtk.Sorter.class sorter` | `Ocgtk.Sorter.class sorter` |
| `Ocgtk_gtk.Gtk.Sorter.class type sorter_t` | `Ocgtk.Sorter.class type sorter_t` |
| `Ocgtk_gtk.Gtk.Sort_list_model` | `Ocgtk.Sort_list_model` |
| `Ocgtk_gtk.Gtk.Sort_list_model.class sort_list_model` | `Ocgtk.Sort_list_model.class sort_list_model` |
| `Ocgtk_gtk.Gtk.Sort_list_model.class type sort_list_model_t` | `Ocgtk.Sort_list_model.class type sort_list_model_t` |
| `Ocgtk_gtk.Gtk.Spin_button` | `Ocgtk.Spin_button` |
| `Ocgtk_gtk.Gtk.Spin_button.class spin_button` | `Ocgtk.Spin_button.class spin_button` |
| `Ocgtk_gtk.Gtk.Spin_button.class type spin_button_t` | `Ocgtk.Spin_button.class type spin_button_t` |
| `Ocgtk_gtk.Gtk.Spinner` | `Ocgtk.Spinner` |
| `Ocgtk_gtk.Gtk.Spinner.class spinner` | `Ocgtk.Spinner.class spinner` |
| `Ocgtk_gtk.Gtk.Spinner.class type spinner_t` | `Ocgtk.Spinner.class type spinner_t` |
| `Ocgtk_gtk.Gtk.Stack` | `Ocgtk.Stack` |
| `Ocgtk_gtk.Gtk.Stack.class stack` | `Ocgtk.Stack.class stack` |
| `Ocgtk_gtk.Gtk.Stack.class type stack_t` | `Ocgtk.Stack.class type stack_t` |
| `Ocgtk_gtk.Gtk.Stack_page` | `Ocgtk.Stack_page` |
| `Ocgtk_gtk.Gtk.Stack_page.class stack_page` | `Ocgtk.Stack_page.class stack_page` |
| `Ocgtk_gtk.Gtk.Stack_page.class type stack_page_t` | `Ocgtk.Stack_page.class type stack_page_t` |
| `Ocgtk_gtk.Gtk.Stack_sidebar` | `Ocgtk.Stack_sidebar` |
| `Ocgtk_gtk.Gtk.Stack_sidebar.class stack_sidebar` | `Ocgtk.Stack_sidebar.class stack_sidebar` |
| `Ocgtk_gtk.Gtk.Stack_sidebar.class type stack_sidebar_t` | `Ocgtk.Stack_sidebar.class type stack_sidebar_t` |
| `Ocgtk_gtk.Gtk.Stack_switcher` | `Ocgtk.Stack_switcher` |
| `Ocgtk_gtk.Gtk.Stack_switcher.class stack_switcher` | `Ocgtk.Stack_switcher.class stack_switcher` |
| `Ocgtk_gtk.Gtk.Stack_switcher.class type stack_switcher_t` | `Ocgtk.Stack_switcher.class type stack_switcher_t` |
| `Ocgtk_gtk.Gtk.Statusbar` | `Ocgtk.Statusbar` |
| `Ocgtk_gtk.Gtk.Statusbar.class statusbar` | `Ocgtk.Statusbar.class statusbar` |
| `Ocgtk_gtk.Gtk.Statusbar.class type statusbar_t` | `Ocgtk.Statusbar.class type statusbar_t` |
| `Ocgtk_gtk.Gtk.String_filter` | `Ocgtk.String_filter` |
| `Ocgtk_gtk.Gtk.String_filter.class string_filter` | `Ocgtk.String_filter.class string_filter` |
| `Ocgtk_gtk.Gtk.String_filter.class type string_filter_t` | `Ocgtk.String_filter.class type string_filter_t` |
| `Ocgtk_gtk.Gtk.String_list` | `Ocgtk.String_list` |
| `Ocgtk_gtk.Gtk.String_list.class string_list` | `Ocgtk.String_list.class string_list` |
| `Ocgtk_gtk.Gtk.String_list.class type string_list_t` | `Ocgtk.String_list.class type string_list_t` |
| `Ocgtk_gtk.Gtk.String_object` | `Ocgtk.String_object` |
| `Ocgtk_gtk.Gtk.String_object.class string_object` | `Ocgtk.String_object.class string_object` |
| `Ocgtk_gtk.Gtk.String_object.class type string_object_t` | `Ocgtk.String_object.class type string_object_t` |
| `Ocgtk_gtk.Gtk.String_sorter` | `Ocgtk.String_sorter` |
| `Ocgtk_gtk.Gtk.String_sorter.class string_sorter` | `Ocgtk.String_sorter.class string_sorter` |
| `Ocgtk_gtk.Gtk.String_sorter.class type string_sorter_t` | `Ocgtk.String_sorter.class type string_sorter_t` |
| `Ocgtk_gtk.Gtk.Style_context` | `Ocgtk.Style_context` |
| `Ocgtk_gtk.Gtk.Style_context.class style_context` | `Ocgtk.Style_context.class style_context` |
| `Ocgtk_gtk.Gtk.Style_context.class type style_context_t` | `Ocgtk.Style_context.class type style_context_t` |
| `Ocgtk_gtk.Gtk.Style_provider` | `Ocgtk.Style_provider` |
| `Ocgtk_gtk.Gtk.Style_provider.class style_provider` | `Ocgtk.Style_provider.class style_provider` |
| `Ocgtk_gtk.Gtk.Style_provider.class type style_provider_t` | `Ocgtk.Style_provider.class type style_provider_t` |
| `Ocgtk_gtk.Gtk.Switch` | `Ocgtk.Switch` |
| `Ocgtk_gtk.Gtk.Switch.class switch` | `Ocgtk.Switch.class switch` |
| `Ocgtk_gtk.Gtk.Switch.class type switch_t` | `Ocgtk.Switch.class type switch_t` |
| `Ocgtk_gtk.Gtk.Symbolic_paintable` | `Ocgtk.Symbolic_paintable` |
| `Ocgtk_gtk.Gtk.Symbolic_paintable.class symbolic_paintable` | `Ocgtk.Symbolic_paintable.class symbolic_paintable` |
| `Ocgtk_gtk.Gtk.Symbolic_paintable.class type symbolic_paintable_t` | `Ocgtk.Symbolic_paintable.class type symbolic_paintable_t` |
| `Ocgtk_gtk.Gtk.Text` | `Ocgtk.Text` |
| `Ocgtk_gtk.Gtk.Text_buffer` | `Ocgtk.Text_buffer` |
| `Ocgtk_gtk.Gtk.Text_buffer.class text_buffer` | `Ocgtk.Text_buffer.class text_buffer` |
| `Ocgtk_gtk.Gtk.Text_buffer.class type text_buffer_t` | `Ocgtk.Text_buffer.class type text_buffer_t` |
| `Ocgtk_gtk.Gtk.Text_child_anchor` | `Ocgtk.Text_child_anchor` |
| `Ocgtk_gtk.Gtk.Text_child_anchor.class text_child_anchor` | `Ocgtk.Text_child_anchor.class text_child_anchor` |
| `Ocgtk_gtk.Gtk.Text_child_anchor.class type text_child_anchor_t` | `Ocgtk.Text_child_anchor.class type text_child_anchor_t` |
| `Ocgtk_gtk.Gtk.Text.class text` | `Ocgtk.Text.class text` |
| `Ocgtk_gtk.Gtk.Text.class type text_t` | `Ocgtk.Text.class type text_t` |
| `Ocgtk_gtk.Gtk.Text_iter` | `Ocgtk.Text_iter` |
| `Ocgtk_gtk.Gtk.Text_iter.class text_iter` | `Ocgtk.Text_iter.class text_iter` |
| `Ocgtk_gtk.Gtk.Text_iter.class type text_iter_t` | `Ocgtk.Text_iter.class type text_iter_t` |
| `Ocgtk_gtk.Gtk.Text_mark` | `Ocgtk.Text_mark` |
| `Ocgtk_gtk.Gtk.Text_mark.class text_mark` | `Ocgtk.Text_mark.class text_mark` |
| `Ocgtk_gtk.Gtk.Text_mark.class type text_mark_t` | `Ocgtk.Text_mark.class type text_mark_t` |
| `Ocgtk_gtk.Gtk.Text_tag` | `Ocgtk.Text_tag` |
| `Ocgtk_gtk.Gtk.Text_tag.class text_tag` | `Ocgtk.Text_tag.class text_tag` |
| `Ocgtk_gtk.Gtk.Text_tag.class type text_tag_t` | `Ocgtk.Text_tag.class type text_tag_t` |
| `Ocgtk_gtk.Gtk.Text_tag_table` | `Ocgtk.Text_tag_table` |
| `Ocgtk_gtk.Gtk.Text_tag_table.class text_tag_table` | `Ocgtk.Text_tag_table.class text_tag_table` |
| `Ocgtk_gtk.Gtk.Text_tag_table.class type text_tag_table_t` | `Ocgtk.Text_tag_table.class type text_tag_table_t` |
| `Ocgtk_gtk.Gtk.Text_view` | `Ocgtk.Text_view` |
| `Ocgtk_gtk.Gtk.Text_view.class text_view` | `Ocgtk.Text_view.class text_view` |
| `Ocgtk_gtk.Gtk.Text_view.class type text_view_t` | `Ocgtk.Text_view.class type text_view_t` |
| `Ocgtk_gtk.Gtk.Toggle_button` | `Ocgtk.Toggle_button` |
| `Ocgtk_gtk.Gtk.Toggle_button.class toggle_button` | `Ocgtk.Toggle_button.class toggle_button` |
| `Ocgtk_gtk.Gtk.Toggle_button.class type toggle_button_t` | `Ocgtk.Toggle_button.class type toggle_button_t` |
| `Ocgtk_gtk.Gtk.Tooltip` | `Ocgtk.Tooltip` |
| `Ocgtk_gtk.Gtk.Tooltip.class tooltip` | `Ocgtk.Tooltip.class tooltip` |
| `Ocgtk_gtk.Gtk.Tooltip.class type tooltip_t` | `Ocgtk.Tooltip.class type tooltip_t` |
| `Ocgtk_gtk.Gtk.Tree_drag_dest` | `Ocgtk.Tree_drag_dest` |
| `Ocgtk_gtk.Gtk.Tree_drag_dest.class tree_drag_dest` | `Ocgtk.Tree_drag_dest.class tree_drag_dest` |
| `Ocgtk_gtk.Gtk.Tree_drag_dest.class type tree_drag_dest_t` | `Ocgtk.Tree_drag_dest.class type tree_drag_dest_t` |
| `Ocgtk_gtk.Gtk.Tree_drag_source` | `Ocgtk.Tree_drag_source` |
| `Ocgtk_gtk.Gtk.Tree_drag_source.class tree_drag_source` | `Ocgtk.Tree_drag_source.class tree_drag_source` |
| `Ocgtk_gtk.Gtk.Tree_drag_source.class type tree_drag_source_t` | `Ocgtk.Tree_drag_source.class type tree_drag_source_t` |
| `Ocgtk_gtk.Gtk.Tree_expander` | `Ocgtk.Tree_expander` |
| `Ocgtk_gtk.Gtk.Tree_expander.class tree_expander` | `Ocgtk.Tree_expander.class tree_expander` |
| `Ocgtk_gtk.Gtk.Tree_expander.class type tree_expander_t` | `Ocgtk.Tree_expander.class type tree_expander_t` |
| `Ocgtk_gtk.Gtk.Tree_iter` | `Ocgtk.Tree_iter` |
| `Ocgtk_gtk.Gtk.Tree_iter.class tree_iter` | `Ocgtk.Tree_iter.class tree_iter` |
| `Ocgtk_gtk.Gtk.Tree_iter.class type tree_iter_t` | `Ocgtk.Tree_iter.class type tree_iter_t` |
| `Ocgtk_gtk.Gtk.Tree_list_model` | `Ocgtk.Tree_list_model` |
| `Ocgtk_gtk.Gtk.Tree_list_model.class tree_list_model` | `Ocgtk.Tree_list_model.class tree_list_model` |
| `Ocgtk_gtk.Gtk.Tree_list_model.class type tree_list_model_t` | `Ocgtk.Tree_list_model.class type tree_list_model_t` |
| `Ocgtk_gtk.Gtk.Tree_list_row` | `Ocgtk.Tree_list_row` |
| `Ocgtk_gtk.Gtk.Tree_list_row.class tree_list_row` | `Ocgtk.Tree_list_row.class tree_list_row` |
| `Ocgtk_gtk.Gtk.Tree_list_row.class type tree_list_row_t` | `Ocgtk.Tree_list_row.class type tree_list_row_t` |
| `Ocgtk_gtk.Gtk.Tree_list_row_sorter` | `Ocgtk.Tree_list_row_sorter` |
| `Ocgtk_gtk.Gtk.Tree_list_row_sorter.class tree_list_row_sorter` | `Ocgtk.Tree_list_row_sorter.class tree_list_row_sorter` |
| `Ocgtk_gtk.Gtk.Tree_list_row_sorter.class type tree_list_row_sorter_t` | `Ocgtk.Tree_list_row_sorter.class type tree_list_row_sorter_t` |
| `Ocgtk_gtk.Gtk.Tree_model` | `Ocgtk.Tree_model` |
| `Ocgtk_gtk.Gtk.Tree_model.class tree_model` | `Ocgtk.Tree_model.class tree_model` |
| `Ocgtk_gtk.Gtk.Tree_model.class type tree_model_t` | `Ocgtk.Tree_model.class type tree_model_t` |
| `Ocgtk_gtk.Gtk.Tree_model_filter` | `Ocgtk.Tree_model_filter` |
| `Ocgtk_gtk.Gtk.Tree_model_filter.class tree_model_filter` | `Ocgtk.Tree_model_filter.class tree_model_filter` |
| `Ocgtk_gtk.Gtk.Tree_model_filter.class type tree_model_filter_t` | `Ocgtk.Tree_model_filter.class type tree_model_filter_t` |
| `Ocgtk_gtk.Gtk.Tree_model_sort` | `Ocgtk.Tree_model_sort` |
| `Ocgtk_gtk.Gtk.Tree_model_sort.class tree_model_sort` | `Ocgtk.Tree_model_sort.class tree_model_sort` |
| `Ocgtk_gtk.Gtk.Tree_model_sort.class type tree_model_sort_t` | `Ocgtk.Tree_model_sort.class type tree_model_sort_t` |
| `Ocgtk_gtk.Gtk.Tree_path` | `Ocgtk.Tree_path` |
| `Ocgtk_gtk.Gtk.Tree_path.class tree_path` | `Ocgtk.Tree_path.class tree_path` |
| `Ocgtk_gtk.Gtk.Tree_path.class type tree_path_t` | `Ocgtk.Tree_path.class type tree_path_t` |
| `Ocgtk_gtk.Gtk.Tree_row_reference` | `Ocgtk.Tree_row_reference` |
| `Ocgtk_gtk.Gtk.Tree_row_reference.class tree_row_reference` | `Ocgtk.Tree_row_reference.class tree_row_reference` |
| `Ocgtk_gtk.Gtk.Tree_row_reference.class type tree_row_reference_t` | `Ocgtk.Tree_row_reference.class type tree_row_reference_t` |
| `Ocgtk_gtk.Gtk.Tree_selection` | `Ocgtk.Tree_selection` |
| `Ocgtk_gtk.Gtk.Tree_selection.class tree_selection` | `Ocgtk.Tree_selection.class tree_selection` |
| `Ocgtk_gtk.Gtk.Tree_selection.class type tree_selection_t` | `Ocgtk.Tree_selection.class type tree_selection_t` |
| `Ocgtk_gtk.Gtk.Tree_sortable` | `Ocgtk.Tree_sortable` |
| `Ocgtk_gtk.Gtk.Tree_sortable.class tree_sortable` | `Ocgtk.Tree_sortable.class tree_sortable` |
| `Ocgtk_gtk.Gtk.Tree_sortable.class type tree_sortable_t` | `Ocgtk.Tree_sortable.class type tree_sortable_t` |
| `Ocgtk_gtk.Gtk.Tree_store` | `Ocgtk.Tree_store` |
| `Ocgtk_gtk.Gtk.Tree_store.class tree_store` | `Ocgtk.Tree_store.class tree_store` |
| `Ocgtk_gtk.Gtk.Tree_store.class type tree_store_t` | `Ocgtk.Tree_store.class type tree_store_t` |
| `Ocgtk_gtk.Gtk.Tree_view` | `Ocgtk.Tree_view` |
| `Ocgtk_gtk.Gtk.Tree_view.class tree_view` | `Ocgtk.Tree_view.class tree_view` |
| `Ocgtk_gtk.Gtk.Tree_view.class type tree_view_t` | `Ocgtk.Tree_view.class type tree_view_t` |
| `Ocgtk_gtk.Gtk.Tree_view_column` | `Ocgtk.Tree_view_column` |
| `Ocgtk_gtk.Gtk.Tree_view_column.class tree_view_column` | `Ocgtk.Tree_view_column.class tree_view_column` |
| `Ocgtk_gtk.Gtk.Tree_view_column.class type tree_view_column_t` | `Ocgtk.Tree_view_column.class type tree_view_column_t` |
| `Ocgtk_gtk.Gtk.Uri_launcher` | `Ocgtk.Uri_launcher` |
| `Ocgtk_gtk.Gtk.Uri_launcher.class type uri_launcher_t` | `Ocgtk.Uri_launcher.class type uri_launcher_t` |
| `Ocgtk_gtk.Gtk.Uri_launcher.class uri_launcher` | `Ocgtk.Uri_launcher.class uri_launcher` |
| `Ocgtk_gtk.Gtk.Video` | `Ocgtk.Video` |
| `Ocgtk_gtk.Gtk.Video.class type video_t` | `Ocgtk.Video.class type video_t` |
| `Ocgtk_gtk.Gtk.Video.class video` | `Ocgtk.Video.class video` |
| `Ocgtk_gtk.Gtk.Viewport` | `Ocgtk.Viewport` |
| `Ocgtk_gtk.Gtk.Viewport.class type viewport_t` | `Ocgtk.Viewport.class type viewport_t` |
| `Ocgtk_gtk.Gtk.Viewport.class viewport` | `Ocgtk.Viewport.class viewport` |
| `Ocgtk_gtk.Gtk.Volume_button` | `Ocgtk.Volume_button` |
| `Ocgtk_gtk.Gtk.Volume_button.class type volume_button_t` | `Ocgtk.Volume_button.class type volume_button_t` |
| `Ocgtk_gtk.Gtk.Volume_button.class volume_button` | `Ocgtk.Volume_button.class volume_button` |
| `Ocgtk_gtk.Gtk.Widget` | `Ocgtk.Widget` |
| `Ocgtk_gtk.Gtk.Widget.class type widget_t` | `Ocgtk.Widget.class type widget_t` |
| `Ocgtk_gtk.Gtk.Widget.class widget` | `Ocgtk.Widget.class widget` |
| `Ocgtk_gtk.Gtk.Widget_paintable` | `Ocgtk.Widget_paintable` |
| `Ocgtk_gtk.Gtk.Widget_paintable.class type widget_paintable_t` | `Ocgtk.Widget_paintable.class type widget_paintable_t` |
| `Ocgtk_gtk.Gtk.Widget_paintable.class widget_paintable` | `Ocgtk.Widget_paintable.class widget_paintable` |
| `Ocgtk_gtk.Gtk.Window` | `Ocgtk.Window` |
| `Ocgtk_gtk.Gtk.Window.class type window_t` | `Ocgtk.Window.class type window_t` |
| `Ocgtk_gtk.Gtk.Window.class window` | `Ocgtk.Window.class window` |
| `Ocgtk_gtk.Gtk.Window_controls` | `Ocgtk.Window_controls` |
| `Ocgtk_gtk.Gtk.Window_controls.class type window_controls_t` | `Ocgtk.Window_controls.class type window_controls_t` |
| `Ocgtk_gtk.Gtk.Window_controls.class window_controls` | `Ocgtk.Window_controls.class window_controls` |
| `Ocgtk_gtk.Gtk.Window_group` | `Ocgtk.Window_group` |
| `Ocgtk_gtk.Gtk.Window_group.class type window_group_t` | `Ocgtk.Window_group.class type window_group_t` |
| `Ocgtk_gtk.Gtk.Window_group.class window_group` | `Ocgtk.Window_group.class window_group` |
| `Ocgtk_gtk.Gtk.Window_handle` | `Ocgtk.Window_handle` |
| `Ocgtk_gtk.Gtk.Window_handle.class type window_handle_t` | `Ocgtk.Window_handle.class type window_handle_t` |
| `Ocgtk_gtk.Gtk.Window_handle.class window_handle` | `Ocgtk.Window_handle.class window_handle` |
| `Ocgtk_gtk.Gtk.Wrappers` | `Ocgtk.Raw` |
| `Ocgtk_gtk.Gtk.Wrappers.About_dialog` | `Ocgtk.Raw.About_dialog` |
| `Ocgtk_gtk.Gtk.Wrappers.Accessible` | `Ocgtk.Raw.Accessible` |
| `Ocgtk_gtk.Gtk.Wrappers.Accessible_list` | `Ocgtk.Raw.Accessible_list` |
| `Ocgtk_gtk.Gtk.Wrappers.Accessible_range` | `Ocgtk.Raw.Accessible_range` |
| `Ocgtk_gtk.Gtk.Wrappers.Accessible_text` | `Ocgtk.Raw.Accessible_text` |
| `Ocgtk_gtk.Gtk.Wrappers.Accessible_text_range` | `Ocgtk.Raw.Accessible_text_range` |
| `Ocgtk_gtk.Gtk.Wrappers.Actionable` | `Ocgtk.Raw.Actionable` |
| `Ocgtk_gtk.Gtk.Wrappers.Action_bar` | `Ocgtk.Raw.Action_bar` |
| `Ocgtk_gtk.Gtk.Wrappers.Activate_action` | `Ocgtk.Raw.Activate_action` |
| `Ocgtk_gtk.Gtk.Wrappers.Adjustment` | `Ocgtk.Raw.Adjustment` |
| `Ocgtk_gtk.Gtk.Wrappers.Alert_dialog` | `Ocgtk.Raw.Alert_dialog` |
| `Ocgtk_gtk.Gtk.Wrappers.Alternative_trigger` | `Ocgtk.Raw.Alternative_trigger` |
| `Ocgtk_gtk.Gtk.Wrappers.Any_filter` | `Ocgtk.Raw.Any_filter` |
| `Ocgtk_gtk.Gtk.Wrappers.App_chooser` | `Ocgtk.Raw.App_chooser` |
| `Ocgtk_gtk.Gtk.Wrappers.App_chooser_button` | `Ocgtk.Raw.App_chooser_button` |
| `Ocgtk_gtk.Gtk.Wrappers.App_chooser_dialog` | `Ocgtk.Raw.App_chooser_dialog` |
| `Ocgtk_gtk.Gtk.Wrappers.App_chooser_widget` | `Ocgtk.Raw.App_chooser_widget` |
| `Ocgtk_gtk.Gtk.Wrappers.Application` | `Ocgtk.Raw.Application` |
| `Ocgtk_gtk.Gtk.Wrappers.Application_window` | `Ocgtk.Raw.Application_window` |
| `Ocgtk_gtk.Gtk.Wrappers.Aspect_frame` | `Ocgtk.Raw.Aspect_frame` |
| `Ocgtk_gtk.Gtk.Wrappers.Assistant` | `Ocgtk.Raw.Assistant` |
| `Ocgtk_gtk.Gtk.Wrappers.Assistant_page` | `Ocgtk.Raw.Assistant_page` |
| `Ocgtk_gtk.Gtk.Wrappers.At_context` | `Ocgtk.Raw.At_context` |
| `Ocgtk_gtk.Gtk.Wrappers.Bin_layout` | `Ocgtk.Raw.Bin_layout` |
| `Ocgtk_gtk.Gtk.Wrappers.Bitset` | `Ocgtk.Raw.Bitset` |
| `Ocgtk_gtk.Gtk.Wrappers.Bitset_iter` | `Ocgtk.Raw.Bitset_iter` |
| `Ocgtk_gtk.Gtk.Wrappers.Bookmark_list` | `Ocgtk.Raw.Bookmark_list` |
| `Ocgtk_gtk.Gtk.Wrappers.Bool_filter` | `Ocgtk.Raw.Bool_filter` |
| `Ocgtk_gtk.Gtk.Wrappers.Border` | `Ocgtk.Raw.Border` |
| `Ocgtk_gtk.Gtk.Wrappers.Box` | `Ocgtk.Raw.Box` |
| `Ocgtk_gtk.Gtk.Wrappers.Box_layout` | `Ocgtk.Raw.Box_layout` |
| `Ocgtk_gtk.Gtk.Wrappers.Buildable` | `Ocgtk.Raw.Buildable` |
| `Ocgtk_gtk.Gtk.Wrappers.Buildable_parse_context` | `Ocgtk.Raw.Buildable_parse_context` |
| `Ocgtk_gtk.Gtk.Wrappers.Buildable_parser` | `Ocgtk.Raw.Buildable_parser` |
| `Ocgtk_gtk.Gtk.Wrappers.Builder` | `Ocgtk.Raw.Builder` |
| `Ocgtk_gtk.Gtk.Wrappers.Builder_c_scope` | `Ocgtk.Raw.Builder_c_scope` |
| `Ocgtk_gtk.Gtk.Wrappers.Builder_list_item_factory` | `Ocgtk.Raw.Builder_list_item_factory` |
| `Ocgtk_gtk.Gtk.Wrappers.Builder_scope` | `Ocgtk.Raw.Builder_scope` |
| `Ocgtk_gtk.Gtk.Wrappers.Button` | `Ocgtk.Raw.Button` |
| `Ocgtk_gtk.Gtk.Wrappers.Calendar` | `Ocgtk.Raw.Calendar` |
| `Ocgtk_gtk.Gtk.Wrappers.Callback_action` | `Ocgtk.Raw.Callback_action` |
| `Ocgtk_gtk.Gtk.Wrappers.C_closure_expression` | `Ocgtk.Raw.C_closure_expression` |
| `Ocgtk_gtk.Gtk.Wrappers.Cell_area` | `Ocgtk.Raw.Cell_area` |
| `Ocgtk_gtk.Gtk.Wrappers.Cell_area_box` | `Ocgtk.Raw.Cell_area_box` |
| `Ocgtk_gtk.Gtk.Wrappers.Cell_area_context` | `Ocgtk.Raw.Cell_area_context` |
| `Ocgtk_gtk.Gtk.Wrappers.Cell_editable` | `Ocgtk.Raw.Cell_editable` |
| `Ocgtk_gtk.Gtk.Wrappers.Cell_layout` | `Ocgtk.Raw.Cell_layout` |
| `Ocgtk_gtk.Gtk.Wrappers.Cell_renderer` | `Ocgtk.Raw.Cell_renderer` |
| `Ocgtk_gtk.Gtk.Wrappers.Cell_renderer_accel` | `Ocgtk.Raw.Cell_renderer_accel` |
| `Ocgtk_gtk.Gtk.Wrappers.Cell_renderer_combo` | `Ocgtk.Raw.Cell_renderer_combo` |
| `Ocgtk_gtk.Gtk.Wrappers.Cell_renderer_pixbuf` | `Ocgtk.Raw.Cell_renderer_pixbuf` |
| `Ocgtk_gtk.Gtk.Wrappers.Cell_renderer_progress` | `Ocgtk.Raw.Cell_renderer_progress` |
| `Ocgtk_gtk.Gtk.Wrappers.Cell_renderer_spin` | `Ocgtk.Raw.Cell_renderer_spin` |
| `Ocgtk_gtk.Gtk.Wrappers.Cell_renderer_spinner` | `Ocgtk.Raw.Cell_renderer_spinner` |
| `Ocgtk_gtk.Gtk.Wrappers.Cell_renderer_text` | `Ocgtk.Raw.Cell_renderer_text` |
| `Ocgtk_gtk.Gtk.Wrappers.Cell_renderer_toggle` | `Ocgtk.Raw.Cell_renderer_toggle` |
| `Ocgtk_gtk.Gtk.Wrappers.Cell_view` | `Ocgtk.Raw.Cell_view` |
| `Ocgtk_gtk.Gtk.Wrappers.Center_box` | `Ocgtk.Raw.Center_box` |
| `Ocgtk_gtk.Gtk.Wrappers.Center_layout` | `Ocgtk.Raw.Center_layout` |
| `Ocgtk_gtk.Gtk.Wrappers.Check_button` | `Ocgtk.Raw.Check_button` |
| `Ocgtk_gtk.Gtk.Wrappers.Closure_expression` | `Ocgtk.Raw.Closure_expression` |
| `Ocgtk_gtk.Gtk.Wrappers.Color_button` | `Ocgtk.Raw.Color_button` |
| `Ocgtk_gtk.Gtk.Wrappers.Color_chooser` | `Ocgtk.Raw.Color_chooser` |
| `Ocgtk_gtk.Gtk.Wrappers.Color_chooser_dialog` | `Ocgtk.Raw.Color_chooser_dialog` |
| `Ocgtk_gtk.Gtk.Wrappers.Color_chooser_widget` | `Ocgtk.Raw.Color_chooser_widget` |
| `Ocgtk_gtk.Gtk.Wrappers.Color_dialog` | `Ocgtk.Raw.Color_dialog` |
| `Ocgtk_gtk.Gtk.Wrappers.Color_dialog_button` | `Ocgtk.Raw.Color_dialog_button` |
| `Ocgtk_gtk.Gtk.Wrappers.Column_view` | `Ocgtk.Raw.Column_view` |
| `Ocgtk_gtk.Gtk.Wrappers.Column_view_cell` | `Ocgtk.Raw.Column_view_cell` |
| `Ocgtk_gtk.Gtk.Wrappers.Column_view_column` | `Ocgtk.Raw.Column_view_column` |
| `Ocgtk_gtk.Gtk.Wrappers.Column_view_row` | `Ocgtk.Raw.Column_view_row` |
| `Ocgtk_gtk.Gtk.Wrappers.Column_view_sorter` | `Ocgtk.Raw.Column_view_sorter` |
| `Ocgtk_gtk.Gtk.Wrappers.Combo_box` | `Ocgtk.Raw.Combo_box` |
| `Ocgtk_gtk.Gtk.Wrappers.Combo_box_text` | `Ocgtk.Raw.Combo_box_text` |
| `Ocgtk_gtk.Gtk.Wrappers.Constant_expression` | `Ocgtk.Raw.Constant_expression` |
| `Ocgtk_gtk.Gtk.Wrappers.Constraint` | `Ocgtk.Raw.Constraint` |
| `Ocgtk_gtk.Gtk.Wrappers.Constraint_guide` | `Ocgtk.Raw.Constraint_guide` |
| `Ocgtk_gtk.Gtk.Wrappers.Constraint_layout` | `Ocgtk.Raw.Constraint_layout` |
| `Ocgtk_gtk.Gtk.Wrappers.Constraint_layout_child` | `Ocgtk.Raw.Constraint_layout_child` |
| `Ocgtk_gtk.Gtk.Wrappers.Constraint_target` | `Ocgtk.Raw.Constraint_target` |
| `Ocgtk_gtk.Gtk.Wrappers.Css_location` | `Ocgtk.Raw.Css_location` |
| `Ocgtk_gtk.Gtk.Wrappers.Css_provider` | `Ocgtk.Raw.Css_provider` |
| `Ocgtk_gtk.Gtk.Wrappers.Css_section` | `Ocgtk.Raw.Css_section` |
| `Ocgtk_gtk.Gtk.Wrappers.Css_style_change` | `Ocgtk.Raw.Css_style_change` |
| `Ocgtk_gtk.Gtk.Wrappers.Custom_filter` | `Ocgtk.Raw.Custom_filter` |
| `Ocgtk_gtk.Gtk.Wrappers.Custom_layout` | `Ocgtk.Raw.Custom_layout` |
| `Ocgtk_gtk.Gtk.Wrappers.Custom_sorter` | `Ocgtk.Raw.Custom_sorter` |
| `Ocgtk_gtk.Gtk.Wrappers.Dialog` | `Ocgtk.Raw.Dialog` |
| `Ocgtk_gtk.Gtk.Wrappers.Directory_list` | `Ocgtk.Raw.Directory_list` |
| `Ocgtk_gtk.Gtk.Wrappers.Drag_icon` | `Ocgtk.Raw.Drag_icon` |
| `Ocgtk_gtk.Gtk.Wrappers.Drag_source` | `Ocgtk.Raw.Drag_source` |
| `Ocgtk_gtk.Gtk.Wrappers.Drawing_area` | `Ocgtk.Raw.Drawing_area` |
| `Ocgtk_gtk.Gtk.Wrappers.Drop_controller_motion` | `Ocgtk.Raw.Drop_controller_motion` |
| `Ocgtk_gtk.Gtk.Wrappers.Drop_down` | `Ocgtk.Raw.Drop_down` |
| `Ocgtk_gtk.Gtk.Wrappers.Drop_target` | `Ocgtk.Raw.Drop_target` |
| `Ocgtk_gtk.Gtk.Wrappers.Drop_target_async` | `Ocgtk.Raw.Drop_target_async` |
| `Ocgtk_gtk.Gtk.Wrappers.Editable` | `Ocgtk.Raw.Editable` |
| `Ocgtk_gtk.Gtk.Wrappers.Editable_label` | `Ocgtk.Raw.Editable_label` |
| `Ocgtk_gtk.Gtk.Wrappers.Emoji_chooser` | `Ocgtk.Raw.Emoji_chooser` |
| `Ocgtk_gtk.Gtk.Wrappers.Entry` | `Ocgtk.Raw.Entry` |
| `Ocgtk_gtk.Gtk.Wrappers.Entry_buffer` | `Ocgtk.Raw.Entry_buffer` |
| `Ocgtk_gtk.Gtk.Wrappers.Entry_completion` | `Ocgtk.Raw.Entry_completion` |
| `Ocgtk_gtk.Gtk.Wrappers.Event_controller` | `Ocgtk.Raw.Event_controller` |
| `Ocgtk_gtk.Gtk.Wrappers.Event_controller_focus` | `Ocgtk.Raw.Event_controller_focus` |
| `Ocgtk_gtk.Gtk.Wrappers.Event_controller_key` | `Ocgtk.Raw.Event_controller_key` |
| `Ocgtk_gtk.Gtk.Wrappers.Event_controller_legacy` | `Ocgtk.Raw.Event_controller_legacy` |
| `Ocgtk_gtk.Gtk.Wrappers.Event_controller_motion` | `Ocgtk.Raw.Event_controller_motion` |
| `Ocgtk_gtk.Gtk.Wrappers.Event_controller_scroll` | `Ocgtk.Raw.Event_controller_scroll` |
| `Ocgtk_gtk.Gtk.Wrappers.Every_filter` | `Ocgtk.Raw.Every_filter` |
| `Ocgtk_gtk.Gtk.Wrappers.Expander` | `Ocgtk.Raw.Expander` |
| `Ocgtk_gtk.Gtk.Wrappers.Expression` | `Ocgtk.Raw.Expression` |
| `Ocgtk_gtk.Gtk.Wrappers.Expression_watch` | `Ocgtk.Raw.Expression_watch` |
| `Ocgtk_gtk.Gtk.Wrappers.File_chooser` | `Ocgtk.Raw.File_chooser` |
| `Ocgtk_gtk.Gtk.Wrappers.File_chooser_dialog` | `Ocgtk.Raw.File_chooser_dialog` |
| `Ocgtk_gtk.Gtk.Wrappers.File_chooser_native` | `Ocgtk.Raw.File_chooser_native` |
| `Ocgtk_gtk.Gtk.Wrappers.File_chooser_widget` | `Ocgtk.Raw.File_chooser_widget` |
| `Ocgtk_gtk.Gtk.Wrappers.File_dialog` | `Ocgtk.Raw.File_dialog` |
| `Ocgtk_gtk.Gtk.Wrappers.File_filter` | `Ocgtk.Raw.File_filter` |
| `Ocgtk_gtk.Gtk.Wrappers.File_launcher` | `Ocgtk.Raw.File_launcher` |
| `Ocgtk_gtk.Gtk.Wrappers.Filter` | `Ocgtk.Raw.Filter` |
| `Ocgtk_gtk.Gtk.Wrappers.Filter_list_model` | `Ocgtk.Raw.Filter_list_model` |
| `Ocgtk_gtk.Gtk.Wrappers.Fixed` | `Ocgtk.Raw.Fixed` |
| `Ocgtk_gtk.Gtk.Wrappers.Fixed_layout` | `Ocgtk.Raw.Fixed_layout` |
| `Ocgtk_gtk.Gtk.Wrappers.Fixed_layout_child` | `Ocgtk.Raw.Fixed_layout_child` |
| `Ocgtk_gtk.Gtk.Wrappers.Flatten_list_model` | `Ocgtk.Raw.Flatten_list_model` |
| `Ocgtk_gtk.Gtk.Wrappers.Flow_box` | `Ocgtk.Raw.Flow_box` |
| `Ocgtk_gtk.Gtk.Wrappers.Flow_box_child` | `Ocgtk.Raw.Flow_box_child` |
| `Ocgtk_gtk.Gtk.Wrappers.Font_button` | `Ocgtk.Raw.Font_button` |
| `Ocgtk_gtk.Gtk.Wrappers.Font_chooser` | `Ocgtk.Raw.Font_chooser` |
| `Ocgtk_gtk.Gtk.Wrappers.Font_chooser_dialog` | `Ocgtk.Raw.Font_chooser_dialog` |
| `Ocgtk_gtk.Gtk.Wrappers.Font_chooser_widget` | `Ocgtk.Raw.Font_chooser_widget` |
| `Ocgtk_gtk.Gtk.Wrappers.Font_dialog` | `Ocgtk.Raw.Font_dialog` |
| `Ocgtk_gtk.Gtk.Wrappers.Font_dialog_button` | `Ocgtk.Raw.Font_dialog_button` |
| `Ocgtk_gtk.Gtk.Wrappers.Frame` | `Ocgtk.Raw.Frame` |
| `Ocgtk_gtk.Gtk.Wrappers.Gesture` | `Ocgtk.Raw.Gesture` |
| `Ocgtk_gtk.Gtk.Wrappers.Gesture_click` | `Ocgtk.Raw.Gesture_click` |
| `Ocgtk_gtk.Gtk.Wrappers.Gesture_drag` | `Ocgtk.Raw.Gesture_drag` |
| `Ocgtk_gtk.Gtk.Wrappers.Gesture_long_press` | `Ocgtk.Raw.Gesture_long_press` |
| `Ocgtk_gtk.Gtk.Wrappers.Gesture_pan` | `Ocgtk.Raw.Gesture_pan` |
| `Ocgtk_gtk.Gtk.Wrappers.Gesture_rotate` | `Ocgtk.Raw.Gesture_rotate` |
| `Ocgtk_gtk.Gtk.Wrappers.Gesture_single` | `Ocgtk.Raw.Gesture_single` |
| `Ocgtk_gtk.Gtk.Wrappers.Gesture_stylus` | `Ocgtk.Raw.Gesture_stylus` |
| `Ocgtk_gtk.Gtk.Wrappers.Gesture_swipe` | `Ocgtk.Raw.Gesture_swipe` |
| `Ocgtk_gtk.Gtk.Wrappers.Gesture_zoom` | `Ocgtk.Raw.Gesture_zoom` |
| `Ocgtk_gtk.Gtk.Wrappers.Gl_area` | `Ocgtk.Raw.Gl_area` |
| `Ocgtk_gtk.Gtk.Wrappers.Graphics_offload` | `Ocgtk.Raw.Graphics_offload` |
| `Ocgtk_gtk.Gtk.Wrappers.Grid` | `Ocgtk.Raw.Grid` |
| `Ocgtk_gtk.Gtk.Wrappers.Grid_layout` | `Ocgtk.Raw.Grid_layout` |
| `Ocgtk_gtk.Gtk.Wrappers.Grid_layout_child` | `Ocgtk.Raw.Grid_layout_child` |
| `Ocgtk_gtk.Gtk.Wrappers.Grid_view` | `Ocgtk.Raw.Grid_view` |
| `Ocgtk_gtk.Gtk.Wrappers.Header_bar` | `Ocgtk.Raw.Header_bar` |
| `Ocgtk_gtk.Gtk.Wrappers.Icon_paintable` | `Ocgtk.Raw.Icon_paintable` |
| `Ocgtk_gtk.Gtk.Wrappers.Icon_theme` | `Ocgtk.Raw.Icon_theme` |
| `Ocgtk_gtk.Gtk.Wrappers.Icon_view` | `Ocgtk.Raw.Icon_view` |
| `Ocgtk_gtk.Gtk.Wrappers.Image` | `Ocgtk.Raw.Image` |
| `Ocgtk_gtk.Gtk.Wrappers.Im_context` | `Ocgtk.Raw.Im_context` |
| `Ocgtk_gtk.Gtk.Wrappers.Im_context_simple` | `Ocgtk.Raw.Im_context_simple` |
| `Ocgtk_gtk.Gtk.Wrappers.Im_multicontext` | `Ocgtk.Raw.Im_multicontext` |
| `Ocgtk_gtk.Gtk.Wrappers.Info_bar` | `Ocgtk.Raw.Info_bar` |
| `Ocgtk_gtk.Gtk.Wrappers.Inscription` | `Ocgtk.Raw.Inscription` |
| `Ocgtk_gtk.Gtk.Wrappers.Keyval_trigger` | `Ocgtk.Raw.Keyval_trigger` |
| `Ocgtk_gtk.Gtk.Wrappers.Label` | `Ocgtk.Raw.Label` |
| `Ocgtk_gtk.Gtk.Wrappers.Layout_child` | `Ocgtk.Raw.Layout_child` |
| `Ocgtk_gtk.Gtk.Wrappers.Layout_manager` | `Ocgtk.Raw.Layout_manager` |
| `Ocgtk_gtk.Gtk.Wrappers.Level_bar` | `Ocgtk.Raw.Level_bar` |
| `Ocgtk_gtk.Gtk.Wrappers.Link_button` | `Ocgtk.Raw.Link_button` |
| `Ocgtk_gtk.Gtk.Wrappers.List_base` | `Ocgtk.Raw.List_base` |
| `Ocgtk_gtk.Gtk.Wrappers.List_box` | `Ocgtk.Raw.List_box` |
| `Ocgtk_gtk.Gtk.Wrappers.List_box_row` | `Ocgtk.Raw.List_box_row` |
| `Ocgtk_gtk.Gtk.Wrappers.List_header` | `Ocgtk.Raw.List_header` |
| `Ocgtk_gtk.Gtk.Wrappers.List_item` | `Ocgtk.Raw.List_item` |
| `Ocgtk_gtk.Gtk.Wrappers.List_item_factory` | `Ocgtk.Raw.List_item_factory` |
| `Ocgtk_gtk.Gtk.Wrappers.List_store` | `Ocgtk.Raw.List_store` |
| `Ocgtk_gtk.Gtk.Wrappers.List_view` | `Ocgtk.Raw.List_view` |
| `Ocgtk_gtk.Gtk.Wrappers.Lock_button` | `Ocgtk.Raw.Lock_button` |
| `Ocgtk_gtk.Gtk.Wrappers.Map_list_model` | `Ocgtk.Raw.Map_list_model` |
| `Ocgtk_gtk.Gtk.Wrappers.Media_controls` | `Ocgtk.Raw.Media_controls` |
| `Ocgtk_gtk.Gtk.Wrappers.Media_file` | `Ocgtk.Raw.Media_file` |
| `Ocgtk_gtk.Gtk.Wrappers.Media_stream` | `Ocgtk.Raw.Media_stream` |
| `Ocgtk_gtk.Gtk.Wrappers.Menu_button` | `Ocgtk.Raw.Menu_button` |
| `Ocgtk_gtk.Gtk.Wrappers.Message_dialog` | `Ocgtk.Raw.Message_dialog` |
| `Ocgtk_gtk.Gtk.Wrappers.Mnemonic_action` | `Ocgtk.Raw.Mnemonic_action` |
| `Ocgtk_gtk.Gtk.Wrappers.Mnemonic_trigger` | `Ocgtk.Raw.Mnemonic_trigger` |
| `Ocgtk_gtk.Gtk.Wrappers.Mount_operation` | `Ocgtk.Raw.Mount_operation` |
| `Ocgtk_gtk.Gtk.Wrappers.Multi_filter` | `Ocgtk.Raw.Multi_filter` |
| `Ocgtk_gtk.Gtk.Wrappers.Multi_selection` | `Ocgtk.Raw.Multi_selection` |
| `Ocgtk_gtk.Gtk.Wrappers.Multi_sorter` | `Ocgtk.Raw.Multi_sorter` |
| `Ocgtk_gtk.Gtk.Wrappers.Named_action` | `Ocgtk.Raw.Named_action` |
| `Ocgtk_gtk.Gtk.Wrappers.Native` | `Ocgtk.Raw.Native` |
| `Ocgtk_gtk.Gtk.Wrappers.Native_dialog` | `Ocgtk.Raw.Native_dialog` |
| `Ocgtk_gtk.Gtk.Wrappers.Never_trigger` | `Ocgtk.Raw.Never_trigger` |
| `Ocgtk_gtk.Gtk.Wrappers.No_selection` | `Ocgtk.Raw.No_selection` |
| `Ocgtk_gtk.Gtk.Wrappers.Notebook` | `Ocgtk.Raw.Notebook` |
| `Ocgtk_gtk.Gtk.Wrappers.Notebook_page` | `Ocgtk.Raw.Notebook_page` |
| `Ocgtk_gtk.Gtk.Wrappers.Nothing_action` | `Ocgtk.Raw.Nothing_action` |
| `Ocgtk_gtk.Gtk.Wrappers.Numeric_sorter` | `Ocgtk.Raw.Numeric_sorter` |
| `Ocgtk_gtk.Gtk.Wrappers.Object_expression` | `Ocgtk.Raw.Object_expression` |
| `Ocgtk_gtk.Gtk.Wrappers.Orientable` | `Ocgtk.Raw.Orientable` |
| `Ocgtk_gtk.Gtk.Wrappers.Overlay` | `Ocgtk.Raw.Overlay` |
| `Ocgtk_gtk.Gtk.Wrappers.Overlay_layout` | `Ocgtk.Raw.Overlay_layout` |
| `Ocgtk_gtk.Gtk.Wrappers.Overlay_layout_child` | `Ocgtk.Raw.Overlay_layout_child` |
| `Ocgtk_gtk.Gtk.Wrappers.Pad_action_entry` | `Ocgtk.Raw.Pad_action_entry` |
| `Ocgtk_gtk.Gtk.Wrappers.Pad_controller` | `Ocgtk.Raw.Pad_controller` |
| `Ocgtk_gtk.Gtk.Wrappers.Page_range` | `Ocgtk.Raw.Page_range` |
| `Ocgtk_gtk.Gtk.Wrappers.Page_setup` | `Ocgtk.Raw.Page_setup` |
| `Ocgtk_gtk.Gtk.Wrappers.Paned` | `Ocgtk.Raw.Paned` |
| `Ocgtk_gtk.Gtk.Wrappers.Paper_size` | `Ocgtk.Raw.Paper_size` |
| `Ocgtk_gtk.Gtk.Wrappers.Param_spec_expression` | `Ocgtk.Raw.Param_spec_expression` |
| `Ocgtk_gtk.Gtk.Wrappers.Password_entry` | `Ocgtk.Raw.Password_entry` |
| `Ocgtk_gtk.Gtk.Wrappers.Password_entry_buffer` | `Ocgtk.Raw.Password_entry_buffer` |
| `Ocgtk_gtk.Gtk.Wrappers.Picture` | `Ocgtk.Raw.Picture` |
| `Ocgtk_gtk.Gtk.Wrappers.Popover` | `Ocgtk.Raw.Popover` |
| `Ocgtk_gtk.Gtk.Wrappers.Popover_menu` | `Ocgtk.Raw.Popover_menu` |
| `Ocgtk_gtk.Gtk.Wrappers.Popover_menu_bar` | `Ocgtk.Raw.Popover_menu_bar` |
| `Ocgtk_gtk.Gtk.Wrappers.Print_context` | `Ocgtk.Raw.Print_context` |
| `Ocgtk_gtk.Gtk.Wrappers.Print_dialog` | `Ocgtk.Raw.Print_dialog` |
| `Ocgtk_gtk.Gtk.Wrappers.Print_operation` | `Ocgtk.Raw.Print_operation` |
| `Ocgtk_gtk.Gtk.Wrappers.Print_operation_preview` | `Ocgtk.Raw.Print_operation_preview` |
| `Ocgtk_gtk.Gtk.Wrappers.Print_settings` | `Ocgtk.Raw.Print_settings` |
| `Ocgtk_gtk.Gtk.Wrappers.Print_setup` | `Ocgtk.Raw.Print_setup` |
| `Ocgtk_gtk.Gtk.Wrappers.Progress_bar` | `Ocgtk.Raw.Progress_bar` |
| `Ocgtk_gtk.Gtk.Wrappers.Property_expression` | `Ocgtk.Raw.Property_expression` |
| `Ocgtk_gtk.Gtk.Wrappers.Range` | `Ocgtk.Raw.Range` |
| `Ocgtk_gtk.Gtk.Wrappers.Recent_data` | `Ocgtk.Raw.Recent_data` |
| `Ocgtk_gtk.Gtk.Wrappers.Recent_info` | `Ocgtk.Raw.Recent_info` |
| `Ocgtk_gtk.Gtk.Wrappers.Recent_manager` | `Ocgtk.Raw.Recent_manager` |
| `Ocgtk_gtk.Gtk.Wrappers.Requested_size` | `Ocgtk.Raw.Requested_size` |
| `Ocgtk_gtk.Gtk.Wrappers.Requisition` | `Ocgtk.Raw.Requisition` |
| `Ocgtk_gtk.Gtk.Wrappers.Revealer` | `Ocgtk.Raw.Revealer` |
| `Ocgtk_gtk.Gtk.Wrappers.Root` | `Ocgtk.Raw.Root` |
| `Ocgtk_gtk.Gtk.Wrappers.Scale` | `Ocgtk.Raw.Scale` |
| `Ocgtk_gtk.Gtk.Wrappers.Scale_button` | `Ocgtk.Raw.Scale_button` |
| `Ocgtk_gtk.Gtk.Wrappers.Scrollable` | `Ocgtk.Raw.Scrollable` |
| `Ocgtk_gtk.Gtk.Wrappers.Scrollbar` | `Ocgtk.Raw.Scrollbar` |
| `Ocgtk_gtk.Gtk.Wrappers.Scrolled_window` | `Ocgtk.Raw.Scrolled_window` |
| `Ocgtk_gtk.Gtk.Wrappers.Scroll_info` | `Ocgtk.Raw.Scroll_info` |
| `Ocgtk_gtk.Gtk.Wrappers.Search_bar` | `Ocgtk.Raw.Search_bar` |
| `Ocgtk_gtk.Gtk.Wrappers.Search_entry` | `Ocgtk.Raw.Search_entry` |
| `Ocgtk_gtk.Gtk.Wrappers.Section_model` | `Ocgtk.Raw.Section_model` |
| `Ocgtk_gtk.Gtk.Wrappers.Selection_filter_model` | `Ocgtk.Raw.Selection_filter_model` |
| `Ocgtk_gtk.Gtk.Wrappers.Selection_model` | `Ocgtk.Raw.Selection_model` |
| `Ocgtk_gtk.Gtk.Wrappers.Separator` | `Ocgtk.Raw.Separator` |
| `Ocgtk_gtk.Gtk.Wrappers.Settings` | `Ocgtk.Raw.Settings` |
| `Ocgtk_gtk.Gtk.Wrappers.Shortcut` | `Ocgtk.Raw.Shortcut` |
| `Ocgtk_gtk.Gtk.Wrappers.Shortcut_action` | `Ocgtk.Raw.Shortcut_action` |
| `Ocgtk_gtk.Gtk.Wrappers.Shortcut_controller` | `Ocgtk.Raw.Shortcut_controller` |
| `Ocgtk_gtk.Gtk.Wrappers.Shortcut_label` | `Ocgtk.Raw.Shortcut_label` |
| `Ocgtk_gtk.Gtk.Wrappers.Shortcut_manager` | `Ocgtk.Raw.Shortcut_manager` |
| `Ocgtk_gtk.Gtk.Wrappers.Shortcuts_group` | `Ocgtk.Raw.Shortcuts_group` |
| `Ocgtk_gtk.Gtk.Wrappers.Shortcuts_section` | `Ocgtk.Raw.Shortcuts_section` |
| `Ocgtk_gtk.Gtk.Wrappers.Shortcuts_shortcut` | `Ocgtk.Raw.Shortcuts_shortcut` |
| `Ocgtk_gtk.Gtk.Wrappers.Shortcuts_window` | `Ocgtk.Raw.Shortcuts_window` |
| `Ocgtk_gtk.Gtk.Wrappers.Shortcut_trigger` | `Ocgtk.Raw.Shortcut_trigger` |
| `Ocgtk_gtk.Gtk.Wrappers.Signal_action` | `Ocgtk.Raw.Signal_action` |
| `Ocgtk_gtk.Gtk.Wrappers.Signal_list_item_factory` | `Ocgtk.Raw.Signal_list_item_factory` |
| `Ocgtk_gtk.Gtk.Wrappers.Single_selection` | `Ocgtk.Raw.Single_selection` |
| `Ocgtk_gtk.Gtk.Wrappers.Size_group` | `Ocgtk.Raw.Size_group` |
| `Ocgtk_gtk.Gtk.Wrappers.Slice_list_model` | `Ocgtk.Raw.Slice_list_model` |
| `Ocgtk_gtk.Gtk.Wrappers.Snapshot` | `Ocgtk.Raw.Snapshot` |
| `Ocgtk_gtk.Gtk.Wrappers.Sorter` | `Ocgtk.Raw.Sorter` |
| `Ocgtk_gtk.Gtk.Wrappers.Sort_list_model` | `Ocgtk.Raw.Sort_list_model` |
| `Ocgtk_gtk.Gtk.Wrappers.Spin_button` | `Ocgtk.Raw.Spin_button` |
| `Ocgtk_gtk.Gtk.Wrappers.Spinner` | `Ocgtk.Raw.Spinner` |
| `Ocgtk_gtk.Gtk.Wrappers.Stack` | `Ocgtk.Raw.Stack` |
| `Ocgtk_gtk.Gtk.Wrappers.Stack_page` | `Ocgtk.Raw.Stack_page` |
| `Ocgtk_gtk.Gtk.Wrappers.Stack_sidebar` | `Ocgtk.Raw.Stack_sidebar` |
| `Ocgtk_gtk.Gtk.Wrappers.Stack_switcher` | `Ocgtk.Raw.Stack_switcher` |
| `Ocgtk_gtk.Gtk.Wrappers.Statusbar` | `Ocgtk.Raw.Statusbar` |
| `Ocgtk_gtk.Gtk.Wrappers.String_filter` | `Ocgtk.Raw.String_filter` |
| `Ocgtk_gtk.Gtk.Wrappers.String_list` | `Ocgtk.Raw.String_list` |
| `Ocgtk_gtk.Gtk.Wrappers.String_object` | `Ocgtk.Raw.String_object` |
| `Ocgtk_gtk.Gtk.Wrappers.String_sorter` | `Ocgtk.Raw.String_sorter` |
| `Ocgtk_gtk.Gtk.Wrappers.Style_context` | `Ocgtk.Raw.Style_context` |
| `Ocgtk_gtk.Gtk.Wrappers.Style_provider` | `Ocgtk.Raw.Style_provider` |
| `Ocgtk_gtk.Gtk.Wrappers.Switch` | `Ocgtk.Raw.Switch` |
| `Ocgtk_gtk.Gtk.Wrappers.Symbolic_paintable` | `Ocgtk.Raw.Symbolic_paintable` |
| `Ocgtk_gtk.Gtk.Wrappers.Text` | `Ocgtk.Raw.Text` |
| `Ocgtk_gtk.Gtk.Wrappers.Text_buffer` | `Ocgtk.Raw.Text_buffer` |
| `Ocgtk_gtk.Gtk.Wrappers.Text_child_anchor` | `Ocgtk.Raw.Text_child_anchor` |
| `Ocgtk_gtk.Gtk.Wrappers.Text_iter` | `Ocgtk.Raw.Text_iter` |
| `Ocgtk_gtk.Gtk.Wrappers.Text_mark` | `Ocgtk.Raw.Text_mark` |
| `Ocgtk_gtk.Gtk.Wrappers.Text_tag` | `Ocgtk.Raw.Text_tag` |
| `Ocgtk_gtk.Gtk.Wrappers.Text_tag_table` | `Ocgtk.Raw.Text_tag_table` |
| `Ocgtk_gtk.Gtk.Wrappers.Text_view` | `Ocgtk.Raw.Text_view` |
| `Ocgtk_gtk.Gtk.Wrappers.Toggle_button` | `Ocgtk.Raw.Toggle_button` |
| `Ocgtk_gtk.Gtk.Wrappers.Tooltip` | `Ocgtk.Raw.Tooltip` |
| `Ocgtk_gtk.Gtk.Wrappers.Tree_drag_dest` | `Ocgtk.Raw.Tree_drag_dest` |
| `Ocgtk_gtk.Gtk.Wrappers.Tree_drag_source` | `Ocgtk.Raw.Tree_drag_source` |
| `Ocgtk_gtk.Gtk.Wrappers.Tree_expander` | `Ocgtk.Raw.Tree_expander` |
| `Ocgtk_gtk.Gtk.Wrappers.Tree_iter` | `Ocgtk.Raw.Tree_iter` |
| `Ocgtk_gtk.Gtk.Wrappers.Tree_list_model` | `Ocgtk.Raw.Tree_list_model` |
| `Ocgtk_gtk.Gtk.Wrappers.Tree_list_row` | `Ocgtk.Raw.Tree_list_row` |
| `Ocgtk_gtk.Gtk.Wrappers.Tree_list_row_sorter` | `Ocgtk.Raw.Tree_list_row_sorter` |
| `Ocgtk_gtk.Gtk.Wrappers.Tree_model` | `Ocgtk.Raw.Tree_model` |
| `Ocgtk_gtk.Gtk.Wrappers.Tree_model_filter` | `Ocgtk.Raw.Tree_model_filter` |
| `Ocgtk_gtk.Gtk.Wrappers.Tree_model_sort` | `Ocgtk.Raw.Tree_model_sort` |
| `Ocgtk_gtk.Gtk.Wrappers.Tree_path` | `Ocgtk.Raw.Tree_path` |
| `Ocgtk_gtk.Gtk.Wrappers.Tree_row_reference` | `Ocgtk.Raw.Tree_row_reference` |
| `Ocgtk_gtk.Gtk.Wrappers.Tree_selection` | `Ocgtk.Raw.Tree_selection` |
| `Ocgtk_gtk.Gtk.Wrappers.Tree_sortable` | `Ocgtk.Raw.Tree_sortable` |
| `Ocgtk_gtk.Gtk.Wrappers.Tree_store` | `Ocgtk.Raw.Tree_store` |
| `Ocgtk_gtk.Gtk.Wrappers.Tree_view` | `Ocgtk.Raw.Tree_view` |
| `Ocgtk_gtk.Gtk.Wrappers.Tree_view_column` | `Ocgtk.Raw.Tree_view_column` |
| `Ocgtk_gtk.Gtk.Wrappers.Uri_launcher` | `Ocgtk.Raw.Uri_launcher` |
| `Ocgtk_gtk.Gtk.Wrappers.Video` | `Ocgtk.Raw.Video` |
| `Ocgtk_gtk.Gtk.Wrappers.Viewport` | `Ocgtk.Raw.Viewport` |
| `Ocgtk_gtk.Gtk.Wrappers.Volume_button` | `Ocgtk.Raw.Volume_button` |
| `Ocgtk_gtk.Gtk.Wrappers.Widget` | `Ocgtk.Raw.Widget` |
| `Ocgtk_gtk.Gtk.Wrappers.Widget_paintable` | `Ocgtk.Raw.Widget_paintable` |
| `Ocgtk_gtk.Gtk.Wrappers.Window` | `Ocgtk.Raw.Window` |
| `Ocgtk_gtk.Gtk.Wrappers.Window_controls` | `Ocgtk.Raw.Window_controls` |
| `Ocgtk_gtk.Gtk.Wrappers.Window_group` | `Ocgtk.Raw.Window_group` |
| `Ocgtk_gtk.Gtk.Wrappers.Window_handle` | `Ocgtk.Raw.Window_handle` |
| `Ocgtk_gtk.GVersion` | `Ocgtk.Version` |
| `Ocgtk_pango` | `Ocpango` |
| `Ocgtk_pangocairo` | `Ocpangocairo` |
| `Ocgtk_pangocairo.PangoCairo` | `Ocpangocairo` |
| `Ocgtk_pangocairo.PangoCairo.Font` | `Ocpangocairo.Font` |
| `Ocgtk_pangocairo.PangoCairo.Font.class font` | `Ocpangocairo.Font.class font` |
| `Ocgtk_pangocairo.PangoCairo.Font.class type font_t` | `Ocpangocairo.Font.class type font_t` |
| `Ocgtk_pangocairo.PangoCairo.Font_map` | `Ocpangocairo.Font_map` |
| `Ocgtk_pangocairo.PangoCairo.Font_map.class font_map` | `Ocpangocairo.Font_map.class font_map` |
| `Ocgtk_pangocairo.PangoCairo.Font_map.class type font_map_t` | `Ocpangocairo.Font_map.class type font_map_t` |
| `Ocgtk_pangocairo.PangoCairo.Wrappers` | `Ocpangocairo.Raw` |
| `Ocgtk_pangocairo.PangoCairo.Wrappers.Font` | `Ocpangocairo.Raw.Font` |
| `Ocgtk_pangocairo.PangoCairo.Wrappers.Font_map` | `Ocpangocairo.Raw.Font_map` |
| `Ocgtk_pango.Pango` | `Ocpango` |
| `Ocgtk_pango.Pango.Analysis` | `Ocpango.Analysis` |
| `Ocgtk_pango.Pango.Analysis.class analysis` | `Ocpango.Analysis.class analysis` |
| `Ocgtk_pango.Pango.Analysis.class type analysis_t` | `Ocpango.Analysis.class type analysis_t` |
| `Ocgtk_pango.Pango.Attr_class` | `Ocpango.Attr_class` |
| `Ocgtk_pango.Pango.Attr_class.class attr_class` | `Ocpango.Attr_class.class attr_class` |
| `Ocgtk_pango.Pango.Attr_class.class type attr_class_t` | `Ocpango.Attr_class.class type attr_class_t` |
| `Ocgtk_pango.Pango.Attr_color` | `Ocpango.Attr_color` |
| `Ocgtk_pango.Pango.Attr_color.class attr_color` | `Ocpango.Attr_color.class attr_color` |
| `Ocgtk_pango.Pango.Attr_color.class type attr_color_t` | `Ocpango.Attr_color.class type attr_color_t` |
| `Ocgtk_pango.Pango.Attr_float` | `Ocpango.Attr_float` |
| `Ocgtk_pango.Pango.Attr_float.class attr_float` | `Ocpango.Attr_float.class attr_float` |
| `Ocgtk_pango.Pango.Attr_float.class type attr_float_t` | `Ocpango.Attr_float.class type attr_float_t` |
| `Ocgtk_pango.Pango.Attr_font_desc` | `Ocpango.Attr_font_desc` |
| `Ocgtk_pango.Pango.Attr_font_desc.class attr_font_desc` | `Ocpango.Attr_font_desc.class attr_font_desc` |
| `Ocgtk_pango.Pango.Attr_font_desc.class type attr_font_desc_t` | `Ocpango.Attr_font_desc.class type attr_font_desc_t` |
| `Ocgtk_pango.Pango.Attr_font_features` | `Ocpango.Attr_font_features` |
| `Ocgtk_pango.Pango.Attr_font_features.class attr_font_features` | `Ocpango.Attr_font_features.class attr_font_features` |
| `Ocgtk_pango.Pango.Attr_font_features.class type attr_font_features_t` | `Ocpango.Attr_font_features.class type attr_font_features_t` |
| `Ocgtk_pango.Pango.Attribute` | `Ocpango.Attribute` |
| `Ocgtk_pango.Pango.Attribute.class attribute` | `Ocpango.Attribute.class attribute` |
| `Ocgtk_pango.Pango.Attribute.class type attribute_t` | `Ocpango.Attribute.class type attribute_t` |
| `Ocgtk_pango.Pango.Attr_int` | `Ocpango.Attr_int` |
| `Ocgtk_pango.Pango.Attr_int.class attr_int` | `Ocpango.Attr_int.class attr_int` |
| `Ocgtk_pango.Pango.Attr_int.class type attr_int_t` | `Ocpango.Attr_int.class type attr_int_t` |
| `Ocgtk_pango.Pango.Attr_iterator` | `Ocpango.Attr_iterator` |
| `Ocgtk_pango.Pango.Attr_iterator.class attr_iterator` | `Ocpango.Attr_iterator.class attr_iterator` |
| `Ocgtk_pango.Pango.Attr_iterator.class type attr_iterator_t` | `Ocpango.Attr_iterator.class type attr_iterator_t` |
| `Ocgtk_pango.Pango.Attr_language` | `Ocpango.Attr_language` |
| `Ocgtk_pango.Pango.Attr_language.class attr_language` | `Ocpango.Attr_language.class attr_language` |
| `Ocgtk_pango.Pango.Attr_language.class type attr_language_t` | `Ocpango.Attr_language.class type attr_language_t` |
| `Ocgtk_pango.Pango.Attr_list` | `Ocpango.Attr_list` |
| `Ocgtk_pango.Pango.Attr_list.class attr_list` | `Ocpango.Attr_list.class attr_list` |
| `Ocgtk_pango.Pango.Attr_list.class type attr_list_t` | `Ocpango.Attr_list.class type attr_list_t` |
| `Ocgtk_pango.Pango.Attr_shape` | `Ocpango.Attr_shape` |
| `Ocgtk_pango.Pango.Attr_shape.class attr_shape` | `Ocpango.Attr_shape.class attr_shape` |
| `Ocgtk_pango.Pango.Attr_shape.class type attr_shape_t` | `Ocpango.Attr_shape.class type attr_shape_t` |
| `Ocgtk_pango.Pango.Attr_size` | `Ocpango.Attr_size` |
| `Ocgtk_pango.Pango.Attr_size.class attr_size` | `Ocpango.Attr_size.class attr_size` |
| `Ocgtk_pango.Pango.Attr_size.class type attr_size_t` | `Ocpango.Attr_size.class type attr_size_t` |
| `Ocgtk_pango.Pango.Attr_string` | `Ocpango.Attr_string` |
| `Ocgtk_pango.Pango.Attr_string.class attr_string` | `Ocpango.Attr_string.class attr_string` |
| `Ocgtk_pango.Pango.Attr_string.class type attr_string_t` | `Ocpango.Attr_string.class type attr_string_t` |
| `Ocgtk_pango.Pango.Color` | `Ocpango.Color` |
| `Ocgtk_pango.Pango.Color.class color` | `Ocpango.Color.class color` |
| `Ocgtk_pango.Pango.Color.class type color_t` | `Ocpango.Color.class type color_t` |
| `Ocgtk_pango.Pango_constants` | `Ocpango.Constants` |
| `Ocgtk_pango.Pango.Context` | `Ocpango.Context` |
| `Ocgtk_pango.Pango.Context.class context` | `Ocpango.Context.class context` |
| `Ocgtk_pango.Pango.Context.class type context_t` | `Ocpango.Context.class type context_t` |
| `Ocgtk_pango.Pango.Coverage` | `Ocpango.Coverage` |
| `Ocgtk_pango.Pango.Coverage.class coverage` | `Ocpango.Coverage.class coverage` |
| `Ocgtk_pango.Pango.Coverage.class type coverage_t` | `Ocpango.Coverage.class type coverage_t` |
| `Ocgtk_pango.Pango_enums` | `Ocpango.Enums` |
| `Ocgtk_pango.Pango.Font` | `Ocpango.Font` |
| `Ocgtk_pango.Pango.Font.class font` | `Ocpango.Font.class font` |
| `Ocgtk_pango.Pango.Font.class type font_t` | `Ocpango.Font.class type font_t` |
| `Ocgtk_pango.Pango.Font_description` | `Ocpango.Font_description` |
| `Ocgtk_pango.Pango.Font_description.class font_description` | `Ocpango.Font_description.class font_description` |
| `Ocgtk_pango.Pango.Font_description.class type font_description_t` | `Ocpango.Font_description.class type font_description_t` |
| `Ocgtk_pango.Pango.Font_face` | `Ocpango.Font_face` |
| `Ocgtk_pango.Pango.Font_face.class font_face` | `Ocpango.Font_face.class font_face` |
| `Ocgtk_pango.Pango.Font_face.class type font_face_t` | `Ocpango.Font_face.class type font_face_t` |
| `Ocgtk_pango.Pango.Font_family` | `Ocpango.Font_family` |
| `Ocgtk_pango.Pango.Font_family.class font_family` | `Ocpango.Font_family.class font_family` |
| `Ocgtk_pango.Pango.Font_family.class type font_family_t` | `Ocpango.Font_family.class type font_family_t` |
| `Ocgtk_pango.Pango.Font_map` | `Ocpango.Font_map` |
| `Ocgtk_pango.Pango.Font_map.class font_map` | `Ocpango.Font_map.class font_map` |
| `Ocgtk_pango.Pango.Font_map.class type font_map_t` | `Ocpango.Font_map.class type font_map_t` |
| `Ocgtk_pango.Pango.Font_metrics` | `Ocpango.Font_metrics` |
| `Ocgtk_pango.Pango.Font_metrics.class font_metrics` | `Ocpango.Font_metrics.class font_metrics` |
| `Ocgtk_pango.Pango.Font_metrics.class type font_metrics_t` | `Ocpango.Font_metrics.class type font_metrics_t` |
| `Ocgtk_pango.Pango.Fontset` | `Ocpango.Fontset` |
| `Ocgtk_pango.Pango.Fontset.class fontset` | `Ocpango.Fontset.class fontset` |
| `Ocgtk_pango.Pango.Fontset.class type fontset_t` | `Ocpango.Fontset.class type fontset_t` |
| `Ocgtk_pango.Pango.Fontset_simple` | `Ocpango.Fontset_simple` |
| `Ocgtk_pango.Pango.Fontset_simple.class fontset_simple` | `Ocpango.Fontset_simple.class fontset_simple` |
| `Ocgtk_pango.Pango.Fontset_simple.class type fontset_simple_t` | `Ocpango.Fontset_simple.class type fontset_simple_t` |
| `Ocgtk_pango.Pango.Glyph_geometry` | `Ocpango.Glyph_geometry` |
| `Ocgtk_pango.Pango.Glyph_geometry.class glyph_geometry` | `Ocpango.Glyph_geometry.class glyph_geometry` |
| `Ocgtk_pango.Pango.Glyph_geometry.class type glyph_geometry_t` | `Ocpango.Glyph_geometry.class type glyph_geometry_t` |
| `Ocgtk_pango.Pango.Glyph_info` | `Ocpango.Glyph_info` |
| `Ocgtk_pango.Pango.Glyph_info.class glyph_info` | `Ocpango.Glyph_info.class glyph_info` |
| `Ocgtk_pango.Pango.Glyph_info.class type glyph_info_t` | `Ocpango.Glyph_info.class type glyph_info_t` |
| `Ocgtk_pango.Pango.Glyph_item` | `Ocpango.Glyph_item` |
| `Ocgtk_pango.Pango.Glyph_item.class glyph_item` | `Ocpango.Glyph_item.class glyph_item` |
| `Ocgtk_pango.Pango.Glyph_item.class type glyph_item_t` | `Ocpango.Glyph_item.class type glyph_item_t` |
| `Ocgtk_pango.Pango.Glyph_item_iter` | `Ocpango.Glyph_item_iter` |
| `Ocgtk_pango.Pango.Glyph_item_iter.class glyph_item_iter` | `Ocpango.Glyph_item_iter.class glyph_item_iter` |
| `Ocgtk_pango.Pango.Glyph_item_iter.class type glyph_item_iter_t` | `Ocpango.Glyph_item_iter.class type glyph_item_iter_t` |
| `Ocgtk_pango.Pango.Glyph_string` | `Ocpango.Glyph_string` |
| `Ocgtk_pango.Pango.Glyph_string.class glyph_string` | `Ocpango.Glyph_string.class glyph_string` |
| `Ocgtk_pango.Pango.Glyph_string.class type glyph_string_t` | `Ocpango.Glyph_string.class type glyph_string_t` |
| `Ocgtk_pango.Pango.Glyph_vis_attr` | `Ocpango.Glyph_vis_attr` |
| `Ocgtk_pango.Pango.Glyph_vis_attr.class glyph_vis_attr` | `Ocpango.Glyph_vis_attr.class glyph_vis_attr` |
| `Ocgtk_pango.Pango.Glyph_vis_attr.class type glyph_vis_attr_t` | `Ocpango.Glyph_vis_attr.class type glyph_vis_attr_t` |
| `Ocgtk_pango.Pango.Item` | `Ocpango.Item` |
| `Ocgtk_pango.Pango.Item.class item` | `Ocpango.Item.class item` |
| `Ocgtk_pango.Pango.Item.class type item_t` | `Ocpango.Item.class type item_t` |
| `Ocgtk_pango.Pango.Language` | `Ocpango.Language` |
| `Ocgtk_pango.Pango.Language.class language` | `Ocpango.Language.class language` |
| `Ocgtk_pango.Pango.Language.class type language_t` | `Ocpango.Language.class type language_t` |
| `Ocgtk_pango.Pango.Layout` | `Ocpango.Layout` |
| `Ocgtk_pango.Pango.Layout.class layout` | `Ocpango.Layout.class layout` |
| `Ocgtk_pango.Pango.Layout.class type layout_t` | `Ocpango.Layout.class type layout_t` |
| `Ocgtk_pango.Pango.Layout_iter` | `Ocpango.Layout_iter` |
| `Ocgtk_pango.Pango.Layout_iter.class layout_iter` | `Ocpango.Layout_iter.class layout_iter` |
| `Ocgtk_pango.Pango.Layout_iter.class type layout_iter_t` | `Ocpango.Layout_iter.class type layout_iter_t` |
| `Ocgtk_pango.Pango.Layout_line` | `Ocpango.Layout_line` |
| `Ocgtk_pango.Pango.Layout_line.class layout_line` | `Ocpango.Layout_line.class layout_line` |
| `Ocgtk_pango.Pango.Layout_line.class type layout_line_t` | `Ocpango.Layout_line.class type layout_line_t` |
| `Ocgtk_pango.Pango.Log_attr` | `Ocpango.Log_attr` |
| `Ocgtk_pango.Pango.Log_attr.class log_attr` | `Ocpango.Log_attr.class log_attr` |
| `Ocgtk_pango.Pango.Log_attr.class type log_attr_t` | `Ocpango.Log_attr.class type log_attr_t` |
| `Ocgtk_pango.Pango.Matrix` | `Ocpango.Matrix` |
| `Ocgtk_pango.Pango.Matrix.class matrix` | `Ocpango.Matrix.class matrix` |
| `Ocgtk_pango.Pango.Matrix.class type matrix_t` | `Ocpango.Matrix.class type matrix_t` |
| `Ocgtk_pango.Pango.Rectangle` | `Ocpango.Rectangle` |
| `Ocgtk_pango.Pango.Rectangle.class rectangle` | `Ocpango.Rectangle.class rectangle` |
| `Ocgtk_pango.Pango.Rectangle.class type rectangle_t` | `Ocpango.Rectangle.class type rectangle_t` |
| `Ocgtk_pango.Pango.Renderer` | `Ocpango.Renderer` |
| `Ocgtk_pango.Pango.Renderer.class renderer` | `Ocpango.Renderer.class renderer` |
| `Ocgtk_pango.Pango.Renderer.class type renderer_t` | `Ocpango.Renderer.class type renderer_t` |
| `Ocgtk_pango.Pango.Script_iter` | `Ocpango.Script_iter` |
| `Ocgtk_pango.Pango.Script_iter.class script_iter` | `Ocpango.Script_iter.class script_iter` |
| `Ocgtk_pango.Pango.Script_iter.class type script_iter_t` | `Ocpango.Script_iter.class type script_iter_t` |
| `Ocgtk_pango.Pango.Tab_array` | `Ocpango.Tab_array` |
| `Ocgtk_pango.Pango.Tab_array.class tab_array` | `Ocpango.Tab_array.class tab_array` |
| `Ocgtk_pango.Pango.Tab_array.class type tab_array_t` | `Ocpango.Tab_array.class type tab_array_t` |
| `Ocgtk_pango.Pango.Wrappers` | `Ocpango.Raw` |
| `Ocgtk_pango.Pango.Wrappers.Analysis` | `Ocpango.Raw.Analysis` |
| `Ocgtk_pango.Pango.Wrappers.Attr_class` | `Ocpango.Raw.Attr_class` |
| `Ocgtk_pango.Pango.Wrappers.Attr_color` | `Ocpango.Raw.Attr_color` |
| `Ocgtk_pango.Pango.Wrappers.Attr_float` | `Ocpango.Raw.Attr_float` |
| `Ocgtk_pango.Pango.Wrappers.Attr_font_desc` | `Ocpango.Raw.Attr_font_desc` |
| `Ocgtk_pango.Pango.Wrappers.Attr_font_features` | `Ocpango.Raw.Attr_font_features` |
| `Ocgtk_pango.Pango.Wrappers.Attribute` | `Ocpango.Raw.Attribute` |
| `Ocgtk_pango.Pango.Wrappers.Attr_int` | `Ocpango.Raw.Attr_int` |
| `Ocgtk_pango.Pango.Wrappers.Attr_iterator` | `Ocpango.Raw.Attr_iterator` |
| `Ocgtk_pango.Pango.Wrappers.Attr_language` | `Ocpango.Raw.Attr_language` |
| `Ocgtk_pango.Pango.Wrappers.Attr_list` | `Ocpango.Raw.Attr_list` |
| `Ocgtk_pango.Pango.Wrappers.Attr_shape` | `Ocpango.Raw.Attr_shape` |
| `Ocgtk_pango.Pango.Wrappers.Attr_size` | `Ocpango.Raw.Attr_size` |
| `Ocgtk_pango.Pango.Wrappers.Attr_string` | `Ocpango.Raw.Attr_string` |
| `Ocgtk_pango.Pango.Wrappers.Color` | `Ocpango.Raw.Color` |
| `Ocgtk_pango.Pango.Wrappers.Context` | `Ocpango.Raw.Context` |
| `Ocgtk_pango.Pango.Wrappers.Coverage` | `Ocpango.Raw.Coverage` |
| `Ocgtk_pango.Pango.Wrappers.Font` | `Ocpango.Raw.Font` |
| `Ocgtk_pango.Pango.Wrappers.Font_description` | `Ocpango.Raw.Font_description` |
| `Ocgtk_pango.Pango.Wrappers.Font_face` | `Ocpango.Raw.Font_face` |
| `Ocgtk_pango.Pango.Wrappers.Font_family` | `Ocpango.Raw.Font_family` |
| `Ocgtk_pango.Pango.Wrappers.Font_map` | `Ocpango.Raw.Font_map` |
| `Ocgtk_pango.Pango.Wrappers.Font_metrics` | `Ocpango.Raw.Font_metrics` |
| `Ocgtk_pango.Pango.Wrappers.Fontset` | `Ocpango.Raw.Fontset` |
| `Ocgtk_pango.Pango.Wrappers.Fontset_simple` | `Ocpango.Raw.Fontset_simple` |
| `Ocgtk_pango.Pango.Wrappers.Glyph_geometry` | `Ocpango.Raw.Glyph_geometry` |
| `Ocgtk_pango.Pango.Wrappers.Glyph_info` | `Ocpango.Raw.Glyph_info` |
| `Ocgtk_pango.Pango.Wrappers.Glyph_item` | `Ocpango.Raw.Glyph_item` |
| `Ocgtk_pango.Pango.Wrappers.Glyph_item_iter` | `Ocpango.Raw.Glyph_item_iter` |
| `Ocgtk_pango.Pango.Wrappers.Glyph_string` | `Ocpango.Raw.Glyph_string` |
| `Ocgtk_pango.Pango.Wrappers.Glyph_vis_attr` | `Ocpango.Raw.Glyph_vis_attr` |
| `Ocgtk_pango.Pango.Wrappers.Item` | `Ocpango.Raw.Item` |
| `Ocgtk_pango.Pango.Wrappers.Language` | `Ocpango.Raw.Language` |
| `Ocgtk_pango.Pango.Wrappers.Layout` | `Ocpango.Raw.Layout` |
| `Ocgtk_pango.Pango.Wrappers.Layout_iter` | `Ocpango.Raw.Layout_iter` |
| `Ocgtk_pango.Pango.Wrappers.Layout_line` | `Ocpango.Raw.Layout_line` |
| `Ocgtk_pango.Pango.Wrappers.Log_attr` | `Ocpango.Raw.Log_attr` |
| `Ocgtk_pango.Pango.Wrappers.Matrix` | `Ocpango.Raw.Matrix` |
| `Ocgtk_pango.Pango.Wrappers.Rectangle` | `Ocpango.Raw.Rectangle` |
| `Ocgtk_pango.Pango.Wrappers.Renderer` | `Ocpango.Raw.Renderer` |
| `Ocgtk_pango.Pango.Wrappers.Script_iter` | `Ocpango.Raw.Script_iter` |
| `Ocgtk_pango.Pango.Wrappers.Tab_array` | `Ocpango.Raw.Tab_array` |
| `UInt16` | `Ocglib.UInt16` |
| `UInt32` | `Ocglib.UInt32` |
| `UInt64` | `Ocglib.UInt64` |
| `UInt8` | `Ocglib.UInt8` |
