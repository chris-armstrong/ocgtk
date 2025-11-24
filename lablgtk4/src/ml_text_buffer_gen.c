/* GENERATED CODE - DO NOT EDIT */
/* C bindings for TextBuffer */

#include <gtk/gtk.h>
#include <caml/mlvalues.h>
#include <caml/memory.h>
#include <caml/alloc.h>
#include <caml/callback.h>
#include <caml/fail.h>
#include "wrappers.h"
#include "ml_gobject.h"

/* Include common type conversions and forward declarations */
#include "generated_forward_decls.h"

/* Type-specific conversion macros for GtkTextBuffer */
#define GtkTextBuffer_val(val) ((GtkTextBuffer*)ext_of_val(val))
#define Val_GtkTextBuffer(obj) ((value)(val_of_ext(obj)))


CAMLexport CAMLprim value ml_gtk_text_buffer_new(value arg1)
{
CAMLparam1(arg1);
GtkTextBuffer *obj = gtk_text_buffer_new((Is_some(arg1) ? GtkWidget_val(Some_val(arg1)) : NULL));
CAMLreturn(Val_GtkTextBuffer(obj));
}

CAMLexport CAMLprim value ml_gtk_text_buffer_undo(value self)
{
CAMLparam1(self);


    gtk_text_buffer_undo(GtkTextBuffer_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_text_buffer_set_modified(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_text_buffer_set_modified(GtkTextBuffer_val(self), Bool_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_text_buffer_set_max_undo_levels(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_text_buffer_set_max_undo_levels(GtkTextBuffer_val(self), Int_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_text_buffer_redo(value self)
{
CAMLparam1(self);


    gtk_text_buffer_redo(GtkTextBuffer_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_text_buffer_insert_markup(value self, value arg1, value arg2, value arg3)
{
CAMLparam4(self, arg1, arg2, arg3);


    gtk_text_buffer_insert_markup(GtkTextBuffer_val(self), GtkWidget_val(arg1), String_val(arg2), Int_val(arg3));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_text_buffer_insert_interactive_at_cursor(value self, value arg1, value arg2, value arg3)
{
CAMLparam4(self, arg1, arg2, arg3);


    gboolean result = gtk_text_buffer_insert_interactive_at_cursor(GtkTextBuffer_val(self), String_val(arg1), Int_val(arg2), Bool_val(arg3));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_text_buffer_insert_interactive(value self, value arg1, value arg2, value arg3, value arg4)
{
CAMLparam5(self, arg1, arg2, arg3, arg4);


    gboolean result = gtk_text_buffer_insert_interactive(GtkTextBuffer_val(self), GtkWidget_val(arg1), String_val(arg2), Int_val(arg3), Bool_val(arg4));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_text_buffer_insert_child_anchor(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    gtk_text_buffer_insert_child_anchor(GtkTextBuffer_val(self), GtkWidget_val(arg1), GtkWidget_val(arg2));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_text_buffer_insert_at_cursor(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    gtk_text_buffer_insert_at_cursor(GtkTextBuffer_val(self), String_val(arg1), Int_val(arg2));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_text_buffer_insert(value self, value arg1, value arg2, value arg3)
{
CAMLparam4(self, arg1, arg2, arg3);


    gtk_text_buffer_insert(GtkTextBuffer_val(self), GtkWidget_val(arg1), String_val(arg2), Int_val(arg3));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_text_buffer_get_tag_table(value self)
{
CAMLparam1(self);


    GtkTextTagTable* result = gtk_text_buffer_get_tag_table(GtkTextBuffer_val(self));
CAMLreturn(Val_GtkWidget(result));
}

CAMLexport CAMLprim value ml_gtk_text_buffer_get_start_iter(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_text_buffer_get_start_iter(GtkTextBuffer_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_text_buffer_get_selection_bounds(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    gboolean result = gtk_text_buffer_get_selection_bounds(GtkTextBuffer_val(self), GtkWidget_val(arg1), GtkWidget_val(arg2));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_text_buffer_get_selection_bound(value self)
{
CAMLparam1(self);


    GtkTextMark* result = gtk_text_buffer_get_selection_bound(GtkTextBuffer_val(self));
CAMLreturn(Val_GtkWidget(result));
}

CAMLexport CAMLprim value ml_gtk_text_buffer_get_modified(value self)
{
CAMLparam1(self);


    gboolean result = gtk_text_buffer_get_modified(GtkTextBuffer_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_text_buffer_get_max_undo_levels(value self)
{
CAMLparam1(self);


    guint result = gtk_text_buffer_get_max_undo_levels(GtkTextBuffer_val(self));
CAMLreturn(Val_int(result));
}

CAMLexport CAMLprim value ml_gtk_text_buffer_get_mark(value self, value arg1)
{
CAMLparam2(self, arg1);


    GtkTextMark* result = gtk_text_buffer_get_mark(GtkTextBuffer_val(self), String_val(arg1));
CAMLreturn(Val_GtkWidget(result));
}

CAMLexport CAMLprim value ml_gtk_text_buffer_get_line_count(value self)
{
CAMLparam1(self);


    int result = gtk_text_buffer_get_line_count(GtkTextBuffer_val(self));
CAMLreturn(Val_int(result));
}

CAMLexport CAMLprim value ml_gtk_text_buffer_get_iter_at_offset(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    gtk_text_buffer_get_iter_at_offset(GtkTextBuffer_val(self), GtkWidget_val(arg1), Int_val(arg2));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_text_buffer_get_iter_at_mark(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    gtk_text_buffer_get_iter_at_mark(GtkTextBuffer_val(self), GtkWidget_val(arg1), GtkWidget_val(arg2));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_text_buffer_get_iter_at_line_offset(value self, value arg1, value arg2, value arg3)
{
CAMLparam4(self, arg1, arg2, arg3);


    gboolean result = gtk_text_buffer_get_iter_at_line_offset(GtkTextBuffer_val(self), GtkWidget_val(arg1), Int_val(arg2), Int_val(arg3));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_text_buffer_get_iter_at_line_index(value self, value arg1, value arg2, value arg3)
{
CAMLparam4(self, arg1, arg2, arg3);


    gboolean result = gtk_text_buffer_get_iter_at_line_index(GtkTextBuffer_val(self), GtkWidget_val(arg1), Int_val(arg2), Int_val(arg3));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_text_buffer_get_iter_at_line(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    gboolean result = gtk_text_buffer_get_iter_at_line(GtkTextBuffer_val(self), GtkWidget_val(arg1), Int_val(arg2));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_text_buffer_get_iter_at_child_anchor(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    gtk_text_buffer_get_iter_at_child_anchor(GtkTextBuffer_val(self), GtkWidget_val(arg1), GtkWidget_val(arg2));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_text_buffer_get_insert(value self)
{
CAMLparam1(self);


    GtkTextMark* result = gtk_text_buffer_get_insert(GtkTextBuffer_val(self));
CAMLreturn(Val_GtkWidget(result));
}

CAMLexport CAMLprim value ml_gtk_text_buffer_get_end_iter(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_text_buffer_get_end_iter(GtkTextBuffer_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_text_buffer_get_char_count(value self)
{
CAMLparam1(self);


    int result = gtk_text_buffer_get_char_count(GtkTextBuffer_val(self));
CAMLreturn(Val_int(result));
}

CAMLexport CAMLprim value ml_gtk_text_buffer_get_bounds(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    gtk_text_buffer_get_bounds(GtkTextBuffer_val(self), GtkWidget_val(arg1), GtkWidget_val(arg2));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_text_buffer_end_user_action(value self)
{
CAMLparam1(self);


    gtk_text_buffer_end_user_action(GtkTextBuffer_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_text_buffer_end_irreversible_action(value self)
{
CAMLparam1(self);


    gtk_text_buffer_end_irreversible_action(GtkTextBuffer_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_text_buffer_delete_selection(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    gboolean result = gtk_text_buffer_delete_selection(GtkTextBuffer_val(self), Bool_val(arg1), Bool_val(arg2));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_text_buffer_delete_mark_by_name(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_text_buffer_delete_mark_by_name(GtkTextBuffer_val(self), String_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_text_buffer_delete_mark(value self, value arg1)
{
CAMLparam2(self, arg1);


    gtk_text_buffer_delete_mark(GtkTextBuffer_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_text_buffer_delete_interactive(value self, value arg1, value arg2, value arg3)
{
CAMLparam4(self, arg1, arg2, arg3);


    gboolean result = gtk_text_buffer_delete_interactive(GtkTextBuffer_val(self), GtkWidget_val(arg1), GtkWidget_val(arg2), Bool_val(arg3));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_text_buffer_delete(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);


    gtk_text_buffer_delete(GtkTextBuffer_val(self), GtkWidget_val(arg1), GtkWidget_val(arg2));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_text_buffer_create_child_anchor(value self, value arg1)
{
CAMLparam2(self, arg1);


    GtkTextChildAnchor* result = gtk_text_buffer_create_child_anchor(GtkTextBuffer_val(self), GtkWidget_val(arg1));
CAMLreturn(Val_GtkWidget(result));
}

CAMLexport CAMLprim value ml_gtk_text_buffer_begin_user_action(value self)
{
CAMLparam1(self);


    gtk_text_buffer_begin_user_action(GtkTextBuffer_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_text_buffer_begin_irreversible_action(value self)
{
CAMLparam1(self);


    gtk_text_buffer_begin_irreversible_action(GtkTextBuffer_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_text_buffer_backspace(value self, value arg1, value arg2, value arg3)
{
CAMLparam4(self, arg1, arg2, arg3);


    gboolean result = gtk_text_buffer_backspace(GtkTextBuffer_val(self), GtkWidget_val(arg1), Bool_val(arg2), Bool_val(arg3));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gtk_text_buffer_get_can_redo(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkTextBuffer *obj = (GtkTextBuffer *)GtkTextBuffer_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "can-redo", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_text_buffer_get_can_undo(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkTextBuffer *obj = (GtkTextBuffer *)GtkTextBuffer_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "can-undo", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_text_buffer_get_cursor_position(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkTextBuffer *obj = (GtkTextBuffer *)GtkTextBuffer_val(self);
gint prop_value;
g_object_get(G_OBJECT(obj), "cursor-position", &prop_value, NULL);
result = Val_int(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_text_buffer_get_enable_undo(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkTextBuffer *obj = (GtkTextBuffer *)GtkTextBuffer_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "enable-undo", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_text_buffer_set_enable_undo(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkTextBuffer *obj = (GtkTextBuffer *)GtkTextBuffer_val(self);
gboolean c_value = Bool_val(new_value);
g_object_set(G_OBJECT(obj), "enable-undo", c_value, NULL);
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_text_buffer_get_has_selection(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkTextBuffer *obj = (GtkTextBuffer *)GtkTextBuffer_val(self);
gboolean prop_value;
g_object_get(G_OBJECT(obj), "has-selection", &prop_value, NULL);
result = Val_bool(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_text_buffer_get_text(value self)
{
CAMLparam1(self);
CAMLlocal1(result);
GtkTextBuffer *obj = (GtkTextBuffer *)GtkTextBuffer_val(self);
gchar* prop_value;
g_object_get(G_OBJECT(obj), "text", &prop_value, NULL);
result = caml_copy_string(prop_value);
CAMLreturn(result);
}

CAMLexport CAMLprim value ml_gtk_text_buffer_set_text(value self, value new_value)
{
CAMLexport CAMLparam2(self, new_value);
GtkTextBuffer *obj = (GtkTextBuffer *)GtkTextBuffer_val(self);
gchar* c_value = String_val(new_value);
g_object_set(G_OBJECT(obj), "text", c_value, NULL);
CAMLreturn(Val_unit);
}
