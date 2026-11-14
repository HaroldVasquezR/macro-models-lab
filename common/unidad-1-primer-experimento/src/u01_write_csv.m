function u01_write_csv(filename, x)
% U01_WRITE_CSV Escribe las siete columnas del resultado, con encabezado.
% CSV en formato internacional: separador coma y decimal punto.
    if ~(ischar(filename) && isrow(filename) && ~isempty(filename))
        error('U01:FileName', 'Use una ruta entre comillas simples.');
    end
    if ~(isnumeric(x) && isreal(x) && ismatrix(x) && size(x,2) == 7 ...
            && all(isfinite(x(:))))
        error('U01:CsvData', 'Se requiere una matriz numerica finita de siete columnas.');
    end
    [fid, msg] = fopen(filename, 'w');
    if fid < 0
        error('U01:FileWrite', 'No se pudo abrir %s: %s', filename, msg);
    end
    clean_file = onCleanup(@() fclose(fid)); %#ok<NASGU>
    fprintf(fid, ['year,index_a,index_b,gap_points,gap_pct,' ...
                  'cumulative_a_pct,cumulative_b_pct\n']);
    fprintf(fid, '%d,%.15g,%.15g,%.15g,%.15g,%.15g,%.15g\n', x');
end
