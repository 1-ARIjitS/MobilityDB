/*****************************************************************************
 *
 * This MobilityDB code is provided under The PostgreSQL License.
 * Copyright (c) 2016-2022, Université libre de Bruxelles and MobilityDB
 * contributors
 *
 * MobilityDB includes portions of PostGIS version 3 source code released
 * under the GNU General Public License (GPLv2 or later).
 * Copyright (c) 2001-2022, PostGIS contributors
 *
 * Permission to use, copy, modify, and distribute this software and its
 * documentation for any purpose, without fee, and without a written
 * agreement is hereby granted, provided that the above copyright notice and
 * this paragraph and the following two paragraphs appear in all copies.
 *
 * IN NO EVENT SHALL UNIVERSITE LIBRE DE BRUXELLES BE LIABLE TO ANY PARTY FOR
 * DIRECT, INDIRECT, SPECIAL, INCIDENTAL, OR CONSEQUENTIAL DAMAGES, INCLUDING
 * LOST PROFITS, ARISING OUT OF THE USE OF THIS SOFTWARE AND ITS DOCUMENTATION,
 * EVEN IF UNIVERSITE LIBRE DE BRUXELLES HAS BEEN ADVISED OF THE POSSIBILITY
 * OF SUCH DAMAGE.
 *
 * UNIVERSITE LIBRE DE BRUXELLES SPECIFICALLY DISCLAIMS ANY WARRANTIES,
 * INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY
 * AND FITNESS FOR A PARTICULAR PURPOSE. THE SOFTWARE PROVIDED HEREUNDER IS ON
 * AN "AS IS" BASIS, AND UNIVERSITE LIBRE DE BRUXELLES HAS NO OBLIGATIONS TO
 * PROVIDE MAINTENANCE, SUPPORT, UPDATES, ENHANCEMENTS, OR MODIFICATIONS. 
 *
 *****************************************************************************/

/**
 * @brief Basic functions for set of (distinct) timestamps.
 */

#ifndef __TIMESTAMPSET_H__
#define __TIMESTAMPSET_H__

/*****************************************************************************/

/*
 * fmgr macros for ordered set types
 */

/* PostgreSQL */
#include <postgres.h>
/* MobilityDB */
#include "general/timetypes.h"

#if MEOS
  #define DatumGetSetP(X)      ((Set *) DatumGetPointer(X))
#else
  #define DatumGetSetP(X)      ((Set *) PG_DETOAST_DATUM(X))
#endif /* MEOS */
#define SetPGetDatum(X)        PointerGetDatum(X)
#define PG_GETARG_SET_P(X)     ((Set *) PG_GETARG_VARLENA_P(X))
#define PG_RETURN_SET_P(X)     PG_RETURN_POINTER(X)

/*****************************************************************************/

/* General functions */

extern bool set_find_value(const Set *s, Datum, int *loc);

/*****************************************************************************/

#endif
