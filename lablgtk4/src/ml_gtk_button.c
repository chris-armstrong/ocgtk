/* GTK4 Button Widget C Bindings */

#include <gtk/gtk.h>
#include <caml/mlvalues.h>
#include <caml/memory.h>
#include <caml/alloc.h>
#include <caml/fail.h>
#include "wrappers.h"
#include "ml_gobject.h"

/* Button Constructors */

CAMLprim value ml_gtk_button_new(value unit)
{
    CAMLparam1(unit);
    GtkWidget *button = gtk_button_new();
    CAMLreturn(Val_GtkWidget(button));
}

CAMLprim value ml_gtk_button_new_with_label(value label)
{
    CAMLparam1(label);
    GtkWidget *button = gtk_button_new_with_label(String_val(label));
    CAMLreturn(Val_GtkWidget(button));
}

CAMLprim value ml_gtk_button_new_with_mnemonic(value label)
{
    CAMLparam1(label);
    GtkWidget *button = gtk_button_new_with_mnemonic(String_val(label));
    CAMLreturn(Val_GtkWidget(button));
}

CAMLprim value ml_gtk_button_new_from_icon_name(value icon_name)
{
    CAMLparam1(icon_name);
    GtkWidget *button = gtk_button_new_from_icon_name(String_val(icon_name));
    CAMLreturn(Val_GtkWidget(button));
}

/* Button Properties */

CAMLprim value ml_gtk_button_get_label(value button)
{
    CAMLparam1(button);
    const char *label = gtk_button_get_label(GTK_BUTTON(GtkWidget_val(button)));
    CAMLreturn(caml_copy_string(label ? label : ""));
}

