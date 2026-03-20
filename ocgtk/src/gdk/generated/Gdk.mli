(* GENERATED CODE - DO NOT EDIT *)
(* Top-level library module with direct references to all classes and enumerations *)

(** {1 Classes and Interfaces} *)

class type app_launch_context_t = GApp_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context.app_launch_context_t
class type button_event_t = GButton_event.button_event_t
class type cairo_context_t = GApp_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context.cairo_context_t
class type clipboard_t = GApp_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context.clipboard_t
class type content_deserializer_t = GContent_deserializer.content_deserializer_t
class type content_formats_t = GContent_formats.content_formats_t
class type content_formats_builder_t = GContent_formats_builder.content_formats_builder_t
class type content_provider_t = GContent_provider.content_provider_t
class type content_serializer_t = GContent_serializer.content_serializer_t
class type crossing_event_t = GCrossing_event.crossing_event_t
class type cursor_t = GCursor.cursor_t
class type dnd_event_t = GDnd_event.dnd_event_t
class type delete_event_t = GDelete_event.delete_event_t
class type device_t = GApp_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context.device_t
class type device_pad_t = GDevice_pad.device_pad_t
class type device_tool_t = GDevice_tool.device_tool_t
class type display_t = GApp_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context.display_t
class type display_manager_t = GDisplay_manager.display_manager_t
class type dmabuf_formats_t = GDmabuf_formats.dmabuf_formats_t
class type dmabuf_texture_t = GDmabuf_texture.dmabuf_texture_t
class type dmabuf_texture_builder_t = GDmabuf_texture_builder.dmabuf_texture_builder_t
class type drag_t = GDrag.drag_t
class type drag_surface_t = GDrag_surface.drag_surface_t
class type drag_surface_size_t = GDrag_surface_size.drag_surface_size_t
class type draw_context_t = GApp_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context.draw_context_t
class type drop_t = GDrop.drop_t
class type event_t = GApp_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context.event_t
class type event_sequence_t = GEvent_sequence.event_sequence_t
class type file_list_t = GFile_list.file_list_t
class type focus_event_t = GFocus_event.focus_event_t
class type frame_clock_t = GFrame_clock.frame_clock_t
class type frame_timings_t = GFrame_timings.frame_timings_t
class type gl_context_t = GApp_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context.gl_context_t
class type gl_texture_t = GGl_texture.gl_texture_t
class type gl_texture_builder_t = GGl_texture_builder.gl_texture_builder_t
class type grab_broken_event_t = GGrab_broken_event.grab_broken_event_t
class type key_event_t = GKey_event.key_event_t
class type keymap_key_t = GKeymap_key.keymap_key_t
class type memory_texture_t = GMemory_texture.memory_texture_t
class type monitor_t = GApp_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context.monitor_t
class type motion_event_t = GMotion_event.motion_event_t
class type pad_event_t = GPad_event.pad_event_t
class type paintable_t = GPaintable.paintable_t
class type popup_t = GPopup.popup_t
class type popup_layout_t = GPopup_layout.popup_layout_t
class type proximity_event_t = GProximity_event.proximity_event_t
class type rgb_a_t = GRgb_a.rgb_a_t
class type rectangle_t = GRectangle.rectangle_t
class type scroll_event_t = GScroll_event.scroll_event_t
class type seat_t = GApp_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context.seat_t
class type snapshot_t = GSnapshot.snapshot_t
class type surface_t = GApp_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context.surface_t
class type texture_t = GTexture.texture_t
class type texture_downloader_t = GTexture_downloader.texture_downloader_t
class type time_coord_t = GTime_coord.time_coord_t
class type toplevel_t = GToplevel.toplevel_t
class type toplevel_layout_t = GToplevel_layout.toplevel_layout_t
class type toplevel_size_t = GToplevel_size.toplevel_size_t
class type touch_event_t = GTouch_event.touch_event_t
class type touchpad_event_t = GTouchpad_event.touchpad_event_t
class type vulkan_context_t = GApp_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context.vulkan_context_t

