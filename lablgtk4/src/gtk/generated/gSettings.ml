(* High-level class for Settings *)
class settings (obj : Settings.t) = object (self)

  method gtk_alternative_button_order = Settings.get_gtk_alternative_button_order obj
  method set_gtk_alternative_button_order v = Settings.set_gtk_alternative_button_order obj v

  method gtk_alternative_sort_arrows = Settings.get_gtk_alternative_sort_arrows obj
  method set_gtk_alternative_sort_arrows v = Settings.set_gtk_alternative_sort_arrows obj v

  method gtk_application_prefer_dark_theme = Settings.get_gtk_application_prefer_dark_theme obj
  method set_gtk_application_prefer_dark_theme v = Settings.set_gtk_application_prefer_dark_theme obj v

  method gtk_cursor_aspect_ratio = Settings.get_gtk_cursor_aspect_ratio obj
  method set_gtk_cursor_aspect_ratio v = Settings.set_gtk_cursor_aspect_ratio obj v

  method gtk_cursor_blink = Settings.get_gtk_cursor_blink obj
  method set_gtk_cursor_blink v = Settings.set_gtk_cursor_blink obj v

  method gtk_cursor_blink_time = Settings.get_gtk_cursor_blink_time obj
  method set_gtk_cursor_blink_time v = Settings.set_gtk_cursor_blink_time obj v

  method gtk_cursor_blink_timeout = Settings.get_gtk_cursor_blink_timeout obj
  method set_gtk_cursor_blink_timeout v = Settings.set_gtk_cursor_blink_timeout obj v

  method gtk_cursor_theme_name = Settings.get_gtk_cursor_theme_name obj
  method set_gtk_cursor_theme_name v = Settings.set_gtk_cursor_theme_name obj v

  method gtk_cursor_theme_size = Settings.get_gtk_cursor_theme_size obj
  method set_gtk_cursor_theme_size v = Settings.set_gtk_cursor_theme_size obj v

  method gtk_decoration_layout = Settings.get_gtk_decoration_layout obj
  method set_gtk_decoration_layout v = Settings.set_gtk_decoration_layout obj v

  method gtk_dialogs_use_header = Settings.get_gtk_dialogs_use_header obj
  method set_gtk_dialogs_use_header v = Settings.set_gtk_dialogs_use_header obj v

  method gtk_dnd_drag_threshold = Settings.get_gtk_dnd_drag_threshold obj
  method set_gtk_dnd_drag_threshold v = Settings.set_gtk_dnd_drag_threshold obj v

  method gtk_double_click_distance = Settings.get_gtk_double_click_distance obj
  method set_gtk_double_click_distance v = Settings.set_gtk_double_click_distance obj v

  method gtk_double_click_time = Settings.get_gtk_double_click_time obj
  method set_gtk_double_click_time v = Settings.set_gtk_double_click_time obj v

  method gtk_enable_accels = Settings.get_gtk_enable_accels obj
  method set_gtk_enable_accels v = Settings.set_gtk_enable_accels obj v

  method gtk_enable_animations = Settings.get_gtk_enable_animations obj
  method set_gtk_enable_animations v = Settings.set_gtk_enable_animations obj v

  method gtk_enable_event_sounds = Settings.get_gtk_enable_event_sounds obj
  method set_gtk_enable_event_sounds v = Settings.set_gtk_enable_event_sounds obj v

  method gtk_enable_input_feedback_sounds = Settings.get_gtk_enable_input_feedback_sounds obj
  method set_gtk_enable_input_feedback_sounds v = Settings.set_gtk_enable_input_feedback_sounds obj v

  method gtk_enable_primary_paste = Settings.get_gtk_enable_primary_paste obj
  method set_gtk_enable_primary_paste v = Settings.set_gtk_enable_primary_paste obj v

  method gtk_entry_password_hint_timeout = Settings.get_gtk_entry_password_hint_timeout obj
  method set_gtk_entry_password_hint_timeout v = Settings.set_gtk_entry_password_hint_timeout obj v

  method gtk_entry_select_on_focus = Settings.get_gtk_entry_select_on_focus obj
  method set_gtk_entry_select_on_focus v = Settings.set_gtk_entry_select_on_focus obj v

  method gtk_error_bell = Settings.get_gtk_error_bell obj
  method set_gtk_error_bell v = Settings.set_gtk_error_bell obj v

  method gtk_font_name = Settings.get_gtk_font_name obj
  method set_gtk_font_name v = Settings.set_gtk_font_name obj v

  method gtk_fontconfig_timestamp = Settings.get_gtk_fontconfig_timestamp obj
  method set_gtk_fontconfig_timestamp v = Settings.set_gtk_fontconfig_timestamp obj v

  method gtk_hint_font_metrics = Settings.get_gtk_hint_font_metrics obj
  method set_gtk_hint_font_metrics v = Settings.set_gtk_hint_font_metrics obj v

  method gtk_icon_theme_name = Settings.get_gtk_icon_theme_name obj
  method set_gtk_icon_theme_name v = Settings.set_gtk_icon_theme_name obj v

  method gtk_im_module = Settings.get_gtk_im_module obj
  method set_gtk_im_module v = Settings.set_gtk_im_module obj v

  method gtk_keynav_use_caret = Settings.get_gtk_keynav_use_caret obj
  method set_gtk_keynav_use_caret v = Settings.set_gtk_keynav_use_caret obj v

  method gtk_label_select_on_focus = Settings.get_gtk_label_select_on_focus obj
  method set_gtk_label_select_on_focus v = Settings.set_gtk_label_select_on_focus obj v

  method gtk_long_press_time = Settings.get_gtk_long_press_time obj
  method set_gtk_long_press_time v = Settings.set_gtk_long_press_time obj v

  method gtk_overlay_scrolling = Settings.get_gtk_overlay_scrolling obj
  method set_gtk_overlay_scrolling v = Settings.set_gtk_overlay_scrolling obj v

  method gtk_primary_button_warps_slider = Settings.get_gtk_primary_button_warps_slider obj
  method set_gtk_primary_button_warps_slider v = Settings.set_gtk_primary_button_warps_slider obj v

  method gtk_print_backends = Settings.get_gtk_print_backends obj
  method set_gtk_print_backends v = Settings.set_gtk_print_backends obj v

  method gtk_print_preview_command = Settings.get_gtk_print_preview_command obj
  method set_gtk_print_preview_command v = Settings.set_gtk_print_preview_command obj v

  method gtk_recent_files_enabled = Settings.get_gtk_recent_files_enabled obj
  method set_gtk_recent_files_enabled v = Settings.set_gtk_recent_files_enabled obj v

  method gtk_recent_files_max_age = Settings.get_gtk_recent_files_max_age obj
  method set_gtk_recent_files_max_age v = Settings.set_gtk_recent_files_max_age obj v

  method gtk_shell_shows_app_menu = Settings.get_gtk_shell_shows_app_menu obj
  method set_gtk_shell_shows_app_menu v = Settings.set_gtk_shell_shows_app_menu obj v

  method gtk_shell_shows_desktop = Settings.get_gtk_shell_shows_desktop obj
  method set_gtk_shell_shows_desktop v = Settings.set_gtk_shell_shows_desktop obj v

  method gtk_shell_shows_menubar = Settings.get_gtk_shell_shows_menubar obj
  method set_gtk_shell_shows_menubar v = Settings.set_gtk_shell_shows_menubar obj v

  method gtk_show_status_shapes = Settings.get_gtk_show_status_shapes obj
  method set_gtk_show_status_shapes v = Settings.set_gtk_show_status_shapes obj v

  method gtk_sound_theme_name = Settings.get_gtk_sound_theme_name obj
  method set_gtk_sound_theme_name v = Settings.set_gtk_sound_theme_name obj v

  method gtk_split_cursor = Settings.get_gtk_split_cursor obj
  method set_gtk_split_cursor v = Settings.set_gtk_split_cursor obj v

  method gtk_theme_name = Settings.get_gtk_theme_name obj
  method set_gtk_theme_name v = Settings.set_gtk_theme_name obj v

  method gtk_titlebar_double_click = Settings.get_gtk_titlebar_double_click obj
  method set_gtk_titlebar_double_click v = Settings.set_gtk_titlebar_double_click obj v

  method gtk_titlebar_middle_click = Settings.get_gtk_titlebar_middle_click obj
  method set_gtk_titlebar_middle_click v = Settings.set_gtk_titlebar_middle_click obj v

  method gtk_titlebar_right_click = Settings.get_gtk_titlebar_right_click obj
  method set_gtk_titlebar_right_click v = Settings.set_gtk_titlebar_right_click obj v

  method gtk_xft_antialias = Settings.get_gtk_xft_antialias obj
  method set_gtk_xft_antialias v = Settings.set_gtk_xft_antialias obj v

  method gtk_xft_dpi = Settings.get_gtk_xft_dpi obj
  method set_gtk_xft_dpi v = Settings.set_gtk_xft_dpi obj v

  method gtk_xft_hinting = Settings.get_gtk_xft_hinting obj
  method set_gtk_xft_hinting v = Settings.set_gtk_xft_hinting obj v

  method gtk_xft_hintstyle = Settings.get_gtk_xft_hintstyle obj
  method set_gtk_xft_hintstyle v = Settings.set_gtk_xft_hintstyle obj v

  method gtk_xft_rgba = Settings.get_gtk_xft_rgba obj
  method set_gtk_xft_rgba v = Settings.set_gtk_xft_rgba obj v

  method reset_property : string -> unit = fun name -> (Settings.reset_property obj name)

    method as_settings = obj
end

