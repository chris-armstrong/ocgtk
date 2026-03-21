/* GENERATED CODE - DO NOT EDIT */
/* C bindings for Renderer */

#include <gsk/gsk.h>
#include <caml/mlvalues.h>
#include <caml/memory.h>
#include <caml/alloc.h>
#include <caml/callback.h>
#include <caml/fail.h>
#include <caml/hash.h>
#include <caml/custom.h>
#include "wrappers.h"

#include <gsk/gsk.h>
/* Include library-specific type conversions and forward declarations */
#include "gsk_decls.h"


CAMLexport CAMLprim value ml_gsk_renderer_new_for_surface(value arg1)
{
CAMLparam1(arg1);

GskRenderer *obj = gsk_renderer_new_for_surface(GdkSurface_val(arg1));
if (obj) g_object_ref_sink(obj);

CAMLreturn(Val_GskRenderer(obj));
}
CAMLexport CAMLprim value ml_gsk_renderer_unrealize(value self)
{
CAMLparam1(self);

gsk_renderer_unrealize(GskRenderer_val(self));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gsk_renderer_render_texture(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);

GdkTexture* result = gsk_renderer_render_texture(GskRenderer_val(self), GskRenderNode_val(arg1), Option_val(arg2, graphene_rect_t_val, NULL));
CAMLreturn(Val_GdkTexture(result));
}

CAMLexport CAMLprim value ml_gsk_renderer_render(value self, value arg1, value arg2)
{
CAMLparam3(self, arg1, arg2);

gsk_renderer_render(GskRenderer_val(self), GskRenderNode_val(arg1), Option_val(arg2, cairo_region_t_val, NULL));
CAMLreturn(Val_unit);
}

CAMLexport CAMLprim value ml_gsk_renderer_realize_for_display(value self, value arg1)
{
CAMLparam2(self, arg1);
GError *error = NULL;

gboolean result = gsk_renderer_realize_for_display(GskRenderer_val(self), GdkDisplay_val(arg1), &error);
if (error == NULL) CAMLreturn(Res_Ok(Val_bool(result))); else CAMLreturn(Res_Error(Val_GError(error)));
}

CAMLexport CAMLprim value ml_gsk_renderer_realize(value self, value arg1)
{
CAMLparam2(self, arg1);
GError *error = NULL;

gboolean result = gsk_renderer_realize(GskRenderer_val(self), Option_val(arg1, GdkSurface_val, NULL), &error);
if (error == NULL) CAMLreturn(Res_Ok(Val_bool(result))); else CAMLreturn(Res_Error(Val_GError(error)));
}

CAMLexport CAMLprim value ml_gsk_renderer_is_realized(value self)
{
CAMLparam1(self);

gboolean result = gsk_renderer_is_realized(GskRenderer_val(self));
CAMLreturn(Val_bool(result));
}

CAMLexport CAMLprim value ml_gsk_renderer_get_surface(value self)
{
CAMLparam1(self);

GdkSurface* result = gsk_renderer_get_surface(GskRenderer_val(self));
if (result) g_object_ref_sink(result);
CAMLreturn(Val_option(result, Val_GdkSurface));
}

CAMLexport CAMLprim value ml_gsk_renderer_get_realized(value self)
{
    CAMLparam1(self);
    CAMLlocal1(result);
GskRenderer *obj = (GskRenderer *)GskRenderer_val(self);
    gboolean *prop_value;
GParamSpec *pspec = g_object_class_find_property(G_OBJECT_GET_CLASS(obj), "realized");
if (pspec == NULL) caml_failwith("ml_gsk_renderer_get_realized: property 'realized' not found");
GValue prop_gvalue = G_VALUE_INIT;
g_value_init(&prop_gvalue, pspec->value_type);
      g_object_get_property(G_OBJECT(obj), "realized", &prop_gvalue);
          prop_value = g_value_get_boolean(&prop_gvalue);

      result = Val_bool(prop_value);
g_value_unset(&prop_gvalue);
CAMLreturn(result);}
