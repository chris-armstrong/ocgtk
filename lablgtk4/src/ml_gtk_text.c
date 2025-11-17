/* Phase 5.3: Manual GTK Text Widget Bindings for lablgtk4
 *
 * This file implements C FFI bindings for GtkTextIter and related
 * text widget functionality not handled by the GIR generator.
 *
 * GtkTextIter is a stack-allocated structure (not a GObject),
 * so it requires special handling with copy_memblock_indirected.
 */

#include <string.h>
#include <gtk/gtk.h>

#include <caml/mlvalues.h>
#include <caml/alloc.h>
#include <caml/memory.h>
#include <caml/callback.h>
#include <caml/fail.h>

#include "wrappers.h"
#include "ml_gobject.h"
#include "ml_gtk.h"

/* ========================================================================= */
/* TextIter - Stack-Allocated Structure                                      */
/* ========================================================================= */

/*
 * TextIter is NOT a GObject - it's a stack-allocated structure.
 * We use the "lighter" version that allocates in the OCaml heap.
 */

#define GtkTextIter_val(val) ((GtkTextIter*)MLPointer_val(val))
#define Val_GtkTextIter(it) (copy_memblock_indirected(it, sizeof(GtkTextIter)))

/* Copy a text iterator */
CAMLprim value ml_gtk_text_iter_copy(value it) {
    CAMLparam1(it);
    GtkTextIter *iter = GtkTextIter_val(it);
    GtkTextIter *copy = gtk_text_iter_copy(iter);
    value result = Val_GtkTextIter(copy);
    gtk_text_iter_free(copy);
    CAMLreturn(result);
}

/* Assign one iterator to another (GTK 3.2+) */
CAMLprim value ml_gtk_text_iter_assign(value dst, value src) {
    CAMLparam2(dst, src);
    GtkTextIter *dst_iter = GtkTextIter_val(dst);
    GtkTextIter *src_iter = GtkTextIter_val(src);
    if (dst_iter != NULL && src_iter != NULL) {
        *dst_iter = *src_iter;
    }
    CAMLreturn(Val_unit);
}

/* ========================================================================= */
/* TextIter - Position and Movement                                         */
/* ========================================================================= */

CAMLprim value ml_gtk_text_iter_get_offset(value iter) {
    CAMLparam1(iter);
    int offset = gtk_text_iter_get_offset(GtkTextIter_val(iter));
    CAMLreturn(Val_int(offset));
}

CAMLprim value ml_gtk_text_iter_get_line(value iter) {
    CAMLparam1(iter);
    int line = gtk_text_iter_get_line(GtkTextIter_val(iter));
    CAMLreturn(Val_int(line));
}

CAMLprim value ml_gtk_text_iter_get_line_offset(value iter) {
    CAMLparam1(iter);
    int offset = gtk_text_iter_get_line_offset(GtkTextIter_val(iter));
    CAMLreturn(Val_int(offset));
}

CAMLprim value ml_gtk_text_iter_get_line_index(value iter) {
    CAMLparam1(iter);
    int index = gtk_text_iter_get_line_index(GtkTextIter_val(iter));
    CAMLreturn(Val_int(index));
}

CAMLprim value ml_gtk_text_iter_forward_char(value iter) {
    CAMLparam1(iter);
    gboolean result = gtk_text_iter_forward_char(GtkTextIter_val(iter));
    CAMLreturn(Val_bool(result));
}

CAMLprim value ml_gtk_text_iter_backward_char(value iter) {
    CAMLparam1(iter);
    gboolean result = gtk_text_iter_backward_char(GtkTextIter_val(iter));
    CAMLreturn(Val_bool(result));
}

CAMLprim value ml_gtk_text_iter_forward_chars(value iter, value count) {
    CAMLparam2(iter, count);
    gboolean result = gtk_text_iter_forward_chars(GtkTextIter_val(iter), Int_val(count));
    CAMLreturn(Val_bool(result));
}

CAMLprim value ml_gtk_text_iter_backward_chars(value iter, value count) {
    CAMLparam2(iter, count);
    gboolean result = gtk_text_iter_backward_chars(GtkTextIter_val(iter), Int_val(count));
    CAMLreturn(Val_bool(result));
}

CAMLprim value ml_gtk_text_iter_forward_line(value iter) {
    CAMLparam1(iter);
    gboolean result = gtk_text_iter_forward_line(GtkTextIter_val(iter));
    CAMLreturn(Val_bool(result));
}

