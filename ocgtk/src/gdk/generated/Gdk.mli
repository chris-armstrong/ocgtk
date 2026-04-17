(* GENERATED CODE - DO NOT EDIT *)
(* Top-level library module with direct references to all classes and enumerations *)

(** {1 Layer 1 Module Wrappers}

    This submodule provides aliases to the layer 1 (low-level) modules. These
    are the modules containing external declarations and basic bindings. *)
module Wrappers : sig
  module App_launch_context =
    App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context
    .App_launch_context

  module Button_event = Button_event

  module Cairo_context =
    App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context
    .Cairo_context

  module Clipboard =
    App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context
    .Clipboard

  module Content_deserializer = Content_deserializer
  module Content_formats = Content_formats
  module Content_formats_builder = Content_formats_builder
  module Content_provider = Content_provider
  module Content_serializer = Content_serializer
  module Crossing_event = Crossing_event
  module Cursor = Cursor
  module Dnd_event = Dnd_event
  module Delete_event = Delete_event

  module Device =
    App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context
    .Device

  module Device_pad = Device_pad
  module Device_tool = Device_tool

  module Display =
    App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context
    .Display

  module Display_manager = Display_manager
  module Dmabuf_formats = Dmabuf_formats
  module Dmabuf_texture = Dmabuf_texture
  module Dmabuf_texture_builder = Dmabuf_texture_builder
  module Drag = Drag
  module Drag_surface = Drag_surface
  module Drag_surface_size = Drag_surface_size

  module Draw_context =
    App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context
    .Draw_context

  module Drop = Drop

  module Event =
    App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context
    .Event

  module Event_sequence = Event_sequence
  module File_list = File_list
  module Focus_event = Focus_event
  module Frame_clock = Frame_clock
  module Frame_timings = Frame_timings

  module Gl_context =
    App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context
    .Gl_context

  module Gl_texture = Gl_texture
  module Gl_texture_builder = Gl_texture_builder
  module Grab_broken_event = Grab_broken_event
  module Key_event = Key_event
  module Keymap_key = Keymap_key
  module Memory_texture = Memory_texture

  module Monitor =
    App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context
    .Monitor

  module Motion_event = Motion_event
  module Pad_event = Pad_event
  module Paintable = Paintable
  module Popup = Popup
  module Popup_layout = Popup_layout
  module Proximity_event = Proximity_event
  module Rgb_a = Rgb_a
  module Rectangle = Rectangle
  module Scroll_event = Scroll_event

  module Seat =
    App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context
    .Seat

  module Snapshot = Snapshot

  module Surface =
    App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context
    .Surface

  module Texture = Texture
  module Texture_downloader = Texture_downloader
  module Time_coord = Time_coord
  module Toplevel = Toplevel
  module Toplevel_layout = Toplevel_layout
  module Toplevel_size = Toplevel_size
  module Touch_event = Touch_event
  module Touchpad_event = Touchpad_event

  module Vulkan_context =
    App_launch_context_and__cairo_context_and__clipboard_and__device_and__display_and__draw_context_and__event_and__gl_context_and__monitor_and__seat_and__surface_and__vulkan_context
    .Vulkan_context
end

(** {1 Classes and Interfaces} *)

module App_launch_context = GApp_launch_context
module Button_event = GButton_event
module Cairo_context = GCairo_context
module Clipboard = GClipboard
module Content_deserializer = GContent_deserializer
module Content_formats = GContent_formats
module Content_formats_builder = GContent_formats_builder
module Content_provider = GContent_provider
module Content_serializer = GContent_serializer
module Crossing_event = GCrossing_event
module Cursor = GCursor
module Dnd_event = GDnd_event
module Delete_event = GDelete_event
module Device = GDevice
module Device_pad = GDevice_pad
module Device_tool = GDevice_tool
module Display = GDisplay
module Display_manager = GDisplay_manager
module Dmabuf_formats = GDmabuf_formats
module Dmabuf_texture = GDmabuf_texture
module Dmabuf_texture_builder = GDmabuf_texture_builder
module Drag = GDrag
module Drag_surface = GDrag_surface
module Drag_surface_size = GDrag_surface_size
module Draw_context = GDraw_context
module Drop = GDrop
module Event = GEvent
module Event_sequence = GEvent_sequence
module File_list = GFile_list
module Focus_event = GFocus_event
module Frame_clock = GFrame_clock
module Frame_timings = GFrame_timings
module Gl_context = GGl_context
module Gl_texture = GGl_texture
module Gl_texture_builder = GGl_texture_builder
module Grab_broken_event = GGrab_broken_event
module Key_event = GKey_event
module Keymap_key = GKeymap_key
module Memory_texture = GMemory_texture
module Monitor = GMonitor
module Motion_event = GMotion_event
module Pad_event = GPad_event
module Paintable = GPaintable
module Popup = GPopup
module Popup_layout = GPopup_layout
module Proximity_event = GProximity_event
module Rgb_a = GRgb_a
module Rectangle = GRectangle
module Scroll_event = GScroll_event
module Seat = GSeat
module Snapshot = GSnapshot
module Surface = GSurface
module Texture = GTexture
module Texture_downloader = GTexture_downloader
module Time_coord = GTime_coord
module Toplevel = GToplevel
module Toplevel_layout = GToplevel_layout
module Toplevel_size = GToplevel_size
module Touch_event = GTouch_event
module Touchpad_event = GTouchpad_event
module Vulkan_context = GVulkan_context

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
