/*****************************************************************************
 *
 * tpoint_tempspatialrels.h
 *    Temporal spatial relationships for temporal points.
 *
 * Copyright (c) 2020, Université libre de Bruxelles and MobilityDB contributors
 *
 * Permission to use, copy, modify, and distribute this software and its documentation for any purpose, without fee, and without a written agreement is hereby
 * granted, provided that the above copyright notice and this paragraph and the following two paragraphs appear in all copies.
 *
 * IN NO EVENT SHALL UNIVERSITE LIBRE DE BRUXELLES BE LIABLE TO ANY PARTY FOR DIRECT, INDIRECT, SPECIAL, INCIDENTAL, OR CONSEQUENTIAL DAMAGES, INCLUDING LOST
 * PROFITS, ARISING OUT OF THE USE OF THIS SOFTWARE AND ITS DOCUMENTATION, EVEN IF UNIVERSITE LIBRE DE BRUXELLES HAS BEEN ADVISED OF THE POSSIBILITY OF SUCH
 * DAMAGE.
 *
 * UNIVERSITE LIBRE DE BRUXELLES SPECIFICALLY DISCLAIMS ANY WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
 * FOR A PARTICULAR PURPOSE. THE SOFTWARE PROVIDED HEREUNDER IS ON AN "AS IS" BASIS, AND UNIVERSITE LIBRE DE BRUXELLES HAS NO OBLIGATIONS TO PROVIDE
 * MAINTENANCE, SUPPORT, UPDATES, ENHANCEMENTS, OR MODIFICATIONS. 
 *
 *****************************************************************************/

#ifndef __TPOINT_TEMPSPATIALRELS_H__
#define __TPOINT_TEMPSPATIALRELS_H__

#include <postgres.h>
#include <fmgr.h>
#include <catalog/pg_type.h>

#include "temporal.h"

/*****************************************************************************/

extern Datum tcontains_geo_tpoint(PG_FUNCTION_ARGS);
extern Datum tcontains_tpoint_geo(PG_FUNCTION_ARGS);

extern Datum tcovers_geo_tpoint(PG_FUNCTION_ARGS);
extern Datum tcovers_tpoint_geo(PG_FUNCTION_ARGS);

extern Datum tcoveredby_geo_tpoint(PG_FUNCTION_ARGS);
extern Datum tcoveredby_tpoint_geo(PG_FUNCTION_ARGS);

extern Datum tdisjoint_geo_tpoint(PG_FUNCTION_ARGS);
extern Datum tdisjoint_tpoint_geo(PG_FUNCTION_ARGS);
extern Datum tdisjoint_tpoint_tpoint(PG_FUNCTION_ARGS);

extern Datum tequals_geo_tpoint(PG_FUNCTION_ARGS);
extern Datum tequals_tpoint_geo(PG_FUNCTION_ARGS);
extern Datum tequals_tpoint_tpoint(PG_FUNCTION_ARGS);

extern Datum tintersects_geo_tpoint(PG_FUNCTION_ARGS);
extern Datum tintersects_tpoint_geo(PG_FUNCTION_ARGS);
extern Datum tintersects_tpoint_tpoint(PG_FUNCTION_ARGS);

extern Datum ttouches_geo_tpoint(PG_FUNCTION_ARGS);
extern Datum ttouches_tpoint_geo(PG_FUNCTION_ARGS);

extern Datum twithin_geo_tpoint(PG_FUNCTION_ARGS);
extern Datum twithin_tpoint_geo(PG_FUNCTION_ARGS);

extern Datum tdwithin_geo_tpoint(PG_FUNCTION_ARGS);
extern Datum tdwithin_tpoint_geo(PG_FUNCTION_ARGS);
extern Datum tdwithin_tpoint_tpoint(PG_FUNCTION_ARGS);

extern Datum trelate_geo_tpoint(PG_FUNCTION_ARGS);
extern Datum trelate_tpoint_geo(PG_FUNCTION_ARGS);
extern Datum trelate_tpoint_tpoint(PG_FUNCTION_ARGS);

extern Datum trelate_pattern_geo_tpoint(PG_FUNCTION_ARGS);
extern Datum trelate_pattern_tpoint_geo(PG_FUNCTION_ARGS);
extern Datum trelate_pattern_tpoint_tpoint(PG_FUNCTION_ARGS);

/*****************************************************************************/

#endif