class app_launch_context : App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context.App_launch_context.t -> app_launch_context_t
class button_event : Button_event.t -> button_event_t
class cairo_context : App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context.Cairo_context.t -> cairo_context_t
class clipboard : App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context.Clipboard.t -> clipboard_t
class content_deserializer : Content_deserializer.t -> content_deserializer_t
class content_formats : Content_formats.t -> content_formats_t
class content_formats_builder : Content_formats_builder.t -> content_formats_builder_t
class content_provider : Content_provider.t -> content_provider_t
class content_serializer : Content_serializer.t -> content_serializer_t
class crossing_event : Crossing_event.t -> crossing_event_t
class cursor : Cursor.t -> cursor_t
class dnd_event : Dnd_event.t -> dnd_event_t
class delete_event : Delete_event.t -> delete_event_t
class device : App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context.Device.t -> device_t
class device_pad : Device_pad.t -> device_pad_t
class device_tool : Device_tool.t -> device_tool_t
class display : App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context.Display.t -> display_t
class display_manager : Display_manager.t -> display_manager_t
class dmabuf_formats : Dmabuf_formats.t -> dmabuf_formats_t
class dmabuf_texture : Dmabuf_texture.t -> dmabuf_texture_t
class dmabuf_texture_builder : Dmabuf_texture_builder.t -> dmabuf_texture_builder_t
class drag : Drag.t -> drag_t
class drag_surface : Drag_surface.t -> drag_surface_t
class drag_surface_size : Drag_surface_size.t -> drag_surface_size_t
class draw_context : App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context.Draw_context.t -> draw_context_t
class drop : Drop.t -> drop_t
class event : App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context.Event.t -> event_t
class event_sequence : Event_sequence.t -> event_sequence_t
class file_list : File_list.t -> file_list_t
class focus_event : Focus_event.t -> focus_event_t
class frame_clock : Frame_clock.t -> frame_clock_t
class frame_timings : Frame_timings.t -> frame_timings_t
class gl_context : App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context.Gl_context.t -> gl_context_t
class gl_texture : Gl_texture.t -> gl_texture_t
class gl_texture_builder : Gl_texture_builder.t -> gl_texture_builder_t
class grab_broken_event : Grab_broken_event.t -> grab_broken_event_t
class key_event : Key_event.t -> key_event_t
class keymap_key : Keymap_key.t -> keymap_key_t
class memory_texture : Memory_texture.t -> memory_texture_t
class monitor : App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context.Monitor.t -> monitor_t
class motion_event : Motion_event.t -> motion_event_t
class pad_event : Pad_event.t -> pad_event_t
class paintable : Paintable.t -> paintable_t
class popup : Popup.t -> popup_t
class popup_layout : Popup_layout.t -> popup_layout_t
class proximity_event : Proximity_event.t -> proximity_event_t
class rgb_a : Rgb_a.t -> rgb_a_t
class rectangle : Rectangle.t -> rectangle_t
class scroll_event : Scroll_event.t -> scroll_event_t
class seat : App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context.Seat.t -> seat_t
class snapshot : Snapshot.t -> snapshot_t
class surface : App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context.Surface.t -> surface_t
class texture : Texture.t -> texture_t
class texture_downloader : Texture_downloader.t -> texture_downloader_t
class time_coord : Time_coord.t -> time_coord_t
class toplevel : Toplevel.t -> toplevel_t
class toplevel_layout : Toplevel_layout.t -> toplevel_layout_t
class toplevel_size : Toplevel_size.t -> toplevel_size_t
class touch_event : Touch_event.t -> touch_event_t
class touchpad_event : Touchpad_event.t -> touchpad_event_t
class vulkan_context : App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context.Vulkan_context.t -> vulkan_context_t

(** {1 Layer 1 Module Wrappers}
    
    This submodule provides aliases to the layer 1 (low-level) modules.
    These are the modules containing external declarations and basic bindings.
 *)
