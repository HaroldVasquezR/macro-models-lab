function info = check_environment(check_graphics)
% CHECK_ENVIRONMENT Diagnostico sin instalar ni cargar paquetes.
%   info = check_environment(false); % solo motor y funciones basicas
%   info = check_environment(true);  % tambien exporta una figura temporal
% No modifica configuraciones, privilegios, rutas permanentes ni paquetes.
    if nargin < 1
        check_graphics = false;
    end
    if ~(islogical(check_graphics) && isscalar(check_graphics))
        error('U01:Flag', 'Use true o false como argumento.');
    end
    if exist('OCTAVE_VERSION', 'builtin') ~= 0
        info.engine = 'GNU Octave';
    else
        info.engine = 'MATLAB';
    end
    info.version = version;
    info.platform = computer;
    info.date = datestr(now, 'yyyy-mm-dd HH:MM:SS');
    names = {'plot','print','fopen','fprintf','onCleanup','assert','fullfile'};
    info.missing = {};
    for j = 1:numel(names)
        if isempty(which(names{j}))
            info.missing{end+1} = names{j}; %#ok<AGROW>
        end
    end
    info.numeric_ok = isempty(info.missing);
    info.graphics_checked = check_graphics;
    info.graphics_ok = false;
    info.graphics_message = 'No solicitado.';
    fprintf('%s | version %s | %s\n', info.engine, info.version, info.platform);
    fprintf('Unidad 1: no requiere toolboxes, paquetes de Octave ni Dynare.\n');
    if ~info.numeric_ok
        warning('U01:MissingFunction', 'Faltan funciones basicas; revise la instalacion.');
    end
    if check_graphics
        base = tempname;
        png_name = [base '.png']; pdf_name = [base '.pdf'];
        fig = [];
        try
            fig = figure('Visible','off');
            plot([0 1], [100 102]);
            print(fig, png_name, '-dpng');
            print(fig, pdf_name, '-dpdf');
            d1 = dir(png_name); d2 = dir(pdf_name);
            if isempty(d1) || isempty(d2) || d1.bytes == 0 || d2.bytes == 0
                error('U01:GraphicsFiles', 'No se generaron ambos archivos graficos.');
            end
            info.graphics_ok = true;
            info.graphics_message = 'Exportacion PNG y PDF completada.';
        catch err
            info.graphics_message = err.message;
        end
        if ~isempty(fig) && ishandle(fig), close(fig); end
        if exist(png_name,'file') == 2, delete(png_name); end
        if exist(pdf_name,'file') == 2, delete(pdf_name); end
        fprintf('Graficos: %s\n', info.graphics_message);
        if ~info.graphics_ok
            warning('U01:Graphics', ...
                'Revise docs/troubleshooting.md. Puede usar run_example(false).');
        end
    end
end
