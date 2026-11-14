function r = run_example(make_plots, p, out_dir)
% RUN_EXAMPLE Ejecuta y exporta el experimento reproducible de la Unidad 1.
%   run_example                      % valores de params.m, tablas y figuras
%   r = run_example(false)           % tablas sin graficos
%   p = params(); p.g_alt = 0.04;
%   r = run_example(true,p,'mi_salida') % carpeta alternativa
% Si el grafico falla, el error es explicito; CSV y metadatos ya se guardaron.
% Las salidas existentes con el mismo nombre se sobrescriben.
    unit_dir = fileparts(mfilename('fullpath'));
    old_path = path;
    clean_path = onCleanup(@() path(old_path)); %#ok<NASGU>
    addpath(unit_dir, fullfile(unit_dir, 'src'));
    if nargin < 1, make_plots = true; end
    if nargin < 2 || isempty(p), p = params(); end
    if nargin < 3 || isempty(out_dir), out_dir = fullfile(unit_dir,'outputs'); end
    if ~(islogical(make_plots) && isscalar(make_plots))
        error('U01:Flag', 'make_plots debe ser true o false.');
    end
    if ~(ischar(out_dir) && isrow(out_dir) && ~isempty(out_dir))
        error('U01:OutputDir', 'La carpeta debe ser una cadena entre comillas simples.');
    end
    % Validar antes de crear o sobrescribir archivos.
    r = u01_compute(p);
    if exist(out_dir, 'dir') ~= 7
        [ok,msg] = mkdir(out_dir);
        if ~ok, error('U01:OutputDir', 'No se pudo crear la carpeta: %s',msg); end
    end
    info = check_environment(false);
    u01_write_csv(fullfile(out_dir,'growth_paths.csv'), r.matrix);
    years = unique([0, min(5,p.T), min(10,p.T), p.T]);
    u01_write_csv(fullfile(out_dir,'summary.csv'), r.matrix(years+1,:));
    write_metadata(fullfile(out_dir,'run_metadata.txt'),p,info);
    r.output_dir = out_dir;
    fprintf('A(T)=%.6f | B(T)=%.6f | Brecha=%.6f %%\n', ...
            r.y_base(end),r.y_alt(end),r.gap_pct(end));
    fprintf('Salidas: %s\n', out_dir);
    if make_plots
        u01_export_figures(r,out_dir);
        fprintf('Figuras PNG y PDF exportadas.\n');
    end
end

function write_metadata(filename,p,info)
    [fid,msg] = fopen(filename,'w');
    if fid < 0, error('U01:FileWrite','No se pudo escribir metadatos: %s',msg); end
    clean_file = onCleanup(@() fclose(fid)); %#ok<NASGU>
    fprintf(fid,'unit=01\nversion=1.0.0\ndata_type=synthetic\nfrequency=annual\n');
    fprintf(fid,'units=index_of_real_income_per_capita\n');
    fprintf(fid,'equation=y0*(1+g)^t\n');
    fprintf(fid,'y0=%.17g\ng_base=%.17g\ng_alt=%.17g\nT=%d\n', ...
            p.y0,p.g_base,p.g_alt,p.T);
    fprintf(fid,'engine=%s\nengine_version=%s\nplatform=%s\nrun_time=%s\n', ...
            info.engine,info.version,info.platform,info.date);
    fprintf(fid,'country_assignment=none\nforecast_validated=no\n');
    fprintf(fid,'note=Both country applications are illustrative; no observed data.\n');
end