module Wrappers : sig
  module App_launch_context = App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context.App_launch_context
  module Button_event = Button_event
  module Cairo_context = App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context.Cairo_context
  module Clipboard = App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context.Clipboard
  module Content_deserializer = Content_deserializer
  module Content_formats = Content_formats
  module Content_formats_builder = Content_formats_builder
  module Content_provider = Content_provider
  module Content_serializer = Content_serializer
  module Crossing_event = Crossing_event
  module Cursor = Cursor
  module Dnd_event = Dnd_event
  module Delete_event = Delete_event
  module Device = App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context.Device
  module Device_pad = Device_pad
  module Device_tool = Device_tool
  module Display = App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context.Display
  module Display_manager = Display_manager
  module Dmabuf_formats = Dmabuf_formats
  module Dmabuf_texture = Dmabuf_texture
  module Dmabuf_texture_builder = Dmabuf_texture_builder
  module Drag = Drag
  module Drag_surface = Drag_surface
  module Drag_surface_size = Drag_surface_size
  module Draw_context = App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context.Draw_context
  module Drop = Drop
  module Event = App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context.Event
  module Event_sequence = Event_sequence
  module File_list = File_list
  module Focus_event = Focus_event
  module Frame_clock = Frame_clock
  module Frame_timings = Frame_timings
  module Gl_context = App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context.Gl_context
  module Gl_texture = Gl_texture
  module Gl_texture_builder = Gl_texture_builder
  module Grab_broken_event = Grab_broken_event
  module Key_event = Key_event
  module Keymap_key = Keymap_key
  module Memory_texture = Memory_texture
  module Monitor = App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context.Monitor
  module Motion_event = Motion_event
  module Pad_event = Pad_event
  module Paintable = Paintable
  module Popup = Popup
  module Popup_layout = Popup_layout
  module Proximity_event = Proximity_event
  module Rgb_a = Rgb_a
  module Rectangle = Rectangle
  module Scroll_event = Scroll_event
  module Seat = App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context.Seat
  module Snapshot = Snapshot
  module Surface = App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context.Surface
  module Texture = Texture
  module Texture_downloader = Texture_downloader
  module Time_coord = Time_coord
  module Toplevel = Toplevel
  module Toplevel_layout = Toplevel_layout
  module Toplevel_size = Toplevel_size
  module Touch_event = Touch_event
  module Touchpad_event = Touchpad_event
  module Vulkan_context = App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context.Vulkan_context
end

(** {1 Enumerations and Bitfields} *)

type axisuse = Gdk_enums.axisuse
type crossingmode = Gdk_enums.crossingmode
type devicepadfeature = Gdk_enums.devicepadfeature
type devicetooltype = Gdk_enums.devicetooltype
type dmabuferror = Gdk_enums.dmabuferror
type dragcancelreason = Gdk_enums.dragcancelreason
type eventtype = Gdk_enums.eventtype
type fullscreenmode = Gdk_enums.fullscreenmode
type glerror = Gdk_enums.glerror
type gravity = Gdk_enums.gravity
type inputsource = Gdk_enums.inputsource
type keymatch = Gdk_enums.keymatch
type memoryformat = Gdk_enums.memoryformat
type notifytype = Gdk_enums.notifytype
type scrolldirection = Gdk_enums.scrolldirection
type scrollunit = Gdk_enums.scrollunit
type subpixellayout = Gdk_enums.subpixellayout
type surfaceedge = Gdk_enums.surfaceedge
type textureerror = Gdk_enums.textureerror
type titlebargesture = Gdk_enums.titlebargesture
type touchpadgesturephase = Gdk_enums.touchpadgesturephase
type vulkanerror = Gdk_enums.vulkanerror
type anchorhints = Gdk_enums.anchorhints
type axisflags = Gdk_enums.axisflags
type dragaction = Gdk_enums.dragaction
type frameclockphase = Gdk_enums.frameclockphase
type glapi = Gdk_enums.glapi
type modifiertype = Gdk_enums.modifiertype
type paintableflags = Gdk_enums.paintableflags
type seatcapabilities = Gdk_enums.seatcapabilities
type toplevelstate = Gdk_enums.toplevelstate
