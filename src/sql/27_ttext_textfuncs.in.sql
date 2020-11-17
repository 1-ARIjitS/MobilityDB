/*****************************************************************************
 *
 * temporal_textfuncs.sql
 *    Temporal text functions.
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

/*****************************************************************************
 * Temporal text concatenation
 *****************************************************************************/


CREATE FUNCTION temporal_textcat(text, ttext)
  RETURNS ttext
  AS 'MODULE_PATHNAME', 'textcat_base_ttext'
  LANGUAGE C IMMUTABLE STRICT PARALLEL SAFE;
CREATE FUNCTION temporal_textcat(ttext, text)
  RETURNS ttext
  AS 'MODULE_PATHNAME', 'textcat_ttext_base'
  LANGUAGE C IMMUTABLE STRICT PARALLEL SAFE;
CREATE FUNCTION temporal_textcat(ttext, ttext)
  RETURNS ttext
  AS 'MODULE_PATHNAME', 'textcat_ttext_ttext'
  LANGUAGE C IMMUTABLE STRICT PARALLEL SAFE;

CREATE OPERATOR || (
  PROCEDURE = temporal_textcat,
  LEFTARG = text, RIGHTARG = ttext,
  COMMUTATOR = ||
);
CREATE OPERATOR || (
  PROCEDURE = temporal_textcat,
  LEFTARG = ttext, RIGHTARG = text,
  COMMUTATOR = ||
);
CREATE OPERATOR || (
  PROCEDURE = temporal_textcat,
  LEFTARG = ttext, RIGHTARG = ttext,
  COMMUTATOR = ||
);

/******************************************************************************
 * Temporal upper/lower case
 *****************************************************************************/

CREATE FUNCTION upper(ttext)
  RETURNS ttext
  AS 'MODULE_PATHNAME', 'ttext_upper'
  LANGUAGE C IMMUTABLE STRICT PARALLEL SAFE;

CREATE FUNCTION lower(ttext)
  RETURNS ttext
  AS 'MODULE_PATHNAME', 'ttext_lower'
  LANGUAGE C IMMUTABLE STRICT PARALLEL SAFE;

/******************************************************************************/