CAMLprim value ml_gtk_text_iter_backward_line(value iter) {
    CAMLparam1(iter);
    gboolean result = gtk_text_iter_backward_line(GtkTextIter_val(iter));
    CAMLreturn(Val_bool(result));
}

CAMLprim value ml_gtk_text_iter_forward_lines(value iter, value count) {
    CAMLparam2(iter, count);
    gboolean result = gtk_text_iter_forward_lines(GtkTextIter_val(iter), Int_val(count));
    CAMLreturn(Val_bool(result));
}

CAMLprim value ml_gtk_text_iter_backward_lines(value iter, value count) {
    CAMLparam2(iter, count);
    gboolean result = gtk_text_iter_backward_lines(GtkTextIter_val(iter), Int_val(count));
    CAMLreturn(Val_bool(result));
}

CAMLprim value ml_gtk_text_iter_forward_to_line_end(value iter) {
    CAMLparam1(iter);
    gboolean result = gtk_text_iter_forward_to_line_end(GtkTextIter_val(iter));
    CAMLreturn(Val_bool(result));
}

CAMLprim value ml_gtk_text_iter_set_offset(value iter, value offset) {
    CAMLparam2(iter, offset);
    gtk_text_iter_set_offset(GtkTextIter_val(iter), Int_val(offset));
    CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_text_iter_set_line(value iter, value line) {
    CAMLparam2(iter, line);
    gtk_text_iter_set_line(GtkTextIter_val(iter), Int_val(line));
    CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_text_iter_set_line_offset(value iter, value offset) {
    CAMLparam2(iter, offset);
    gtk_text_iter_set_line_offset(GtkTextIter_val(iter), Int_val(offset));
    CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_text_iter_set_line_index(value iter, value index) {
    CAMLparam2(iter, index);
    gtk_text_iter_set_line_index(GtkTextIter_val(iter), Int_val(index));
    CAMLreturn(Val_unit);
}

/* ========================================================================= */
/* TextIter - Comparison                                                     */
/* ========================================================================= */

CAMLprim value ml_gtk_text_iter_equal(value lhs, value rhs) {
    CAMLparam2(lhs, rhs);
    gboolean result = gtk_text_iter_equal(GtkTextIter_val(lhs), GtkTextIter_val(rhs));
    CAMLreturn(Val_bool(result));
}

CAMLprim value ml_gtk_text_iter_compare(value lhs, value rhs) {
    CAMLparam2(lhs, rhs);
    int result = gtk_text_iter_compare(GtkTextIter_val(lhs), GtkTextIter_val(rhs));
    CAMLreturn(Val_int(result));
}

/* ========================================================================= */
/* TextIter - Text Extraction                                               */
/* ========================================================================= */

CAMLprim value ml_gtk_text_iter_get_char(value iter) {
    CAMLparam1(iter);
    gunichar c = gtk_text_iter_get_char(GtkTextIter_val(iter));
    CAMLreturn(Val_int(c));
}

CAMLprim value ml_gtk_text_iter_get_slice(value start, value end) {
    CAMLparam2(start, end);
    CAMLlocal1(result);
    gchar *text = gtk_text_iter_get_slice(GtkTextIter_val(start), GtkTextIter_val(end));
    result = caml_copy_string(text);
    g_free(text);
    CAMLreturn(result);
}

CAMLprim value ml_gtk_text_iter_get_text(value start, value end) {
    CAMLparam2(start, end);
    CAMLlocal1(result);
    gchar *text = gtk_text_iter_get_text(GtkTextIter_val(start), GtkTextIter_val(end));
    result = caml_copy_string(text);
    g_free(text);
    CAMLreturn(result);
}

/* ========================================================================= */
/* TextIter - Buffer Access                                                  */
/* ========================================================================= */

CAMLprim value ml_gtk_text_iter_get_buffer(value iter) {
    CAMLparam1(iter);
    GtkTextBuffer *buffer = gtk_text_iter_get_buffer(GtkTextIter_val(iter));
    CAMLreturn(Val_GtkWidget((GtkWidget*)buffer));
}

/* ========================================================================= */
/* TextBuffer - Iterator Creation                                            */
/* ========================================================================= */

CAMLprim value ml_gtk_text_buffer_get_start_iter(value buffer) {
    CAMLparam1(buffer);
    CAMLlocal1(result);
    GtkTextIter iter;
    gtk_text_buffer_get_start_iter(GTK_TEXT_BUFFER(GtkWidget_val(buffer)), &iter);
    result = Val_GtkTextIter(&iter);
    CAMLreturn(result);
}

CAMLprim value ml_gtk_text_buffer_get_end_iter(value buffer) {
    CAMLparam1(buffer);
    CAMLlocal1(result);
    GtkTextIter iter;
    gtk_text_buffer_get_end_iter(GTK_TEXT_BUFFER(GtkWidget_val(buffer)), &iter);
    result = Val_GtkTextIter(&iter);
    CAMLreturn(result);
}

CAMLprim value ml_gtk_text_buffer_get_iter_at_offset(value buffer, value offset) {
    CAMLparam2(buffer, offset);
    CAMLlocal1(result);
    GtkTextIter iter;
    gtk_text_buffer_get_iter_at_offset(GTK_TEXT_BUFFER(GtkWidget_val(buffer)), &iter, Int_val(offset));
    result = Val_GtkTextIter(&iter);
    CAMLreturn(result);
}

CAMLprim value ml_gtk_text_buffer_get_iter_at_line(value buffer, value line) {
    CAMLparam2(buffer, line);
    CAMLlocal1(result);
    GtkTextIter iter;
    gtk_text_buffer_get_iter_at_line(GTK_TEXT_BUFFER(GtkWidget_val(buffer)), &iter, Int_val(line));
    result = Val_GtkTextIter(&iter);
    CAMLreturn(result);
}

CAMLprim value ml_gtk_text_buffer_get_iter_at_line_offset(value buffer, value line, value offset) {
    CAMLparam3(buffer, line, offset);
    CAMLlocal1(result);
    GtkTextIter iter;
    gtk_text_buffer_get_iter_at_line_offset(
        GTK_TEXT_BUFFER(GtkWidget_val(buffer)),
        &iter,
        Int_val(line),
        Int_val(offset)
    );
    result = Val_GtkTextIter(&iter);
    CAMLreturn(result);
}

CAMLprim value ml_gtk_text_buffer_get_iter_at_line_index(value buffer, value line, value index) {
    CAMLparam3(buffer, line, index);
    CAMLlocal1(result);
    GtkTextIter iter;
    gtk_text_buffer_get_iter_at_line_index(
        GTK_TEXT_BUFFER(GtkWidget_val(buffer)),
        &iter,
        Int_val(line),
        Int_val(index)
    );
    result = Val_GtkTextIter(&iter);
    CAMLreturn(result);
}

/* ========================================================================= */
/* TextBuffer - Text Operations with Iterators                               */
/* ========================================================================= */

CAMLprim value ml_gtk_text_buffer_insert(value buffer, value iter, value text) {
    CAMLparam3(buffer, iter, text);
    gtk_text_buffer_insert(
        GTK_TEXT_BUFFER(GtkWidget_val(buffer)),
        GtkTextIter_val(iter),
        String_val(text),
        -1
    );
    CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_text_buffer_delete(value buffer, value start, value end) {
    CAMLparam3(buffer, start, end);
    gtk_text_buffer_delete(
        GTK_TEXT_BUFFER(GtkWidget_val(buffer)),
        GtkTextIter_val(start),
        GtkTextIter_val(end)
    );
    CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_text_buffer_get_text_range(value buffer, value start, value end, value include_hidden) {
    CAMLparam4(buffer, start, end, include_hidden);
    CAMLlocal1(result);
    gchar *text = gtk_text_buffer_get_text(
        GTK_TEXT_BUFFER(GtkWidget_val(buffer)),
        GtkTextIter_val(start),
        GtkTextIter_val(end),
        Bool_val(include_hidden)
    );
    result = caml_copy_string(text);
    g_free(text);
    CAMLreturn(result);
}

CAMLprim value ml_gtk_text_buffer_apply_tag(value buffer, value tag, value start, value end) {
    CAMLparam4(buffer, tag, start, end);
    gtk_text_buffer_apply_tag(
        GTK_TEXT_BUFFER(GtkWidget_val(buffer)),
        GTK_TEXT_TAG(GtkWidget_val(tag)),
        GtkTextIter_val(start),
        GtkTextIter_val(end)
    );
    CAMLreturn(Val_unit);
}

CAMLprim value ml_gtk_text_buffer_remove_tag(value buffer, value tag, value start, value end) {
    CAMLparam4(buffer, tag, start, end);
    gtk_text_buffer_remove_tag(
        GTK_TEXT_BUFFER(GtkWidget_val(buffer)),
        GTK_TEXT_TAG(GtkWidget_val(tag)),
        GtkTextIter_val(start),
        GtkTextIter_val(end)
    );
    CAMLreturn(Val_unit);
}
