CREATE FUNCTION html2text (@htmlText varchar(max))
RETURNS varchar(max)
AS
BEGIN
  DECLARE @start int
  DECLARE @end int
  DECLARE @length int
  SET @htmlText = REPLACE(@htmlText, '<br>', CHAR(13) + CHAR(10))
  SET @htmlText = REPLACE(@htmlText, '<br/>', CHAR(13) + CHAR(10))
  SET @htmlText = REPLACE(@htmlText, '<br />', CHAR(13) + CHAR(10))
  SET @htmlText = REPLACE(@htmlText, '<li>', '- ')
  SET @htmlText = REPLACE(@htmlText, '</li>', CHAR(13) + CHAR(10))
  SET @htmlText = REPLACE(@htmlText, '&Aacute;' COLLATE Latin1_General_CS_AS, '' COLLATE Latin1_General_CS_AS)
  SET @htmlText = REPLACE(@htmlText, '&aacute;' COLLATE Latin1_General_CS_AS, '' COLLATE Latin1_General_CS_AS)
  SET @htmlText = REPLACE(@htmlText, '&Acirc;' COLLATE Latin1_General_CS_AS, '' COLLATE Latin1_General_CS_AS)
  SET @htmlText = REPLACE(@htmlText, '&acirc;' COLLATE Latin1_General_CS_AS, '' COLLATE Latin1_General_CS_AS)
  SET @htmlText = REPLACE(@htmlText, '&Agrave;' COLLATE Latin1_General_CS_AS, '' COLLATE Latin1_General_CS_AS)
  SET @htmlText = REPLACE(@htmlText, '&agrave;' COLLATE Latin1_General_CS_AS, '' COLLATE Latin1_General_CS_AS)
  SET @htmlText = REPLACE(@htmlText, '&Aring;' COLLATE Latin1_General_CS_AS, '' COLLATE Latin1_General_CS_AS)
  SET @htmlText = REPLACE(@htmlText, '&aring;' COLLATE Latin1_General_CS_AS, '' COLLATE Latin1_General_CS_AS)
  SET @htmlText = REPLACE(@htmlText, '&Atilde;' COLLATE Latin1_General_CS_AS, '' COLLATE Latin1_General_CS_AS)
  SET @htmlText = REPLACE(@htmlText, '&atilde;' COLLATE Latin1_General_CS_AS, '' COLLATE Latin1_General_CS_AS)
  SET @htmlText = REPLACE(@htmlText, '&Auml;' COLLATE Latin1_General_CS_AS, '' COLLATE Latin1_General_CS_AS)
  SET @htmlText = REPLACE(@htmlText, '&auml;' COLLATE Latin1_General_CS_AS, '' COLLATE Latin1_General_CS_AS)
  SET @htmlText = REPLACE(@htmlText, '&AElig;' COLLATE Latin1_General_CS_AS, '' COLLATE Latin1_General_CS_AS)
  SET @htmlText = REPLACE(@htmlText, '&aelig;' COLLATE Latin1_General_CS_AS, '' COLLATE Latin1_General_CS_AS)
  SET @htmlText = REPLACE(@htmlText, '&Eacute;' COLLATE Latin1_General_CS_AS, '' COLLATE Latin1_General_CS_AS)
  SET @htmlText = REPLACE(@htmlText, '&eacute;' COLLATE Latin1_General_CS_AS, '' COLLATE Latin1_General_CS_AS)
  SET @htmlText = REPLACE(@htmlText, '&Ecirc;' COLLATE Latin1_General_CS_AS, '' COLLATE Latin1_General_CS_AS)
  SET @htmlText = REPLACE(@htmlText, '&ecirc;' COLLATE Latin1_General_CS_AS, '' COLLATE Latin1_General_CS_AS)
  SET @htmlText = REPLACE(@htmlText, '&Egrave;' COLLATE Latin1_General_CS_AS, '' COLLATE Latin1_General_CS_AS)
  SET @htmlText = REPLACE(@htmlText, '&egrave;' COLLATE Latin1_General_CS_AS, '' COLLATE Latin1_General_CS_AS)
  SET @htmlText = REPLACE(@htmlText, '&Euml;' COLLATE Latin1_General_CS_AS, '' COLLATE Latin1_General_CS_AS)
  SET @htmlText = REPLACE(@htmlText, '&euml;' COLLATE Latin1_General_CS_AS, '' COLLATE Latin1_General_CS_AS)
  SET @htmlText = REPLACE(@htmlText, '&ETH;' COLLATE Latin1_General_CS_AS, '' COLLATE Latin1_General_CS_AS)
  SET @htmlText = REPLACE(@htmlText, '&eth;' COLLATE Latin1_General_CS_AS, '' COLLATE Latin1_General_CS_AS)
  SET @htmlText = REPLACE(@htmlText, '&Iacute;' COLLATE Latin1_General_CS_AS, '' COLLATE Latin1_General_CS_AS)
  SET @htmlText = REPLACE(@htmlText, '&iacute;' COLLATE Latin1_General_CS_AS, '' COLLATE Latin1_General_CS_AS)
  SET @htmlText = REPLACE(@htmlText, '&Icirc;' COLLATE Latin1_General_CS_AS, '' COLLATE Latin1_General_CS_AS)
  SET @htmlText = REPLACE(@htmlText, '&icirc;' COLLATE Latin1_General_CS_AS, '' COLLATE Latin1_General_CS_AS)
  SET @htmlText = REPLACE(@htmlText, '&Igrave;' COLLATE Latin1_General_CS_AS, '' COLLATE Latin1_General_CS_AS)
  SET @htmlText = REPLACE(@htmlText, '&igrave;' COLLATE Latin1_General_CS_AS, '' COLLATE Latin1_General_CS_AS)
  SET @htmlText = REPLACE(@htmlText, '&Iuml;' COLLATE Latin1_General_CS_AS, '' COLLATE Latin1_General_CS_AS)
  SET @htmlText = REPLACE(@htmlText, '&iuml;' COLLATE Latin1_General_CS_AS, '' COLLATE Latin1_General_CS_AS)
  SET @htmlText = REPLACE(@htmlText, '&Oacute;' COLLATE Latin1_General_CS_AS, '' COLLATE Latin1_General_CS_AS)
  SET @htmlText = REPLACE(@htmlText, '&oacute;' COLLATE Latin1_General_CS_AS, '' COLLATE Latin1_General_CS_AS)
  SET @htmlText = REPLACE(@htmlText, '&Ocirc;' COLLATE Latin1_General_CS_AS, '' COLLATE Latin1_General_CS_AS)
  SET @htmlText = REPLACE(@htmlText, '&ocirc;' COLLATE Latin1_General_CS_AS, '' COLLATE Latin1_General_CS_AS)
  SET @htmlText = REPLACE(@htmlText, '&Ograve;' COLLATE Latin1_General_CS_AS, '' COLLATE Latin1_General_CS_AS)
  SET @htmlText = REPLACE(@htmlText, '&ograve;' COLLATE Latin1_General_CS_AS, '' COLLATE Latin1_General_CS_AS)
  SET @htmlText = REPLACE(@htmlText, '&Oslash;' COLLATE Latin1_General_CS_AS, '' COLLATE Latin1_General_CS_AS)
  SET @htmlText = REPLACE(@htmlText, '&oslash;' COLLATE Latin1_General_CS_AS, '' COLLATE Latin1_General_CS_AS)
  SET @htmlText = REPLACE(@htmlText, '&Otilde;' COLLATE Latin1_General_CS_AS, '' COLLATE Latin1_General_CS_AS)
  SET @htmlText = REPLACE(@htmlText, '&otilde;' COLLATE Latin1_General_CS_AS, '' COLLATE Latin1_General_CS_AS)
  SET @htmlText = REPLACE(@htmlText, '&Ouml;' COLLATE Latin1_General_CS_AS, '' COLLATE Latin1_General_CS_AS)
  SET @htmlText = REPLACE(@htmlText, '&ouml;' COLLATE Latin1_General_CS_AS, '' COLLATE Latin1_General_CS_AS)
  SET @htmlText = REPLACE(@htmlText, '&Uacute;' COLLATE Latin1_General_CS_AS, '' COLLATE Latin1_General_CS_AS)
  SET @htmlText = REPLACE(@htmlText, '&uacute;' COLLATE Latin1_General_CS_AS, '' COLLATE Latin1_General_CS_AS)
  SET @htmlText = REPLACE(@htmlText, '&Ucirc;' COLLATE Latin1_General_CS_AS, '' COLLATE Latin1_General_CS_AS)
  SET @htmlText = REPLACE(@htmlText, '&ucirc;' COLLATE Latin1_General_CS_AS, '' COLLATE Latin1_General_CS_AS)
  SET @htmlText = REPLACE(@htmlText, '&Ugrave;' COLLATE Latin1_General_CS_AS, '' COLLATE Latin1_General_CS_AS)
  SET @htmlText = REPLACE(@htmlText, '&ugrave;' COLLATE Latin1_General_CS_AS, '' COLLATE Latin1_General_CS_AS)
  SET @htmlText = REPLACE(@htmlText, '&Uuml;' COLLATE Latin1_General_CS_AS, '' COLLATE Latin1_General_CS_AS)
  SET @htmlText = REPLACE(@htmlText, '&uuml;' COLLATE Latin1_General_CS_AS, '' COLLATE Latin1_General_CS_AS)
  SET @htmlText = REPLACE(@htmlText, '&Ccedil;' COLLATE Latin1_General_CS_AS, '' COLLATE Latin1_General_CS_AS)
  SET @htmlText = REPLACE(@htmlText, '&ccedil;' COLLATE Latin1_General_CS_AS, '' COLLATE Latin1_General_CS_AS)
  SET @htmlText = REPLACE(@htmlText, '&Ntilde;' COLLATE Latin1_General_CS_AS, '' COLLATE Latin1_General_CS_AS)
  SET @htmlText = REPLACE(@htmlText, '&ntilde;' COLLATE Latin1_General_CS_AS, '' COLLATE Latin1_General_CS_AS)
  SET @htmlText = REPLACE(@htmlText, '&Yacute;' COLLATE Latin1_General_CS_AS, '' COLLATE Latin1_General_CS_AS)
  SET @htmlText = REPLACE(@htmlText, '&yacute;' COLLATE Latin1_General_CS_AS, '' COLLATE Latin1_General_CS_AS)
  SET @htmlText = REPLACE(@htmlText, '&quot;' COLLATE Latin1_General_CS_AS, '"' COLLATE Latin1_General_CS_AS)
  SET @htmlText = REPLACE(@htmlText, '&lt;' COLLATE Latin1_General_CS_AS, '<' COLLATE Latin1_General_CS_AS)
  SET @htmlText = REPLACE(@htmlText, '&gt;' COLLATE Latin1_General_CS_AS, '>' COLLATE Latin1_General_CS_AS)
  SET @htmlText = REPLACE(@htmlText, '&amp;' COLLATE Latin1_General_CS_AS, '&' COLLATE Latin1_General_CS_AS)
  SET @htmlText = REPLACE(@htmlText, '&reg;' COLLATE Latin1_General_CS_AS, '' COLLATE Latin1_General_CS_AS)
  SET @htmlText = REPLACE(@htmlText, '&copy;' COLLATE Latin1_General_CS_AS, '' COLLATE Latin1_General_CS_AS)
  SET @htmlText = REPLACE(@htmlText, '&THORN;' COLLATE Latin1_General_CS_AS, '' COLLATE Latin1_General_CS_AS)
  SET @htmlText = REPLACE(@htmlText, '&thorn;' COLLATE Latin1_General_CS_AS, '' COLLATE Latin1_General_CS_AS)
  SET @htmlText = REPLACE(@htmlText, '&szlig;' COLLATE Latin1_General_CS_AS, '' COLLATE Latin1_General_CS_AS)
  SET @htmlText = REPLACE(@htmlText, '&nbsp;' COLLATE Latin1_General_CS_AS, ' ' COLLATE Latin1_General_CS_AS)
  SET @htmlText = REPLACE(@htmlText, '&iexcl;' COLLATE Latin1_General_CS_AS, '' COLLATE Latin1_General_CS_AS)
  SET @htmlText = REPLACE(@htmlText, '&cent;' COLLATE Latin1_General_CS_AS, '' COLLATE Latin1_General_CS_AS)
  SET @htmlText = REPLACE(@htmlText, '&pound;' COLLATE Latin1_General_CS_AS, '' COLLATE Latin1_General_CS_AS)
  SET @htmlText = REPLACE(@htmlText, '&curren;' COLLATE Latin1_General_CS_AS, '' COLLATE Latin1_General_CS_AS)
  SET @htmlText = REPLACE(@htmlText, '&yen;' COLLATE Latin1_General_CS_AS, '' COLLATE Latin1_General_CS_AS)
  SET @htmlText = REPLACE(@htmlText, '&brvbar;' COLLATE Latin1_General_CS_AS, '|' COLLATE Latin1_General_CS_AS)
  SET @htmlText = REPLACE(@htmlText, '&sect;' COLLATE Latin1_General_CS_AS, '' COLLATE Latin1_General_CS_AS)
  SET @htmlText = REPLACE(@htmlText, '&uml;' COLLATE Latin1_General_CS_AS, '' COLLATE Latin1_General_CS_AS)
  SET @htmlText = REPLACE(@htmlText, '&copy;' COLLATE Latin1_General_CS_AS, '' COLLATE Latin1_General_CS_AS)
  SET @htmlText = REPLACE(@htmlText, '&ordf;' COLLATE Latin1_General_CS_AS, '' COLLATE Latin1_General_CS_AS)
  SET @htmlText = REPLACE(@htmlText, '&laquo;' COLLATE Latin1_General_CS_AS, '' COLLATE Latin1_General_CS_AS)
  SET @htmlText = REPLACE(@htmlText, '&not;' COLLATE Latin1_General_CS_AS, '' COLLATE Latin1_General_CS_AS)
  SET @htmlText = REPLACE(@htmlText, '&shy;' COLLATE Latin1_General_CS_AS, '' COLLATE Latin1_General_CS_AS)
  SET @htmlText = REPLACE(@htmlText, '&reg;' COLLATE Latin1_General_CS_AS, '' COLLATE Latin1_General_CS_AS)
  SET @htmlText = REPLACE(@htmlText, '&macr;' COLLATE Latin1_General_CS_AS, '' COLLATE Latin1_General_CS_AS)
  SET @htmlText = REPLACE(@htmlText, '&deg;' COLLATE Latin1_General_CS_AS, '' COLLATE Latin1_General_CS_AS)
  SET @htmlText = REPLACE(@htmlText, '&plusmn;' COLLATE Latin1_General_CS_AS, '' COLLATE Latin1_General_CS_AS)
  SET @htmlText = REPLACE(@htmlText, '&sup2' COLLATE Latin1_General_CS_AS, '' COLLATE Latin1_General_CS_AS)
  SET @htmlText = REPLACE(@htmlText, '&sup3' COLLATE Latin1_General_CS_AS, '' COLLATE Latin1_General_CS_AS)
  SET @htmlText = REPLACE(@htmlText, '&acute;' COLLATE Latin1_General_CS_AS, '' COLLATE Latin1_General_CS_AS)
  SET @htmlText = REPLACE(@htmlText, '&micro;' COLLATE Latin1_General_CS_AS, '' COLLATE Latin1_General_CS_AS)
  SET @htmlText = REPLACE(@htmlText, '&para;' COLLATE Latin1_General_CS_AS, '' COLLATE Latin1_General_CS_AS)
  SET @htmlText = REPLACE(@htmlText, '&middot;' COLLATE Latin1_General_CS_AS, '' COLLATE Latin1_General_CS_AS)
  SET @htmlText = REPLACE(@htmlText, '&cedil;' COLLATE Latin1_General_CS_AS, '' COLLATE Latin1_General_CS_AS)
  SET @htmlText = REPLACE(@htmlText, '&sup1;' COLLATE Latin1_General_CS_AS, '' COLLATE Latin1_General_CS_AS)
  SET @htmlText = REPLACE(@htmlText, '&ordm;' COLLATE Latin1_General_CS_AS, '' COLLATE Latin1_General_CS_AS)
  SET @htmlText = REPLACE(@htmlText, '&raquo;' COLLATE Latin1_General_CS_AS, '' COLLATE Latin1_General_CS_AS)
  SET @htmlText = REPLACE(@htmlText, '&frac14;' COLLATE Latin1_General_CS_AS, '' COLLATE Latin1_General_CS_AS)
  SET @htmlText = REPLACE(@htmlText, '&frac12;' COLLATE Latin1_General_CS_AS, '' COLLATE Latin1_General_CS_AS)
  SET @htmlText = REPLACE(@htmlText, '&frac34;' COLLATE Latin1_General_CS_AS, '' COLLATE Latin1_General_CS_AS)
  SET @htmlText = REPLACE(@htmlText, '&iquest;' COLLATE Latin1_General_CS_AS, '' COLLATE Latin1_General_CS_AS)
  SET @htmlText = REPLACE(@htmlText, '&Agrave;' COLLATE Latin1_General_CS_AS, '' COLLATE Latin1_General_CS_AS)
  SET @htmlText = REPLACE(@htmlText, '&Aacute;' COLLATE Latin1_General_CS_AS, '' COLLATE Latin1_General_CS_AS)
  SET @htmlText = REPLACE(@htmlText, '&Acirc;' COLLATE Latin1_General_CS_AS, '' COLLATE Latin1_General_CS_AS)
  SET @htmlText = REPLACE(@htmlText, '&Atilde;' COLLATE Latin1_General_CS_AS, '' COLLATE Latin1_General_CS_AS)
  SET @htmlText = REPLACE(@htmlText, '&Auml;' COLLATE Latin1_General_CS_AS, '' COLLATE Latin1_General_CS_AS)
  SET @htmlText = REPLACE(@htmlText, '&Aring;' COLLATE Latin1_General_CS_AS, '' COLLATE Latin1_General_CS_AS)
  SET @htmlText = REPLACE(@htmlText, '&AElig;' COLLATE Latin1_General_CS_AS, '' COLLATE Latin1_General_CS_AS)
  SET @htmlText = REPLACE(@htmlText, '&Ccedil;' COLLATE Latin1_General_CS_AS, '' COLLATE Latin1_General_CS_AS)
  SET @htmlText = REPLACE(@htmlText, '&Egrave;' COLLATE Latin1_General_CS_AS, '' COLLATE Latin1_General_CS_AS)
  SET @htmlText = REPLACE(@htmlText, '&Eacute;' COLLATE Latin1_General_CS_AS, '' COLLATE Latin1_General_CS_AS)
  SET @htmlText = REPLACE(@htmlText, '&Ecirc;' COLLATE Latin1_General_CS_AS, '' COLLATE Latin1_General_CS_AS)
  SET @htmlText = REPLACE(@htmlText, '&Euml;' COLLATE Latin1_General_CS_AS, '' COLLATE Latin1_General_CS_AS)
  SET @htmlText = REPLACE(@htmlText, '&Igrave;' COLLATE Latin1_General_CS_AS, '' COLLATE Latin1_General_CS_AS)
  SET @htmlText = REPLACE(@htmlText, '&Iacute;' COLLATE Latin1_General_CS_AS, '' COLLATE Latin1_General_CS_AS)
  SET @htmlText = REPLACE(@htmlText, '&Icirc;' COLLATE Latin1_General_CS_AS, '' COLLATE Latin1_General_CS_AS)
  SET @htmlText = REPLACE(@htmlText, '&Iuml;' COLLATE Latin1_General_CS_AS, '' COLLATE Latin1_General_CS_AS)
  SET @htmlText = REPLACE(@htmlText, '&ETH;' COLLATE Latin1_General_CS_AS, '' COLLATE Latin1_General_CS_AS)
  SET @htmlText = REPLACE(@htmlText, '&Ntilde;' COLLATE Latin1_General_CS_AS, '' COLLATE Latin1_General_CS_AS)
  SET @htmlText = REPLACE(@htmlText, '&Ograve;' COLLATE Latin1_General_CS_AS, '' COLLATE Latin1_General_CS_AS)
  SET @htmlText = REPLACE(@htmlText, '&Oacute;' COLLATE Latin1_General_CS_AS, '' COLLATE Latin1_General_CS_AS)
  SET @htmlText = REPLACE(@htmlText, '&Ocirc;' COLLATE Latin1_General_CS_AS, '' COLLATE Latin1_General_CS_AS)
  SET @htmlText = REPLACE(@htmlText, '&Otilde;' COLLATE Latin1_General_CS_AS, '' COLLATE Latin1_General_CS_AS)
  SET @htmlText = REPLACE(@htmlText, '&Ouml;' COLLATE Latin1_General_CS_AS, '' COLLATE Latin1_General_CS_AS)
  SET @htmlText = REPLACE(@htmlText, '&times;' COLLATE Latin1_General_CS_AS, '' COLLATE Latin1_General_CS_AS)
  SET @htmlText = REPLACE(@htmlText, '&Oslash;' COLLATE Latin1_General_CS_AS, '' COLLATE Latin1_General_CS_AS)
  SET @htmlText = REPLACE(@htmlText, '&Ugrave;' COLLATE Latin1_General_CS_AS, '' COLLATE Latin1_General_CS_AS)
  SET @htmlText = REPLACE(@htmlText, '&Uacute;' COLLATE Latin1_General_CS_AS, '' COLLATE Latin1_General_CS_AS)
  SET @htmlText = REPLACE(@htmlText, '&Ucirc;' COLLATE Latin1_General_CS_AS, '' COLLATE Latin1_General_CS_AS)
  SET @htmlText = REPLACE(@htmlText, '&Uuml;' COLLATE Latin1_General_CS_AS, '' COLLATE Latin1_General_CS_AS)
  SET @htmlText = REPLACE(@htmlText, '&Yacute;' COLLATE Latin1_General_CS_AS, '' COLLATE Latin1_General_CS_AS)
  SET @htmlText = REPLACE(@htmlText, '&THORN;' COLLATE Latin1_General_CS_AS, '' COLLATE Latin1_General_CS_AS)
  SET @htmlText = REPLACE(@htmlText, '&szlig;' COLLATE Latin1_General_CS_AS, '' COLLATE Latin1_General_CS_AS)
  SET @htmlText = REPLACE(@htmlText, '&agrave;' COLLATE Latin1_General_CS_AS, '' COLLATE Latin1_General_CS_AS)
  SET @htmlText = REPLACE(@htmlText, '&aacute;' COLLATE Latin1_General_CS_AS, '' COLLATE Latin1_General_CS_AS)
  SET @htmlText = REPLACE(@htmlText, '&acirc;' COLLATE Latin1_General_CS_AS, '' COLLATE Latin1_General_CS_AS)
  SET @htmlText = REPLACE(@htmlText, '&atilde;' COLLATE Latin1_General_CS_AS, '' COLLATE Latin1_General_CS_AS)
  SET @htmlText = REPLACE(@htmlText, '&auml;' COLLATE Latin1_General_CS_AS, '' COLLATE Latin1_General_CS_AS)
  SET @htmlText = REPLACE(@htmlText, '&aring;' COLLATE Latin1_General_CS_AS, '' COLLATE Latin1_General_CS_AS)
  SET @htmlText = REPLACE(@htmlText, '&aelig;' COLLATE Latin1_General_CS_AS, '' COLLATE Latin1_General_CS_AS)
  SET @htmlText = REPLACE(@htmlText, '&ccedil;' COLLATE Latin1_General_CS_AS, '' COLLATE Latin1_General_CS_AS)
  SET @htmlText = REPLACE(@htmlText, '&egrave;' COLLATE Latin1_General_CS_AS, '' COLLATE Latin1_General_CS_AS)
  SET @htmlText = REPLACE(@htmlText, '&eacute;' COLLATE Latin1_General_CS_AS, '' COLLATE Latin1_General_CS_AS)
  SET @htmlText = REPLACE(@htmlText, '&ecirc;' COLLATE Latin1_General_CS_AS, '' COLLATE Latin1_General_CS_AS)
  SET @htmlText = REPLACE(@htmlText, '&euml;' COLLATE Latin1_General_CS_AS, '' COLLATE Latin1_General_CS_AS)
  SET @htmlText = REPLACE(@htmlText, '&igrave;' COLLATE Latin1_General_CS_AS, '' COLLATE Latin1_General_CS_AS)
  SET @htmlText = REPLACE(@htmlText, '&iacute;' COLLATE Latin1_General_CS_AS, '' COLLATE Latin1_General_CS_AS)
  SET @htmlText = REPLACE(@htmlText, '&icirc;' COLLATE Latin1_General_CS_AS, '' COLLATE Latin1_General_CS_AS)
  SET @htmlText = REPLACE(@htmlText, '&iuml;' COLLATE Latin1_General_CS_AS, '' COLLATE Latin1_General_CS_AS)
  SET @htmlText = REPLACE(@htmlText, '&eth;' COLLATE Latin1_General_CS_AS, '' COLLATE Latin1_General_CS_AS)
  SET @htmlText = REPLACE(@htmlText, '&ntilde;' COLLATE Latin1_General_CS_AS, '' COLLATE Latin1_General_CS_AS)
  SET @htmlText = REPLACE(@htmlText, '&ograve;' COLLATE Latin1_General_CS_AS, '' COLLATE Latin1_General_CS_AS)
  SET @htmlText = REPLACE(@htmlText, '&oacute;' COLLATE Latin1_General_CS_AS, '' COLLATE Latin1_General_CS_AS)
  SET @htmlText = REPLACE(@htmlText, '&ocirc;' COLLATE Latin1_General_CS_AS, '' COLLATE Latin1_General_CS_AS)
  SET @htmlText = REPLACE(@htmlText, '&otilde;' COLLATE Latin1_General_CS_AS, '' COLLATE Latin1_General_CS_AS)
  SET @htmlText = REPLACE(@htmlText, '&ouml;' COLLATE Latin1_General_CS_AS, '' COLLATE Latin1_General_CS_AS)
  SET @htmlText = REPLACE(@htmlText, '&divide;' COLLATE Latin1_General_CS_AS, '' COLLATE Latin1_General_CS_AS)
  SET @htmlText = REPLACE(@htmlText, '&oslash;' COLLATE Latin1_General_CS_AS, '' COLLATE Latin1_General_CS_AS)
  SET @htmlText = REPLACE(@htmlText, '&ugrave;' COLLATE Latin1_General_CS_AS, '' COLLATE Latin1_General_CS_AS)
  SET @htmlText = REPLACE(@htmlText, '&uacute;' COLLATE Latin1_General_CS_AS, '' COLLATE Latin1_General_CS_AS)
  SET @htmlText = REPLACE(@htmlText, '&ucirc;' COLLATE Latin1_General_CS_AS, '' COLLATE Latin1_General_CS_AS)
  SET @htmlText = REPLACE(@htmlText, '&uuml;' COLLATE Latin1_General_CS_AS, '' COLLATE Latin1_General_CS_AS)
  SET @htmlText = REPLACE(@htmlText, '&yacute;' COLLATE Latin1_General_CS_AS, '' COLLATE Latin1_General_CS_AS)
  SET @htmlText = REPLACE(@htmlText, '&thorn;' COLLATE Latin1_General_CS_AS, '' COLLATE Latin1_General_CS_AS)
  SET @htmlText = REPLACE(@htmlText, '&yuml;' COLLATE Latin1_General_CS_AS, '' COLLATE Latin1_General_CS_AS)
  SET @start = CHARINDEX('<STYLE', @htmlText)
  SET @end = CHARINDEX('</STYLE>', @htmlText, CHARINDEX('<', @htmlText)) + 7
  SET @length = (@end - @start) + 1
  WHILE (@start > 0
    AND @end > 0
    AND @length > 0)
  BEGIN
    SET @htmlText = STUFF(@htmlText, @start, @length, '')
    SET @start = CHARINDEX('<STYLE', @htmlText)
    SET @end = CHARINDEX('</STYLE>', @htmlText, CHARINDEX('</STYLE>', @htmlText)) + 7
    SET @length = (@end - @start) + 1
  END
  SET @start = CHARINDEX('<', @htmlText)
  SET @end = CHARINDEX('>', @htmlText, CHARINDEX('<', @htmlText))
  SET @length = (@end - @start) + 1
  WHILE (@start > 0
    AND @end > 0
    AND @length > 0)
  BEGIN
    SET @htmlText = STUFF(@htmlText, @start, @length, '')
    SET @start = CHARINDEX('<', @htmlText)
    SET @end = CHARINDEX('>', @htmlText, CHARINDEX('<', @htmlText))
    SET @length = (@end - @start) + 1
  END
  RETURN LTRIM(RTRIM(@htmlText))
END
GO