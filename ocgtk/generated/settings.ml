class type settings_t = object
  inherit Style_provider.style_provider_t

  method reset_property : string -> unit
  (** Undoes the effect of calling g_object_set() to install an
      application-specific value for a setting.

      After this call, the setting will again follow the session-wide value for
      this setting. *)

  method gtk_alternative_button_order : bool
  method set_gtk_alternative_button_order : bool -> unit
  method gtk_alternative_sort_arrows : bool
  method set_gtk_alternative_sort_arrows : bool -> unit
  method gtk_application_prefer_dark_theme : bool
  method set_gtk_application_prefer_dark_theme : bool -> unit
  method gtk_cursor_aspect_ratio : float
  method set_gtk_cursor_aspect_ratio : float -> unit
  method gtk_cursor_blink : bool
  method set_gtk_cursor_blink : bool -> unit
  method gtk_cursor_blink_time : int
  method set_gtk_cursor_blink_time : int -> unit
  method gtk_cursor_blink_timeout : int
  method set_gtk_cursor_blink_timeout : int -> unit
  method gtk_cursor_theme_name : string
  method set_gtk_cursor_theme_name : string -> unit
  method gtk_cursor_theme_size : int
  method set_gtk_cursor_theme_size : int -> unit
  method gtk_decoration_layout : string
  method set_gtk_decoration_layout : string -> unit
  method gtk_dialogs_use_header : bool
  method set_gtk_dialogs_use_header : bool -> unit
  method gtk_dnd_drag_threshold : int
  method set_gtk_dnd_drag_threshold : int -> unit
  method gtk_double_click_distance : int
  method set_gtk_double_click_distance : int -> unit
  method gtk_double_click_time : int
  method set_gtk_double_click_time : int -> unit
  method gtk_enable_accels : bool
  method set_gtk_enable_accels : bool -> unit
  method gtk_enable_animations : bool
  method set_gtk_enable_animations : bool -> unit
  method gtk_enable_event_sounds : bool
  method set_gtk_enable_event_sounds : bool -> unit
  method gtk_enable_input_feedback_sounds : bool
  method set_gtk_enable_input_feedback_sounds : bool -> unit
  method gtk_enable_primary_paste : bool
  method set_gtk_enable_primary_paste : bool -> unit
  method gtk_entry_password_hint_timeout : int
  method set_gtk_entry_password_hint_timeout : int -> unit
  method gtk_entry_select_on_focus : bool
  method set_gtk_entry_select_on_focus : bool -> unit
  method gtk_error_bell : bool
  method set_gtk_error_bell : bool -> unit
  method gtk_font_name : string
  method set_gtk_font_name : string -> unit
  method gtk_font_rendering : Enums.fontrendering
  method set_gtk_font_rendering : Enums.fontrendering -> unit
  method gtk_fontconfig_timestamp : int
  method set_gtk_fontconfig_timestamp : int -> unit
  method gtk_hint_font_metrics : bool
  method set_gtk_hint_font_metrics : bool -> unit
  method gtk_icon_theme_name : string
  method set_gtk_icon_theme_name : string -> unit
  method gtk_im_module : string
  method set_gtk_im_module : string -> unit
  method gtk_interface_color_scheme : Enums.interfacecolorscheme
  method set_gtk_interface_color_scheme : Enums.interfacecolorscheme -> unit
  method gtk_interface_contrast : Enums.interfacecontrast
  method set_gtk_interface_contrast : Enums.interfacecontrast -> unit
  method gtk_keynav_use_caret : bool
  method set_gtk_keynav_use_caret : bool -> unit
  method gtk_label_select_on_focus : bool
  method set_gtk_label_select_on_focus : bool -> unit
  method gtk_long_press_time : int
  method set_gtk_long_press_time : int -> unit
  method gtk_overlay_scrolling : bool
  method set_gtk_overlay_scrolling : bool -> unit
  method gtk_primary_button_warps_slider : bool
  method set_gtk_primary_button_warps_slider : bool -> unit
  method gtk_print_backends : string
  method set_gtk_print_backends : string -> unit
  method gtk_print_preview_command : string
  method set_gtk_print_preview_command : string -> unit
  method gtk_recent_files_enabled : bool
  method set_gtk_recent_files_enabled : bool -> unit
  method gtk_recent_files_max_age : int
  method set_gtk_recent_files_max_age : int -> unit
  method gtk_shell_shows_app_menu : bool
  method set_gtk_shell_shows_app_menu : bool -> unit
  method gtk_shell_shows_desktop : bool
  method set_gtk_shell_shows_desktop : bool -> unit
  method gtk_shell_shows_menubar : bool
  method set_gtk_shell_shows_menubar : bool -> unit
  method gtk_show_status_shapes : bool
  method set_gtk_show_status_shapes : bool -> unit
  method gtk_sound_theme_name : string
  method set_gtk_sound_theme_name : string -> unit
  method gtk_split_cursor : bool
  method set_gtk_split_cursor : bool -> unit
  method gtk_theme_name : string
  method set_gtk_theme_name : string -> unit
  method gtk_titlebar_double_click : string
  method set_gtk_titlebar_double_click : string -> unit
  method gtk_titlebar_middle_click : string
  method set_gtk_titlebar_middle_click : string -> unit
  method gtk_titlebar_right_click : string
  method set_gtk_titlebar_right_click : string -> unit
  method gtk_xft_antialias : int
  method set_gtk_xft_antialias : int -> unit
  method gtk_xft_dpi : int
  method set_gtk_xft_dpi : int -> unit
  method gtk_xft_hinting : int
  method set_gtk_xft_hinting : int -> unit
  method gtk_xft_hintstyle : string
  method set_gtk_xft_hintstyle : string -> unit
  method gtk_xft_rgba : string
  method set_gtk_xft_rgba : string -> unit
  method as_settings : Raw.Settings.t