CAMLprim value ml_gtk_button_set_label(value button, value label)
{
    CAMLparam2(button, label);
    gtk_button_set_label(GTK_BUTTON(GtkWidget_val(button)), String_val(label));
    CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_button_get_has_frame(value button)
{
    CAMLparam1(button);
    gboolean has_frame = gtk_button_get_has_frame(GTK_BUTTON(GtkWidget_val(button)));
    CAMLreturn(Val_bool(has_frame));
}

CAMLprim value ml_gtk_button_set_has_frame(value button, value has_frame)
{
    CAMLparam2(button, has_frame);
    gtk_button_set_has_frame(GTK_BUTTON(GtkWidget_val(button)), Bool_val(has_frame));
    CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_button_get_use_underline(value button)
{
    CAMLparam1(button);
    gboolean use_underline = gtk_button_get_use_underline(GTK_BUTTON(GtkWidget_val(button)));
    CAMLreturn(Val_bool(use_underline));
}

CAMLprim value ml_gtk_button_set_use_underline(value button, value use_underline)
{
    CAMLparam2(button, use_underline);
    gtk_button_set_use_underline(GTK_BUTTON(GtkWidget_val(button)), Bool_val(use_underline));
    CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_button_get_icon_name(value button)
{
    CAMLparam1(button);
    const char *icon_name = gtk_button_get_icon_name(GTK_BUTTON(GtkWidget_val(button)));
    CAMLreturn(caml_copy_string(icon_name ? icon_name : ""));
}

CAMLprim value ml_gtk_button_set_icon_name(value button, value icon_name)
{
    CAMLparam2(button, icon_name);
    gtk_button_set_icon_name(GTK_BUTTON(GtkWidget_val(button)), String_val(icon_name));
    CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_button_get_can_shrink(value button)
{
    CAMLparam1(button);
    gboolean can_shrink;
    g_object_get(G_OBJECT(GtkWidget_val(button)), "can-shrink", &can_shrink, NULL);
    CAMLreturn(Val_bool(can_shrink));
}

CAMLprim value ml_gtk_button_set_can_shrink(value button, value can_shrink)
{
    CAMLparam2(button, can_shrink);
    g_object_set(G_OBJECT(GtkWidget_val(button)), "can-shrink", Bool_val(can_shrink), NULL);
    CAMLreturn(Val_unit);
}

/* Child management */

CAMLprim value ml_gtk_button_get_child(value button)
{
    CAMLparam1(button);
    GtkWidget *child = gtk_button_get_child(GTK_BUTTON(GtkWidget_val(button)));
    CAMLreturn(Val_option(child, Val_GtkWidget));
}

CAMLprim value ml_gtk_button_set_child(value button, value child)
{
    CAMLparam2(button, child);
    GtkWidget *child_widget = Is_some(child) ? GtkWidget_val(Some_val(child)) : NULL;
    gtk_button_set_child(GTK_BUTTON(GtkWidget_val(button)), child_widget);
    CAMLreturn(Val_unit);
}

/* CheckButton */

CAMLprim value ml_gtk_check_button_new(value unit)
{
    CAMLparam1(unit);
    GtkWidget *button = gtk_check_button_new();
    CAMLreturn(Val_GtkWidget(button));
}

CAMLprim value ml_gtk_check_button_new_with_label(value label)
{
    CAMLparam1(label);
    GtkWidget *button = gtk_check_button_new_with_label(String_val(label));
    CAMLreturn(Val_GtkWidget(button));
}

CAMLprim value ml_gtk_check_button_new_with_mnemonic(value label)
{
    CAMLparam1(label);
    GtkWidget *button = gtk_check_button_new_with_mnemonic(String_val(label));
    CAMLreturn(Val_GtkWidget(button));
}

CAMLprim value ml_gtk_check_button_get_active(value button)
{
    CAMLparam1(button);
    gboolean active = gtk_check_button_get_active(GTK_CHECK_BUTTON(GtkWidget_val(button)));
    CAMLreturn(Val_bool(active));
}

CAMLprim value ml_gtk_check_button_set_active(value button, value active)
{
    CAMLparam2(button, active);
    gtk_check_button_set_active(GTK_CHECK_BUTTON(GtkWidget_val(button)), Bool_val(active));
    CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_check_button_get_label(value button)
{
    CAMLparam1(button);
    const char *label = gtk_check_button_get_label(GTK_CHECK_BUTTON(GtkWidget_val(button)));
    CAMLreturn(caml_copy_string(label ? label : ""));
}

CAMLprim value ml_gtk_check_button_set_label(value button, value label)
{
    CAMLparam2(button, label);
    gtk_check_button_set_label(GTK_CHECK_BUTTON(GtkWidget_val(button)), String_val(label));
    CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_check_button_get_use_underline(value button)
{
    CAMLparam1(button);
    gboolean use_underline = gtk_check_button_get_use_underline(GTK_CHECK_BUTTON(GtkWidget_val(button)));
    CAMLreturn(Val_bool(use_underline));
}

CAMLprim value ml_gtk_check_button_set_use_underline(value button, value use_underline)
{
    CAMLparam2(button, use_underline);
    gtk_check_button_set_use_underline(GTK_CHECK_BUTTON(GtkWidget_val(button)), Bool_val(use_underline));
    CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_check_button_get_inconsistent(value button)
{
    CAMLparam1(button);
    gboolean inconsistent = gtk_check_button_get_inconsistent(GTK_CHECK_BUTTON(GtkWidget_val(button)));
    CAMLreturn(Val_bool(inconsistent));
}

CAMLprim value ml_gtk_check_button_set_inconsistent(value button, value inconsistent)
{
    CAMLparam2(button, inconsistent);
    gtk_check_button_set_inconsistent(GTK_CHECK_BUTTON(GtkWidget_val(button)), Bool_val(inconsistent));
    CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_check_button_set_group(value button, value group)
{
    CAMLparam2(button, group);
    GtkCheckButton *group_button = Is_some(group) ?
        GTK_CHECK_BUTTON(GtkWidget_val(Some_val(group))) : NULL;
    gtk_check_button_set_group(GTK_CHECK_BUTTON(GtkWidget_val(button)), group_button);
    CAMLreturn(Val_unit);
}

/* ToggleButton */

CAMLprim value ml_gtk_toggle_button_new(value unit)
{
    CAMLparam1(unit);
    GtkWidget *button = gtk_toggle_button_new();
    CAMLreturn(Val_GtkWidget(button));
}

CAMLprim value ml_gtk_toggle_button_new_with_label(value label)
{
    CAMLparam1(label);
    GtkWidget *button = gtk_toggle_button_new_with_label(String_val(label));
    CAMLreturn(Val_GtkWidget(button));
}

CAMLprim value ml_gtk_toggle_button_new_with_mnemonic(value label)
{
    CAMLparam1(label);
    GtkWidget *button = gtk_toggle_button_new_with_mnemonic(String_val(label));
    CAMLreturn(Val_GtkWidget(button));
}

CAMLprim value ml_gtk_toggle_button_get_active(value button)
{
    CAMLparam1(button);
    gboolean active = gtk_toggle_button_get_active(GTK_TOGGLE_BUTTON(GtkWidget_val(button)));
    CAMLreturn(Val_bool(active));
}

CAMLprim value ml_gtk_toggle_button_set_active(value button, value active)
{
    CAMLparam2(button, active);
    gtk_toggle_button_set_active(GTK_TOGGLE_BUTTON(GtkWidget_val(button)), Bool_val(active));
    CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_toggle_button_toggled(value button)
{
    CAMLparam1(button);
    gtk_toggle_button_toggled(GTK_TOGGLE_BUTTON(GtkWidget_val(button)));
    CAMLreturn(Val_unit);
}
