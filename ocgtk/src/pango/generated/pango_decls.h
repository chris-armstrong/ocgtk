/* GENERATED CODE - DO NOT EDIT */
/* Forward declarations for generated enum, bitfield, class and record converters */

#ifndef _pango_decls_h_
#define _pango_decls_h_

#include <pango/pango.h>
#include <caml/mlvalues.h>

/* Dependency headers for cross-namespace types */
#include "generated/gio_decls.h"
#include "generated/cairo_decls.h"

/* Class-specific conversion macros (shared) */
#ifndef Val_PangoContext
#define PangoContext_val(val) ((PangoContext*)ml_gobject_ext_of_val(val))
#define Val_PangoContext(obj) ((value)(ml_gobject_val_of_ext(obj)))
#endif /* Val_PangoContext */

#ifndef Val_PangoCoverage
#define PangoCoverage_val(val) ((PangoCoverage*)ml_gobject_ext_of_val(val))
#define Val_PangoCoverage(obj) ((value)(ml_gobject_val_of_ext(obj)))
#endif /* Val_PangoCoverage */

#ifndef Val_PangoFont
#define PangoFont_val(val) ((PangoFont*)ml_gobject_ext_of_val(val))
#define Val_PangoFont(obj) ((value)(ml_gobject_val_of_ext(obj)))
#endif /* Val_PangoFont */

#ifndef Val_PangoFontFace
#define PangoFontFace_val(val) ((PangoFontFace*)ml_gobject_ext_of_val(val))
#define Val_PangoFontFace(obj) ((value)(ml_gobject_val_of_ext(obj)))
#endif /* Val_PangoFontFace */

#ifndef Val_PangoFontFamily
#define PangoFontFamily_val(val) ((PangoFontFamily*)ml_gobject_ext_of_val(val))
#define Val_PangoFontFamily(obj) ((value)(ml_gobject_val_of_ext(obj)))
#endif /* Val_PangoFontFamily */

#ifndef Val_PangoFontMap
#define PangoFontMap_val(val) ((PangoFontMap*)ml_gobject_ext_of_val(val))
#define Val_PangoFontMap(obj) ((value)(ml_gobject_val_of_ext(obj)))
#endif /* Val_PangoFontMap */

#ifndef Val_PangoFontset
#define PangoFontset_val(val) ((PangoFontset*)ml_gobject_ext_of_val(val))
#define Val_PangoFontset(obj) ((value)(ml_gobject_val_of_ext(obj)))
#endif /* Val_PangoFontset */

#ifndef Val_PangoFontsetSimple
#define PangoFontsetSimple_val(val) ((PangoFontsetSimple*)ml_gobject_ext_of_val(val))
#define Val_PangoFontsetSimple(obj) ((value)(ml_gobject_val_of_ext(obj)))
#endif /* Val_PangoFontsetSimple */

#ifndef Val_PangoLayout
#define PangoLayout_val(val) ((PangoLayout*)ml_gobject_ext_of_val(val))
#define Val_PangoLayout(obj) ((value)(ml_gobject_val_of_ext(obj)))
#endif /* Val_PangoLayout */

#if PANGO_VERSION_CHECK(1,8,0)
#ifndef Val_PangoRenderer
#define PangoRenderer_val(val) ((PangoRenderer*)ml_gobject_ext_of_val(val))
#define Val_PangoRenderer(obj) ((value)(ml_gobject_val_of_ext(obj)))
#endif /* Val_PangoRenderer */

#endif
/* Interface-specific conversion macros (shared) */
/* Value-returning structs copied into OCaml */
value copy_PangoAttribute(const PangoAttribute *ptr);
value copy_PangoColor(const PangoColor *ptr);
value copy_PangoGlyphItem(const PangoGlyphItem *ptr);
#if PANGO_VERSION_CHECK(1,22,0)
value copy_PangoGlyphItemIter(const PangoGlyphItemIter *ptr);
#endif
value copy_PangoGlyphString(const PangoGlyphString *ptr);
value copy_PangoItem(const PangoItem *ptr);
#if PANGO_VERSION_CHECK(1,6,0)
value copy_PangoMatrix(const PangoMatrix *ptr);
#endif

#ifndef Val_PangoAttribute
#define PangoAttribute_val(val) ((PangoAttribute*)ext_of_val(val))
#define Val_PangoAttribute(obj) copy_PangoAttribute((obj))
#define Val_PangoAttribute_option(ptr) ((ptr) ? Val_some(copy_PangoAttribute(ptr)) : Val_none)
#endif /* Val_PangoAttribute */

