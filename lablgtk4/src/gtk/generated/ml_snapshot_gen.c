/* GENERATED CODE - DO NOT EDIT */
/* C bindings for Snapshot */

#include <gtk/gtk.h>
#include <caml/mlvalues.h>
#include <caml/memory.h>
#include <caml/alloc.h>
#include <caml/callback.h>
#include <caml/fail.h>
#include <caml/hash.h>
#include <caml/custom.h>
#include "wrappers.h"
#include "converters.h"

#include <gtk/gtk.h>
/* Include common type conversions and forward declarations */
#include "generated_forward_decls.h"


CAMLexport CAMLprim value ml_gtk_snapshot_new(value unit)
{
CAMLparam1(unit);
GtkSnapshot *obj = gtk_snapshot_new();
if (obj) g_object_ref_sink(obj);
CAMLreturn(Val_GtkSnapshot(obj));
}

CAMLexport CAMLprim value ml_gtk_snapshot_scale_3d(value self, value arg1, value arg2, value arg3)
{
CAMLparam4(self, arg1, arg2, arg3);

gtk_snapshot_scale_3d(GtkSnapshot_val(self), Double_val(arg1), Double_val(arg2), Double_val(arg3));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_snapshot_scale(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);

gtk_snapshot_scale(GtkSnapshot_val(self), Double_val(arg1), Double_val(arg2));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_snapshot_save(value self)
{
CAMLparam1(self);

gtk_snapshot_save(GtkSnapshot_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_snapshot_rotate(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_snapshot_rotate(GtkSnapshot_val(self), Double_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_snapshot_restore(value self)
{
CAMLparam1(self);

gtk_snapshot_restore(GtkSnapshot_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_snapshot_render_frame_native(value self, value arg1, value arg2, value arg3, value arg4, value arg5)
{
CAMLparam5(self, arg1, arg2, arg3, arg4);
CAMLxparam1(arg5);

gtk_snapshot_render_frame(GtkSnapshot_val(self), GtkStyleContext_val(arg1), Double_val(arg2), Double_val(arg3), Double_val(arg4), Double_val(arg5));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_snapshot_render_frame_bytecode(value * argv, int argn)
{
return ml_gtk_snapshot_render_frame_native(argv[0], argv[1], argv[2], argv[3], argv[4], argv[5]);
}

CAMLexport CAMLprim value ml_gtk_snapshot_render_focus_native(value self, value arg1, value arg2, value arg3, value arg4, value arg5)
{
CAMLparam5(self, arg1, arg2, arg3, arg4);
CAMLxparam1(arg5);

gtk_snapshot_render_focus(GtkSnapshot_val(self), GtkStyleContext_val(arg1), Double_val(arg2), Double_val(arg3), Double_val(arg4), Double_val(arg5));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_snapshot_render_focus_bytecode(value * argv, int argn)
{
return ml_gtk_snapshot_render_focus_native(argv[0], argv[1], argv[2], argv[3], argv[4], argv[5]);
}

CAMLexport CAMLprim value ml_gtk_snapshot_render_background_native(value self, value arg1, value arg2, value arg3, value arg4, value arg5)
{
CAMLparam5(self, arg1, arg2, arg3, arg4);
CAMLxparam1(arg5);

gtk_snapshot_render_background(GtkSnapshot_val(self), GtkStyleContext_val(arg1), Double_val(arg2), Double_val(arg3), Double_val(arg4), Double_val(arg5));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_snapshot_render_background_bytecode(value * argv, int argn)
{
return ml_gtk_snapshot_render_background_native(argv[0], argv[1], argv[2], argv[3], argv[4], argv[5]);
}

CAMLexport CAMLprim value ml_gtk_snapshot_push_opacity(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_snapshot_push_opacity(GtkSnapshot_val(self), Double_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_snapshot_push_cross_fade(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_snapshot_push_cross_fade(GtkSnapshot_val(self), Double_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_snapshot_push_blur(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_snapshot_push_blur(GtkSnapshot_val(self), Double_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_snapshot_pop(value self)
{
CAMLparam1(self);

gtk_snapshot_pop(GtkSnapshot_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_snapshot_perspective(value self, value arg1)
{
CAMLparam2(self, arg1);

gtk_snapshot_perspective(GtkSnapshot_val(self), Double_val(arg1));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gtk_snapshot_gl_shader_pop_texture(value self)
{
CAMLparam1(self);

gtk_snapshot_gl_shader_pop_texture(GtkSnapshot_val(self));
CAMLreturn(Val_unit);
}