end

(* High-level class for Settings *)
class settings (obj : Raw.Settings.t) : settings_t =
  object (self)
    inherit Style_provider.style_provider (Raw.Style_provider.from_gobject obj)

    method reset_property : string -> unit =
      fun name -> Raw.Settings.reset_property obj name

    method gtk_alternative_button_order =
      Raw.Settings.get_gtk_alternative_button_order obj

    method set_gtk_alternative_button_order v =
      Raw.Settings.set_gtk_alternative_button_order obj v

    method gtk_alternative_sort_arrows =
      Raw.Settings.get_gtk_alternative_sort_arrows obj

    method set_gtk_alternative_sort_arrows v =
      Raw.Settings.set_gtk_alternative_sort_arrows obj v

    method gtk_application_prefer_dark_theme =
      Raw.Settings.get_gtk_application_prefer_dark_theme obj

    method set_gtk_application_prefer_dark_theme v =
      Raw.Settings.set_gtk_application_prefer_dark_theme obj v

    method gtk_cursor_aspect_ratio =
      Raw.Settings.get_gtk_cursor_aspect_ratio obj

    method set_gtk_cursor_aspect_ratio v =
      Raw.Settings.set_gtk_cursor_aspect_ratio obj v

    method gtk_cursor_blink = Raw.Settings.get_gtk_cursor_blink obj
    method set_gtk_cursor_blink v = Raw.Settings.set_gtk_cursor_blink obj v
    method gtk_cursor_blink_time = Raw.Settings.get_gtk_cursor_blink_time obj

    method set_gtk_cursor_blink_time v =
      Raw.Settings.set_gtk_cursor_blink_time obj v

    method gtk_cursor_blink_timeout =
      Raw.Settings.get_gtk_cursor_blink_timeout obj

    method set_gtk_cursor_blink_timeout v =
      Raw.Settings.set_gtk_cursor_blink_timeout obj v

    method gtk_cursor_theme_name = Raw.Settings.get_gtk_cursor_theme_name obj

    method set_gtk_cursor_theme_name v =
      Raw.Settings.set_gtk_cursor_theme_name obj v

    method gtk_cursor_theme_size = Raw.Settings.get_gtk_cursor_theme_size obj

    method set_gtk_cursor_theme_size v =
      Raw.Settings.set_gtk_cursor_theme_size obj v

    method gtk_decoration_layout = Raw.Settings.get_gtk_decoration_layout obj

    method set_gtk_decoration_layout v =
      Raw.Settings.set_gtk_decoration_layout obj v

    method gtk_dialogs_use_header = Raw.Settings.get_gtk_dialogs_use_header obj

    method set_gtk_dialogs_use_header v =
      Raw.Settings.set_gtk_dialogs_use_header obj v

    method gtk_dnd_drag_threshold = Raw.Settings.get_gtk_dnd_drag_threshold obj

    method set_gtk_dnd_drag_threshold v =
      Raw.Settings.set_gtk_dnd_drag_threshold obj v

    method gtk_double_click_distance =
      Raw.Settings.get_gtk_double_click_distance obj

    method set_gtk_double_click_distance v =
      Raw.Settings.set_gtk_double_click_distance obj v

    method gtk_double_click_time = Raw.Settings.get_gtk_double_click_time obj

    method set_gtk_double_click_time v =
      Raw.Settings.set_gtk_double_click_time obj v

    method gtk_enable_accels = Raw.Settings.get_gtk_enable_accels obj
    method set_gtk_enable_accels v = Raw.Settings.set_gtk_enable_accels obj v
    method gtk_enable_animations = Raw.Settings.get_gtk_enable_animations obj

    method set_gtk_enable_animations v =
      Raw.Settings.set_gtk_enable_animations obj v

    method gtk_enable_event_sounds =
      Raw.Settings.get_gtk_enable_event_sounds obj

    method set_gtk_enable_event_sounds v =
      Raw.Settings.set_gtk_enable_event_sounds obj v

    method gtk_enable_input_feedback_sounds =
      Raw.Settings.get_gtk_enable_input_feedback_sounds obj

    method set_gtk_enable_input_feedback_sounds v =
      Raw.Settings.set_gtk_enable_input_feedback_sounds obj v

    method gtk_enable_primary_paste =
      Raw.Settings.get_gtk_enable_primary_paste obj

    method set_gtk_enable_primary_paste v =
      Raw.Settings.set_gtk_enable_primary_paste obj v

    method gtk_entry_password_hint_timeout =
      Raw.Settings.get_gtk_entry_password_hint_timeout obj

    method set_gtk_entry_password_hint_timeout v =
      Raw.Settings.set_gtk_entry_password_hint_timeout obj v

    method gtk_entry_select_on_focus =
      Raw.Settings.get_gtk_entry_select_on_focus obj

    method set_gtk_entry_select_on_focus v =
      Raw.Settings.set_gtk_entry_select_on_focus obj v

    method gtk_error_bell = Raw.Settings.get_gtk_error_bell obj
    method set_gtk_error_bell v = Raw.Settings.set_gtk_error_bell obj v
    method gtk_font_name = Raw.Settings.get_gtk_font_name obj
    method set_gtk_font_name v = Raw.Settings.set_gtk_font_name obj v
    method gtk_font_rendering = Raw.Settings.get_gtk_font_rendering obj
    method set_gtk_font_rendering v = Raw.Settings.set_gtk_font_rendering obj v

    method gtk_fontconfig_timestamp =
      Raw.Settings.get_gtk_fontconfig_timestamp obj

    method set_gtk_fontconfig_timestamp v =
      Raw.Settings.set_gtk_fontconfig_timestamp obj v

    method gtk_hint_font_metrics = Raw.Settings.get_gtk_hint_font_metrics obj

    method set_gtk_hint_font_metrics v =
      Raw.Settings.set_gtk_hint_font_metrics obj v

    method gtk_icon_theme_name = Raw.Settings.get_gtk_icon_theme_name obj

    method set_gtk_icon_theme_name v =
      Raw.Settings.set_gtk_icon_theme_name obj v

    method gtk_im_module = Raw.Settings.get_gtk_im_module obj
    method set_gtk_im_module v = Raw.Settings.set_gtk_im_module obj v

    method gtk_interface_color_scheme =
      Raw.Settings.get_gtk_interface_color_scheme obj

    method set_gtk_interface_color_scheme v =
      Raw.Settings.set_gtk_interface_color_scheme obj v

    method gtk_interface_contrast = Raw.Settings.get_gtk_interface_contrast obj

    method set_gtk_interface_contrast v =
      Raw.Settings.set_gtk_interface_contrast obj v

    method gtk_keynav_use_caret = Raw.Settings.get_gtk_keynav_use_caret obj

    method set_gtk_keynav_use_caret v =
      Raw.Settings.set_gtk_keynav_use_caret obj v

    method gtk_label_select_on_focus =
      Raw.Settings.get_gtk_label_select_on_focus obj

    method set_gtk_label_select_on_focus v =
      Raw.Settings.set_gtk_label_select_on_focus obj v

    method gtk_long_press_time = Raw.Settings.get_gtk_long_press_time obj

    method set_gtk_long_press_time v =
      Raw.Settings.set_gtk_long_press_time obj v

    method gtk_overlay_scrolling = Raw.Settings.get_gtk_overlay_scrolling obj

    method set_gtk_overlay_scrolling v =
      Raw.Settings.set_gtk_overlay_scrolling obj v

    method gtk_primary_button_warps_slider =
      Raw.Settings.get_gtk_primary_button_warps_slider obj

    method set_gtk_primary_button_warps_slider v =
      Raw.Settings.set_gtk_primary_button_warps_slider obj v

    method gtk_print_backends = Raw.Settings.get_gtk_print_backends obj
    method set_gtk_print_backends v = Raw.Settings.set_gtk_print_backends obj v

    method gtk_print_preview_command =
      Raw.Settings.get_gtk_print_preview_command obj

    method set_gtk_print_preview_command v =
      Raw.Settings.set_gtk_print_preview_command obj v

    method gtk_recent_files_enabled =
      Raw.Settings.get_gtk_recent_files_enabled obj

    method set_gtk_recent_files_enabled v =
      Raw.Settings.set_gtk_recent_files_enabled obj v

    method gtk_recent_files_max_age =
      Raw.Settings.get_gtk_recent_files_max_age obj

    method set_gtk_recent_files_max_age v =
      Raw.Settings.set_gtk_recent_files_max_age obj v

    method gtk_shell_shows_app_menu =
      Raw.Settings.get_gtk_shell_shows_app_menu obj

    method set_gtk_shell_shows_app_menu v =
      Raw.Settings.set_gtk_shell_shows_app_menu obj v

    method gtk_shell_shows_desktop =
      Raw.Settings.get_gtk_shell_shows_desktop obj

    method set_gtk_shell_shows_desktop v =
      Raw.Settings.set_gtk_shell_shows_desktop obj v

    method gtk_shell_shows_menubar =
      Raw.Settings.get_gtk_shell_shows_menubar obj

    method set_gtk_shell_shows_menubar v =
      Raw.Settings.set_gtk_shell_shows_menubar obj v

    method gtk_show_status_shapes = Raw.Settings.get_gtk_show_status_shapes obj

    method set_gtk_show_status_shapes v =
      Raw.Settings.set_gtk_show_status_shapes obj v

    method gtk_sound_theme_name = Raw.Settings.get_gtk_sound_theme_name obj

    method set_gtk_sound_theme_name v =
      Raw.Settings.set_gtk_sound_theme_name obj v

    method gtk_split_cursor = Raw.Settings.get_gtk_split_cursor obj
    method set_gtk_split_cursor v = Raw.Settings.set_gtk_split_cursor obj v
    method gtk_theme_name = Raw.Settings.get_gtk_theme_name obj
    method set_gtk_theme_name v = Raw.Settings.set_gtk_theme_name obj v

    method gtk_titlebar_double_click =
      Raw.Settings.get_gtk_titlebar_double_click obj

    method set_gtk_titlebar_double_click v =
      Raw.Settings.set_gtk_titlebar_double_click obj v

    method gtk_titlebar_middle_click =
      Raw.Settings.get_gtk_titlebar_middle_click obj

    method set_gtk_titlebar_middle_click v =
      Raw.Settings.set_gtk_titlebar_middle_click obj v

    method gtk_titlebar_right_click =
      Raw.Settings.get_gtk_titlebar_right_click obj

    method set_gtk_titlebar_right_click v =
      Raw.Settings.set_gtk_titlebar_right_click obj v

    method gtk_xft_antialias = Raw.Settings.get_gtk_xft_antialias obj
    method set_gtk_xft_antialias v = Raw.Settings.set_gtk_xft_antialias obj v
    method gtk_xft_dpi = Raw.Settings.get_gtk_xft_dpi obj
    method set_gtk_xft_dpi v = Raw.Settings.set_gtk_xft_dpi obj v
    method gtk_xft_hinting = Raw.Settings.get_gtk_xft_hinting obj
    method set_gtk_xft_hinting v = Raw.Settings.set_gtk_xft_hinting obj v
    method gtk_xft_hintstyle = Raw.Settings.get_gtk_xft_hintstyle obj
    method set_gtk_xft_hintstyle v = Raw.Settings.set_gtk_xft_hintstyle obj v
    method gtk_xft_rgba = Raw.Settings.get_gtk_xft_rgba obj
    method set_gtk_xft_rgba v = Raw.Settings.set_gtk_xft_rgba obj v
    method as_settings = obj
  end