#ifndef Val_PangoColor
#define PangoColor_val(val) ((PangoColor*)ext_of_val(val))
#define Val_PangoColor(obj) copy_PangoColor((obj))
#define Val_PangoColor_option(ptr) ((ptr) ? Val_some(copy_PangoColor(ptr)) : Val_none)
#endif /* Val_PangoColor */

#ifndef Val_PangoGlyphItem
#define PangoGlyphItem_val(val) ((PangoGlyphItem*)ext_of_val(val))
#define Val_PangoGlyphItem(obj) copy_PangoGlyphItem((obj))
#define Val_PangoGlyphItem_option(ptr) ((ptr) ? Val_some(copy_PangoGlyphItem(ptr)) : Val_none)
#endif /* Val_PangoGlyphItem */

#if PANGO_VERSION_CHECK(1,22,0)
#ifndef Val_PangoGlyphItemIter
#define PangoGlyphItemIter_val(val) ((PangoGlyphItemIter*)ext_of_val(val))
#define Val_PangoGlyphItemIter(obj) copy_PangoGlyphItemIter((obj))
#define Val_PangoGlyphItemIter_option(ptr) ((ptr) ? Val_some(copy_PangoGlyphItemIter(ptr)) : Val_none)
#endif /* Val_PangoGlyphItemIter */

#endif
#ifndef Val_PangoGlyphString
#define PangoGlyphString_val(val) ((PangoGlyphString*)ext_of_val(val))
#define Val_PangoGlyphString(obj) copy_PangoGlyphString((obj))
#define Val_PangoGlyphString_option(ptr) ((ptr) ? Val_some(copy_PangoGlyphString(ptr)) : Val_none)
#endif /* Val_PangoGlyphString */

#ifndef Val_PangoItem
#define PangoItem_val(val) ((PangoItem*)ext_of_val(val))
#define Val_PangoItem(obj) copy_PangoItem((obj))
#define Val_PangoItem_option(ptr) ((ptr) ? Val_some(copy_PangoItem(ptr)) : Val_none)
#endif /* Val_PangoItem */

#if PANGO_VERSION_CHECK(1,6,0)
#ifndef Val_PangoMatrix
#define PangoMatrix_val(val) ((PangoMatrix*)ext_of_val(val))
#define Val_PangoMatrix(obj) copy_PangoMatrix((obj))
#define Val_PangoMatrix_option(ptr) ((ptr) ? Val_some(copy_PangoMatrix(ptr)) : Val_none)
#endif /* Val_PangoMatrix */

#endif

/* Forward declarations for record converters (non-opaque records) */
/* Forward declarations for PangoAnalysis converters */
PangoAnalysis *PangoAnalysis_val(value val);
value Val_PangoAnalysis(const PangoAnalysis *ptr);
value Val_PangoAnalysis_option(const PangoAnalysis *ptr);

/* Forward declarations for PangoAttrClass converters */
PangoAttrClass *PangoAttrClass_val(value val);
value Val_PangoAttrClass(const PangoAttrClass *ptr);
value Val_PangoAttrClass_option(const PangoAttrClass *ptr);

/* Forward declarations for PangoAttrColor converters */
PangoAttrColor *PangoAttrColor_val(value val);
value Val_PangoAttrColor(const PangoAttrColor *ptr);
value Val_PangoAttrColor_option(const PangoAttrColor *ptr);

/* Forward declarations for PangoAttrFloat converters */
PangoAttrFloat *PangoAttrFloat_val(value val);
value Val_PangoAttrFloat(const PangoAttrFloat *ptr);
value Val_PangoAttrFloat_option(const PangoAttrFloat *ptr);

/* Forward declarations for PangoAttrFontDesc converters */
PangoAttrFontDesc *PangoAttrFontDesc_val(value val);
value Val_PangoAttrFontDesc(const PangoAttrFontDesc *ptr);
value Val_PangoAttrFontDesc_option(const PangoAttrFontDesc *ptr);

#if PANGO_VERSION_CHECK(1,38,0)
/* Forward declarations for PangoAttrFontFeatures converters */
PangoAttrFontFeatures *PangoAttrFontFeatures_val(value val);
value Val_PangoAttrFontFeatures(const PangoAttrFontFeatures *ptr);
value Val_PangoAttrFontFeatures_option(const PangoAttrFontFeatures *ptr);
#endif

/* Forward declarations for PangoAttrInt converters */
PangoAttrInt *PangoAttrInt_val(value val);
value Val_PangoAttrInt(const PangoAttrInt *ptr);
value Val_PangoAttrInt_option(const PangoAttrInt *ptr);

/* Forward declarations for PangoAttrIterator converters */
PangoAttrIterator *PangoAttrIterator_val(value val);
value Val_PangoAttrIterator(const PangoAttrIterator *ptr);
value Val_PangoAttrIterator_option(const PangoAttrIterator *ptr);

/* Forward declarations for PangoAttrLanguage converters */
PangoAttrLanguage *PangoAttrLanguage_val(value val);
value Val_PangoAttrLanguage(const PangoAttrLanguage *ptr);
value Val_PangoAttrLanguage_option(const PangoAttrLanguage *ptr);

/* Forward declarations for PangoAttrList converters */
PangoAttrList *PangoAttrList_val(value val);
value Val_PangoAttrList(const PangoAttrList *ptr);
value Val_PangoAttrList_option(const PangoAttrList *ptr);

/* Forward declarations for PangoAttrShape converters */
PangoAttrShape *PangoAttrShape_val(value val);
value Val_PangoAttrShape(const PangoAttrShape *ptr);
value Val_PangoAttrShape_option(const PangoAttrShape *ptr);

/* Forward declarations for PangoAttrSize converters */
PangoAttrSize *PangoAttrSize_val(value val);
value Val_PangoAttrSize(const PangoAttrSize *ptr);
value Val_PangoAttrSize_option(const PangoAttrSize *ptr);

/* Forward declarations for PangoAttrString converters */
PangoAttrString *PangoAttrString_val(value val);
value Val_PangoAttrString(const PangoAttrString *ptr);
value Val_PangoAttrString_option(const PangoAttrString *ptr);

/* Forward declarations for PangoFontDescription converters */
PangoFontDescription *PangoFontDescription_val(value val);
value Val_PangoFontDescription(const PangoFontDescription *ptr);
value Val_PangoFontDescription_option(const PangoFontDescription *ptr);

/* Forward declarations for PangoFontMetrics converters */
PangoFontMetrics *PangoFontMetrics_val(value val);
value Val_PangoFontMetrics(const PangoFontMetrics *ptr);
value Val_PangoFontMetrics_option(const PangoFontMetrics *ptr);

/* Forward declarations for PangoGlyphGeometry converters */
PangoGlyphGeometry *PangoGlyphGeometry_val(value val);
value Val_PangoGlyphGeometry(const PangoGlyphGeometry *ptr);
value Val_PangoGlyphGeometry_option(const PangoGlyphGeometry *ptr);

/* Forward declarations for PangoGlyphInfo converters */
PangoGlyphInfo *PangoGlyphInfo_val(value val);
value Val_PangoGlyphInfo(const PangoGlyphInfo *ptr);
value Val_PangoGlyphInfo_option(const PangoGlyphInfo *ptr);

/* Forward declarations for PangoGlyphVisAttr converters */
PangoGlyphVisAttr *PangoGlyphVisAttr_val(value val);
value Val_PangoGlyphVisAttr(const PangoGlyphVisAttr *ptr);
value Val_PangoGlyphVisAttr_option(const PangoGlyphVisAttr *ptr);

/* Forward declarations for PangoLanguage converters */
PangoLanguage *PangoLanguage_val(value val);
value Val_PangoLanguage(const PangoLanguage *ptr);
value Val_PangoLanguage_option(const PangoLanguage *ptr);

/* Forward declarations for PangoLayoutIter converters */
PangoLayoutIter *PangoLayoutIter_val(value val);
value Val_PangoLayoutIter(const PangoLayoutIter *ptr);
value Val_PangoLayoutIter_option(const PangoLayoutIter *ptr);

/* Forward declarations for PangoLayoutLine converters */
PangoLayoutLine *PangoLayoutLine_val(value val);
value Val_PangoLayoutLine(const PangoLayoutLine *ptr);
value Val_PangoLayoutLine_option(const PangoLayoutLine *ptr);

/* Forward declarations for PangoLogAttr converters */
PangoLogAttr *PangoLogAttr_val(value val);
value Val_PangoLogAttr(const PangoLogAttr *ptr);
value Val_PangoLogAttr_option(const PangoLogAttr *ptr);

/* Forward declarations for PangoRectangle converters */
PangoRectangle *PangoRectangle_val(value val);
value Val_PangoRectangle(const PangoRectangle *ptr);
value Val_PangoRectangle_option(const PangoRectangle *ptr);

/* Forward declarations for PangoScriptIter converters */
PangoScriptIter *PangoScriptIter_val(value val);
value Val_PangoScriptIter(const PangoScriptIter *ptr);
value Val_PangoScriptIter_option(const PangoScriptIter *ptr);

/* Forward declarations for PangoTabArray converters */
PangoTabArray *PangoTabArray_val(value val);
value Val_PangoTabArray(const PangoTabArray *ptr);
value Val_PangoTabArray_option(const PangoTabArray *ptr);

/* Const-safe string extraction for setters */
#define ML_DECL_CONST_STRING(name, expr) const gchar *name = (const gchar *)(expr)

/* Note: Res_Ok, Res_Error, ValUnit, and Val_GError are defined in wrappers.h */

/* Forward declarations for enum converters */
value Val_PangoAlignment(PangoAlignment val);
PangoAlignment PangoAlignment_val(value val);
value Val_PangoAttrType(PangoAttrType val);
PangoAttrType PangoAttrType_val(value val);
#if PANGO_VERSION_CHECK(1,50,0)
value Val_PangoBaselineShift(PangoBaselineShift val);
PangoBaselineShift PangoBaselineShift_val(value val);
#endif
#if PANGO_VERSION_CHECK(1,22,0)
value Val_PangoBidiType(PangoBidiType val);
PangoBidiType PangoBidiType_val(value val);
#endif
value Val_PangoCoverageLevel(PangoCoverageLevel val);
PangoCoverageLevel PangoCoverageLevel_val(value val);
value Val_PangoDirection(PangoDirection val);
PangoDirection PangoDirection_val(value val);
value Val_PangoEllipsizeMode(PangoEllipsizeMode val);
PangoEllipsizeMode PangoEllipsizeMode_val(value val);
#if PANGO_VERSION_CHECK(1,50,0)
value Val_PangoFontScale(PangoFontScale val);
PangoFontScale PangoFontScale_val(value val);
#endif
#if PANGO_VERSION_CHECK(1,16,0)
value Val_PangoGravity(PangoGravity val);
PangoGravity PangoGravity_val(value val);
#endif
#if PANGO_VERSION_CHECK(1,16,0)
value Val_PangoGravityHint(PangoGravityHint val);
PangoGravityHint PangoGravityHint_val(value val);
#endif
#if PANGO_VERSION_CHECK(1,50,0)
value Val_PangoLayoutDeserializeError(PangoLayoutDeserializeError val);
PangoLayoutDeserializeError PangoLayoutDeserializeError_val(value val);
#endif
#if PANGO_VERSION_CHECK(1,46,0)
value Val_PangoOverline(PangoOverline val);
PangoOverline PangoOverline_val(value val);
#endif
#if PANGO_VERSION_CHECK(1,8,0)
value Val_PangoRenderPart(PangoRenderPart val);
PangoRenderPart PangoRenderPart_val(value val);
#endif
value Val_PangoScript(PangoScript val);
PangoScript PangoScript_val(value val);
value Val_PangoStretch(PangoStretch val);
PangoStretch PangoStretch_val(value val);
value Val_PangoStyle(PangoStyle val);
PangoStyle PangoStyle_val(value val);
value Val_PangoTabAlign(PangoTabAlign val);
PangoTabAlign PangoTabAlign_val(value val);
#if PANGO_VERSION_CHECK(1,50,0)
value Val_PangoTextTransform(PangoTextTransform val);
PangoTextTransform PangoTextTransform_val(value val);
#endif
value Val_PangoUnderline(PangoUnderline val);
PangoUnderline PangoUnderline_val(value val);
value Val_PangoVariant(PangoVariant val);
PangoVariant PangoVariant_val(value val);
value Val_PangoWeight(PangoWeight val);
PangoWeight PangoWeight_val(value val);
value Val_PangoWrapMode(PangoWrapMode val);
PangoWrapMode PangoWrapMode_val(value val);

/* Forward declarations for bitfield converters */
value Val_PangoFontMask(PangoFontMask flags);
PangoFontMask PangoFontMask_val(value list);
#if PANGO_VERSION_CHECK(1,50,0)
value Val_PangoLayoutDeserializeFlags(PangoLayoutDeserializeFlags flags);
PangoLayoutDeserializeFlags PangoLayoutDeserializeFlags_val(value list);
#endif
#if PANGO_VERSION_CHECK(1,50,0)
value Val_PangoLayoutSerializeFlags(PangoLayoutSerializeFlags flags);
PangoLayoutSerializeFlags PangoLayoutSerializeFlags_val(value list);
#endif
#if PANGO_VERSION_CHECK(1,44,0)
value Val_PangoShapeFlags(PangoShapeFlags flags);
PangoShapeFlags PangoShapeFlags_val(value list);
#endif
#if PANGO_VERSION_CHECK(1,44,0)
value Val_PangoShowFlags(PangoShowFlags flags);
PangoShowFlags PangoShowFlags_val(value list);
#endif


#include "../core/pango_core.h"

#endif /* _pango_decls_h_ */
